-- Thêm dữ liệu mẫu cho bảng nguoi_dung
INSERT INTO nguoi_dung (id, avatar, dia_chi, email, gioi_tinh, mat_khau, ngay_sinh, so_dien_thoai, ten, thoi_gian_tao, trang_thai) VALUES
                                                                                                                                       (1, 'avatar1.jpg', 'Hà Nội', 'admin@cinema.com', 'Nam', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1990-01-15', '0987654321', 'Admin', '2025-01-01 00:00:00', 'Hoạt động'),
                                                                                                                                       (2, 'avatar2.jpg', 'Hồ Chí Minh', 'staff1@cinema.com', 'Nữ', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1992-05-20', '0987654322', 'Nhân viên 1', '2025-01-01 00:00:00', 'Hoạt động'),
                                                                                                                                       (3, 'avatar3.jpg', 'Đà Nẵng', 'customer1@gmail.com', 'Nam', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1995-06-25', '0987654323', 'Nguyễn Văn A', '2025-01-02 00:00:00', 'Hoạt động'),
                                                                                                                                       (4, 'avatar4.jpg', 'Hải Phòng', 'customer2@gmail.com', 'Nữ', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1993-09-10', '0987654324', 'Nguyễn Thị B', '2025-01-03 00:00:00', 'Hoạt động'),
                                                                                                                                       (5, 'avatar5.jpg', 'Huế', 'customer3@gmail.com', 'Nam', '$2a$10$4QZDzO1M0LCXvZy.DK7wvesFxG/7ib/qY4OjZ.Qn45uI0JlrIQ4HS', '1998-12-20', '0987654325', 'Trần Văn C', '2025-01-04 00:00:00', 'Hoạt động');

-- Thêm dữ liệu mẫu cho bảng khach_hang
INSERT INTO khach_hang (id, diem_tich_luy, hang_thanh_vien, ma_thanh_vien, ngay_dang_ky) VALUES
                                                                                             (3, 100, 'Thường', 'KH00001', '2025-01-02 00:00:00'),
                                                                                             (4, 250, 'Bạc', 'KH00002', '2025-01-03 00:00:00'),
                                                                                             (5, 500, 'Vàng', 'KH00003', '2025-01-04 00:00:00');

-- Thêm dữ liệu mẫu cho bảng phong
INSERT INTO phong (id, loai_phong, mo_ta, suc_chua, ten, trang_thai, vi_tri) VALUES
                                                                                 (1, '2D', 'Phòng chiếu phim 2D tiêu chuẩn với 48 ghế ngồi thoải mái', 48, 'Phòng 1', 'Hoạt động', 'Tầng 1'),
                                                                                 (2, '3D', 'Phòng chiếu phim 3D với 48 ghế ngồi và hệ thống âm thanh Dolby', 48, 'Phòng 2', 'Hoạt động', 'Tầng 1'),
                                                                                 (3, 'IMAX', 'Phòng chiếu IMAX với 48 ghế cao cấp và màn hình siêu lớn', 48, 'Phòng 3', 'Hoạt động', 'Tầng 2');

-- Thêm dữ liệu mẫu cho bảng ghe theo sơ đồ trong hình
-- Phòng 1 - Tạo ghế dựa theo sơ đồ A1-F8
INSERT INTO ghe (id, cot, hang, loai_ghe, ten, trang_thai, phong_id) VALUES
-- Hàng A (1-6)
(1, '1', 'A', 'Thường', 'A1', 'Hoạt động', 1),
(2, '2', 'A', 'Thường', 'A2', 'Hoạt động', 1),
(3, '3', 'A', 'Thường', 'A3', 'Hoạt động', 1),
(4, '4', 'A', 'Thường', 'A4', 'Hoạt động', 1),
(5, '5', 'A', 'Thường', 'A5', 'Hoạt động', 1),
(6, '6', 'A', 'Thường', 'A6', 'Hoạt động', 1),

-- Hàng B (1-8)
(7, '1', 'B', 'Thường', 'B1', 'Hoạt động', 1),
(8, '2', 'B', 'Thường', 'B2', 'Hoạt động', 1),
(9, '3', 'B', 'VIP', 'B3', 'Hoạt động', 1),
(10, '4', 'B', 'VIP', 'B4', 'Hoạt động', 1),
(11, '5', 'B', 'Thường', 'B5', 'Hoạt động', 1),
(12, '6', 'B', 'Thường', 'B6', 'Hoạt động', 1),
(13, '7', 'B', 'Thường', 'B7', 'Hoạt động', 1),
(14, '8', 'B', 'Thường', 'B8', 'Hoạt động', 1),

-- Hàng C (1-8)
(15, '1', 'C', 'Thường', 'C1', 'Hoạt động', 1),
(16, '2', 'C', 'Thường', 'C2', 'Hoạt động', 1),
(17, '3', 'C', 'Thường', 'C3', 'Hoạt động', 1),
(18, '4', 'C', 'Thường', 'C4', 'Hoạt động', 1),
(19, '5', 'C', 'Thường', 'C5', 'Hoạt động', 1),
(20, '6', 'C', 'VIP', 'C6', 'Hoạt động', 1),
(21, '7', 'C', 'VIP', 'C7', 'Hoạt động', 1),
(22, '8', 'C', 'VIP', 'C8', 'Hoạt động', 1),

-- Hàng D (1-8)
(23, '1', 'D', 'Thường', 'D1', 'Hoạt động', 1),
(24, '2', 'D', 'VIP', 'D2', 'Hoạt động', 1),
(25, '3', 'D', 'Thường', 'D3', 'Hoạt động', 1),
(26, '4', 'D', 'Thường', 'D4', 'Hoạt động', 1),
(27, '5', 'D', 'Thường', 'D5', 'Hoạt động', 1),
(28, '6', 'D', 'Thường', 'D6', 'Hoạt động', 1),
(29, '7', 'D', 'Thường', 'D7', 'Hoạt động', 1),
(30, '8', 'D', 'Thường', 'D8', 'Hoạt động', 1),

-- Hàng E (1-8)
(31, '1', 'E', 'VIP', 'E1', 'Hoạt động', 1),
(32, '2', 'E', 'VIP', 'E2', 'Hoạt động', 1),
(33, '3', 'E', 'VIP', 'E3', 'Hoạt động', 1),
(34, '4', 'E', 'Thường', 'E4', 'Hoạt động', 1),
(35, '5', 'E', 'VIP', 'E5', 'Hoạt động', 1),
(36, '6', 'E', 'Thường', 'E6', 'Hoạt động', 1),
(37, '7', 'E', 'Thường', 'E7', 'Hoạt động', 1),
(38, '8', 'E', 'Thường', 'E8', 'Hoạt động', 1),

-- Hàng F (1-6)
(39, '1', 'F', 'Thường', 'F1', 'Hoạt động', 1),
(40, '2', 'F', 'Thường', 'F2', 'Hoạt động', 1),
(41, '3', 'F', 'Thường', 'F3', 'Hoạt động', 1),
(42, '4', 'F', 'Thường', 'F4', 'Hoạt động', 1),
(43, '5', 'F', 'VIP', 'F5', 'Hoạt động', 1),
(44, '6', 'F', 'VIP', 'F6', 'Hoạt động', 1);

-- Tương tự, thêm ghế cho phòng 2 với cùng cấu trúc
INSERT INTO ghe (id, cot, hang, loai_ghe, ten, trang_thai, phong_id) VALUES
-- Hàng A (1-6)
(45, '1', 'A', 'Thường', 'A1', 'Hoạt động', 2),
(46, '2', 'A', 'Thường', 'A2', 'Hoạt động', 2),
(47, '3', 'A', 'Thường', 'A3', 'Hoạt động', 2),
(48, '4', 'A', 'Thường', 'A4', 'Hoạt động', 2),
(49, '5', 'A', 'Thường', 'A5', 'Hoạt động', 2),
(50, '6', 'A', 'Thường', 'A6', 'Hoạt động', 2),

-- Hàng B (1-8)
(51, '1', 'B', 'Thường', 'B1', 'Hoạt động', 2),
(52, '2', 'B', 'Thường', 'B2', 'Hoạt động', 2),
(53, '3', 'B', 'VIP', 'B3', 'Hoạt động', 2),
(54, '4', 'B', 'VIP', 'B4', 'Hoạt động', 2),
(55, '5', 'B', 'Thường', 'B5', 'Hoạt động', 2),
(56, '6', 'B', 'Thường', 'B6', 'Hoạt động', 2),
(57, '7', 'B', 'Thường', 'B7', 'Hoạt động', 2),
(58, '8', 'B', 'Thường', 'B8', 'Hoạt động', 2),

-- Hàng C-F tương tự như phòng 1
-- Hàng C (1-8)
(59, '1', 'C', 'Thường', 'C1', 'Hoạt động', 2),
(60, '2', 'C', 'Thường', 'C2', 'Hoạt động', 2),
(61, '3', 'C', 'Thường', 'C3', 'Hoạt động', 2),
(62, '4', 'C', 'Thường', 'C4', 'Hoạt động', 2),
(63, '5', 'C', 'Thường', 'C5', 'Hoạt động', 2),
(64, '6', 'C', 'VIP', 'C6', 'Hoạt động', 2),
(65, '7', 'C', 'VIP', 'C7', 'Hoạt động', 2),
(66, '8', 'C', 'VIP', 'C8', 'Hoạt động', 2);

-- Thêm dữ liệu mẫu cho bảng phim
INSERT INTO phim (id, danh_gia, dao_dien, dien_vien, do_dai, do_tuoi, hang_sx, mo_ta, nam_sx, ngon_ngu, poster, ten, the_loai, trailer, trang_thai) VALUES
                                                                                                                                                        (1, 8.5, 'Đạo diễn A', 'Diễn viên X, Diễn viên Y', 120, 13, 'Studio A', 'Một bộ phim hành động gay cấn', 2024, 'Tiếng Việt', 'poster1.jpg', 'Cuộc Phiêu Lưu Kỳ Thú', 'Hành động, Phiêu lưu', 'trailer1.mp4', 'Đang chiếu'),
                                                                                                                                                        (2, 7.8, 'Đạo diễn B', 'Diễn viên Z, Diễn viên W', 105, 16, 'Studio B', 'Bộ phim kinh dị hấp dẫn', 2024, 'Tiếng Anh', 'poster2.jpg', 'Đêm Kinh Hoàng', 'Kinh dị, Giật gân', 'trailer2.mp4', 'Đang chiếu'),
                                                                                                                                                        (3, 9.0, 'Đạo diễn C', 'Diễn viên M, Diễn viên N', 150, 0, 'Studio C', 'Phim hoạt hình dành cho mọi lứa tuổi', 2024, 'Tiếng Việt', 'poster3.jpg', 'Cuộc Phiêu Lưu Của Mèo Tom', 'Hoạt hình, Gia đình', 'trailer3.mp4', 'Sắp chiếu'),
                                                                                                                                                        (4, 8.2, 'Đạo diễn D', 'Diễn viên P, Diễn viên Q', 135, 18, 'Studio D', 'Phim tình cảm lãng mạn', 2024, 'Tiếng Anh', 'poster4.jpg', 'Tình Yêu Bất Diệt', 'Tình cảm, Lãng mạn', 'trailer4.mp4', 'Đang chiếu');

-- Thêm dữ liệu mẫu cho bảng lich_chieu
INSERT INTO lich_chieu (id, bat_dau, gia_ve, ket_thuc, ngay_lap, trang_thai, phim_id, phong_id) VALUES
                                                                                                    (1, '2025-05-05 10:00:00', 80000.00, '2025-05-05 12:00:00', '2025-05-01 08:00:00', 'Đang mở', 1, 1),
                                                                                                    (2, '2025-05-05 13:00:00', 80000.00, '2025-05-05 15:00:00', '2025-05-01 08:00:00', 'Đang mở', 1, 1),
                                                                                                    (3, '2025-05-05 10:30:00', 90000.00, '2025-05-05 12:15:00', '2025-05-01 08:00:00', 'Đang mở', 2, 2),
                                                                                                    (4, '2025-05-05 13:30:00', 90000.00, '2025-05-05 15:15:00', '2025-05-01 08:00:00', 'Đang mở', 2, 2),
                                                                                                    (5, '2025-05-05 16:00:00', 100000.00, '2025-05-05 18:30:00', '2025-05-01 08:00:00', 'Đang mở', 4, 3);

-- Thêm dữ liệu mẫu cho bảng lich_chieu_ghe


INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A (ghế 1-6): một vài ghế đã đặt
(1, 1, 'Trống'),   -- A1 (Thường)
(1, 2, 'Trống'),   -- A2 (Thường)
(1, 3, 'Đã đặt'),  -- A3 (Thường)
(1, 4, 'Đã đặt'),  -- A4 (Thường)
(1, 5, 'Trống'),   -- A5 (Thường)
(1, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B (ghế 7-14): ghế VIP ở giữa đã đặt
(1, 7, 'Trống'),   -- B1 (Thường)
(1, 8, 'Trống'),   -- B2 (Thường)
(1, 9, 'Đã đặt'),  -- B3 (VIP)
(1, 10, 'Đã đặt'), -- B4 (VIP)
(1, 11, 'Trống'),  -- B5 (Thường)
(1, 12, 'Trống'),  -- B6 (Thường)
(1, 13, 'Trống'),  -- B7 (Thường)
(1, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C (ghế 15-22): một số ghế VIP đã đặt
(1, 15, 'Trống'),  -- C1 (Thường)
(1, 16, 'Trống'),  -- C2 (Thường)
(1, 17, 'Trống'),  -- C3 (Thường)
(1, 18, 'Trống'),  -- C4 (Thường)
(1, 19, 'Trống'),  -- C5 (Thường)
(1, 20, 'Đã đặt'), -- C6 (VIP)
(1, 21, 'Đã đặt'), -- C7 (VIP)
(1, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D (ghế 23-30): một ghế VIP đã đặt
(1, 23, 'Trống'),  -- D1 (Thường)
(1, 24, 'Đã đặt'), -- D2 (VIP)
(1, 25, 'Trống'),  -- D3 (Thường)
(1, 26, 'Trống'),  -- D4 (Thường)
(1, 27, 'Trống'),  -- D5 (Thường)
(1, 28, 'Trống'),  -- D6 (Thường)
(1, 29, 'Trống'),  -- D7 (Thường)
(1, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E (ghế 31-38): ghế VIP đầu hàng đã đặt
(1, 31, 'Đã đặt'), -- E1 (VIP)
(1, 32, 'Đã đặt'), -- E2 (VIP)
(1, 33, 'Đã đặt'), -- E3 (VIP)
(1, 34, 'Trống'),  -- E4 (Thường)
(1, 35, 'Trống'),  -- E5 (VIP)
(1, 36, 'Trống'),  -- E6 (Thường)
(1, 37, 'Trống'),  -- E7 (Thường)
(1, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F (ghế 39-44): 2 ghế VIP cuối đã đặt
(1, 39, 'Trống'),  -- F1 (Thường)
(1, 40, 'Trống'),  -- F2 (Thường)
(1, 41, 'Trống'),  -- F3 (Thường)
(1, 42, 'Trống'),  -- F4 (Thường)
(1, 43, 'Đã đặt'), -- F5 (VIP)
(1, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu cho lịch chiếu 2 (khung giờ khác, phòng 1)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Tất cả ghế trống
(2, 1, 'Trống'),   -- A1
(2, 2, 'Trống'),   -- A2
(2, 3, 'Trống'),   -- A3
(2, 4, 'Trống'),   -- A4
(2, 5, 'Trống'),   -- A5
(2, 6, 'Trống'),   -- A6
(2, 7, 'Trống'),   -- B1
(2, 8, 'Trống'),   -- B2
(2, 9, 'Trống'),   -- B3 (VIP)
(2, 10, 'Trống'),  -- B4 (VIP)
(2, 11, 'Trống'),  -- B5
(2, 12, 'Trống'),  -- B6
(2, 13, 'Trống'),  -- B7
(2, 14, 'Trống'),  -- B8
(2, 15, 'Trống'),  -- C1
(2, 16, 'Trống'),  -- C2
(2, 17, 'Trống'),  -- C3
(2, 18, 'Trống'),  -- C4
(2, 19, 'Trống'),  -- C5
(2, 20, 'Trống'),  -- C6 (VIP)
(2, 21, 'Trống'),  -- C7 (VIP)
(2, 22, 'Trống'),  -- C8 (VIP)
(2, 23, 'Trống'),  -- D1
(2, 24, 'Trống'),  -- D2 (VIP)
(2, 25, 'Trống'),  -- D3
(2, 26, 'Trống'),  -- D4
(2, 27, 'Trống'),  -- D5
(2, 28, 'Trống'),  -- D6
(2, 29, 'Trống'),  -- D7
(2, 30, 'Trống'),  -- D8
(2, 31, 'Trống'),  -- E1 (VIP)
(2, 32, 'Trống'),  -- E2 (VIP)
(2, 33, 'Trống'),  -- E3 (VIP)
(2, 34, 'Trống'),  -- E4
(2, 35, 'Trống'),  -- E5 (VIP)
(2, 36, 'Trống'),  -- E6
(2, 37, 'Trống'),  -- E7
(2, 38, 'Trống'),  -- E8
(2, 39, 'Trống'),  -- F1
(2, 40, 'Trống'),  -- F2
(2, 41, 'Trống'),  -- F3
(2, 42, 'Trống'),  -- F4
(2, 43, 'Trống'),  -- F5 (VIP)
(2, 44, 'Trống'); -- F6 (VIP)

-- Thêm dữ liệu cho lịch chiếu 3 (phòng 1, khung giờ khác)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Một vài ghế đã đặt khác với lịch chiếu 1
(3, 1, 'Trống'),   -- A1
(3, 2, 'Đã đặt'),  -- A2
(3, 3, 'Trống'),   -- A3
(3, 4, 'Trống'),   -- A4
(3, 5, 'Đã đặt'),  -- A5
(3, 6, 'Trống'),   -- A6
(3, 7, 'Trống'),   -- B1
(3, 8, 'Trống'),   -- B2
(3, 9, 'Trống'),   -- B3 (VIP)
(3, 10, 'Trống'),  -- B4 (VIP)
(3, 11, 'Trống'),  -- B5
(3, 12, 'Trống'),  -- B6
(3, 13, 'Trống'),  -- B7
(3, 14, 'Trống'),  -- B8
(3, 15, 'Trống'),  -- C1
(3, 16, 'Đã đặt'), -- C2
(3, 17, 'Trống'),  -- C3
(3, 18, 'Trống'),  -- C4
(3, 19, 'Trống'),  -- C5
(3, 20, 'Trống'),  -- C6 (VIP)
(3, 21, 'Trống'),  -- C7 (VIP)
(3, 22, 'Đã đặt'), -- C8 (VIP)
(3, 23, 'Trống'),  -- D1
(3, 24, 'Trống'),  -- D2 (VIP)
(3, 25, 'Trống'),  -- D3
(3, 26, 'Trống'),  -- D4
(3, 27, 'Trống'),  -- D5
(3, 28, 'Trống'),  -- D6
(3, 29, 'Trống'),  -- D7
(3, 30, 'Trống'),  -- D8
(3, 31, 'Trống'),  -- E1 (VIP)
(3, 32, 'Trống'),  -- E2 (VIP)
(3, 33, 'Trống'),  -- E3 (VIP)
(3, 34, 'Trống'),  -- E4
(3, 35, 'Đã đặt'), -- E5 (VIP)
(3, 36, 'Trống'),  -- E6
(3, 37, 'Trống'),  -- E7
(3, 38, 'Trống'),  -- E8
(3, 39, 'Trống'),  -- F1
(3, 40, 'Trống'),  -- F2
(3, 41, 'Trống'),  -- F3
(3, 42, 'Trống'),  -- F4
(3, 43, 'Trống'),  -- F5 (VIP)
(3, 44, 'Trống'); -- F6 (VIP)

-- Thêm dữ liệu cho lịch chiếu 4 (phòng 2, một vài phim khác)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Lưu ý: Phòng 2 có thể có layout ghế khác, cần kiểm tra dữ liệu thực tế
-- Đây chỉ là ví dụ với giả sử phòng 2 có cùng layout với phòng 1
(4, 1, 'Trống'),   -- A1
(4, 2, 'Trống'),   -- A2
(4, 3, 'Trống'),   -- A3
(4, 4, 'Trống'),   -- A4
(4, 5, 'Trống'),   -- A5
(4, 6, 'Trống'),   -- A6
(4, 7, 'Trống'),   -- B1
(4, 8, 'Trống'),   -- B2
(4, 9, 'Đã đặt'),  -- B3 (VIP)
(4, 10, 'Đã đặt'), -- B4 (VIP)
(4, 11, 'Trống'),  -- B5
(4, 12, 'Trống'),  -- B6
(4, 13, 'Trống'),  -- B7
(4, 14, 'Trống'),  -- B8
(4, 15, 'Trống'),  -- C1
(4, 16, 'Trống'),  -- C2
(4, 17, 'Trống'),  -- C3
(4, 18, 'Trống'),  -- C4
(4, 19, 'Trống'),  -- C5
(4, 20, 'Trống'),  -- C6 (VIP)
(4, 21, 'Trống'),  -- C7 (VIP)
(4, 22, 'Trống'),  -- C8 (VIP)
(4, 23, 'Trống'),  -- D1
(4, 24, 'Trống'),  -- D2 (VIP)
(4, 25, 'Trống'),  -- D3
(4, 26, 'Trống'),  -- D4
(4, 27, 'Trống'),  -- D5
(4, 28, 'Trống'),  -- D6
(4, 29, 'Trống'),  -- D7
(4, 30, 'Trống'),  -- D8
(4, 31, 'Trống'),  -- E1 (VIP)
(4, 32, 'Trống'),  -- E2 (VIP)
(4, 33, 'Trống'),  -- E3 (VIP)
(4, 34, 'Trống'),  -- E4
(4, 35, 'Trống'),  -- E5 (VIP)
(4, 36, 'Trống'),  -- E6
(4, 37, 'Trống'),  -- E7
(4, 38, 'Trống'),  -- E8
(4, 39, 'Trống'),  -- F1
(4, 40, 'Trống'),  -- F2
(4, 41, 'Trống'),  -- F3
(4, 42, 'Trống'),  -- F4
(4, 43, 'Trống'),  -- F5 (VIP)
(4, 44, 'Trống'); -- F6 (VIP

-- Thêm dữ liệu mẫu cho bảng giao_dich
INSERT INTO giao_dich (id, ghi_chu, giam_gia, ma_giao_dich, ma_qr, phuong_thuc, thanh_tien, thoi_gian, tong_tien, trang_thai, khach_hang_id) VALUES
                                                                                                                                                 (1, 'Đặt vé xem phim Cuộc Phiêu Lưu Kỳ Thú', 10000.00, 'GD00001', 'QR00001', 'Thẻ tín dụng', 70000.00, '2025-05-02 09:15:00', 80000.00, 'Thành công', 3),
                                                                                                                                                 (2, 'Đặt vé xem phim Cuộc Phiêu Lưu Kỳ Thú', 0.00, 'GD00002', 'QR00002', 'Momo', 80000.00, '2025-05-02 09:30:00', 80000.00, 'Thành công', 4),
                                                                                                                                                 (3, 'Đặt vé xem phim Đêm Kinh Hoàng', 20000.00, 'GD00003', 'QR00003', 'Tiền mặt', 160000.00, '2025-05-02 10:00:00', 180000.00, 'Thành công', 5);

-- Thêm dữ liệu mẫu cho bảng ve
INSERT INTO ve (id, ghi_chu, gia, ma_ve, ngay_tao, trang_thai, khach_hang_id, lich_chieu_ghe_id) VALUES
                                                                                                     (1, NULL, 80000.00, 'VE00001', '2025-05-02 09:15:00', 'Đã thanh toán', 3, 4),  -- A4
                                                                                                     (2, NULL, 80000.00, 'VE00002', '2025-05-02 09:15:00', 'Đã thanh toán', 3, 5),  -- A5
                                                                                                     (3, NULL, 90000.00, 'VE00003', '2025-05-02 09:30:00', 'Đã thanh toán', 4, 9),  -- B3 (VIP)
                                                                                                     (4, NULL, 90000.00, 'VE00004', '2025-05-02 09:30:00', 'Đã thanh toán', 4, 10), -- B4 (VIP)
                                                                                                     (5, NULL, 90000.00, 'VE00005', '2025-05-02 10:00:00', 'Đã thanh toán', 5, 31), -- E1 (VIP)
                                                                                                     (6, NULL, 90000.00, 'VE00006', '2025-05-02 10:00:00', 'Đã thanh toán', 5, 32); -- E2 (VIP)

-- Thêm dữ liệu mẫu cho bảng chi_tiet_giao_dich
INSERT INTO chi_tiet_giao_dich (id, ghi_chu, gia_tien, giam_gia, giao_dich_id, ve_id) VALUES
                                                                                          (1, NULL, 80000.00, 5000.00, 1, 1),
                                                                                          (2, NULL, 80000.00, 5000.00, 1, 2),
                                                                                          (3, NULL, 90000.00, 0.00, 2, 3),
                                                                                          (4, NULL, 90000.00, 0.00, 2, 4),
                                                                                          (5, NULL, 90000.00, 10000.00, 3, 5),
                                                                                          (6, NULL, 90000.00, 10000.00, 3, 6);