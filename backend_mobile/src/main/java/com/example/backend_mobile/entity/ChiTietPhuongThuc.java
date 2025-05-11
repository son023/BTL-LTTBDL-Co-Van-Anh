package com.example.backend_mobile.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "chi_tiet_phuong_thuc")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChiTietPhuongThuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang", nullable = false)
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "id_thanh_toan", nullable = false)
    private ThanhToan thanhToan;

    @Column(name = "status")
    private String status;

    @Column(name = "so_tai_khoan")
    private String stk;
}
