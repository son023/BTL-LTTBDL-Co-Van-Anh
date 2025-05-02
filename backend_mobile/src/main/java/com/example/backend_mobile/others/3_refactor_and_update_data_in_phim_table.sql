ALTER TABLE phim MODIFY COLUMN mo_ta VARCHAR(5000);

UPDATE movies SET
    rating = 8.8,
    director = 'Christopher Nolan',
    cast = 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy, Ken Watanabe, Cillian Murphy, Marion Cotillard, Michael Caine, Dileep Rao, Tom Berenger',
    duration = 148,
    age_limit = 13,
    studio = 'Warner Bros. Pictures',
    description = 'Một tên trộm chuyên đánh cắp bí mật doanh nghiệp bằng công nghệ chia sẻ giấc mơ được giao nhiệm vụ ngược lại: gieo ý tưởng vào tâm trí một giám đốc điều hành, nhưng quá khứ bi thảm của anh có thể khiến nhiệm vụ và cả đội rơi vào thảm họa.',
    release_year = 2010,
    language = 'Tiếng Anh',
    poster_url = 'https://m.media-amazon.com/images/M/MV5BMjExMjkwNTQ0Nl5BMl5BanBnXkFtZTcwNTY0OTk1Mw@@._V1_.jpg',
    title = 'Inception',
    genre = 'Khoa học viễn tưởng, Hành động',
    trailer_url = 'https://www.youtube.com/watch?v=8hP9D6kZseM',
    status = 'Đang chiếu'
WHERE id = 1;

UPDATE movies SET
    rating = 7.6,
    director = 'Quentin Tarantino',
    cast = 'Leonardo DiCaprio, Brad Pitt, Margot Robbie, Margaret Qualley, Austin Butler, Dakota Fanning, Bruce Dern, Al Pacino, Emile Hirsch, Kurt Russell',
    duration = 165,
    age_limit = 16,
    studio = 'Sony Pictures',
    description = 'Khi Thời kỳ Vàng của Hollywood đang dần khép lại vào mùa hè năm 1969, diễn viên truyền hình Rick Dalton và người đóng thế của anh, Cliff Booth, nỗ lực đạt được thành công bền vững ở Hollywood, đồng thời gặp gỡ nhiều nhân vật đầy màu sắc trên hành trình của họ.',
    release_year = 2019,
    language = 'Tiếng Anh',
    poster_url = 'https://th.bing.com/th/id/OIP.tdNKGp8DTDgSpmyMovSilQHaK-?rs=1&pid=ImgDetMain',
    title = 'Once Upon a Time in Hollywood',
    genre = 'Drama',
    trailer_url = 'https://www.youtube.com/watch?v=ELeMaP8EPAA',
    status = 'Sắp chiếu'
WHERE id = 2;

UPDATE movies SET
    rating = 7.9,
    director = 'Steven Spielberg',
    cast = 'Tom Hanks, Matt Damon, Edward Burns, Tom Sizemore, Barry Pepper, Vin Diesel, Giovanni Ribisi, Adam Goldberg, Jeremy Davies, Ted Danson.',
    duration = 140,
    age_limit = 13,
    studio = 'Universal',
    description = 'Sau cuộc đổ bộ Normandy, một nhóm lính Mỹ đi sau chiến tuyến của kẻ thù để lấy một lính dù có anh em đã thiệt mạng trong chiến đấu.',
    release_year = 1998,
    language = 'Tiếng Anh',
    poster_url = 'https://th.bing.com/th/id/R.24f6a65f3371b06c7ae158bfad7f8151?rik=87qYKCQY3eiDCQ&pid=ImgRaw&r=0',
    title = 'Saving Private Ryan',
    genre = 'Chiến tranh',
    trailer_url = 'https://www.youtube.com/watch?v=S1Qj_AVu2pA',
    status = 'Đang chiếu'
WHERE id = 3;

