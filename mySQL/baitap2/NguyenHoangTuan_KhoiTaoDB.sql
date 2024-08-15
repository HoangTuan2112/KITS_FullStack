CREATE DATABASE QuanLyNhanVien;
USE QuanLyNhanVien;

CREATE TABLE PHONGBAN (
    MAPHG INT PRIMARY KEY,
    TENPHG VARCHAR(15),
    TRPHG CHAR(9),
    NG_NHANCHUC DATE
   
);

CREATE TABLE NHANVIEN (
    MANV CHAR(9) PRIMARY KEY,
    HONV VARCHAR(15),
    TENLOT VARCHAR(15),
    TENNV VARCHAR(15),
    NGSINH DATE,
    DCHI VARCHAR(30),
    PHAI CHAR(3),
    LUONG DECIMAL(10, 2),
    MA_NQL CHAR(9),
    PHG INT,
    FOREIGN KEY (PHG) REFERENCES PHONGBAN(MAPHG),
    FOREIGN KEY (MA_NQL) REFERENCES NHANVIEN(MANV)
);

CREATE TABLE THANHNHAN (
    MA_NVIEN CHAR(9),
    TENTN VARCHAR(15),
    PHAI CHAR(3),
    NGSINH DATE,
    QUANHE VARCHAR(15),
    PRIMARY KEY (MA_NVIEN, TENTN),
    FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN(MANV)
);

CREATE TABLE DEAN (
    MADA INT PRIMARY KEY,
    TENDA VARCHAR(15),
    DDIEM_DA VARCHAR(15),
    PHONG INT,
    FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPHG)
);

CREATE TABLE CONGVIEC (
    MADA INT,
    STT INT,
    TEN_CONG_VIEC VARCHAR(50),
    PRIMARY KEY (MADA, STT),
    FOREIGN KEY (MADA) REFERENCES DEAN(MADA)
);

CREATE TABLE PHANCONG (
    MA_NVIEN CHAR(9),
    MADA INT,
    STT INT,
    THOIGIAN DECIMAL(5, 2),
    PRIMARY KEY (MA_NVIEN, MADA, STT),
    FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY (MADA) REFERENCES DEAN(MADA),
	FOREIGN KEY (MADA, STT) REFERENCES CONGVIEC(MADA, STT)
);

CREATE TABLE DIADIEM_PHG (
    MAPHG INT PRIMARY KEY,
    DIADIEM VARCHAR(15) ,
    FOREIGN KEY (MAPHG) REFERENCES PHONGBAN(MAPHG)
);

INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC) VALUES
('Nghiên cứu', 5, '005', '1978-05-22'),
('Điều hành', 4, '008', '1985-01-01'),
('Quản lý', 1, '006', '1971-06-19');

INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG) VALUES
('Đinh', 'Bá', 'Tiên', '009', '1960-02-11', '119 Cống Quỳnh, Tp HCM', 'Nam', 30000, '005', 5),
('Nguyễn', 'Thanh', 'Tùng', '005', '1962-08-20', '222 Nguyễn Văn Cừ, Tp HCM', 'Nam', 40000, '006', 5),
('Bùi', 'Ngọc', 'Hằng', '007', '1954-03-11', '332 Nguyễn Thái Học, Tp HCM', 'Nam', 25000, '001', 4),
('Lê', 'Quỳnh', 'Như', '001', '1967-02-01', '291 Hồ Văn Huê, Tp HCM', 'Nữ', 43000, '006', 4),
('Nguyễn', 'Mạnh', 'Hùng', '004', '1967-03-04', '95 Bà Rịa, Vũng Tàu', 'Nam', 38000, '005', 5),
('Trần', 'Thanh', 'Tâm', '003', '1957-05-04', '34 Mai Thị Lự, Tp HCM', 'Nam', 25000, '005', 5),
('Trần', 'Hồng', 'Quang', '008', '1967-09-01', '80 Lê Hồng Phong, Tp HCM', 'Nam', 25000, '001', 4),
('Phạm', 'Văn', 'Vinh', '006', '1965-01-01', '45 Trưng Vương, Hà Nội', 'Nữ', 55000, '001', NULL);


INSERT INTO dean (`MADA`,`TENDA`,`DDIEM_DA`,`PHONG`) VALUES (1,'Sản phẩm X','Nha Trang',5);
INSERT INTO dean (`MADA`,`TENDA`,`DDIEM_DA`,`PHONG`) VALUES (2,'Sản phẩm Y','Tp HCM',5);
INSERT INTO dean (`MADA`,`TENDA`,`DDIEM_DA`,`PHONG`) VALUES (3,'Sản phẩm Z','Tp HCM',5);
INSERT INTO dean (`MADA`,`TENDA`,`DDIEM_DA`,`PHONG`) VALUES (10,'Tin học hoá','Hà Nội',4);
INSERT INTO dean (`MADA`,`TENDA`,`DDIEM_DA`,`PHONG`) VALUES (20,'Cáp quang','Tp HCM',1);
INSERT INTO dean (`MADA`,`TENDA`,`DDIEM_DA`,`PHONG`) VALUES (30,'Đào tạo','Hà Nội',4);

INSERT INTO THANHNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE) VALUES
('009', 'Trinh', 'Nữ', '1978-04-05', 'Con gái'),
('009', 'Khang', 'Nam', '1973-05-20', 'Con trai'),
('005', 'Phương', 'Nữ', '1948-05-03', 'Vợ chồng'),
('003', 'Phương', 'Nữ', '1948-05-03', 'Vợ chồng'),
('001', 'Châu', 'Nam', '1978-12-30', 'Con gái'),
('006', 'Hương', 'Nữ', '1957-05-05', 'Vợ chồng');

INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM) VALUES
(1, 'TP HCM'),
(4, 'Hà Nội'),
(5, 'Vũng Tàu'),
(5, 'Nha Trang'),
(5, 'TP HCM');

INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC) VALUES
(1, 1, 'Thiết kế sản phẩm X'),
(1, 2, 'Thử nghiệm sản phẩm X'),
(2, 1, 'Sản xuất sản phẩm Y'),
(2, 2, 'Quảng cáo sản phẩm Y'),
(3, 1, 'Khuyến mãi sản phẩm Z'),
(10, 1, 'Tin học hoá phòng nhân sự'),
(10, 2, 'Tin học hoá phòng kinh doanh'),
(20, 1, 'Lắp đặt cáp quang'),
(30, 1, 'Đào tạo nhân viên Marketing'),
(30, 2, 'Đào tạo chuyên viên thiết kế');



INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
VALUES
  ('009', 1, 1, 32.00),
  ('009', 2, 2, 8.00),
  ('004', 3, 1, 40.00),
  ('003', 1, 2, 20.00),
  ('003', 2, 1, 20.00),
  ('008', 10, 1, 35.00),
  ('008', 30, 2, 5.00),
  ('001', 30, 1, 20.00),
  ('001', 20, 1, 15.00),
  ('006', 20, 1, 30.00),
  ('005', 3, 1, 10.00),
  ('005', 10, 2, 10.00),
  ('005', 20, 1, 10.00),
  ('007', 30, 2, 30.00),
  ('007', 10, 2, 10.00);

