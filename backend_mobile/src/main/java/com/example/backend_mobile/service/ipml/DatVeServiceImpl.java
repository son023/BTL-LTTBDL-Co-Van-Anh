package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.dtos.request.ThanhToanRequest;
import com.example.backend_mobile.dtos.response.ThanhToanResponse;
import com.example.backend_mobile.entity.*;
import com.example.backend_mobile.enums.HangThanhVien;
import com.example.backend_mobile.repository.*;
import com.example.backend_mobile.service.IDatVeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class DatVeServiceImpl implements IDatVeService {

    private final LichChieuGheRepository lichChieuGheRepository;
    private final VeRepository veRepository;
    private final KhachHangRepository khachHangRepository;
    private final GiaoDichRepository giaoDichRepository;
    private final ChiTietGiaoDichRepository chiTietGiaoDichRepository;
    private final ThanhToanRepository ThanhToanRepository;
    private final ThanhToanRepository thanhToanRepository;

    @Override
    @Transactional
    public String chonGhe(List<Integer> lichChieuGheId, Integer khachHangId) {
        KhachHang khachHang = khachHangRepository.findById(khachHangId)
                .orElseThrow(() -> new RuntimeException("Khách hàng không tồn tại"));

        for(Integer i: lichChieuGheId) {
            LichChieuGhe lichChieuGhe = lichChieuGheRepository.findById(i)
                    .orElseThrow(() -> new RuntimeException("Ghế không tồn tại"));

            if (!lichChieuGhe.getTrangThai().equals("Trống")) {
                throw new RuntimeException("Ghế đã được đặt");
            }

            lichChieuGhe.setTrangThai("Đã chọn");
            lichChieuGhe.setThoiGianGiu(LocalDateTime.now());
            lichChieuGhe.setThoiGianHetHan(LocalDateTime.now().plusMinutes(5));
            lichChieuGheRepository.save(lichChieuGhe);
        }

        return "Thanh cong";
    }

    @Override
    @Transactional
    public void huyGhe(Integer lichChieuGheId, Integer khachHangId) {
        LichChieuGhe lichChieuGhe = lichChieuGheRepository.findById(lichChieuGheId)
                .orElseThrow(() -> new RuntimeException("Ghế không tồn tại"));

        // Chỉ cần cập nhật trạng thái ghế về trống
        lichChieuGhe.setTrangThai("Trống");
        lichChieuGhe.setThoiGianGiu(null);
        lichChieuGhe.setThoiGianHetHan(null);
        lichChieuGheRepository.save(lichChieuGhe);
    }

    @Override
    public boolean enablePaymentMethod(int methodId) {
        Optional<ThanhToan> optionalThanhToan = thanhToanRepository.findById(methodId);
        if (optionalThanhToan.isPresent()) {
            ThanhToan thanhToan = optionalThanhToan.get();
            thanhToan.setStatus(1);
            thanhToanRepository.save(thanhToan);
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public ThanhToanResponse thanhToan(ThanhToanRequest request, Integer khachHangId) {
        KhachHang khachHang = khachHangRepository.findById(khachHangId)
                .orElseThrow(() -> new RuntimeException("Khách hàng không tồn tại"));

        List<LichChieuGhe> danhSachGhe = new ArrayList<>();
        List<String> tenGheDaDat = new ArrayList<>();

        for (Integer lichChieuGheId : request.getLichChieuGheIds()) {
            LichChieuGhe lichChieuGhe = lichChieuGheRepository.findById(lichChieuGheId)
                    .orElseThrow(() -> new RuntimeException("Ghế không tồn tại: " + lichChieuGheId));

            if (!"Đã chọn".equals(lichChieuGhe.getTrangThai())) {
                throw new RuntimeException("Ghế " + lichChieuGhe.getGhe().getTen() + " không được giữ");
            }

            if (lichChieuGhe.getThoiGianHetHan() != null &&
                    lichChieuGhe.getThoiGianHetHan().isBefore(LocalDateTime.now())) {
                throw new RuntimeException("Ghế " + lichChieuGhe.getGhe().getTen() + " đã hết thời gian giữ");
            }

            danhSachGhe.add(lichChieuGhe);
            tenGheDaDat.add(lichChieuGhe.getGhe().getTen());
        }

        BigDecimal tongTien = BigDecimal.valueOf(request.getTongTien());
        BigDecimal giamGia = tinhGiamGia(tongTien, khachHang.getHangThanhVien());
        BigDecimal thanhTien = tongTien.subtract(giamGia);

        GiaoDich giaoDich = new GiaoDich().builder()
                .maGiaoDich(generateMaGiaoDich())
                .thoiGian(LocalDateTime.now())
                .tongTien(tongTien)
                .giamGia(giamGia)
                .thanhTien(thanhTien)
                .trangThai("Đã thanh toán")
                .khachHang(khachHang)
                .maQR(generateMaQR())

                .build();
        giaoDichRepository.save(giaoDich);

        // 4. Tạo vé
        List<String> maCacVe = new ArrayList<>();
        List<Ve> danhSachVe = new ArrayList<>();
        List<ChiTietGiaoDich> chiTietList = new ArrayList<>();

        for (LichChieuGhe lichChieuGhe : danhSachGhe) {
            // Tạo vé
            Ve ve = new Ve().builder()
                    .maVe(generateMaVe())
                    .gia(lichChieuGhe.getLichChieu().getGiaVe())
                    .ngayTao(LocalDateTime.now())
                    .trangThai("Đã thanh toán")
                    .lichChieuGhe(lichChieuGhe)
                    .khachHang(khachHang)
                    .build();

            danhSachVe.add(ve);
            maCacVe.add(ve.getMaVe());

            // Tạo chi tiết giao dịch
            ChiTietGiaoDich chiTiet = new ChiTietGiaoDich().builder()
                    .giaoDich(giaoDich)
                    .ve(ve)
                    .giamGia(BigDecimal.ZERO)
                    .giaTien(ve.getGia()).build();
            chiTietList.add(chiTiet);

            // Cập nhật trạng thái ghế
            lichChieuGhe.setTrangThai("Đã đặt");
            lichChieuGhe.setThoiGianGiu(null);
            lichChieuGhe.setThoiGianHetHan(null);
            lichChieuGheRepository.save(lichChieuGhe);
        }

        veRepository.saveAll(danhSachVe);
        chiTietGiaoDichRepository.saveAll(chiTietList);

        // 5. Cập nhật điểm tích lũy
        int diemThem = thanhTien.intValue() / 10000;
        khachHang.setDiemTichLuy(khachHang.getDiemTichLuy() + diemThem);
        capNhatHangThanhVien(khachHang);
        khachHangRepository.save(khachHang);

        // 6. Trả về response
        return ThanhToanResponse.builder()
                .maQR(giaoDich.getMaQR())
                .maGiaoDich(giaoDich.getMaGiaoDich())
                .gheDaDat(tenGheDaDat)
                .tongTien(thanhTien.doubleValue())
                .maCacVe(maCacVe)
                .build();
    }

    private String generateMaQR() {
        return "QR" + UUID.randomUUID().toString().substring(0, 10).toUpperCase();
    }
    private String generateMaVe() {
        return "V" + System.currentTimeMillis() % 10000000;
    }

    private String generateMaGiaoDich() {
        return "GD" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }

    private BigDecimal tinhGiamGia(BigDecimal tongTien, HangThanhVien hangThanhVien) {
        BigDecimal tyLeGiamGia;

        switch (hangThanhVien) {
            case THUONG:
                tyLeGiamGia = new BigDecimal("0.00");
                break;
            case BAC:
                tyLeGiamGia = new BigDecimal("0.05");
                break;
            default:
                tyLeGiamGia = BigDecimal.ZERO;
        }

        return tongTien.multiply(tyLeGiamGia);
    }

    private void capNhatHangThanhVien(KhachHang khachHang) {
        int diemTichLuy = khachHang.getDiemTichLuy();

        if (diemTichLuy >= 200) {
            khachHang.setHangThanhVien(HangThanhVien.BAC);
        } else {
            khachHang.setHangThanhVien(HangThanhVien.THUONG);
        }
    }


}