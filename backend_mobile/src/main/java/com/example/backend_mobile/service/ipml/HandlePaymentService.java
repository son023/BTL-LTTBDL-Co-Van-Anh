package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.entity.ChiTietPhuongThuc;
import com.example.backend_mobile.entity.ThanhToan;
import com.example.backend_mobile.repository.ChiTietPhuongThucRepository;
import com.example.backend_mobile.repository.ThanhToanRepository;
import com.example.backend_mobile.security.service.UserDetailsImpl;
import com.example.backend_mobile.service.IHandlePaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class HandlePaymentService implements IHandlePaymentService {

    private final ThanhToanRepository thanhToanRepository;
    private final ChiTietPhuongThucRepository chiTietPhuongThucRepository;

    @Override
    public ResponseEntity<List<ThanhToan>> getAllEnalblePaymentMethods() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (!(authentication.getPrincipal() instanceof UserDetailsImpl)) {
            throw new RuntimeException("Người dùng chưa đăng nhập hoặc sai kiểu dữ liệu!");
        }
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        int currentUserId = userDetails.getId();

        List<ThanhToan> thanhToanList = new ArrayList<>();

        List<ChiTietPhuongThuc> methodList = chiTietPhuongThucRepository.findByKhachHangId(currentUserId);
        for (ChiTietPhuongThuc method : methodList) {
            if(Objects.equals(method.getStatus(), "ENABLE")) {
                Optional<ThanhToan> thanhToan = thanhToanRepository.findById(method.getThanhToan().getId());
                thanhToan.ifPresent(thanhToanList::add);
            }
        }

        return ResponseEntity.ok(thanhToanList);
    }
}
