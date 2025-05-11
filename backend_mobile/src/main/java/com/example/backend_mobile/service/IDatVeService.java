package com.example.backend_mobile.service;

import com.example.backend_mobile.dtos.request.DatVeRequest;
import com.example.backend_mobile.dtos.response.DatVeResponse;

public interface IDatVeService {

    DatVeResponse chonGhe(DatVeRequest request, Integer khachHangId);

    void huyGhe(Integer lichChieuGheId, Integer khachHangId);

    String taoGiaoDich(Integer lichChieuId, Integer khachHangId);

//    void xacNhanThanhToan(String maGiaoDich, Integer khachHangId);

    boolean enablePaymentMethod(int methodId, String stk);
}