UPDATE movies SET
    rating = 8.0,
    director = 'James Cameron',
    cast = 'Leonardo DiCaprio, Kate Winslet, Billy Zane, Kathy Bates, Frances Fisher, Danny Nucci, Bill Paxton, David Warner, Jonathan Hyde, Bernard Hill.',
    duration = 195,
    age_limit = 13,
    studio = '20th Century Fox',
    description = 'Titanic kể về mối tình giữa Jack và Rose, hai con người từ hai thế giới khác nhau, trên con tàu Titanic. Dù hoàn cảnh không thuận lợi, họ yêu nhau say đắm. Khi tàu gặp nạn và chìm, tình yêu của họ phải đối mặt với sự sống còn, mang đến những khoảnh khắc đầy bi thương và hy sinh.',
    release_year = 1997,
    language = 'Tiếng Anh',
    poster_url = 'https://www.themoviedb.org/t/p/original/tr5y5H4qOlqCGbZKaT9Q97cscVj.jpg',
    title = 'Titanic',
    genre = 'Lãng mạn',
    trailer_url = 'https://www.youtube.com/watch?v=kVrqfYjkTdQ',
    status = 'Đang chiếu'
WHERE id = 4;

UPDATE movies SET
    rating = 7.8,
    director = 'Peter Jackson',
    cast = 'Elijah Wood, Ian McKellen, Viggo Mortensen, Sean Astin, Orlando Bloom, Cate Blanchett, Hugo Weaving, Liv Tyler, John Rhys-Davies, Sean Bean.',
    duration = 178,
    age_limit = 13,
    studio = 'New Line Cinema',
    description = 'The Lord of the Rings theo chân Frodo Baggins, người được giao nhiệm vụ tiêu diệt chiếc nhẫn quyền lực. Cùng với nhóm bạn, Frodo phải đối mặt với những nguy hiểm, bao gồm bóng tối từ Sauron. Họ chiến đấu chống lại cái ác để cứu lấy Trung Địa, vượt qua nhiều thử thách và hy sinh.',
    release_year = 2001,
    language = 'Tiếng Anh',
    poster_url = 'https://image.tmdb.org/t/p/original/uexxR7Kw1qYbZk0RYaF9Rx5ykbj.jpg',
    title = 'The Lord of the Rings',
    genre = 'Phiêu lưu',
    trailer_url = 'https://www.youtube.com/watch?v=gCUg6Td5fgQ',
    status = 'Đang chiếu'
WHERE id = 5;

