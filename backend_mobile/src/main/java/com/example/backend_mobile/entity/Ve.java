package com.example.backend_mobile.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "ve")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ve {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma_ve", nullable = false, length = 20, unique = true)
    private String maVe;

    @Column(name = "gia", nullable = false, precision = 10, scale = 2)
    private BigDecimal gia;

    @Column(name = "ngay_tao")
    private LocalDateTime ngayTao = LocalDateTime.now();

    @Column(name = "trang_thai", length = 20)
    private String trangThai = "Chờ thanh toán";

    @Column(name = "ghi_chu", columnDefinition = "TEXT")
    private String ghiChu;

    @OneToOne
    @JoinColumn(name = "lich_chieu_ghe_id", nullable = false)
    private LichChieuGhe lichChieuGhe;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "khach_hang_id", nullable = false)
    private KhachHang khachHang;
}