package com.example.backend_mobile.dtos.response;

import lombok.Builder;
import lombok.Data;
import java.util.List;

@Data
@Builder
public class ThanhToanResponse {
    private String maQR;
    private String maGiaoDich;
    private List<String> gheDaDat;
    private Double tongTien;
    private List<String> maCacVe;
}