package com.example.backend_mobile.dtos.request;

import lombok.Data;
import java.util.List;

@Data
public class ThanhToanRequest {
    private List<Integer> lichChieuGheIds;
    private Double tongTien;
    private String phuongThucThanhToan;
}