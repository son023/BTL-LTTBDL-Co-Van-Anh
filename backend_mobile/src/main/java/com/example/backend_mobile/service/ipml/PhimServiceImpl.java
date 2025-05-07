package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.entity.Phim;
import com.example.backend_mobile.repository.PhimRepository;
import com.example.backend_mobile.service.IPhimService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PhimServiceImpl implements IPhimService {

    PhimRepository phimRepository;

    @Override
    public ResponseEntity<?> getAll() {
        List<Phim> dsPhim = phimRepository.findAll();
        return ResponseEntity.ok().body(dsPhim);
    }

    @Override
    public ResponseEntity<?> get(Integer maPhim) {
        Phim phim = phimRepository.findById(maPhim).get();

        if (phim == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().body(phim);
    }
}
