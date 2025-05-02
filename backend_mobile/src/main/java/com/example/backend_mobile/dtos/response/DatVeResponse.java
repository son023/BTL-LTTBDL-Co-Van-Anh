package com.example.backend_mobile.dtos.response;

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
public class DatVeResponse {
    private Integer veId;
    private String maVe;
    private String tenGhe;
    private BigDecimal giaVe;
    private LocalDateTime thoiGianGiuGhe;
}

