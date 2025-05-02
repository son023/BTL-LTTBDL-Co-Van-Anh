package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.dtos.request.UserProfileUpdateRequest;
import com.example.backend_mobile.dtos.response.AvatarResponse;
import com.example.backend_mobile.dtos.response.MessageResponse;
import com.example.backend_mobile.enums.GioiTinh;
import com.example.backend_mobile.security.service.UserDetailsImpl;
import com.example.backend_mobile.entity.KhachHang;
import com.example.backend_mobile.entity.NguoiDung;
import com.example.backend_mobile.repository.NguoiDungRepository;
import com.example.backend_mobile.service.IUserService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

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

    @Override
    public ResponseEntity<?> updateUserProfile(UserProfileUpdateRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        Optional<NguoiDung> userOpt = nguoiDungRepository.findById(userDetails.getId());
        if (userOpt.isPresent()) {
            NguoiDung user = userOpt.get();

            // Cập nhật thông tin
            if (request.getTen() != null && !request.getTen().isEmpty()) {
                user.setTen(request.getTen());
            }

            if (request.getSoDienThoai() != null) {
                user.setSoDienThoai(request.getSoDienThoai());
            }

            if (request.getNgaySinh() != null && !request.getNgaySinh().isEmpty()) {
                try {
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate ngaySinh = LocalDate.parse(request.getNgaySinh(), formatter);
                    user.setNgaySinh(ngaySinh);
                } catch (Exception e) {
                    return ResponseEntity.badRequest()
                            .body(new MessageResponse("Ngày sinh không đúng định dạng (yyyy-MM-dd)", false));
                }
            }

            if (request.getGioiTinh() != null) {
                // Chuyển đổi String thành enum GioiTinh
                try {
                    for (GioiTinh gioiTinh : GioiTinh.values()) {
                        if (gioiTinh.getValue().equals(request.getGioiTinh())) {
                            user.setGioiTinh(gioiTinh);
                            break;
                        }
                    }
                } catch (Exception e) {
                    return ResponseEntity.badRequest()
                            .body(new MessageResponse("Giới tính không hợp lệ", false));
                }
            }

            if (request.getDiaChi() != null) {
                user.setDiaChi(request.getDiaChi());
            }

            nguoiDungRepository.save(user);

            return ResponseEntity.ok(new MessageResponse("Cập nhật thông tin thành công", true));
        }

        return ResponseEntity.notFound().build();
    }

    @Override
    public ResponseEntity<?> uploadAvatar(MultipartFile file) {
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body(new MessageResponse("File rỗng", false));
        }

        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

            Optional<NguoiDung> userOpt = nguoiDungRepository.findById(userDetails.getId());
            if (!userOpt.isPresent()) {
                return ResponseEntity.notFound().build();
            }

            NguoiDung user = userOpt.get();

            // Tạo thư mục uploads nếu chưa tồn tại
            Path uploadPath = Paths.get("uploads/avatars");
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // Tạo tên file duy nhất
            String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());
            String extension = "";
            int dotIndex = originalFilename.lastIndexOf('.');
            if (dotIndex >= 0 && dotIndex < originalFilename.length() - 1) {
                extension = originalFilename.substring(dotIndex + 1);
            }

            String fileName = "avatar_" + user.getId() + "_" + UUID.randomUUID().toString() +
                    (extension.isEmpty() ? "" : "." + extension);

            // Lưu file
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            // Cập nhật đường dẫn avatar trong database
            String avatarUrl = "/uploads/avatars/" + fileName;
            user.setAvatar(avatarUrl);
            nguoiDungRepository.save(user);

            return ResponseEntity.ok(new AvatarResponse(avatarUrl));
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new MessageResponse("Không thể lưu avatar: " + e.getMessage(), false));
        }
    }
}