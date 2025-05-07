package com.example.backend_mobile.controller;

import com.example.backend_mobile.entity.Phim;
import com.example.backend_mobile.service.ipml.PhimServiceImpl;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/phim")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PhimController {

    PhimServiceImpl phimService;

    @GetMapping()
    ResponseEntity<?> getAll() {
        return phimService.getAll();
    }

    @GetMapping("/{maPhim}")
    ResponseEntity<?> get(@PathVariable Integer maPhim) {
        return phimService.get(maPhim);
    }
}
