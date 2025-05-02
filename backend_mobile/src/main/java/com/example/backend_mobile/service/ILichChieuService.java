package com.example.backend_mobile.service;


import com.example.backend_mobile.dtos.LichChieuDTO;
import com.example.backend_mobile.dtos.response.SoDoGheResponse;

import java.time.LocalDate;
import java.util.List;

public interface ILichChieuService {

    List<LocalDate> getNgayChieuByPhimId(Integer phimId);

    List<LichChieuDTO> getGioChieuByPhimIdAndNgay(Integer phimId, LocalDate ngay);

    SoDoGheResponse getSoDoGheByLichChieuId(Integer lichChieuId);
}