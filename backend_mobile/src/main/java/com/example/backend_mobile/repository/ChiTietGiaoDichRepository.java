package com.example.backend_mobile.repository;

import com.example.backend_mobile.entity.ChiTietGiaoDich;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChiTietGiaoDichRepository extends JpaRepository<ChiTietGiaoDich, Integer> {
    List<ChiTietGiaoDich> findByGiaoDichId(Integer giaoDichId);
}
