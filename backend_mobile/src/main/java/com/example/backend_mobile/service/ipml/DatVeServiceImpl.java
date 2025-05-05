package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.dtos.request.DatVeRequest;
import com.example.backend_mobile.dtos.response.DatVeResponse;
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
    public DatVeResponse chonGhe(DatVeRequest request, Integer khachHangId) {
        KhachHang khachHang = khachHangRepository.findById(khachHangId)
                .orElseThrow(() -> new RuntimeException("Khách hàng không tồn tại"));

        LichChieuGhe lichChieuGhe = lichChieuGheRepository.findById(request.getLichChieuGheId())
                .orElseThrow(() -> new RuntimeException("Ghế không tồn tại"));

        if (!lichChieuGhe.getTrangThai().equals("Trống")) {
            throw new RuntimeException("Ghế đã được đặt");
        }

        lichChieuGhe.setTrangThai("Đã chọn");
        lichChieuGheRepository.save(lichChieuGhe);

        Ve ve = new Ve();
        ve.setMaVe(generateMaVe());
        ve.setGia(lichChieuGhe.getLichChieu().getGiaVe());
        ve.setNgayTao(LocalDateTime.now());
        ve.setTrangThai("Chờ thanh toán");
        ve.setLichChieuGhe(lichChieuGhe);
        ve.setKhachHang(khachHang);

        veRepository.save(ve);

        LocalDateTime thoiGianGiuGhe = LocalDateTime.now().plusMinutes(5);

        return DatVeResponse.builder()
                .veId(ve.getId())
                .maVe(ve.getMaVe())
                .tenGhe(lichChieuGhe.getGhe().getTen())
                .giaVe(ve.getGia())
                .thoiGianGiuGhe(thoiGianGiuGhe)
                .build();
    }

    @Override
    @Transactional
    public void huyGhe(Integer lichChieuGheId, Integer khachHangId) {
        LichChieuGhe lichChieuGhe = lichChieuGheRepository.findById(lichChieuGheId)
                .orElseThrow(() -> new RuntimeException("Ghế không tồn tại"));

        lichChieuGhe.setTrangThai("Trống");
        lichChieuGheRepository.save(lichChieuGhe);

        Ve ve = veRepository.findByLichChieuGheIdAndKhachHangIdAndTrangThai(
                lichChieuGheId, khachHangId, "Chờ thanh toán");

        if (ve != null) {
            ve.setTrangThai("Đã hủy");
            ve.setGhiChu("Người dùng tự hủy vé");
            veRepository.save(ve);
        }
    }

    @Override
    @Transactional
    public String taoGiaoDich(Integer lichChieuId, Integer khachHangId) {
        KhachHang khachHang = khachHangRepository.findById(khachHangId)
                .orElseThrow(() -> new RuntimeException("Khách hàng không tồn tại"));

        List<Ve> danhSachVe = veRepository.findByKhachHangIdAndTrangThaiAndLichChieuGhe_LichChieu_Id(
                khachHangId, "Chờ thanh toán", lichChieuId);

        if (danhSachVe.isEmpty()) {
            throw new RuntimeException("Không có vé nào chờ thanh toán");
        }

        BigDecimal tongTien = BigDecimal.ZERO;
        for (Ve ve : danhSachVe) {
            tongTien = tongTien.add(ve.getGia());
        }

        BigDecimal giamGia = tinhGiamGia(tongTien, khachHang.getHangThanhVien());

        BigDecimal thanhTien = tongTien.subtract(giamGia);

        GiaoDich giaoDich = new GiaoDich();
        giaoDich.setMaGiaoDich(generateMaGiaoDich());
        giaoDich.setThoiGian(LocalDateTime.now());
        giaoDich.setTongTien(tongTien);
        giaoDich.setGiamGia(giamGia);
        giaoDich.setThanhTien(thanhTien);
        giaoDich.setTrangThai("Đang xử lý");
        giaoDich.setKhachHang(khachHang);

        String maQR = "maQR";
        giaoDich.setMaQR(maQR);

        giaoDichRepository.save(giaoDich);

        List<ChiTietGiaoDich> chiTietList = new ArrayList<>();
        for (Ve ve : danhSachVe) {
            ChiTietGiaoDich chiTiet = new ChiTietGiaoDich();
            chiTiet.setGiaoDich(giaoDich);
            chiTiet.setVe(ve);
            chiTiet.setGiaTien(ve.getGia());
            chiTiet.setGiamGia(BigDecimal.ZERO);
            chiTietList.add(chiTiet);

            ve.setTrangThai("Chờ xác nhận");
            veRepository.save(ve);
        }

        chiTietGiaoDichRepository.saveAll(chiTietList);

        return maQR;
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

//    @Override
//    @Transactional
//    public void xacNhanThanhToan(String maGiaoDich, Integer khachHangId) {
//        GiaoDich giaoDich = giaoDichRepository.findByMaGiaoDichAndKhachHangId(maGiaoDich, khachHangId)
//                .orElseThrow(() -> new RuntimeException("Giao dịch không tồn tại"));
//
//        giaoDich.setTrangThai("Đã thanh toán");
//        giaoDichRepository.save(giaoDich);
//
//        // Lấy danh sách chi tiết giao dịch
//        List<ChiTietGiaoDich> chiTietList = chiTietGiaoDichRepository.findByGiaoDichId(giaoDich.getId());
//
//        for (ChiTietGiaoDich chiTiet : chiTietList) {
//            Ve ve = chiTiet.getVe();
//            ve.setTrangThai("Đã thanh toán");
//            veRepository.save(ve);
//
//            LichChieuGhe lichChieuGhe = ve.getLichChieuGhe();
//            lichChieuGhe.setTrangThai("Đã đặt");
//            lichChieuGheRepository.save(lichChieuGhe);
//        }
//
//        KhachHang khachHang = giaoDich.getKhachHang();
//        int diemThem = giaoDich.getThanhTien().intValue() / 10000; // Cứ 10,000 VND = 1 điểm
//        khachHang.setDiemTichLuy(khachHang.getDiemTichLuy() + diemThem);
//
//        capNhatHangThanhVien(khachHang);
//
//        khachHangRepository.save(khachHang);
//    }

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