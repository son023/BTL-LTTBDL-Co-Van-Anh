ALTER TABLE phim MODIFY COLUMN mo_ta VARCHAR(5000);

UPDATE phim SET
    danh_gia = 8.8,
    dao_dien = 'Christopher Nolan',
    dien_vien = 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy, Ken Watanabe, Cillian Murphy, Marion Cotillard, Michael Caine, Dileep Rao, Tom Berenger',
    do_dai = 148,
    do_tuoi = 13,
    hang_sx = 'Warner Bros. Pictures',
    mo_ta = 'Một tên trộm chuyên đánh cắp bí mật doanh nghiệp bằng công nghệ chia sẻ giấc mơ được giao nhiệm vụ ngược lại: gieo ý tưởng vào tâm trí một giám đốc điều hành, nhưng quá khứ bi thảm của anh có thể khiến nhiệm vụ và cả đội rơi vào thảm họa.',
    nam_sx = 2010,
    ngon_ngu = 'Tiếng Anh',
    poster = 'https://th.bing.com/th/id/OIP.DF6kVZd8CeIEccxAdvv4fAHaKz?rs=1&pid=ImgDetMain',
    ten = 'Inception',
    the_loai = 'Khoa học viễn tưởng, Hành động',
    trailer = 'https://www.youtube.com/watch?v=8hP9D6kZseM',
    trang_thai = 'Đang chiếu'
WHERE id = 1;

UPDATE phim SET
    danh_gia = 7.6,
    dao_dien = 'Quentin Tarantino',
    dien_vien = 'Leonardo DiCaprio, Brad Pitt, Margot Robbie, Margaret Qualley, Austin Butler, Dakota Fanning, Bruce Dern, Al Pacino, Emile Hirsch, Kurt Russell',
    do_dai = 165,
    do_tuoi = 16,
    hang_sx = 'Sony Pictures',
    mo_ta = 'Khi Thời kỳ Vàng của Hollywood đang dần khép lại vào mùa hè năm 1969, diễn viên truyền hình Rick Dalton và người đóng thế của anh, Cliff Booth, nỗ lực đạt được thành công bền vững ở Hollywood, đồng thời gặp gỡ nhiều nhân vật đầy màu sắc trên hành trình của họ.',
    nam_sx = 2019,
    ngon_ngu = 'Tiếng Anh',
    poster = 'https://th.bing.com/th/id/OIP.tdNKGp8DTDgSpmyMovSilQHaK-?rs=1&pid=ImgDetMain',
    ten = 'Once Upon a Time in Hollywood',
    the_loai = 'Drama',
    trailer = 'https://www.youtube.com/watch?v=ELeMaP8EPAA',
    trang_thai = 'Sắp chiếu'
WHERE id = 2;

UPDATE phim SET
    danh_gia = 7.9,
    dao_dien = 'Steven Spielberg',
    dien_vien = 'Tom Hanks, Matt Damon, Edward Burns, Tom Sizemore, Barry Pepper, Vin Diesel, Giovanni Ribisi, Adam Goldberg, Jeremy Davies, Ted Danson.',
    do_dai = 140,
    do_tuoi = 13,
    hang_sx = 'Universal',
    mo_ta = 'Sau cuộc đổ bộ Normandy, một nhóm lính Mỹ đi sau chiến tuyến của kẻ thù để lấy một lính dù có anh em đã thiệt mạng trong chiến đấu.',
    nam_sx = 1998,
    ngon_ngu = 'Tiếng Anh',
    poster = 'https://th.bing.com/th/id/R.24f6a65f3371b06c7ae158bfad7f8151?rik=87qYKCQY3eiDCQ&pid=ImgRaw&r=0',
    ten = 'Saving Private Ryan',
    the_loai = 'Chiến tranh',
    trailer = 'https://www.youtube.com/watch?v=S1Qj_AVu2pA',
    trang_thai = 'Đang chiếu'
WHERE id = 3;

UPDATE phim SET
    danh_gia = 8.0,
    dao_dien = 'James Cameron',
    dien_vien = 'Leonardo DiCaprio, Kate Winslet, Billy Zane, Kathy Bates, Frances Fisher, Danny Nucci, Bill Paxton, David Warner, Jonathan Hyde, Bernard Hill.',
    do_dai = 195,
    do_tuoi = 13,
    hang_sx = '20th Century Fox',
    mo_ta = 'Titanic kể về mối tình giữa Jack và Rose, hai con người từ hai thế giới khác nhau, trên con tàu Titanic. Dù hoàn cảnh không thuận lợi, họ yêu nhau say đắm. Khi tàu gặp nạn và chìm, tình yêu của họ phải đối mặt với sự sống còn, mang đến những khoảnh khắc đầy bi thương và hy sinh.',
    nam_sx = 1997,
    ngon_ngu = 'Tiếng Anh',
    poster = 'https://www.themoviedb.org/t/p/original/tr5y5H4qOlqCGbZKaT9Q97cscVj.jpg',
    ten = 'Titanic',
    the_loai = 'Lãng mạn',
    trailer = 'https://www.youtube.com/watch?v=kVrqfYjkTdQ',
    trang_thai = 'Đang chiếu'
WHERE id = 4;

