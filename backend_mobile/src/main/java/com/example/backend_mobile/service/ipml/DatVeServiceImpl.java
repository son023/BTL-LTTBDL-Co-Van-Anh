package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.dtos.request.DatVeRequest;
import com.example.backend_mobile.dtos.response.DatVeResponse;
import com.example.backend_mobile.entity.*;
import com.example.backend_mobile.enums.HangThanhVien;
import com.example.backend_mobile.repository.*;
import com.example.backend_mobile.service.DatVeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class DatVeServiceImpl implements DatVeService {

    private final LichChieuGheRepository lichChieuGheRepository;
    private final VeRepository veRepository;
    private final KhachHangRepository khachHangRepository;
    private final GiaoDichRepository giaoDichRepository;
    private final ChiTietGiaoDichRepository chiTietGiaoDichRepository;

    @Override
    @Transactional
    public DatVeResponse chonGhe(DatVeRequest request, Integer khachHangId) {
        // Lấy thông tin khách hàng
        KhachHang khachHang = khachHangRepository.findById(khachHangId)
                .orElseThrow(() -> new RuntimeException("Khách hàng không tồn tại"));

        // Lấy thông tin lịch chiếu ghế
        LichChieuGhe lichChieuGhe = lichChieuGheRepository.findById(request.getLichChieuGheId())
                .orElseThrow(() -> new RuntimeException("Ghế không tồn tại"));

        // Kiểm tra trạng thái ghế
        if (!lichChieuGhe.getTrangThai().equals("Trống")) {
            throw new RuntimeException("Ghế đã được đặt");
        }

        // Cập nhật trạng thái ghế là đã chọn
        lichChieuGhe.setTrangThai("Đã chọn");
        lichChieuGheRepository.save(lichChieuGhe);

        // Tạo vé mới với trạng thái "Chờ thanh toán"
        Ve ve = new Ve();
        ve.setMaVe(generateMaVe());
        ve.setGia(lichChieuGhe.getLichChieu().getGiaVe());
        ve.setNgayTao(LocalDateTime.now());
        ve.setTrangThai("Chờ thanh toán");
        ve.setLichChieuGhe(lichChieuGhe);
        ve.setKhachHang(khachHang);

        veRepository.save(ve);

        // Tính thời gian giữ ghế (mặc định 5 phút)
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
        // Lấy thông tin lịch chiếu ghế
        LichChieuGhe lichChieuGhe = lichChieuGheRepository.findById(lichChieuGheId)
                .orElseThrow(() -> new RuntimeException("Ghế không tồn tại"));

        // Cập nhật trạng thái ghế về "Trống"
        lichChieuGhe.setTrangThai("Trống");
        lichChieuGheRepository.save(lichChieuGhe);

        // Tìm và xóa vé chờ thanh toán tương ứng
        Ve ve = veRepository.findByLichChieuGheIdAndKhachHangIdAndTrangThai(
                lichChieuGheId, khachHangId, "Chờ thanh toán");

        if (ve != null) {
            // Đánh dấu vé là "Đã hủy" thay vì xóa
            ve.setTrangThai("Đã hủy");
            ve.setGhiChu("Người dùng tự hủy vé");
            veRepository.save(ve);
        }
    }

    @Override
    @Transactional
    public String taoGiaoDich(Integer lichChieuId, Integer khachHangId) {
        // Lấy thông tin khách hàng
        KhachHang khachHang = khachHangRepository.findById(khachHangId)
                .orElseThrow(() -> new RuntimeException("Khách hàng không tồn tại"));

        // Lấy danh sách vé chờ thanh toán của khách hàng
        List<Ve> danhSachVe = veRepository.findByKhachHangIdAndTrangThaiAndLichChieuGhe_LichChieu_Id(
                khachHangId, "Chờ thanh toán", lichChieuId);

        if (danhSachVe.isEmpty()) {
            throw new RuntimeException("Không có vé nào chờ thanh toán");
        }

        // Tính tổng tiền
        BigDecimal tongTien = BigDecimal.ZERO;
        for (Ve ve : danhSachVe) {
            tongTien = tongTien.add(ve.getGia());
        }

        // Tính giảm giá dựa trên hạng thành viên
        BigDecimal giamGia = tinhGiamGia(tongTien, khachHang.getHangThanhVien());

        // Tính thành tiền
        BigDecimal thanhTien = tongTien.subtract(giamGia);

        // Tạo giao dịch mới
        GiaoDich giaoDich = new GiaoDich();
        giaoDich.setMaGiaoDich(generateMaGiaoDich());
        giaoDich.setThoiGian(LocalDateTime.now());
        giaoDich.setTongTien(tongTien);
        giaoDich.setGiamGia(giamGia);
        giaoDich.setThanhTien(thanhTien);
        giaoDich.setPhuongThuc("Chuyển khoản");
        giaoDich.setTrangThai("Đang xử lý");
        giaoDich.setKhachHang(khachHang);

        // Tạo mã QR cho thanh toán
        String maQR = "maQR";
        giaoDich.setMaQR(maQR);

        giaoDichRepository.save(giaoDich);

        // Tạo chi tiết giao dịch
        List<ChiTietGiaoDich> chiTietList = new ArrayList<>();
        for (Ve ve : danhSachVe) {
            ChiTietGiaoDich chiTiet = new ChiTietGiaoDich();
            chiTiet.setGiaoDich(giaoDich);
            chiTiet.setVe(ve);
            chiTiet.setGiaTien(ve.getGia());
            chiTiet.setGiamGia(BigDecimal.ZERO); // Giảm giá áp dụng ở cấp giao dịch
            chiTietList.add(chiTiet);

            // Cập nhật trạng thái vé
            ve.setTrangThai("Chờ xác nhận");
            veRepository.save(ve);
        }

        chiTietGiaoDichRepository.saveAll(chiTietList);

        return maQR;
    }

//    @Override
//    @Transactional
//    public void xacNhanThanhToan(String maGiaoDich, Integer khachHangId) {
//        // Lấy thông tin giao dịch
//        GiaoDich giaoDich = giaoDichRepository.findByMaGiaoDichAndKhachHangId(maGiaoDich, khachHangId)
//                .orElseThrow(() -> new RuntimeException("Giao dịch không tồn tại"));
//
//        // Cập nhật trạng thái giao dịch
//        giaoDich.setTrangThai("Đã thanh toán");
//        giaoDichRepository.save(giaoDich);
//
//        // Lấy danh sách chi tiết giao dịch
//        List<ChiTietGiaoDich> chiTietList = chiTietGiaoDichRepository.findByGiaoDichId(giaoDich.getId());
//
//        // Cập nhật trạng thái ghế và vé
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
//        // Cập nhật điểm tích lũy cho khách hàng
//        KhachHang khachHang = giaoDich.getKhachHang();
//        int diemThem = giaoDich.getThanhTien().intValue() / 10000; // Cứ 10,000 VND = 1 điểm
//        khachHang.setDiemTichLuy(khachHang.getDiemTichLuy() + diemThem);
//
//        // Cập nhật hạng thành viên nếu cần
//        capNhatHangThanhVien(khachHang);
//
//        khachHangRepository.save(khachHang);
//    }

    // Các phương thức hỗ trợ
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