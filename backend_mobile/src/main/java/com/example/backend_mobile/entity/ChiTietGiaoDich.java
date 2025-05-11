package com.example.backend_mobile.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Entity
@Table(name = "chi_tiet_giao_dich", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"giao_dich_id", "ve_id"})
})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChiTietGiaoDich {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "giao_dich_id", nullable = false)
    private GiaoDich giaoDich;

    @ManyToOne
    @JoinColumn(name = "ve_id", nullable = false)
    private Ve ve;

    @Column(name = "gia_tien", precision = 10, scale = 2)
    private BigDecimal giaTien;

    @Column(name = "giam_gia", precision = 10, scale = 2)
    private BigDecimal giamGia;

    @Column(name = "ghi_chu", columnDefinition = "TEXT")
    private String ghiChu;
}