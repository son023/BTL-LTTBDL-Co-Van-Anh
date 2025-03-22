package com.example.backend_mobile.entity;


import com.example.backend_mobile.enums.HangThanhVien;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "khach_hang")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class KhachHang extends NguoiDung {

    @Column(name = "ma_thanh_vien")
    private String maThanhVien;

    @Column(name = "diem_tich_luy")
    private Integer diemTichLuy = 0;

    @Enumerated(EnumType.STRING)
    @Column(name = "hang_thanh_vien")
    private HangThanhVien hangThanhVien = HangThanhVien.THUONG;

    @Column(name = "ngay_dang_ky")
    private LocalDateTime ngayDangKy = LocalDateTime.now();
}