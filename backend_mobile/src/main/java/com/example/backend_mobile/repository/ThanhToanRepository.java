package com.example.backend_mobile.repository;

import com.example.backend_mobile.entity.ChiTietGiaoDich;
import com.example.backend_mobile.entity.ThanhToan;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ThanhToanRepository extends JpaRepository<ThanhToan, Integer> {
}
