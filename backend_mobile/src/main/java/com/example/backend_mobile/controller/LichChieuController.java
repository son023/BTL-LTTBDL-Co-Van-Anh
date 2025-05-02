package com.example.backend_mobile.controller;

import com.example.backend_mobile.dtos.LichChieuDTO;
import com.example.backend_mobile.dtos.response.ApiResponse;
import com.example.backend_mobile.dtos.response.SoDoGheResponse;
import com.example.backend_mobile.service.LichChieuService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/lich-chieu")
@RequiredArgsConstructor
public class LichChieuController {

    private final LichChieuService lichChieuService;

    @GetMapping("/ngay-chieu/{phimId}")
    public ResponseEntity<ApiResponse<List<LocalDate>>> getNgayChieuByPhimId(
            @PathVariable Integer phimId) {
        List<LocalDate> ngayChieu = lichChieuService.getNgayChieuByPhimId(phimId);
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy ngày chiếu thành công", ngayChieu));
    }

    @GetMapping("/gio-chieu/{phimId}")
    public ResponseEntity<ApiResponse<List<LichChieuDTO>>> getGioChieuByPhimIdAndNgay(
            @PathVariable Integer phimId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate ngay) {
        List<LichChieuDTO> lichChieuList = lichChieuService.getGioChieuByPhimIdAndNgay(phimId, ngay);
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy giờ chiếu thành công", lichChieuList));
    }

    @GetMapping("/so-do-ghe/{lichChieuId}")
    public ResponseEntity<ApiResponse<SoDoGheResponse>> getSoDoGheByLichChieuId(
            @PathVariable Integer lichChieuId) {
        SoDoGheResponse soDoGhe = lichChieuService.getSoDoGheByLichChieuId(lichChieuId);
        return ResponseEntity.ok(new ApiResponse<>(true, "Lấy sơ đồ ghế thành công", soDoGhe));
    }
}