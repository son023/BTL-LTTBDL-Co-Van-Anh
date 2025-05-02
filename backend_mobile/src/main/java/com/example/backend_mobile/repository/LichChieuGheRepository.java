package com.example.backend_mobile.repository;

import com.example.backend_mobile.entity.LichChieu;
import com.example.backend_mobile.entity.LichChieuGhe;
import com.example.backend_mobile.entity.Ghe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LichChieuGheRepository extends JpaRepository<LichChieuGhe, Integer> {
    List<LichChieuGhe> findLichChieuGhesByLichChieuId(Integer lichChieuId);
    List<LichChieuGhe> findByLichChieuAndTrangThai(LichChieu lichChieu, String trangThai);
    Optional<LichChieuGhe> findByLichChieuAndGhe(LichChieu lichChieu, Ghe ghe);
}