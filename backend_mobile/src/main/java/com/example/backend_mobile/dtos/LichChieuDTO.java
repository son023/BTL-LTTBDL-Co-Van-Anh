package com.example.backend_mobile.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LichChieuDTO {
    private Integer id;
    private LocalDateTime batDau;
    private LocalDateTime ketThuc;
    private BigDecimal giaVe;
    private String tenPhong;
    private String loaiPhong;
}

