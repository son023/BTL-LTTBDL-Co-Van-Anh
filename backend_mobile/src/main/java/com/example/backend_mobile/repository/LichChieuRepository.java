package com.example.backend_mobile.repository;

import com.example.backend_mobile.entity.LichChieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface LichChieuRepository extends JpaRepository<LichChieu, Integer> {

    @Query("SELECT DISTINCT CAST(lc.batDau AS LocalDate) FROM LichChieu lc WHERE lc.phim.id = :phimId AND lc.trangThai = 'Đang mở' AND lc.batDau >= CURRENT_DATE ORDER BY CAST(lc.batDau AS LocalDate)")
    List<LocalDate> findNgayChieuByPhimId(@Param("phimId") Integer phimId);

    @Query("SELECT lc FROM LichChieu lc WHERE lc.phim.id = :phimId AND DATE(lc.batDau) = :ngay AND lc.trangThai = :trangThai ORDER BY lc.batDau")
    List<LichChieu> findByPhimIdAndNgayAndTrangThai(
            @Param("phimId") Integer phimId,
            @Param("ngay") LocalDate ngay,
            @Param("trangThai") String trangThai);
}

