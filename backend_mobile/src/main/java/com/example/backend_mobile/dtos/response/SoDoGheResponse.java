package com.example.backend_mobile.dtos.response;

import com.example.backend_mobile.dtos.GheDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SoDoGheResponse {
    private Integer lichChieuId;
    private String tenPhim;
    private LocalDateTime batDau;
    private LocalDateTime ketThuc;
    private String tenPhong;
    private String loaiPhong;
    private BigDecimal giaVe;
    private Map<String, List<GheDTO>> soDoGhe; // Map<Hàng, Danh sách ghế>
}
