package com.example.backend_mobile.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "lich_chieu")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LichChieu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "bat_dau", nullable = false)
    private LocalDateTime batDau;

    @Column(name = "ket_thuc", nullable = false)
    private LocalDateTime ketThuc;

    @Column(name = "ngay_lap", nullable = false)
    private LocalDateTime ngayLap = LocalDateTime.now();

    @Column(name = "gia_ve", nullable = false, precision = 10, scale = 2)
    private BigDecimal giaVe;

    @Column(name = "trang_thai", length = 20)
    private String trangThai = "Chưa mở bán";

    @ManyToOne
    @JoinColumn(name = "phim_id", nullable = false)
    private Phim phim;

    @ManyToOne
    @JoinColumn(name = "phong_id", nullable = false)
    private Phong phong;

}