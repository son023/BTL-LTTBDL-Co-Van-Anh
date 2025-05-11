package com.example.backend_mobile.controller;

import com.example.backend_mobile.entity.ThanhToan;
import com.example.backend_mobile.service.IHandlePaymentService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)

public class PaymentController {

    private IHandlePaymentService handlePaymentService;

    @GetMapping("/get-enable-method")
    public ResponseEntity<List<ThanhToan>> getAllEnalblePaymentMethods() {
        return handlePaymentService.getAllEnalblePaymentMethods();
    }
}
