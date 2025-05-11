package com.example.backend_mobile.controller;


import com.example.backend_mobile.dtos.request.DatVeRequest;
import com.example.backend_mobile.dtos.response.ApiResponse;
import com.example.backend_mobile.dtos.response.DatVeResponse;
import com.example.backend_mobile.security.jwt.JwtUtils;
import com.example.backend_mobile.service.IDatVeService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/dat-ve")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DatVeController {

     IDatVeService datVeService;
     JwtUtils jwtUtils;

    @PostMapping("/chon-ghe")
    public ResponseEntity<ApiResponse<DatVeResponse>> chonGhe(
            @RequestBody DatVeRequest request,
            @RequestHeader("Authorization") String token) {
        try {
            String jwtToken = token.replace("Bearer ", "");
            Integer khachHangId = jwtUtils.getKhachHangIdFromToken(jwtToken);

            DatVeResponse response = datVeService.chonGhe(request, khachHangId);
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

    @PostMapping("/thanh-toan")
    public ResponseEntity<ApiResponse<String>> thanhToan(
            @RequestParam Integer lichChieuId,
            @RequestHeader("Authorization") String token) {
        try {
            String jwtToken = token.replace("Bearer ", "");
            Integer khachHangId = jwtUtils.getKhachHangIdFromToken(jwtToken);

            String maQR = datVeService.taoGiaoDich(lichChieuId, khachHangId);
            return ResponseEntity.ok(new ApiResponse<>(true, "Tạo giao dịch thành công", maQR));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new ApiResponse<>(false, e.getMessage(), null));
        }
    }

    @PostMapping("/enable/{methodId}")
    public ResponseEntity<String> enablePaymentMethod(@PathVariable int methodId, @RequestParam("stk") String stk) {
        boolean success = datVeService.enablePaymentMethod(methodId, stk);
        if (success) {
            return ResponseEntity.ok("Payment method enabled successfully.");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Payment method not found.");
        }
    }

//    @PostMapping("/xac-nhan-thanh-toan")
//    public ResponseEntity<ApiResponse<Void>> xacNhanThanhToan(
//            @RequestParam String maGiaoDich,
//            @RequestHeader("Authorization") String token) {
//        try {
//            String jwtToken = token.replace("Bearer ", "");
//            Integer khachHangId = jwtUtils.getKhachHangIdFromToken(jwtToken);
//
//            datVeService.xacNhanThanhToan(maGiaoDich, khachHangId);
//            return ResponseEntity.ok(new ApiResponse<>(true, "Thanh toán thành công", null));
//        } catch (Exception e) {
//            return ResponseEntity.badRequest().body(new ApiResponse<>(false, e.getMessage(), null));
//        }
//    }
}