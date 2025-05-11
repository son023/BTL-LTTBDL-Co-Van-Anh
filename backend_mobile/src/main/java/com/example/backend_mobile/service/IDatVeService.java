package com.example.backend_mobile.service;

import com.example.backend_mobile.dtos.request.ThanhToanRequest;
import com.example.backend_mobile.dtos.response.ThanhToanResponse;

import java.util.List;

public interface IDatVeService {

    String chonGhe(List<Integer> lichChieuGheId, Integer khachHangId);

    void huyGhe(Integer lichChieuGheId, Integer khachHangId);

    ThanhToanResponse thanhToan(ThanhToanRequest datVeRequest, Integer khachHangId);

    boolean enablePaymentMethod(int methodId);
}