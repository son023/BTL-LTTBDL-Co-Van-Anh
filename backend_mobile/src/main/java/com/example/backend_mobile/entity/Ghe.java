package com.example.backend_mobile.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "ghe", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"phong_id", "hang", "cot"})
})
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ghe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ten", nullable = false, length = 20)
    private String ten;

    @Column(name = "hang", nullable = false, length = 5)
    private String hang;

    @Column(name = "cot", nullable = false, length = 5)
    private String cot;

    @Column(name = "loai_ghe", length = 10)
    private String loaiGhe = "Thường";

    @Column(name = "trang_thai", length = 20)
    private String trangThai = "Hoạt động";

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "phong_id", nullable = false)
    private Phong phong;
}