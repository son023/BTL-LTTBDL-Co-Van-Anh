package com.example.backend_mobile.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "giao_dich")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiaoDich {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma_giao_dich", nullable = false, unique = true)
    private String maGiaoDich;

    @Column(name = "thoi_gian", nullable = false)
    private LocalDateTime thoiGian = LocalDateTime.now();

    @Column(name = "tong_tien", nullable = false, precision = 12, scale = 2)
    private BigDecimal tongTien;

    @Column(name = "giam_gia", precision = 10, scale = 2)
    private BigDecimal giamGia = BigDecimal.ZERO;

    @Column(name = "thanh_tien", precision = 10, scale = 2)
    private BigDecimal thanhTien;

    @Column(name = "phuong_thuc", nullable = false, length = 20)
    private String phuongThuc = "Chuyển khoản";

    @Column(name = "trang_thai", length = 20)
    private String trangThai = "Đang xử lý";

    @Column(name = "ma_qr")
    private String maQR;

    @Column(name = "ghi_chu", columnDefinition = "TEXT")
    private String ghiChu;

    @ManyToOne
    @JoinColumn(name = "khach_hang_id", nullable = false)
    private KhachHang khachHang;

    @OneToMany(mappedBy = "giaoDich", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ChiTietGiaoDich> chiTietGiaoDich;
}