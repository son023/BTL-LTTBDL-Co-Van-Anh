CREATE TABLE thanh_toan (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten varchar(50),
    so_tai_khoan varchar(50),
    status int
);

ALTER TABLE giao_dich DROP COLUMN phuong_thuc;

ALTER TABLE giao_dich
    ADD COLUMN phuong_thuc INT;

ALTER TABLE giao_dich
    ADD CONSTRAINT fk_phuong_thuc
        FOREIGN KEY (phuong_thuc) REFERENCES thanh_toan(id);

INSERT INTO thanh_toan(ten, so_tai_khoan, status) VALUES
('Momo', '0123456789', 1),
('MBBank', '0912345678', 1),
('ZaloPay', '0912345678', 1),
('Techcombank', '0912345678', 1),
('BIDV', '0912345678', 1),
('Vietcombank', '0912345678', 1),
('VietinBank', '0912345678', 1),
('Agribank', '0912345678', 1);
