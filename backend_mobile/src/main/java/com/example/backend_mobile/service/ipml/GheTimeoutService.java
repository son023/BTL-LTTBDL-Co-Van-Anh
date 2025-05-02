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

    // Chạy mỗi phút để kiểm tra ghế hết hạn
    @Scheduled(fixedRate = 60000) // 60000ms = 1 phút
    @Transactional
    public void kiemTraGheHetHan() {
        log.info("Bắt đầu kiểm tra ghế hết hạn...");

        // Lấy thời điểm 5 phút trước để kiểm tra
        LocalDateTime thoiGianHetHan = LocalDateTime.now().minusMinutes(5);

        // Tìm các vé chờ thanh toán đã quá hạn
        List<Ve> danhSachVeHetHan = veRepository.findVeChoThanhToanHetHan(thoiGianHetHan);

        if (!danhSachVeHetHan.isEmpty()) {
            log.info("Đã tìm thấy {} vé hết hạn cần giải phóng", danhSachVeHetHan.size());

            for (Ve ve : danhSachVeHetHan) {
                // Lấy ghế tương ứng với vé
                LichChieuGhe lichChieuGhe = ve.getLichChieuGhe();

                if (lichChieuGhe != null) {
                    // Đặt lại trạng thái ghế thành "Trống"
                    lichChieuGhe.setTrangThai("Trống");
                    lichChieuGheRepository.save(lichChieuGhe);

                    // Cập nhật trạng thái vé thành "Đã hủy"
                    ve.setTrangThai("Đã hủy");
                    ve.setGhiChu("Vé hết hạn do không thanh toán trong thời gian quy định");
                    veRepository.save(ve);

                    log.debug("Đã giải phóng ghế {} cho lịch chiếu {}",
                            lichChieuGhe.getGhe().getTen(),
                            lichChieuGhe.getLichChieu().getId());
                }
            }

            log.info("Hoàn thành việc giải phóng {} ghế đã hết hạn", danhSachVeHetHan.size());
        } else {
            log.debug("Không có ghế nào cần giải phóng");
        }
    }
}