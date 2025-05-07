package com.example.backend_mobile.repository;

import com.example.backend_mobile.entity.Phim;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhimRepository extends JpaRepository<Phim, Integer> {
}
