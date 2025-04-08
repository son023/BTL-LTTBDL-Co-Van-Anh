package com.example.backend_mobile.entity;

import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "dien_vien")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DienVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ho_ten", nullable = false)
    @Size(max = 100)
    private String ho_ten;

    @Column(name = "gioi_tinh")
    @Size(max = 10)
    private String gioi_tinh;

    @Column(name = "ngay_sinh")
    private LocalDateTime ngay_sinh = LocalDateTime.now();

    @Column(name = "quoc_tich")
    @Size(max = 50)
    private String quoc_tich;

    @Column(name = "tieu_su")
    private String tieu_su;

    @Column(name = "anh_dai_dien")
    @Size(max = 255)
    private String anh_dai_dien;

    @Column(name = "ngay_tao")
    private LocalDateTime ngay_tao = LocalDateTime.now();
}