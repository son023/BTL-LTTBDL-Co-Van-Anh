CREATE TABLE lich_chieu_ghe (
                                id INT PRIMARY KEY AUTO_INCREMENT,
                                lich_chieu_id INT NOT NULL,
                                ghe_id INT NOT NULL,
                                trang_thai VARCHAR(20) NOT NULL DEFAULT 'Trống',
                                FOREIGN KEY (lich_chieu_id) REFERENCES lich_chieu(id),
                                FOREIGN KEY (ghe_id) REFERENCES ghe(id),
                                CONSTRAINT unique_lich_chieu_ghe UNIQUE (lich_chieu_id, ghe_id)
);

ALTER TABLE ve DROP FOREIGN KEY FKffda8py1oktkgduf7jgcwnpom;
ALTER TABLE ve DROP FOREIGN KEY FKn7ccscrmof64kjs2uih85us4u;
ALTER TABLE ve DROP COLUMN lich_chieu_id;
ALTER TABLE ve DROP COLUMN ghe_id;
ALTER TABLE ve ADD COLUMN lich_chieu_ghe_id INT NOT NULL;
ALTER TABLE ve ADD CONSTRAINT fk_ve_lich_chieu_ghe FOREIGN KEY (lich_chieu_ghe_id) REFERENCES lich_chieu_ghe(id);