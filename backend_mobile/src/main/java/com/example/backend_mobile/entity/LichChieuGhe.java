package com.example.backend_mobile.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "lich_chieu_ghe")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LichChieuGhe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "lich_chieu_id", nullable = false)
    private LichChieu lichChieu;

    @ManyToOne
    @JoinColumn(name = "ghe_id", nullable = false)
    private Ghe ghe;

    @Column(name = "trang_thai", length = 20, nullable = false)
    private String trangThai = "Trống";

    @Column(name = "thoi_gian_giu")
    private LocalDateTime thoiGianGiu;

    @Column(name = "thoi_gian_het_han")
    private LocalDateTime thoiGianHetHan;
}