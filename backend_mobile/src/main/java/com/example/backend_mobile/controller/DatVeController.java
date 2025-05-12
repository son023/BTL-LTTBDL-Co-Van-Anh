package com.example.backend_mobile.controller;


import com.example.backend_mobile.dtos.request.ThanhToanRequest;
import com.example.backend_mobile.dtos.response.ApiResponse;
import com.example.backend_mobile.dtos.response.ThanhToanResponse;
import com.example.backend_mobile.security.jwt.JwtUtils;
import com.example.backend_mobile.service.IDatVeService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/dat-ve")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DatVeController {

     IDatVeService datVeService;
     JwtUtils jwtUtils;

    @PostMapping("/chon-ghe")
    public ResponseEntity<ApiResponse<String>> chonGhe(
            @RequestBody List<Integer> lichChieuGheId,
            @RequestHeader("Authorization") String token) {
        try {
            String jwtToken = token.replace("Bearer ", "");
            Integer khachHangId = jwtUtils.getKhachHangIdFromToken(jwtToken);

            String response = datVeService.chonGhe(lichChieuGheId, khachHangId);
            return ResponseEntity.ok(new ApiResponse<>(true, "Chọn ghế thành công", response));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse<>(false, e.getMessage(), null));
        }
    }

    @DeleteMapping("/huy-ghe/{lichChieuGheId}")
    public ResponseEntity<ApiResponse<Void>> huyGhe(
            @PathVariable Integer lichChieuGheId,
            @RequestHeader("Authorization") String token) {
        try {
            String jwtToken = token.replace("Bearer ", "");
            Integer khachHangId = jwtUtils.getKhachHangIdFromToken(jwtToken);

            datVeService.huyGhe(lichChieuGheId, khachHangId);
            return ResponseEntity.ok(new ApiResponse<>(true, "Hủy ghế thành công", null));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse<>(false, e.getMessage(), null));
        }
    }

    @PostMapping("/enable/{methodId}")
    public Map<String, Boolean> enablePaymentMethod(@PathVariable int methodId, @RequestParam("stk") String stk) {
        boolean result = datVeService.enablePaymentMethod(methodId, stk);
        Map<String, Boolean> response = new HashMap<>();
        response.put("success", result);
        return response;
    }

    @PostMapping("/thanh-toan")
    public ResponseEntity<ThanhToanResponse> thanhToan(
            @RequestBody ThanhToanRequest request,
            @RequestHeader("Authorization") String token) {
        try {
            String jwtToken = token.replace("Bearer ", "");
            Integer khachHangId = jwtUtils.getKhachHangIdFromToken(jwtToken);

            ThanhToanResponse response = datVeService.thanhToan(request, khachHangId);
            return ResponseEntity.ok( response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }

}