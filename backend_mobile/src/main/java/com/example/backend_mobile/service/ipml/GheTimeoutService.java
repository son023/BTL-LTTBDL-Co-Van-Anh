package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.entity.LichChieuGhe;
import com.example.backend_mobile.entity.Ve;
import com.example.backend_mobile.repository.LichChieuGheRepository;
import com.example.backend_mobile.repository.VeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@EnableScheduling
@RequiredArgsConstructor
@Slf4j
public class GheTimeoutService {

    private final VeRepository veRepository;
    private final LichChieuGheRepository lichChieuGheRepository;

    @Scheduled(fixedRate = 60000)
    @Transactional
    public void huyGheHetHan() {
        LocalDateTime now = LocalDateTime.now();

        List<LichChieuGhe> danhSachGheHetHan = lichChieuGheRepository.findAllByTrangThaiAndThoiGianHetHanBefore("Đã chọn", now);

        for (LichChieuGhe lichChieuGhe : danhSachGheHetHan) {
            lichChieuGhe.setTrangThai("Trống");
            lichChieuGhe.setThoiGianGiu(null);
            lichChieuGhe.setThoiGianHetHan(null);
            lichChieuGheRepository.save(lichChieuGhe);
        }

        if (!danhSachGheHetHan.isEmpty()) {
            log.info("Đã hủy {} ghế hết hạn giữ", danhSachGheHetHan.size());
        }
    }
}