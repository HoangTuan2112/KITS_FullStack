-- cau 1
create database BAITHI
use BAITHI

CREATE TABLE NHAPT (
    MANPT VARCHAR(50) PRIMARY KEY,
    TENNPT VARCHAR(255),
    NGDK DATE,
    SOUD int
);

-- Create the NGUOIDUNG table
CREATE TABLE NGUOIDUNG (
    MAND VARCHAR(50) PRIMARY KEY,
    TENND VARCHAR(255),
    NGDKTV DATE,
    GIOITHINH VARCHAR(10),
    NGSINH DATE
);

-- Create the UNGDUNG table
CREATE TABLE UNGDUNG (
    MAUD VARCHAR(50) PRIMARY KEY,
    TENUD VARCHAR(255),
    MANPT VARCHAR(50),
    NGPH DATE,
    DLUONG DECIMAL(10, 2),
    LOAIUD VARCHAR(50),
    FOREIGN KEY (MANPT) REFERENCES NHAPT(MANPT)
);

-- Create the GHINHAN table
CREATE TABLE GHINHAN (
    MAUD VARCHAR(50),
    MAND VARCHAR(50),
    DANHGIA INT,
    DANGSD VARCHAR(50),
    PRIMARY KEY (MAUD, MAND),
    FOREIGN KEY (MAUD) REFERENCES UNGDUNG(MAUD),
    FOREIGN KEY (MAND) REFERENCES NGUOIDUNG(MAND)
);

-- cau 2
-- Insert data into NHAPT table
INSERT INTO NHAPT (MANPT, TENNPT, NGDK, SOUD) VALUES
('N001', 'Gameloft', '2006-06-20', 100),
('N002', 'Ketchapp', '2010-07-18', 20),
('N003', 'Facebook', '2006-02-27', 20);

-- Insert data into NGUOIDUNG table
INSERT INTO NGUOIDUNG (MAND, TENND, NGDKTV, GIOITHINH, NGSINH) VALUES
('ND001', 'Huynh Cong Khanh', '2009-06-17', 'Nam', '1994-05-25'),
('ND002', 'Nguyen Minh Dat', '2010-05-19', 'Nam', '1993-03-22'),
('ND003', 'Ho Quy Han', '2012-10-15', 'Nu', '1994-02-14');

-- Insert data into UNGDUNG table
INSERT INTO UNGDUNG (MAUD, TENUD, MANPT, NGPH, DLUONG, LOAIUD) VALUES
('UD001', 'Messenger', 'N001', '2007-02-01', 6.5, 'Chat'),
('UD002', 'Slack', 'N002', '2017-06-02', 42, 'Game'),
('UD003', 'Asphalt 8', 'N001', '2018-08-12', 1700, 'Game');

-- Insert data into GHINHAN table
INSERT INTO GHINHAN (MAUD, MAND, DANHGIA, DANGSD) VALUES
('UD001', 'ND001', 5, 1),
('UD002', 'ND002', 4, 1),
('UD003', 'ND003', 4, 1);

-- cau 3
-- Alter the GHINHAN table to add the CHECK constraint
ALTER TABLE GHINHAN
ADD CONSTRAINT chk_danhgia
CHECK (DANHGIA BETWEEN 1 AND 5);
-- 4. Hiện thực ràng buộc toàn vẹn sau: số lượng ứng dụng hiện có của nhà phát triên phải băng tổng số lượng ứng dụng của nhà phát triển đó trên quan hệ UNGDUNG (24).
-- 5. Tìm tất cả các ứng dụng (MAUD, TENUD) của nhà phát triển Gameloft phát hành trong năm 2018 sắp xếp theo dung lượng giảm dần (14).
select MAUD,TENUD
from ungdung join nhapt
on  ungdung.MANPT = nhapt.MANPT
where nhapt.TENNPT = 'Gameloft' and year (NGPH) =2018
-- 6. Tìm người dùng (MAND, TENND) đang không sử dụng bất kì ứng dụng game nào (các ứng dụng loại khác vẫn đang sử dụng) (14).
select distinct nd.mand,nd.tennd
from nguoidung nd join ghinhan gn
on nd.mand = gn.mand 
, ungdung ud
where gn.maud not in ()


-- 7. Tìm ứng dụng (MAUD, TENUD) phát hành năm 2017 có lược đánh giá là 1 nhiều nhất (14).

select ud.maud,ud.tenud
from ungdung ud join ghinhan gn
on ud.maud= gn.maud
where gn.danhgia =1 and year(ngph) =2017
GROUP BY UD.MAUD
HAVING COUNT(UD.MAUD) >= ALL ( 	
								SELECT count(UD.MAUD)
								from ungdung ud join ghinhan gn
								on ud.maud= gn.maud
								where gn.danhgia =1 and year(ngph) =2017
								GROUP BY UD.MAUD 
                                )



-- . Tìm người dùng (  MAND, TENND) đã đánh giả 5 cho tất cả các ứng dụng của Facebook (14).
-- ghinhan(mand,maud) dk danhgia =5  / ungdung (maud) dk loaiud= 'Facebook' = ghinhan(mand)
select mand, tennd
from nguoidung
where mand = (
				select distinct r1.mand
				from ghinhan r1
				where r1.danhgia=5 
				and	not exists (
								select *
								from ungdung s
								where s.manpt in (select manpt from nhapt where tennpt='Facebook')
								and not exists (
												select * 
												from ghinhan r2
												where r2.danhgia=5 and r2.maud=s.maud 
												and r1.mand=r2.mand 
												)
							)

                )




