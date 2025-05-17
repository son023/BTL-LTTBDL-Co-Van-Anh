package com.example.backend_mobile.repository;

import com.example.backend_mobile.entity.ChiTietPhuongThuc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChiTietPhuongThucRepository extends JpaRepository<ChiTietPhuongThuc, Integer> {

    @Query(value = "SELECT * FROM chi_tiet_phuong_thuc WHERE id_khach_hang = :idKhachHang", nativeQuery = true)
    List<ChiTietPhuongThuc> findByKhachHangId(@Param("idKhachHang") Integer idKhachHang);
    List<ChiTietPhuongThuc> findByThanhToanId(Integer thanhToanId);
}
