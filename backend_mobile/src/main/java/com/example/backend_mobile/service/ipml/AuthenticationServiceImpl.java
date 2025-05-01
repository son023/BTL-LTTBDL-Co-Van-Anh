package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.security.jwt.JwtUtils;
import com.example.backend_mobile.security.service.UserDetailsImpl;
import com.example.backend_mobile.security.service.UserDetailsServiceImpl;
import com.example.backend_mobile.dtos.request.LoginRequest;
import com.example.backend_mobile.dtos.request.SignupRequest;
import com.example.backend_mobile.dtos.response.JwtResponse;
import com.example.backend_mobile.dtos.response.MessageResponse;
import com.example.backend_mobile.entity.KhachHang;
import com.example.backend_mobile.entity.NguoiDung;
import com.example.backend_mobile.enums.GioiTinh;
import com.example.backend_mobile.enums.HangThanhVien;
import com.example.backend_mobile.enums.TrangThaiNguoiDung;
import com.example.backend_mobile.repository.KhachHangRepository;
import com.example.backend_mobile.repository.NguoiDungRepository;
import com.example.backend_mobile.service.IAuthenticationService;
import com.nimbusds.jose.JOSEException;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AuthenticationServiceImpl implements IAuthenticationService {

    AuthenticationManager authenticationManager;

    NguoiDungRepository nguoiDungRepository;

    KhachHangRepository khachHangRepository;

    UserDetailsServiceImpl userDetailsService;

    PasswordEncoder encoder;

    JwtUtils jwtUtils;

    @Override
    public ResponseEntity<?> authenticateUser(LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = generateToken(authentication, false);
        String refreshToken = generateToken(authentication, true);

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        return ResponseEntity.ok(new JwtResponse(jwt,
                refreshToken,
                "Bearer",
                userDetails.getId(),
                userDetails.getEmail(),
                userDetails.getTen(),
                userDetails.getAuthorities().stream().findFirst().get().getAuthority()));
    }

    @Override
    @Transactional
    public ResponseEntity<?> registerUser(SignupRequest signUpRequest) {
        if (nguoiDungRepository.existsByEmail(signUpRequest.getEmail())) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Email đã được sử dụng!", false));
        }

        // Tạo tài khoản người dùng mới
        KhachHang user = new KhachHang();
        user.setEmail(signUpRequest.getEmail());
        user.setTen(signUpRequest.getTen());
        user.setMatKhau(encoder.encode(signUpRequest.getMatKhau()));

        // Các trường tùy chọn
        if (signUpRequest.getSoDienThoai() != null) {
            user.setSoDienThoai(signUpRequest.getSoDienThoai());
        }

        if (signUpRequest.getNgaySinh() != null) {
            user.setNgaySinh(signUpRequest.getNgaySinh());
        }

        if (signUpRequest.getGioiTinh() != null) {
            try {
                user.setGioiTinh(GioiTinh.valueOf(signUpRequest.getGioiTinh().toUpperCase()));
            } catch (IllegalArgumentException e) {
                // Mặc định là Nam nếu giá trị không hợp lệ
                user.setGioiTinh(GioiTinh.NAM);
            }
        }

        if (signUpRequest.getDiaChi() != null) {
            user.setDiaChi(signUpRequest.getDiaChi());
        }

        // Thiết lập các giá trị mặc định
        user.setThoiGianTao(LocalDateTime.now());
        user.setTrangThai(TrangThaiNguoiDung.HOAT_DONG);

        // Thông tin riêng cho khách hàng
        user.setMaThanhVien("KH" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        user.setDiemTichLuy(0);
        user.setHangThanhVien(HangThanhVien.THUONG);
        user.setNgayDangKy(LocalDateTime.now());

        try {
            // Lưu đối tượng KhachHang vào cơ sở dữ liệu
            KhachHang savedUser = khachHangRepository.save(user);

            // Tạo token để đăng nhập tự động sau khi đăng ký
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(signUpRequest.getEmail(), signUpRequest.getMatKhau()));

            SecurityContextHolder.getContext().setAuthentication(authentication);
            String jwt = generateToken(authentication, false);
            String refreshToken = generateToken(authentication, true);

            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

            // Trả về JwtResponse thay vì MessageResponse để người dùng có thể đăng nhập ngay
            return ResponseEntity.ok(new JwtResponse(
                    jwt,
                    refreshToken,
                    "Bearer",
                    savedUser.getId(),
                    savedUser.getEmail(),
                    savedUser.getTen(),
                    "ROLE_USER"
            ));
        } catch (Exception e) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Đăng ký thất bại: " + e.getMessage(), false));
        }
    }

    @Override
    public ResponseEntity<?> refreshToken(String refreshToken) {
        try {
            if (refreshToken != null && refreshToken.startsWith("Bearer ")) {
                String token = refreshToken.substring(7);
                String username = jwtUtils.getUserNameFromToken(token);
                UserDetails userDetails = userDetailsService.loadUserByUsername(username);

                if (jwtUtils.validateToken(token, userDetails)) {
                    UsernamePasswordAuthenticationToken authentication =
                            new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                    SecurityContextHolder.getContext().setAuthentication(authentication);

                    String newAccessToken = generateToken(authentication, false);
                    String newRefreshToken = generateToken(authentication, true);
                    UserDetailsImpl userDetailsImpl = (UserDetailsImpl) userDetails;

                    return ResponseEntity.ok(new JwtResponse(
                            newAccessToken,
                            newRefreshToken,
                            "Bearer",
                            userDetailsImpl.getId(),
                            userDetailsImpl.getEmail(),
                            userDetailsImpl.getTen(),
                            userDetails.getAuthorities().stream().findFirst().get().getAuthority()));
                }
            }

            return ResponseEntity.badRequest().body(new MessageResponse("Refresh token không hợp lệ", false));
        } catch (ParseException e) {
            return ResponseEntity.badRequest().body(new MessageResponse("Không thể phân tích token: " + e.getMessage(), false));
        } catch (JOSEException e) {
            return ResponseEntity.badRequest().body(new MessageResponse("Lỗi xác thực token: " + e.getMessage(), false));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new MessageResponse("Không thể làm mới token: " + e.getMessage(), false));
        }
    }

    @Override
    public ResponseEntity<?> logoutUser(String token) {
        return ResponseEntity.ok(new MessageResponse("Đăng xuất thành công!", true));
    }

    @Override
    public String generateToken(Authentication authentication, boolean isRefreshToken) {
        return jwtUtils.generateToken(authentication, isRefreshToken);
    }
}