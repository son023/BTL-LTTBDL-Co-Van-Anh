package com.example.backend_mobile.service;

import com.example.backend_mobile.dtos.PaymentMethodDTO;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface IHandlePaymentService {
    List<PaymentMethodDTO> getAllEnalblePaymentMethods(int currentUserId);
    boolean updatePaymentMethod(int khachHangId, PaymentMethodDTO paymentMethodDTO);
}
