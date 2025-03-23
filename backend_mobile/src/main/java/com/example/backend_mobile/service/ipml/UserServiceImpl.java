package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.security.service.UserDetailsImpl;
import com.example.backend_mobile.entity.KhachHang;
import com.example.backend_mobile.entity.NguoiDung;
import com.example.backend_mobile.repository.NguoiDungRepository;
import com.example.backend_mobile.service.IUserService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserServiceImpl implements IUserService {

    NguoiDungRepository nguoiDungRepository;

    @Override
    public ResponseEntity<?> getUserProfile() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return getUserFromAuthentication(authentication);
    }

    @Override
    public ResponseEntity<?> getUserFromAuthentication(Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        return getUserById(userDetails.getId());
    }

    @Override
    public ResponseEntity<?> getUserById(Integer id) {
        Optional<NguoiDung> userOpt = nguoiDungRepository.findById(id);
        if (userOpt.isPresent()) {
            NguoiDung user = userOpt.get();
            Map<String, Object> response = new HashMap<>();
            response.put("id", user.getId());
            response.put("email", user.getEmail());
            response.put("ten", user.getTen());
            response.put("soDienThoai", user.getSoDienThoai());
            response.put("ngaySinh", user.getNgaySinh());
            response.put("gioiTinh", user.getGioiTinh() != null ? user.getGioiTinh().getValue() : null);
            response.put("diaChi", user.getDiaChi());
            response.put("avatar", user.getAvatar());
            response.put("thoiGianTao", user.getThoiGianTao());
            response.put("trangThai", user.getTrangThai() != null ? user.getTrangThai().getValue() : null);

            if (user instanceof KhachHang) {
                KhachHang khachHang = (KhachHang) user;
                response.put("loaiNguoiDung", "KhachHang");
                response.put("maThanhVien", khachHang.getMaThanhVien());
                response.put("diemTichLuy", khachHang.getDiemTichLuy());
                response.put("hangThanhVien", khachHang.getHangThanhVien() != null ? khachHang.getHangThanhVien().getValue() : null);
                response.put("ngayDangKy", khachHang.getNgayDangKy());
            }

            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @Override
    public ResponseEntity<?> checkAuthentication() {
        Map<String, Boolean> response = new HashMap<>();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        response.put("authenticated", auth != null &&
                auth.isAuthenticated() &&
                !"anonymousUser".equals(auth.getPrincipal()));
        return ResponseEntity.ok(response);
    }

}