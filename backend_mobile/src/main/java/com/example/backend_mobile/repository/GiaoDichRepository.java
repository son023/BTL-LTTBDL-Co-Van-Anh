package com.example.backend_mobile.repository;

import com.example.backend_mobile.entity.GiaoDich;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface GiaoDichRepository extends JpaRepository<GiaoDich, Integer> {
    Optional<GiaoDich> findByMaGiaoDichAndKhachHangId(String maGiaoDich, Integer khachHangId);
}
