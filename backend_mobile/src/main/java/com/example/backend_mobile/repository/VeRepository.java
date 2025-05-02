package com.example.backend_mobile.repository;

import com.example.backend_mobile.entity.Ve;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface VeRepository extends JpaRepository<Ve, Integer> {

    @Query("SELECT v FROM Ve v WHERE v.lichChieuGhe.id = :lichChieuGheId AND v.khachHang.id = :khachHangId AND v.trangThai = :trangThai")
    Ve findByLichChieuGheIdAndKhachHangIdAndTrangThai(
            @Param("lichChieuGheId") Integer lichChieuGheId,
            @Param("khachHangId") Integer khachHangId,
            @Param("trangThai") String trangThai);

    @Query("SELECT v FROM Ve v WHERE v.khachHang.id = :khachHangId AND v.trangThai = :trangThai AND v.lichChieuGhe.lichChieu.id = :lichChieuId")
    List<Ve> findByKhachHangIdAndTrangThaiAndLichChieuGhe_LichChieu_Id(
            @Param("khachHangId") Integer khachHangId,
            @Param("trangThai") String trangThai,
            @Param("lichChieuId") Integer lichChieuId);

    @Query("SELECT v FROM Ve v WHERE v.trangThai = 'Chờ thanh toán' AND v.ngayTao < :thoiGianHet")
    List<Ve> findVeChoThanhToanHetHan(@Param("thoiGianHet") LocalDateTime thoiGianHet);
}

