package com.example.backend_mobile.entity;

import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

@Entity
@Table(name = "phim_dien_vien")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PhimDienVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "phim", nullable = false)
    private Phim phim;

    @ManyToOne
    @JoinColumn(name = "dien_vien", nullable = false)
    private DienVien dienVien;

    @Column(name = "vai_dien")
    @Size(max = 100)
    private String vaiDien;

    @Column(name = "la_chinh")
    private Boolean laChinh = false;

    @Column(name = "ghi_chu")
    private String ghiChu;
}