INSERT INTO phim (id, danh_gia, dao_dien, dien_vien, do_dai, do_tuoi, hang_sx, mo_ta, nam_sx, ngon_ngu, poster, ten, the_loai, trailer, trang_thai) VALUES
(5, 8.3, 'David Fincher', 'Brad Pitt, Edward Norton, Helena Bonham Carter, Meat Loaf, Jared Leto, Zach Grenier, Richmond Arquette, David Andrews, Christy Scott Cashman, Elliot Gould.', 139, 16, '20th Century Fox', 'Fight Club kể về một người đàn ông (Edward Norton) mệt mỏi với cuộc sống, gặp gỡ Tyler Durden (Brad Pitt), người lập ra một câu lạc bộ chiến đấu ngầm. Câu lạc bộ trở thành một phong trào hỗn loạn, nhưng khi người kể chuyện phát hiện sự thật kinh hoàng về Tyler, mọi thứ dần mất kiểm soát. Bộ phim khám phá chủ nghĩa vật chất, bản sắc và sự tan vỡ của xã hội.', 1995, 'Tiếng Anh', 'https://www.themoviedb.org/t/p/original/iqR0M1ln7Kobjp9liUj2Q7mtQZG.jpg', 'Fight Club', 'Hành động', 'https://www.youtube.com/watch?v=qtRKdVHc-cE', 'Đang chiếu'),
(6, 7.7, 'Ridley Scott', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen, Oliver Reed, Richard Harris, Derek Jacobi, Djimon Hounsou, Tomas Arana, Ralf Moeller, David Schofield.', 155, 13, 'Universal', 'Gladiator kể về Maximus (Russell Crowe), một tướng quân La Mã bị phản bội và gia đình bị giết hại. Anh trở thành một đấu sĩ và tìm cách trả thù. Maximus chiến đấu trong đấu trường để giành lại danh dự và công lý, đối đầu với Commodus (Joaquin Phoenix), hoàng đế tàn bạo. Bộ phim thể hiện sự hy sinh, lòng trung thành và khát khao tự do.', 2000, 'Tiếng Anh', 'https://image.tmdb.org/t/p/original/ofDw0himYNpehWA69OkPWOzXOYK.jpg', 'Gladiator', 'Lịch sử', 'https://www.youtube.com/watch?v=P5ieIbInFpg', 'Đang chiếu'),
(7, 8.1, 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain, Michael Caine, Mackenzie Foy, Ellen Burstyn, John Lithgow, Topher Grace, Casey Affleck, Wes Bentley.', 164, 13, 'Warner Bros', 'Interstellar kể về câu chuyện của Cooper (Matthew McConaughey), một phi hành gia được giao nhiệm vụ dẫn dắt một nhóm khám phá không gian để tìm một hành tinh mới cho loài người, khi Trái Đất đang bị tàn phá. Trong hành trình xuyên qua lỗ đen và thời gian, Cooper phải đối mặt với những quyết định khó khăn để cứu cả gia đình và nhân loại. Bộ phim khám phá tình yêu, sự hy sinh và những bí ẩn của vũ trụ.', 2014, 'Tiếng Anh', 'https://www.movieposters.com/cdn/shop/files/interstellar-139399_1024x1024.jpg?v=1708527823', 'Interstellar', 'Khoa học viễn tưởng', 'https://www.youtube.com/watch?v=zSWdZVtXT7E', 'Sắp chiếu'),
(8, 7.6, 'Martin Scorsese', 'Robert De Niro, Al Pacino, Joe Pesci, Harvey Keitel, Ray Romano, Bobby Cannavale, Anna Paquin, Stephen Graham, Jesse Plemons, Paul Herman.', 180, 16, 'Paramount', 'The Irishman kể về Frank Sheeran (Robert De Niro), một người lính cũ trong Mafia, kể lại cuộc đời mình. Anh làm việc cho ông trùm Russell Bufalino (Joe Pesci) và dần dần trở thành người thân cận của Jimmy Hoffa (Al Pacino), một lãnh đạo công đoàn nổi tiếng. Bộ phim khắc họa sự phản bội, tội lỗi và những hậu quả của cuộc sống trong thế giới tội phạm.', 2019, 'Tiếng Anh', 'https://posterspy.com/wp-content/uploads/2021/03/theirishman72dpi-scaled.jpg', 'The Irishman', 'Hình sự', 'https://www.youtube.com/watch?v=WHXxVmeGQUc', 'Sắp chiếu'),
(9, 8.4, 'Denis Villeneuve', 'Timothée Chalamet, Zendaya, Oscar Isaac, Rebecca Ferguson, Josh Brolin, Stellan Skarsgård, Dave Bautista, Jason Momoa, Javier Bardem, Charlotte Rampling.', 155, 13, 'Legendary Pictures', 'Dune theo chân Paul Atreides (Timothée Chalamet), người thừa kế nhà Atreides, khi gia đình anh được giao cai trị hành tinh sa mạc Arrakis, nguồn cung cấp "spice" quý giá. Sau khi gia đình bị phản bội, Paul phải trốn vào hoang mạc và gia nhập các bộ lạc người Fremen. Bộ phim khám phá quyền lực, sự sinh tồn và định mệnh trong một vũ trụ đầy xung đột.', 2021, 'Tiếng Anh', 'https://th.bing.com/th/id/OIP.ORgJjrgXNIbDtLIyU_RoHAHaLG?rs=1&pid=ImgDetMain', 'Dune', 'Khoa học viễn tưởng', 'https://www.youtube.com/watch?v=n9xhJrPXop4', 'Sắp chiếu');

INSERT INTO lich_chieu (id, bat_dau, gia_ve, ket_thuc, ngay_lap, trang_thai, phim_id, phong_id) VALUES
-- Ngày 14/05/2025
(6, '2025-05-14 10:00:00', 85000.00, '2025-05-14 12:00:00', '2025-05-09 08:00:00', 'Đang mở', 3, 1),
(7, '2025-05-14 13:30:00', 85000.00, '2025-05-14 15:30:00', '2025-05-09 08:00:00', 'Đang mở', 3, 2),
(8, '2025-05-14 16:00:00', 95000.00, '2025-05-14 18:00:00', '2025-05-09 08:00:00', 'Đang mở', 4, 2),
(9, '2025-05-14 19:00:00', 100000.00, '2025-05-14 21:00:00', '2025-05-09 08:00:00', 'Đang mở', 5, 1),
(10, '2025-05-14 20:30:00', 100000.00, '2025-05-14 22:30:00', '2025-05-09 08:00:00', 'Đang mở', 6, 2),

-- Ngày 15/05/2025
(11, '2025-05-15 10:00:00', 85000.00, '2025-05-15 12:00:00', '2025-05-09 08:00:00', 'Đang mở', 3, 2),
(12, '2025-05-15 13:00:00', 90000.00, '2025-05-15 15:00:00', '2025-05-09 08:00:00', 'Đang mở', 4, 1),
(13, '2025-05-15 16:30:00', 95000.00, '2025-05-15 18:30:00', '2025-05-09 08:00:00', 'Đang mở', 5, 2),
(14, '2025-05-15 19:00:00', 110000.00, '2025-05-15 21:00:00', '2025-05-09 08:00:00', 'Đang mở', 6, 2),
(15, '2025-05-15 21:30:00', 120000.00, '2025-05-15 23:30:00', '2025-05-09 08:00:00', 'Đang mở', 3, 1),

-- Ngày 16/05/2025
(16, '2025-05-16 10:30:00', 80000.00, '2025-05-16 12:30:00', '2025-05-09 08:00:00', 'Đang mở', 4, 2),
(17, '2025-05-16 13:00:00', 85000.00, '2025-05-16 15:00:00', '2025-05-09 08:00:00', 'Đang mở', 5, 1),
(18, '2025-05-16 15:30:00', 90000.00, '2025-05-16 17:30:00', '2025-05-09 08:00:00', 'Đang mở', 6, 2),
(19, '2025-05-16 18:00:00', 100000.00, '2025-05-16 20:00:00', '2025-05-09 08:00:00', 'Đang mở', 3, 2),
(20, '2025-05-16 20:30:00', 120000.00, '2025-05-16 22:30:00', '2025-05-09 08:00:00', 'Đang mở', 4, 1);

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 6 (Phim ID 3, Phòng 1, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(6, 1, 'Trống'),   -- A1 (Thường)
(6, 2, 'Trống'),   -- A2 (Thường)
(6, 3, 'Đã đặt'),  -- A3 (Thường)
(6, 4, 'Đã đặt'),  -- A4 (Thường)
(6, 5, 'Đã đặt'),  -- A5 (Thường)
(6, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(6, 7, 'Trống'),   -- B1 (Thường)
(6, 8, 'Trống'),   -- B2 (Thường)
(6, 9, 'Đã đặt'),  -- B3 (VIP)
(6, 10, 'Đã đặt'), -- B4 (VIP)
(6, 11, 'Trống'),  -- B5 (Thường)
(6, 12, 'Trống'),  -- B6 (Thường)
(6, 13, 'Trống'),  -- B7 (Thường)
(6, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(6, 15, 'Trống'),  -- C1 (Thường)
(6, 16, 'Trống'),  -- C2 (Thường)
(6, 17, 'Trống'),  -- C3 (Thường)
(6, 18, 'Đã đặt'), -- C4 (Thường)
(6, 19, 'Đã đặt'), -- C5 (Thường)
(6, 20, 'Đã đặt'), -- C6 (VIP)
(6, 21, 'Đã đặt'), -- C7 (VIP)
(6, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(6, 23, 'Trống'),  -- D1 (Thường)
(6, 24, 'Đã đặt'), -- D2 (VIP)
(6, 25, 'Trống'),  -- D3 (Thường)
(6, 26, 'Trống'),  -- D4 (Thường)
(6, 27, 'Trống'),  -- D5 (Thường)
(6, 28, 'Trống'),  -- D6 (Thường)
(6, 29, 'Trống'),  -- D7 (Thường)
(6, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(6, 31, 'Đã đặt'), -- E1 (VIP)
(6, 32, 'Đã đặt'), -- E2 (VIP)
(6, 33, 'Trống'),  -- E3 (VIP)
(6, 34, 'Trống'),  -- E4 (Thường)
(6, 35, 'Trống'),  -- E5 (VIP)
(6, 36, 'Trống'),  -- E6 (Thường)
(6, 37, 'Trống'),  -- E7 (Thường)
(6, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(6, 39, 'Trống'),  -- F1 (Thường)
(6, 40, 'Trống'),  -- F2 (Thường)
(6, 41, 'Trống'),  -- F3 (Thường)
(6, 42, 'Trống'),  -- F4 (Thường)
(6, 43, 'Đã đặt'), -- F5 (VIP)
(6, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 7 (Phim ID 3, Phòng 2, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(7, 1, 'Trống'),   -- A1 (Thường)
(7, 2, 'Trống'),   -- A2 (Thường)
(7, 3, 'Trống'),   -- A3 (Thường)
(7, 4, 'Trống'),   -- A4 (Thường)
(7, 5, 'Trống'),   -- A5 (Thường)
(7, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(7, 7, 'Trống'),   -- B1 (Thường)
(7, 8, 'Trống'),   -- B2 (Thường)
(7, 9, 'Đã đặt'),  -- B3 (VIP)
(7, 10, 'Đã đặt'), -- B4 (VIP)
(7, 11, 'Đã đặt'), -- B5 (Thường)
(7, 12, 'Trống'),  -- B6 (Thường)
(7, 13, 'Trống'),  -- B7 (Thường)
(7, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(7, 15, 'Trống'),  -- C1 (Thường)
(7, 16, 'Trống'),  -- C2 (Thường)
(7, 17, 'Trống'),  -- C3 (Thường)
(7, 18, 'Trống'),  -- C4 (Thường)
(7, 19, 'Trống'),  -- C5 (Thường)
(7, 20, 'Đã đặt'), -- C6 (VIP)
(7, 21, 'Đã đặt'), -- C7 (VIP)
(7, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D
(7, 23, 'Trống'),  -- D1 (Thường)
(7, 24, 'Trống'),  -- D2 (VIP)
(7, 25, 'Trống'),  -- D3 (Thường)
(7, 26, 'Trống'),  -- D4 (Thường)
(7, 27, 'Trống'),  -- D5 (Thường)
(7, 28, 'Trống'),  -- D6 (Thường)
(7, 29, 'Trống'),  -- D7 (Thường)
(7, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(7, 31, 'Trống'),  -- E1 (VIP)
(7, 32, 'Trống'),  -- E2 (VIP)
(7, 33, 'Trống'),  -- E3 (VIP)
(7, 34, 'Trống'),  -- E4 (Thường)
(7, 35, 'Trống'),  -- E5 (VIP)
(7, 36, 'Trống'),  -- E6 (Thường)
(7, 37, 'Trống'),  -- E7 (Thường)
(7, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(7, 39, 'Trống'),  -- F1 (Thường)
(7, 40, 'Trống'),  -- F2 (Thường)
(7, 41, 'Trống'),  -- F3 (Thường)
(7, 42, 'Trống'),  -- F4 (Thường)
(7, 43, 'Trống'),  -- F5 (VIP)
(7, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 8 (Phim ID 4, Phòng 3, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(8, 1, 'Đã đặt'),  -- A1 (Thường)
(8, 2, 'Đã đặt'),  -- A2 (Thường)
(8, 3, 'Đã đặt'),  -- A3 (Thường)
(8, 4, 'Đã đặt'),  -- A4 (Thường)
(8, 5, 'Đã đặt'),  -- A5 (Thường)
(8, 6, 'Đã đặt'),  -- A6 (Thường)

-- Hàng B
(8, 7, 'Trống'),   -- B1 (Thường)
(8, 8, 'Trống'),   -- B2 (Thường)
(8, 9, 'Đã đặt'),  -- B3 (VIP)
(8, 10, 'Đã đặt'), -- B4 (VIP)
(8, 11, 'Đã đặt'), -- B5 (Thường)
(8, 12, 'Đã đặt'), -- B6 (Thường)
(8, 13, 'Trống'),  -- B7 (Thường)
(8, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(8, 15, 'Trống'),  -- C1 (Thường)
(8, 16, 'Trống'),  -- C2 (Thường)
(8, 17, 'Trống'),  -- C3 (Thường)
(8, 18, 'Đã đặt'), -- C4 (Thường)
(8, 19, 'Đã đặt'), -- C5 (Thường)
(8, 20, 'Đã đặt'), -- C6 (VIP)
(8, 21, 'Đã đặt'), -- C7 (VIP)
(8, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(8, 23, 'Trống'),  -- D1 (Thường)
(8, 24, 'Đã đặt'), -- D2 (VIP)
(8, 25, 'Đã đặt'), -- D3 (Thường)
(8, 26, 'Đã đặt'), -- D4 (Thường)
(8, 27, 'Trống'),  -- D5 (Thường)
(8, 28, 'Trống'),  -- D6 (Thường)
(8, 29, 'Trống'),  -- D7 (Thường)
(8, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(8, 31, 'Đã đặt'), -- E1 (VIP)
(8, 32, 'Đã đặt'), -- E2 (VIP)
(8, 33, 'Đã đặt'), -- E3 (VIP)
(8, 34, 'Trống'),  -- E4 (Thường)
(8, 35, 'Trống'),  -- E5 (VIP)
(8, 36, 'Trống'),  -- E6 (Thường)
(8, 37, 'Trống'),  -- E7 (Thường)
(8, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(8, 39, 'Trống'),  -- F1 (Thường)
(8, 40, 'Trống'),  -- F2 (Thường)
(8, 41, 'Trống'),  -- F3 (Thường)
(8, 42, 'Trống'),  -- F4 (Thường)
(8, 43, 'Đã đặt'), -- F5 (VIP)
(8, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 9 (Phim ID 5, Phòng 1, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(9, 1, 'Trống'),   -- A1 (Thường)
(9, 2, 'Trống'),   -- A2 (Thường)
(9, 3, 'Trống'),   -- A3 (Thường)
(9, 4, 'Trống'),   -- A4 (Thường)
(9, 5, 'Trống'),   -- A5 (Thường)
(9, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(9, 7, 'Trống'),   -- B1 (Thường)
(9, 8, 'Trống'),   -- B2 (Thường)
(9, 9, 'Trống'),   -- B3 (VIP)
(9, 10, 'Trống'),  -- B4 (VIP)
(9, 11, 'Trống'),  -- B5 (Thường)
(9, 12, 'Trống'),  -- B6 (Thường)
(9, 13, 'Trống'),  -- B7 (Thường)
(9, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(9, 15, 'Trống'),  -- C1 (Thường)
(9, 16, 'Trống'),  -- C2 (Thường)
(9, 17, 'Trống'),  -- C3 (Thường)
(9, 18, 'Trống'),  -- C4 (Thường)
(9, 19, 'Trống'),  -- C5 (Thường)
(9, 20, 'Trống'),  -- C6 (VIP)
(9, 21, 'Trống'),  -- C7 (VIP)
(9, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D
(9, 23, 'Trống'),  -- D1 (Thường)
(9, 24, 'Trống'),  -- D2 (VIP)
(9, 25, 'Trống'),  -- D3 (Thường)
(9, 26, 'Trống'),  -- D4 (Thường)
(9, 27, 'Trống'),  -- D5 (Thường)
(9, 28, 'Trống'),  -- D6 (Thường)
(9, 29, 'Trống'),  -- D7 (Thường)
(9, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(9, 31, 'Trống'),  -- E1 (VIP)
(9, 32, 'Trống'),  -- E2 (VIP)
(9, 33, 'Trống'),  -- E3 (VIP)
(9, 34, 'Trống'),  -- E4 (Thường)
(9, 35, 'Trống'),  -- E5 (VIP)
(9, 36, 'Trống'),  -- E6 (Thường)
(9, 37, 'Trống'),  -- E7 (Thường)
(9, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(9, 39, 'Trống'),  -- F1 (Thường)
(9, 40, 'Trống'),  -- F2 (Thường)
(9, 41, 'Trống'),  -- F3 (Thường)
(9, 42, 'Trống'),  -- F4 (Thường)
(9, 43, 'Trống'),  -- F5 (VIP)
(9, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 10 (Phim ID 6, Phòng 2, ngày 14/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(10, 1, 'Đã đặt'),  -- A1 (Thường)
(10, 2, 'Đã đặt'),  -- A2 (Thường)
(10, 3, 'Trống'),   -- A3 (Thường)
(10, 4, 'Trống'),   -- A4 (Thường)
(10, 5, 'Trống'),   -- A5 (Thường)
(10, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(10, 7, 'Đã đặt'),  -- B1 (Thường)
(10, 8, 'Đã đặt'),  -- B2 (Thường)
(10, 9, 'Đã đặt'),  -- B3 (VIP)
(10, 10, 'Đã đặt'), -- B4 (VIP)
(10, 11, 'Trống'),  -- B5 (Thường)
(10, 12, 'Trống'),  -- B6 (Thường)
(10, 13, 'Trống'),  -- B7 (Thường)
(10, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(10, 15, 'Trống'),  -- C1 (Thường)
(10, 16, 'Trống'),  -- C2 (Thường)
(10, 17, 'Đã đặt'), -- C3 (Thường)
(10, 18, 'Đã đặt'), -- C4 (Thường)
(10, 19, 'Đã đặt'), -- C5 (Thường)
(10, 20, 'Đã đặt'), -- C6 (VIP)
(10, 21, 'Đã đặt'), -- C7 (VIP)
(10, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(10, 23, 'Trống'),  -- D1 (Thường)
(10, 24, 'Đã đặt'), -- D2 (VIP)
(10, 25, 'Đã đặt'), -- D3 (Thường)
(10, 26, 'Đã đặt'), -- D4 (Thường)
(10, 27, 'Đã đặt'), -- D5 (Thường)
(10, 28, 'Đã đặt'), -- D6 (Thường)
(10, 29, 'Trống'),  -- D7 (Thường)
(10, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(10, 31, 'Trống'),  -- E1 (VIP)
(10, 32, 'Trống'),  -- E2 (VIP)
(10, 33, 'Trống'),  -- E3 (VIP)
(10, 34, 'Trống'),  -- E4 (Thường)
(10, 35, 'Trống'),  -- E5 (VIP)
(10, 36, 'Trống'),  -- E6 (Thường)
(10, 37, 'Trống'),  -- E7 (Thường)
(10, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(10, 39, 'Trống'),  -- F1 (Thường)
(10, 40, 'Trống'),  -- F2 (Thường)
(10, 41, 'Trống'),  -- F3 (Thường)
(10, 42, 'Trống'),  -- F4 (Thường)
(10, 43, 'Trống'),  -- F5 (VIP)
(10, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 11 (Phim ID 3, Phòng 3, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(11, 1, 'Trống'),   -- A1 (Thường)
(11, 2, 'Trống'),   -- A2 (Thường)
(11, 3, 'Trống'),   -- A3 (Thường)
(11, 4, 'Trống'),   -- A4 (Thường)
(11, 5, 'Trống'),   -- A5 (Thường)
(11, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(11, 7, 'Trống'),   -- B1 (Thường)
(11, 8, 'Trống'),   -- B2 (Thường)
(11, 9, 'Trống'),   -- B3 (VIP)
(11, 10, 'Trống'),  -- B4 (VIP)
(11, 11, 'Trống'),  -- B5 (Thường)
(11, 12, 'Trống'),  -- B6 (Thường)
(11, 13, 'Trống'),  -- B7 (Thường)
(11, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(11, 15, 'Đã đặt'), -- C1 (Thường)
(11, 16, 'Đã đặt'), -- C2 (Thường)
(11, 17, 'Đã đặt'), -- C3 (Thường)
(11, 18, 'Đã đặt'), -- C4 (Thường)
(11, 19, 'Đã đặt'), -- C5 (Thường)
(11, 20, 'Đã đặt'), -- C6 (VIP)
(11, 21, 'Đã đặt'), -- C7 (VIP)
(11, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(11, 23, 'Đã đặt'), -- D1 (Thường)
(11, 24, 'Đã đặt'), -- D2 (VIP)
(11, 25, 'Đã đặt'), -- D3 (Thường)
(11, 26, 'Đã đặt'), -- D4 (Thường)
(11, 27, 'Đã đặt'), -- D5 (Thường)
(11, 28, 'Đã đặt'), -- D6 (Thường)
(11, 29, 'Đã đặt'), -- D7 (Thường)
(11, 30, 'Đã đặt'), -- D8 (Thường)

-- Hàng E
(11, 31, 'Trống'),  -- E1 (VIP)
(11, 32, 'Trống'),  -- E2 (VIP)
(11, 33, 'Trống'),  -- E3 (VIP)
(11, 34, 'Trống'),  -- E4 (Thường)
(11, 35, 'Trống'),  -- E5 (VIP)
(11, 36, 'Trống'),  -- E6 (Thường)
(11, 37, 'Trống'),  -- E7 (Thường)
(11, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(11, 39, 'Trống'),  -- F1 (Thường)
(11, 40, 'Trống'),  -- F2 (Thường)
(11, 41, 'Trống'),  -- F3 (Thường)
(11, 42, 'Trống'),  -- F4 (Thường)
(11, 43, 'Trống'),  -- F5 (VIP)
(11, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 12 (Phim ID 4, Phòng 1, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(12, 1, 'Đã đặt'),  -- A1 (Thường)
(12, 2, 'Đã đặt'),  -- A2 (Thường)
(12, 3, 'Đã đặt'),  -- A3 (Thường)
(12, 4, 'Đã đặt'),  -- A4 (Thường)
(12, 5, 'Đã đặt'),  -- A5 (Thường)
(12, 6, 'Đã đặt'),  -- A6 (Thường)

-- Hàng B
(12, 7, 'Đã đặt'),  -- B1 (Thường)
(12, 8, 'Đã đặt'),  -- B2 (Thường)
(12, 9, 'Đã đặt'),  -- B3 (VIP)
(12, 10, 'Đã đặt'), -- B4 (VIP)
(12, 11, 'Đã đặt'), -- B5 (Thường)
(12, 12, 'Đã đặt'), -- B6 (Thường)
(12, 13, 'Đã đặt'), -- B7 (Thường)
(12, 14, 'Đã đặt'), -- B8 (Thường)

-- Hàng C
(12, 15, 'Đã đặt'), -- C1 (Thường)
(12, 16, 'Đã đặt'), -- C2 (Thường)
(12, 17, 'Đã đặt'), -- C3 (Thường)
(12, 18, 'Đã đặt'), -- C4 (Thường)
(12, 19, 'Đã đặt'), -- C5 (Thường)
(12, 20, 'Đã đặt'), -- C6 (VIP)
(12, 21, 'Đã đặt'), -- C7 (VIP)
(12, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(12, 23, 'Trống'),  -- D1 (Thường)
(12, 24, 'Trống'),  -- D2 (VIP)
(12, 25, 'Trống'),  -- D3 (Thường)
(12, 26, 'Trống'),  -- D4 (Thường)
(12, 27, 'Trống'),  -- D5 (Thường)
(12, 28, 'Trống'),  -- D6 (Thường)
(12, 29, 'Trống'),  -- D7 (Thường)
(12, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(12, 31, 'Trống'),  -- E1 (VIP)
(12, 32, 'Trống'),  -- E2 (VIP)
(12, 33, 'Trống'),  -- E3 (VIP)
(12, 34, 'Trống'),  -- E4 (Thường)
(12, 35, 'Trống'),  -- E5 (VIP)
(12, 36, 'Trống'),  -- E6 (Thường)
(12, 37, 'Trống'),  -- E7 (Thường)
(12, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(12, 39, 'Trống'),  -- F1 (Thường)
(12, 40, 'Trống'),  -- F2 (Thường)
(12, 41, 'Trống'),  -- F3 (Thường)
(12, 42, 'Trống'),  -- F4 (Thường)
(12, 43, 'Trống'),  -- F5 (VIP)
(12, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 13 (Phim ID 5, Phòng 2, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(13, 1, 'Trống'),   -- A1 (Thường)
(13, 2, 'Trống'),   -- A2 (Thường)
(13, 3, 'Trống'),   -- A3 (Thường)
(13, 4, 'Trống'),   -- A4 (Thường)
(13, 5, 'Trống'),   -- A5 (Thường)
(13, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(13, 7, 'Trống'),   -- B1 (Thường)
(13, 8, 'Trống'),   -- B2 (Thường)
(13, 9, 'Đã đặt'),  -- B3 (VIP)
(13, 10, 'Đã đặt'), -- B4 (VIP)
(13, 11, 'Trống'),  -- B5 (Thường)
(13, 12, 'Trống'),  -- B6 (Thường)
(13, 13, 'Trống'),  -- B7 (Thường)
(13, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(13, 15, 'Trống'),  -- C1 (Thường)
(13, 16, 'Trống'),  -- C2 (Thường)
(13, 17, 'Trống'),  -- C3 (Thường)
(13, 18, 'Trống'),  -- C4 (Thường)
(13, 19, 'Trống'),  -- C5 (Thường)
(13, 20, 'Đã đặt'), -- C6 (VIP)
(13, 21, 'Đã đặt'), -- C7 (VIP)
(13, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(13, 23, 'Trống'),  -- D1 (Thường)
(13, 24, 'Đã đặt'), -- D2 (VIP)
(13, 25, 'Trống'),  -- D3 (Thường)
(13, 26, 'Trống'),  -- D4 (Thường)
(13, 27, 'Trống'),  -- D5 (Thường)
(13, 28, 'Trống'),  -- D6 (Thường)
(13, 29, 'Trống'),  -- D7 (Thường)
(13, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(13, 31, 'Đã đặt'), -- E1 (VIP)
(13, 32, 'Đã đặt'), -- E2 (VIP)
(13, 33, 'Đã đặt'), -- E3 (VIP)
(13, 34, 'Trống'),  -- E4 (Thường)
(13, 35, 'Trống'),  -- E5 (VIP)
(13, 36, 'Trống'),  -- E6 (Thường)
(13, 37, 'Trống'),  -- E7 (Thường)
(13, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(13, 39, 'Trống'),  -- F1 (Thường)
(13, 40, 'Trống'),  -- F2 (Thường)
(13, 41, 'Trống'),  -- F3 (Thường)
(13, 42, 'Trống'),  -- F4 (Thường)
(13, 43, 'Trống'),  -- F5 (VIP)
(13, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 14 (Phim ID 6, Phòng 3, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(14, 1, 'Trống'),   -- A1 (Thường)
(14, 2, 'Trống'),   -- A2 (Thường)
(14, 3, 'Trống'),   -- A3 (Thường)
(14, 4, 'Trống'),   -- A4 (Thường)
(14, 5, 'Trống'),   -- A5 (Thường)
(14, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(14, 7, 'Trống'),   -- B1 (Thường)
(14, 8, 'Trống'),   -- B2 (Thường)
(14, 9, 'Đã đặt'),  -- B3 (VIP)
(14, 10, 'Đã đặt'), -- B4 (VIP)
(14, 11, 'Trống'),  -- B5 (Thường)
(14, 12, 'Trống'),  -- B6 (Thường)
(14, 13, 'Trống'),  -- B7 (Thường)
(14, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(14, 15, 'Trống'),  -- C1 (Thường)
(14, 16, 'Trống'),  -- C2 (Thường)
(14, 17, 'Trống'),  -- C3 (Thường)
(14, 18, 'Trống'),  -- C4 (Thường)
(14, 19, 'Trống'),  -- C5 (Thường)
(14, 20, 'Đã đặt'), -- C6 (VIP)
(14, 21, 'Đã đặt'), -- C7 (VIP)
(14, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(14, 23, 'Trống'),  -- D1 (Thường)
(14, 24, 'Đã đặt'), -- D2 (VIP)
(14, 25, 'Trống'),  -- D3 (Thường)
(14, 26, 'Trống'),  -- D4 (Thường)
(14, 27, 'Trống'),  -- D5 (Thường)
(14, 28, 'Trống'),  -- D6 (Thường)
(14, 29, 'Trống'),  -- D7 (Thường)
(14, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(14, 31, 'Đã đặt'), -- E1 (VIP)
(14, 32, 'Đã đặt'), -- E2 (VIP)
(14, 33, 'Đã đặt'), -- E3 (VIP)
(14, 34, 'Trống'),  -- E4 (Thường)
(14, 35, 'Trống'),  -- E5 (VIP)
(14, 36, 'Trống'),  -- E6 (Thường)
(14, 37, 'Trống'),  -- E7 (Thường)
(14, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(14, 39, 'Trống'),  -- F1 (Thường)
(14, 40, 'Trống'),  -- F2 (Thường)
(14, 41, 'Trống'),  -- F3 (Thường)
(14, 42, 'Trống'),  -- F4 (Thường)
(14, 43, 'Đã đặt'), -- F5 (VIP)
(14, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 15 (Phim ID 3, Phòng 1, ngày 15/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(15, 1, 'Đã đặt'),  -- A1 (Thường)
(15, 2, 'Đã đặt'),  -- A2 (Thường)
(15, 3, 'Đã đặt'),  -- A3 (Thường)
(15, 4, 'Đã đặt'),  -- A4 (Thường)
(15, 5, 'Đã đặt'),  -- A5 (Thường)
(15, 6, 'Đã đặt'),  -- A6 (Thường)

-- Hàng B
(15, 7, 'Đã đặt'),  -- B1 (Thường)
(15, 8, 'Đã đặt'),  -- B2 (Thường)
(15, 9, 'Đã đặt'),  -- B3 (VIP)
(15, 10, 'Đã đặt'), -- B4 (VIP)
(15, 11, 'Đã đặt'), -- B5 (Thường)
(15, 12, 'Đã đặt'), -- B6 (Thường)
(15, 13, 'Đã đặt'), -- B7 (Thường)
(15, 14, 'Đã đặt'), -- B8 (Thường)

-- Hàng C
(15, 15, 'Đã đặt'), -- C1 (Thường)
(15, 16, 'Đã đặt'), -- C2 (Thường)
(15, 17, 'Đã đặt'), -- C3 (Thường)
(15, 18, 'Đã đặt'), -- C4 (Thường)
(15, 19, 'Đã đặt'), -- C5 (Thường)
(15, 20, 'Đã đặt'), -- C6 (VIP)
(15, 21, 'Đã đặt'), -- C7 (VIP)
(15, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(15, 23, 'Đã đặt'), -- D1 (Thường)
(15, 24, 'Đã đặt'), -- D2 (VIP)
(15, 25, 'Đã đặt'), -- D3 (Thường)
(15, 26, 'Đã đặt'), -- D4 (Thường)
(15, 27, 'Đã đặt'), -- D5 (Thường)
(15, 28, 'Đã đặt'), -- D6 (Thường)
(15, 29, 'Đã đặt'), -- D7 (Thường)
(15, 30, 'Đã đặt'), -- D8 (Thường)

-- Hàng E
(15, 31, 'Đã đặt'), -- E1 (VIP)
(15, 32, 'Đã đặt'), -- E2 (VIP)
(15, 33, 'Đã đặt'), -- E3 (VIP)
(15, 34, 'Đã đặt'), -- E4 (Thường)
(15, 35, 'Đã đặt'), -- E5 (VIP)
(15, 36, 'Đã đặt'), -- E6 (Thường)
(15, 37, 'Đã đặt'), -- E7 (Thường)
(15, 38, 'Đã đặt'), -- E8 (Thường)

-- Hàng F
(15, 39, 'Đã đặt'), -- F1 (Thường)
(15, 40, 'Đã đặt'), -- F2 (Thường)
(15, 41, 'Đã đặt'), -- F3 (Thường)
(15, 42, 'Đã đặt'), -- F4 (Thường)
(15, 43, 'Đã đặt'), -- F5 (VIP)
(15, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 16 (Phim ID 4, Phòng 2, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(16, 1, 'Trống'),   -- A1 (Thường)
(16, 2, 'Trống'),   -- A2 (Thường)
(16, 3, 'Trống'),   -- A3 (Thường)
(16, 4, 'Trống'),   -- A4 (Thường)
(16, 5, 'Trống'),   -- A5 (Thường)
(16, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(16, 7, 'Trống'),   -- B1 (Thường)
(16, 8, 'Trống'),   -- B2 (Thường)
(16, 9, 'Trống'),   -- B3 (VIP)
(16, 10, 'Trống'),  -- B4 (VIP)
(16, 11, 'Trống'),  -- B5 (Thường)
(16, 12, 'Trống'),  -- B6 (Thường)
(16, 13, 'Trống'),  -- B7 (Thường)
(16, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(16, 15, 'Trống'),  -- C1 (Thường)
(16, 16, 'Trống'),  -- C2 (Thường)
(16, 17, 'Trống'),  -- C3 (Thường)
(16, 18, 'Trống'),  -- C4 (Thường)
(16, 19, 'Trống'),  -- C5 (Thường)
(16, 20, 'Trống'),  -- C6 (VIP)
(16, 21, 'Trống'),  -- C7 (VIP)
(16, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D
(16, 23, 'Trống'),  -- D1 (Thường)
(16, 24, 'Trống'),  -- D2 (VIP)
(16, 25, 'Trống'),  -- D3 (Thường)
(16, 26, 'Trống'),  -- D4 (Thường)
(16, 27, 'Trống'),  -- D5 (Thường)
(16, 28, 'Trống'),  -- D6 (Thường)
(16, 29, 'Trống'),  -- D7 (Thường)
(16, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(16, 31, 'Trống'),  -- E1 (VIP)
(16, 32, 'Trống'),  -- E2 (VIP)
(16, 33, 'Trống'),  -- E3 (VIP)
(16, 34, 'Trống'),  -- E4 (Thường)
(16, 35, 'Trống'),  -- E5 (VIP)
(16, 36, 'Trống'),  -- E6 (Thường)
(16, 37, 'Trống'),  -- E7 (Thường)
(16, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(16, 39, 'Trống'),  -- F1 (Thường)
(16, 40, 'Trống'),  -- F2 (Thường)
(16, 41, 'Trống'),  -- F3 (Thường)
(16, 42, 'Trống'),  -- F4 (Thường)
(16, 43, 'Trống'),  -- F5 (VIP)
(16, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 17 (Phim ID 5, Phòng 1, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(17, 1, 'Trống'),   -- A1 (Thường)
(17, 2, 'Trống'),   -- A2 (Thường)
(17, 3, 'Trống'),   -- A3 (Thường)
(17, 4, 'Trống'),   -- A4 (Thường)
(17, 5, 'Trống'),   -- A5 (Thường)
(17, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(17, 7, 'Trống'),   -- B1 (Thường)
(17, 8, 'Trống'),   -- B2 (Thường)
(17, 9, 'Đã đặt'),  -- B3 (VIP)
(17, 10, 'Đã đặt'), -- B4 (VIP)
(17, 11, 'Trống'),  -- B5 (Thường)
(17, 12, 'Trống'),  -- B6 (Thường)
(17, 13, 'Trống'),  -- B7 (Thường)
(17, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(17, 15, 'Trống'),  -- C1 (Thường)
(17, 16, 'Trống'),  -- C2 (Thường)
(17, 17, 'Trống'),  -- C3 (Thường)
(17, 18, 'Trống'),  -- C4 (Thường)
(17, 19, 'Trống'),  -- C5 (Thường)
(17, 20, 'Đã đặt'), -- C6 (VIP)
(17, 21, 'Đã đặt'), -- C7 (VIP)
(17, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(17, 23, 'Trống'),  -- D1 (Thường)
(17, 24, 'Đã đặt'), -- D2 (VIP)
(17, 25, 'Trống'),  -- D3 (Thường)
(17, 26, 'Trống'),  -- D4 (Thường)
(17, 27, 'Trống'),  -- D5 (Thường)
(17, 28, 'Trống'),  -- D6 (Thường)
(17, 29, 'Trống'),  -- D7 (Thường)
(17, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(17, 31, 'Đã đặt'), -- E1 (VIP)
(17, 32, 'Đã đặt'), -- E2 (VIP)
(17, 33, 'Đã đặt'), -- E3 (VIP)
(17, 34, 'Trống'),  -- E4 (Thường)
(17, 35, 'Trống'),  -- E5 (VIP)
(17, 36, 'Trống'),  -- E6 (Thường)
(17, 37, 'Trống'),  -- E7 (Thường)
(17, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(17, 39, 'Trống'),  -- F1 (Thường)
(17, 40, 'Trống'),  -- F2 (Thường)
(17, 41, 'Trống'),  -- F3 (Thường)
(17, 42, 'Trống'),  -- F4 (Thường)
(17, 43, 'Đã đặt'), -- F5 (VIP)
(17, 44, 'Đã đặt'); -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 18 (Phim ID 6, Phòng 3, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(18, 1, 'Đã đặt'),  -- A1 (Thường)
(18, 2, 'Đã đặt'),  -- A2 (Thường)
(18, 3, 'Đã đặt'),  -- A3 (Thường)
(18, 4, 'Đã đặt'),  -- A4 (Thường)
(18, 5, 'Đã đặt'),  -- A5 (Thường)
(18, 6, 'Đã đặt'),  -- A6 (Thường)

-- Hàng B
(18, 7, 'Đã đặt'),  -- B1 (Thường)
(18, 8, 'Đã đặt'),  -- B2 (Thường)
(18, 9, 'Đã đặt'),  -- B3 (VIP)
(18, 10, 'Đã đặt'), -- B4 (VIP)
(18, 11, 'Đã đặt'), -- B5 (Thường)
(18, 12, 'Đã đặt'), -- B6 (Thường)
(18, 13, 'Đã đặt'), -- B7 (Thường)
(18, 14, 'Đã đặt'), -- B8 (Thường)

-- Hàng C
(18, 15, 'Đã đặt'), -- C1 (Thường)
(18, 16, 'Đã đặt'), -- C2 (Thường)
(18, 17, 'Đã đặt'), -- C3 (Thường)
(18, 18, 'Đã đặt'), -- C4 (Thường)
(18, 19, 'Đã đặt'), -- C5 (Thường)
(18, 20, 'Đã đặt'), -- C6 (VIP)
(18, 21, 'Đã đặt'), -- C7 (VIP)
(18, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(18, 23, 'Trống'),  -- D1 (Thường)
(18, 24, 'Trống'),  -- D2 (VIP)
(18, 25, 'Trống'),  -- D3 (Thường)
(18, 26, 'Trống'),  -- D4 (Thường)
(18, 27, 'Trống'),  -- D5 (Thường)
(18, 28, 'Trống'),  -- D6 (Thường)
(18, 29, 'Trống'),  -- D7 (Thường)
(18, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(18, 31, 'Trống'),  -- E1 (VIP)
(18, 32, 'Trống'),  -- E2 (VIP)
(18, 33, 'Trống'),  -- E3 (VIP)
(18, 34, 'Trống'),  -- E4 (Thường)
(18, 35, 'Trống'),  -- E5 (VIP)
(18, 36, 'Trống'),  -- E6 (Thường)
(18, 37, 'Trống'),  -- E7 (Thường)
(18, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(18, 39, 'Trống'),  -- F1 (Thường)
(18, 40, 'Trống'),  -- F2 (Thường)
(18, 41, 'Trống'),  -- F3 (Thường)
(18, 42, 'Trống'),  -- F4 (Thường)
(18, 43, 'Trống'),  -- F5 (VIP)
(18, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 19 (Phim ID 3, Phòng 2, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(19, 1, 'Trống'),   -- A1 (Thường)
(19, 2, 'Trống'),   -- A2 (Thường)
(19, 3, 'Trống'),   -- A3 (Thường)
(19, 4, 'Trống'),   -- A4 (Thường)
(19, 5, 'Trống'),   -- A5 (Thường)
(19, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(19, 7, 'Trống'),   -- B1 (Thường)
(19, 8, 'Trống'),   -- B2 (Thường)
(19, 9, 'Trống'),   -- B3 (VIP)
(19, 10, 'Trống'),  -- B4 (VIP)
(19, 11, 'Trống'),  -- B5 (Thường)
(19, 12, 'Trống'),  -- B6 (Thường)
(19, 13, 'Trống'),  -- B7 (Thường)
(19, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(19, 15, 'Trống'),  -- C1 (Thường)
(19, 16, 'Trống'),  -- C2 (Thường)
(19, 17, 'Trống'),  -- C3 (Thường)
(19, 18, 'Trống'),  -- C4 (Thường)
(19, 19, 'Trống'),  -- C5 (Thường)
(19, 20, 'Trống'),  -- C6 (VIP)
(19, 21, 'Trống'),  -- C7 (VIP)
(19, 22, 'Trống'),  -- C8 (VIP)

-- Hàng D
(19, 23, 'Trống'),  -- D1 (Thường)
(19, 24, 'Trống'),  -- D2 (VIP)
(19, 25, 'Trống'),  -- D3 (Thường)
(19, 26, 'Trống'),  -- D4 (Thường)
(19, 27, 'Trống'),  -- D5 (Thường)
(19, 28, 'Trống'),  -- D6 (Thường)
(19, 29, 'Trống'),  -- D7 (Thường)
(19, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(19, 31, 'Trống'),  -- E1 (VIP)
(19, 32, 'Trống'),  -- E2 (VIP)
(19, 33, 'Trống'),  -- E3 (VIP)
(19, 34, 'Trống'),  -- E4 (Thường)
(19, 35, 'Trống'),  -- E5 (VIP)
(19, 36, 'Trống'),  -- E6 (Thường)
(19, 37, 'Trống'),  -- E7 (Thường)
(19, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(19, 39, 'Trống'),  -- F1 (Thường)
(19, 40, 'Trống'),  -- F2 (Thường)
(19, 41, 'Trống'),  -- F3 (Thường)
(19, 42, 'Trống'),  -- F4 (Thường)
(19, 43, 'Trống'),  -- F5 (VIP)
(19, 44, 'Trống');  -- F6 (VIP)

-- Thêm dữ liệu lịch chiếu ghế cho lịch chiếu ID 20 (Phim ID 4, Phòng 1, ngày 16/05/2025)
INSERT INTO lich_chieu_ghe (lich_chieu_id, ghe_id, trang_thai) VALUES
-- Hàng A
(20, 1, 'Trống'),   -- A1 (Thường)
(20, 2, 'Trống'),   -- A2 (Thường)
(20, 3, 'Trống'),   -- A3 (Thường)
(20, 4, 'Trống'),   -- A4 (Thường)
(20, 5, 'Trống'),   -- A5 (Thường)
(20, 6, 'Trống'),   -- A6 (Thường)

-- Hàng B
(20, 7, 'Trống'),   -- B1 (Thường)
(20, 8, 'Trống'),   -- B2 (Thường)
(20, 9, 'Đã đặt'),  -- B3 (VIP)
(20, 10, 'Đã đặt'), -- B4 (VIP)
(20, 11, 'Trống'),  -- B5 (Thường)
(20, 12, 'Trống'),  -- B6 (Thường)
(20, 13, 'Trống'),  -- B7 (Thường)
(20, 14, 'Trống'),  -- B8 (Thường)

-- Hàng C
(20, 15, 'Trống'),  -- C1 (Thường)
(20, 16, 'Trống'),  -- C2 (Thường)
(20, 17, 'Trống'),  -- C3 (Thường)
(20, 18, 'Trống'),  -- C4 (Thường)
(20, 19, 'Trống'),  -- C5 (Thường)
(20, 20, 'Đã đặt'), -- C6 (VIP)
(20, 21, 'Đã đặt'), -- C7 (VIP)
(20, 22, 'Đã đặt'), -- C8 (VIP)

-- Hàng D
(20, 23, 'Trống'),  -- D1 (Thường)
(20, 24, 'Đã đặt'), -- D2 (VIP)
(20, 25, 'Trống'),  -- D3 (Thường)
(20, 26, 'Trống'),  -- D4 (Thường)
(20, 27, 'Trống'),  -- D5 (Thường)
(20, 28, 'Trống'),  -- D6 (Thường)
(20, 29, 'Trống'),  -- D7 (Thường)
(20, 30, 'Trống'),  -- D8 (Thường)

-- Hàng E
(20, 31, 'Đã đặt'), -- E1 (VIP)
(20, 32, 'Đã đặt'), -- E2 (VIP)
(20, 33, 'Đã đặt'), -- E3 (VIP)
(20, 34, 'Trống'),  -- E4 (Thường)
(20, 35, 'Trống'),  -- E5 (VIP)
(20, 36, 'Trống'),  -- E6 (Thường)
(20, 37, 'Trống'),  -- E7 (Thường)
(20, 38, 'Trống'),  -- E8 (Thường)

-- Hàng F
(20, 39, 'Trống'),  -- F1 (Thường)
(20, 40, 'Trống'),  -- F2 (Thường)
(20, 41, 'Trống'),  -- F3 (Thường)
(20, 42, 'Trống'),  -- F4 (Thường)
(20, 43, 'Đã đặt'), -- F5 (VIP)
(20, 44, 'Đã đặt'); -- F6 (VIP)

