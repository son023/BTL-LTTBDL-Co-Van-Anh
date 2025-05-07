package com.example.backend_mobile.service;

import org.springframework.http.ResponseEntity;

public interface IPhimService {
    ResponseEntity<?> getAll();
    ResponseEntity<?> get(Integer maPhim);
}
