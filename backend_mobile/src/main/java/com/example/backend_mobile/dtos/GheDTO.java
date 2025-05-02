package com.example.backend_mobile.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GheDTO {
    private Integer id;
    private Integer lichChieuGheId;
    private String ten;
    private String hang;
    private String cot;
    private String loaiGhe;
    private String trangThai;
}

