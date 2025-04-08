package com.example.backend_mobile.entity;

import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

@Entity
@Table(name = "phim")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Phim {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ten", nullable = false)
    @Size(max = 255)
    private String ten;

    @Column(name = "the_loai", nullable = false)
    @Size(max = 100)
    private String theLoai;

    @Column(name = "do_dai", nullable = false)
    private Integer doDai;

    @Column(name = "ngon_ngu", nullable = false)
    @Size(max = 50)
    private String ngonNgu;

    @Column(name = "dao_dien")
    @Size(max = 100)
    private String daoDien;

    @Column(name = "mo_ta")
    private String moTa;

    @Column(name = "poster")
    @Size(max = 255)
    private String poster;

    @Column(name = "trailer")
    @Size(max = 255)
    private String trailer;

    @Column(name = "nam_sx")
    private Integer namSx;

    @Column(name = "hang_sx")
    @Size(max = 100)
    private String hangSx;

    @Column(name = "do_tuoi")
    @Size(max = 10)
    private Integer doTuoi;

    @Column(name = "danh_gia")
    private Float danhGia = 0f;

    @Column(name = "trang_thai")
    @Size(max = 20)
    private String trangThai = "Sắp chiếu";
}