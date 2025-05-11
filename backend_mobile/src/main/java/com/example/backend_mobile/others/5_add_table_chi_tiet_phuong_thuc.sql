CREATE TABLE chi_tiet_phuong_thuc (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_khach_hang INT,
    id_thanh_toan INT,
    so_tai_khoan varchar(50),
    status varchar(50),
    FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
    FOREIGN KEY (id_thanh_toan) REFERENCES thanh_toan(id)
);

alter table thanh_toan
drop column so_tai_khoan;