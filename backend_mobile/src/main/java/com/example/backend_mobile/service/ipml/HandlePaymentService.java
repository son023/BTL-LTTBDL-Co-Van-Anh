package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.dtos.PaymentMethodDTO;
import com.example.backend_mobile.entity.ChiTietPhuongThuc;
import com.example.backend_mobile.entity.ThanhToan;
import com.example.backend_mobile.repository.ChiTietPhuongThucRepository;
import com.example.backend_mobile.repository.ThanhToanRepository;
import com.example.backend_mobile.security.service.UserDetailsImpl;
import com.example.backend_mobile.service.IHandlePaymentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class HandlePaymentService implements IHandlePaymentService {

    private final ChiTietPhuongThucRepository chiTietPhuongThucRepository;

    @Override
    public List<PaymentMethodDTO> getAllEnalblePaymentMethods(int currentUserId) {

        List<PaymentMethodDTO> paymentMethodDTOS = new ArrayList<>();
        List<ChiTietPhuongThuc> methodList = chiTietPhuongThucRepository.findByKhachHangId(currentUserId);

        for (ChiTietPhuongThuc method : methodList) {
            if(method.getStatus().equals("ENABLE")) {
                PaymentMethodDTO paymentMethodDTO = new PaymentMethodDTO();
                paymentMethodDTO.setId(method.getThanhToan().getId());
                paymentMethodDTO.setTen(method.getThanhToan().getTen());
                paymentMethodDTO.setSoTaiKhoan(method.getStk());
                paymentMethodDTOS.add(paymentMethodDTO);
            }
        }

        return paymentMethodDTOS;
    }
}
