package com.example.backend_mobile.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "phong")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Phong {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ten", nullable = false, length = 50)
    private String ten;

    @Column(name = "suc_chua", nullable = false)
    private Integer sucChua;

    @Column(name = "loai_phong", nullable = false, length = 10)
    private String loaiPhong;

    @Column(name = "vi_tri", nullable = false, length = 100)
    private String viTri;

    @Column(name = "trang_thai", length = 20)
    private String trangThai = "Hoạt động";

    @Column(name = "mo_ta", columnDefinition = "TEXT")
    private String moTa;



}