INSERT INTO movies (id, rating, director, cast, duration, age_limit, studio, description, release_year, language, poster_url, title, genre, trailer_url, status) VALUES
(6, 8.3, 'David Fincher', 'Brad Pitt, Edward Norton, Helena Bonham Carter, Meat Loaf, Jared Leto, Zach Grenier, Richmond Arquette, David Andrews, Christy Scott Cashman, Elliot Gould.', 139, 16, '20th Century Fox', 'Fight Club kể về một người đàn ông (Edward Norton) mệt mỏi với cuộc sống, gặp gỡ Tyler Durden (Brad Pitt), người lập ra một câu lạc bộ chiến đấu ngầm. Câu lạc bộ trở thành một phong trào hỗn loạn, nhưng khi người kể chuyện phát hiện sự thật kinh hoàng về Tyler, mọi thứ dần mất kiểm soát. Bộ phim khám phá chủ nghĩa vật chất, bản sắc và sự tan vỡ của xã hội.', 1995, 'Tiếng Anh', 'https://www.themoviedb.org/t/p/original/iqR0M1ln7Kobjp9liUj2Q7mtQZG.jpg', 'Fight Club', 'Hành động', 'https://www.youtube.com/watch?v=qtRKdVHc-cE', 'Đang chiếu'),
(7, 7.7, 'Ridley Scott', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen, Oliver Reed, Richard Harris, Derek Jacobi, Djimon Hounsou, Tomas Arana, Ralf Moeller, David Schofield.', 155, 13, 'Universal', 'Gladiator kể về Maximus (Russell Crowe), một tướng quân La Mã bị phản bội và gia đình bị giết hại. Anh trở thành một đấu sĩ và tìm cách trả thù. Maximus chiến đấu trong đấu trường để giành lại danh dự và công lý, đối đầu với Commodus (Joaquin Phoenix), hoàng đế tàn bạo. Bộ phim thể hiện sự hy sinh, lòng trung thành và khát khao tự do.', 2000, 'Tiếng Anh', 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg', 'Gladiator', 'Lịch sử', 'https://www.youtube.com/watch?v=P5ieIbInFpg', 'Đang chiếu'),
(8, 8.1, 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain, Michael Caine, Mackenzie Foy, Ellen Burstyn, John Lithgow, Topher Grace, Casey Affleck, Wes Bentley.', 164, 13, 'Warner Bros', 'Interstellar kể về câu chuyện của Cooper (Matthew McConaughey), một phi hành gia được giao nhiệm vụ dẫn dắt một nhóm khám phá không gian để tìm một hành tinh mới cho loài người, khi Trái Đất đang bị tàn phá. Trong hành trình xuyên qua lỗ đen và thời gian, Cooper phải đối mặt với những quyết định khó khăn để cứu cả gia đình và nhân loại. Bộ phim khám phá tình yêu, sự hy sinh và những bí ẩn của vũ trụ.', 2014, 'Tiếng Anh', 'https://cdn.shopify.com/s/files/1/1416/8662/products/interstellar_2014_advance_original_film_art_682852f2-23f6-46de-a1db-4029d5b6f0b4_2000x.jpg?v=1574284010', 'Interstellar', 'Khoa học viễn tưởng', 'https://www.youtube.com/watch?v=zSWdZVtXT7E', 'Sắp chiếu'),
(9, 7.6, 'Martin Scorsese', 'Robert De Niro, Al Pacino, Joe Pesci, Harvey Keitel, Ray Romano, Bobby Cannavale, Anna Paquin, Stephen Graham, Jesse Plemons, Paul Herman.', 180, 16, 'Paramount', 'The Irishman kể về Frank Sheeran (Robert De Niro), một người lính cũ trong Mafia, kể lại cuộc đời mình. Anh làm việc cho ông trùm Russell Bufalino (Joe Pesci) và dần dần trở thành người thân cận của Jimmy Hoffa (Al Pacino), một lãnh đạo công đoàn nổi tiếng. Bộ phim khắc họa sự phản bội, tội lỗi và những hậu quả của cuộc sống trong thế giới tội phạm.', 2019, 'Tiếng Anh', 'https://posterspy.com/wp-content/uploads/2021/03/theirishman72dpi-scaled.jpg', 'The Irishman', 'Hình sự', 'https://www.youtube.com/watch?v=WHXxVmeGQUc', 'Sắp chiếu'),
(10, 8.4, 'Denis Villeneuve', 'Timothée Chalamet, Zendaya, Oscar Isaac, Rebecca Ferguson, Josh Brolin, Stellan Skarsgård, Dave Bautista, Jason Momoa, Javier Bardem, Charlotte Rampling.', 155, 13, 'Legendary Pictures', 'Dune theo chân Paul Atreides (Timothée Chalamet), người thừa kế nhà Atreides, khi gia đình anh được giao cai trị hành tinh sa mạc Arrakis, nguồn cung cấp "spice" quý giá. Sau khi gia đình bị phản bội, Paul phải trốn vào hoang mạc và gia nhập các bộ lạc người Fremen. Bộ phim khám phá quyền lực, sự sinh tồn và định mệnh trong một vũ trụ đầy xung đột.', 2021, 'Tiếng Anh', 'https://th.bing.com/th/id/OIP.ORgJjrgXNIbDtLIyU_RoHAHaLG?rs=1&pid=ImgDetMain', 'Dune', 'Khoa học viễn tưởng', 'https://www.youtube.com/watch?v=n9xhJrPXop4', 'Sắp chiếu');


