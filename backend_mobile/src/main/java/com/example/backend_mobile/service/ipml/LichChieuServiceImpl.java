package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.dtos.GheDTO;
import com.example.backend_mobile.dtos.LichChieuDTO;
import com.example.backend_mobile.dtos.response.SoDoGheResponse;
import com.example.backend_mobile.entity.LichChieu;
import com.example.backend_mobile.entity.LichChieuGhe;
import com.example.backend_mobile.repository.LichChieuGheRepository;
import com.example.backend_mobile.repository.LichChieuRepository;
import com.example.backend_mobile.service.ILichChieuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class LichChieuServiceImpl implements ILichChieuService {

    private final LichChieuRepository lichChieuRepository;
    private final LichChieuGheRepository lichChieuGheRepository;

    @Override
    public List<LocalDate> getNgayChieuByPhimId(Integer phimId) {
        return lichChieuRepository.findNgayChieuByPhimId(phimId);
    }

    @Override
    public List<LichChieuDTO> getGioChieuByPhimIdAndNgay(Integer phimId, LocalDate ngay) {
        List<LichChieu> lichChieuList = lichChieuRepository.findByPhimIdAndNgayAndTrangThai(
                phimId, ngay, "Đang mở");

        return lichChieuList.stream()
                .map(this::convertToLichChieuDTO)
                .collect(Collectors.toList());
    }

    @Override
    public SoDoGheResponse getSoDoGheByLichChieuId(Integer lichChieuId) {
        LichChieu lichChieu = lichChieuRepository.findById(lichChieuId)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy lịch chiếu"));

        List<LichChieuGhe> lichChieuGheList = lichChieuGheRepository.findLichChieuGhesByLichChieuId(lichChieuId);

        // Nhóm ghế theo hàng để dễ hiển thị
        Map<String, List<GheDTO>> gheTheoHang = lichChieuGheList.stream()
                .collect(Collectors.groupingBy(
                        lcg -> lcg.getGhe().getHang(),
                        Collectors.mapping(lcg -> convertToGheDTO(lcg), Collectors.toList())
                ));

        return SoDoGheResponse.builder()
                .lichChieuId(lichChieu.getId())
                .tenPhim(lichChieu.getPhim().getTen())
                .batDau(lichChieu.getBatDau())
                .ketThuc(lichChieu.getKetThuc())
                .tenPhong(lichChieu.getPhong().getTen())
                .loaiPhong(lichChieu.getPhong().getLoaiPhong())
                .giaVe(lichChieu.getGiaVe())
                .soDoGhe(gheTheoHang)
                .build();
    }

    private LichChieuDTO convertToLichChieuDTO(LichChieu lichChieu) {
        return LichChieuDTO.builder()
                .id(lichChieu.getId())
                .batDau(lichChieu.getBatDau())
                .ketThuc(lichChieu.getKetThuc())
                .giaVe(lichChieu.getGiaVe())
                .tenPhong(lichChieu.getPhong().getTen())
                .loaiPhong(lichChieu.getPhong().getLoaiPhong())
                .build();
    }

    private GheDTO convertToGheDTO(LichChieuGhe lichChieuGhe) {
        return GheDTO.builder()
                .id(lichChieuGhe.getGhe().getId())
                .lichChieuGheId(lichChieuGhe.getId())
                .ten(lichChieuGhe.getGhe().getTen())
                .hang(lichChieuGhe.getGhe().getHang())
                .cot(lichChieuGhe.getGhe().getCot())
                .loaiGhe(lichChieuGhe.getGhe().getLoaiGhe())
                .trangThai(lichChieuGhe.getTrangThai())
                .build();
    }
}