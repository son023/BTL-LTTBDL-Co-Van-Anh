package com.example.backend_mobile.controller;

import com.example.backend_mobile.dtos.PaymentMethodDTO;
import com.example.backend_mobile.security.jwt.JwtUtils;
import com.example.backend_mobile.service.IHandlePaymentService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PaymentController {

    IHandlePaymentService handlePaymentService;
    JwtUtils jwtUtils;

    @GetMapping("/get-enable-method")
    public ResponseEntity<List<PaymentMethodDTO>> getAllEnalblePaymentMethods(@RequestHeader("Authorization") String token) {

        try {
            String jwtToken = token.replace("Bearer ", "");
            Integer khachHangId = jwtUtils.getKhachHangIdFromToken(jwtToken);
            return ResponseEntity.ok(handlePaymentService.getAllEnalblePaymentMethods(khachHangId));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ArrayList<>());
        }
    }

    @PostMapping("update")
    public ResponseEntity<Boolean> updatePaymentMethod(@RequestBody PaymentMethodDTO paymentMethodDTO,
                                                       @RequestHeader("Authorization") String token) {
        try {
            String jwtToken = token.replace("Bearer ", "");
            Integer khachHangId = jwtUtils.getKhachHangIdFromToken(jwtToken);
            return ResponseEntity.ok(handlePaymentService.updatePaymentMethod(khachHangId, paymentMethodDTO));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(false);
        }
    }
}
