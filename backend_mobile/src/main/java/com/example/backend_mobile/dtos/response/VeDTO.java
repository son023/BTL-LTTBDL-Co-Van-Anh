package com.example.backend_mobile.dtos.response;

import com.example.backend_mobile.entity.Ve;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VeDTO {
    private Integer id;
    private String maVe;
    private BigDecimal gia;
    private LocalDateTime ngayTao;
    private String trangThai;
    private String ghiChu;

    // Dữ liệu từ các entity liên quan (flatten)
    private Integer lichChieuId;
    private String tenPhim;
    private String tenPhong;

    private Integer gheId;
    private String tenGhe;

    private Integer khachHangId;
    private String tenKhachHang;
    private String emailKhachHang;

    public VeDTO convertToDTO(Ve ve) {
        VeDTO dto = new VeDTO();
        dto.setId(ve.getId());
        dto.setMaVe(ve.getMaVe());
        dto.setGia(ve.getGia());
        dto.setNgayTao(ve.getNgayTao());
        dto.setTrangThai(ve.getTrangThai());
        dto.setGhiChu(ve.getGhiChu());

        dto.setLichChieuId(ve.getLichChieu().getId());
        dto.setTenPhim(ve.getLichChieu().getPhim().getTen()); // nếu có
        dto.setTenPhong(ve.getLichChieu().getPhong().getTen()); // nếu có

        dto.setGheId(ve.getGhe().getId());
        dto.setTenGhe(ve.getGhe().getTen());

        dto.setKhachHangId(ve.getKhachHang().getId());
        dto.setTenKhachHang(ve.getKhachHang().getTen());
        dto.setEmailKhachHang(ve.getKhachHang().getEmail());
        return dto;
    }
}

