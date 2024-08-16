SET FOREIGN_KEY_CHECKS=1;
SET SQL_SAFE_UPDATES = 1;
-- 2.1 TRUY VẤN CƠ BẢN
-- 2.1.1 Truy vấn đơn giản
-- 1. Tìm các nhân viên làm việc ở phòng số 4
select * from nhanvien
where PHG =4
-- 2. Tìm các nhân viên có mức lương trên 30000
select * from nhanvien
where LUONG >30000
-- 3. Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân
-- viên có mức lương trên 30,000 ở phòng 5
select * from nhanvien
where (LUONG >25000 and PHG=4) or (LUONG >30000 and PHG=5)
-- 4. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM

SELECT CONCAT(HONV , ' ',TENLOT, ' ',TENNV) AS hoten FROM nhanvien
where DCHI LIKE '%HCM';

-- 5. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'
SELECT CONCAT(HONV , ' ',TENLOT, ' ',TENNV) AS hoten FROM nhanvien
where HONV LIKE 'N%';
-- 6. Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien
SELECT NGSINH , DCHI FROM	nhanvien
where CONCAT(HONV , ' ',TENLOT, ' ',TENNV) = 'Đinh Bá Tiên'
-- 7. Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965
SELECT CONCAT(HONV , ' ',TENLOT, ' ',TENNV) AS hoten FROM nhanvien
where year(NGSINH) between 1960 and 1965;
-- 8. Cho biết các nhân viên và năm sinh của nhân viên
SELECT CONCAT(HONV , ' ',TENLOT, ' ',TENNV) AS hoten ,NGSINH FROM nhanvien

-- 9. Cho biết các nhân viên và tuổi của nhân viên
SELECT CONCAT(HONV , ' ',TENLOT, ' ',TENNV) AS hoten ,(YEAR(CURRENT_DATE())-YEAR(NGSINH)) AS TUOI FROM nhanvien
-- 2.1.2 Truy vấn có sử dụng phép kết
-- 10. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng
SELECT p.MAPHG, d.DIADIEM from phongban p join diadiem_phg d
WHERE p.MAPHG = d.MAPHG
-- 11. Tìm tên những người trưởng phòng của từng phòng ban
SELECT p.TRPHG, d.TENNV from phongban p join nhanvien d
WHERE p.TRPHG = d.MANV
-- 12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Nghiên cứu".
SELECT  d.TENNV, D.DCHI from phongban p join nhanvien d
WHERE p.TENPHG = 'Nghiên cứu' and p.MAPHG = d.PHG
-- 13. Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và
-- ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
SELECT DA.TENDA ,P.TENPHG, CONCAT(NV.HONV , ' ',NV.TENLOT, ' ',NV.TENNV) AS hoten ,P.NG_NHANCHUC 
FROM dean DA join phongban P join nhanvien NV
WHERE DA.PHONG = P.MAPHG AND P.TRPHG = NV.MANV
-- 14. Tìm tên những nữ nhân viên và tên người thân của họ
SELECT CONCAT(NV.HONV , ' ',NV.TENLOT, ' ',NV.TENNV) AS hoten , TN.TENTN
FROM nhanvien NV join thannhan TN
where NV.PHAI='Nữ' AND NV.MANV = TN.MA_NVIEN
-- 15. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý
-- trực tiếp của nhân viên đó
SELECT CONCAT(NV.HONV , ' ',NV.TENLOT, ' ',NV.TENNV) AS hotenNV , CONCAT(QL.HONV , ' ',QL.TENLOT, ' ',QL.TENNV) AS hotenQL
FROM nhanvien NV  LEFT Join (SELECT * FROM nhanvien) as QL
ON NV.MA_NQL = QL.MANV
-- 16. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người
-- trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó.

SELECT R1.hotenNV, R1.hotenQL ,CONCAT(R2.HONV , ' ',R2.TENLOT, ' ',R2.TENNV) AS hotenTP
FROM (
SELECT CONCAT(NV.HONV , ' ',NV.TENLOT, ' ',NV.TENNV) AS hotenNV , CONCAT(QL.HONV , ' ',QL.TENLOT, ' ',QL.TENNV) AS hotenQL, NV.PHG AS PHG
FROM nhanvien NV LEFT JOIN (SELECT * FROM nhanvien) as QL 
ON NV.MA_NQL = QL.MANV )  R1 LEFT JOIN (SELECT * FROM phongban PB JOIN nhanvien TP where PB.TRPHG = TP.MANV ) R2
ON R1.PHG =R2.MAPHG


-- 17. Tên những nhân viên phòng số 5 có tham gia vào đề án "Sản phẩm X"
-- và nhân viên này do "Nguyễn Thanh Tùng" quản lý trực tiếp.
select TENNV
from nhanvien
where PHG=5 and MA_NQL in (select MANV from nhanvien where CONCAT(HONV , ' ',TENLOT, ' ',TENNV) = 'Nguyễn Thanh Tùng')
and MANV in (select MANV from phancong p,dean d where p.mada = d.mada and tenda='Sản phẩm X')
-- 18. Cho biết tên các đề án mà nhân viên Đinh Bá Tiến đã tham gia.
select tenda
from nhanvien n, dean d, phancong p where n.manv=p.ma_nvien and d.mada=p.mada
and  CONCAT(HONV , ' ',TENLOT, ' ',TENNV) = 'Đinh Bá Tiến'
-- 2.2 GOM NHÓM
-- 19. Cho biết số lượng đề án của công ty
select count(*)
from dean
-- 20. Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì
select count(*)
from dean d join phongban p
on d.phong = p.maphg
where p.tenphg = 'Nghiên cứu'
-- 21. Cho biết lương trung bình của các nữ nhân viên
select avg(luong)
from nhanvien
where phai='Nữ'
-- 22. Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'
select count(*)
from nhanvien left join thannhan
on nhanvien.manv = thannhan.ma_nvien
where CONCAT(HONV , ' ',TENLOT, ' ',TENNV) = 'Đinh Bá Tiến'
-- 23. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của
-- tất cả các nhân viên tham dự đề án đó.
select p.mada , d.tenda ,sum(thoigian)
from phancong p join dean d 
on p.mada=d.mada
group by p.mada
-- 24. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó
select  p.mada ,  count(tennv)
from phancong p join nhanvien n 
on p.ma_nvien=n.manv
group by p.mada
-- 25. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân
-- của nhân viên đó.
select CONCAT(HONV , ' ',TENLOT, ' ',TENNV) as hotennv, count(ma_nvien) as soluongthannhan
from nhanvien n left join thannhan t
on n.manv=t.ma_nvien
group by manv
-- 26. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà
-- nhân viên đó đã tham gia.
select CONCAT(HONV , ' ',TENLOT, ' ',TENNV) as hotennv, count(p.mada) as soluongdean
from nhanvien n left join phancong p
on n.manv=p.ma_nvien
group by manv
-- 27. Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản
-- lý trực tiếp.
SELECT nv1.MANV AS MaNhanVien, COUNT(nv2.MANV) AS SoLuongNhanVienQuanLy
FROM nhanvien nv1
LEFT JOIN nhanvien nv2 
ON nv1.MANV = nv2.MA_NQL
GROUP BY nv1.MANV;

-- 28. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của
-- những nhân viên làm việc cho phòng ban đó.
select maphg, tenphg, avg(luong) as tbluong
from phongban p join nhanvien n
on p.maphg = n.phg
group by maphg

-- 29. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên
-- phòng ban và số lượng nhân viên của phòng ban đó.
select maphg, tenphg, avg(luong) as tbLuong, count(manv) as slNV
from phongban p join nhanvien n
on p.maphg = n.phg
group by maphg
having tbluong> 30000 
-- 30. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà
-- phòng ban đó chủ trì
select maphg,tenphg,count(mada) as slDA
from phongban p join dean d
on p.maphg = d.phong
group by maphg
-- 31. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng
-- phòng và số lượng đề án mà phòng ban đó chủ trì
select maphg,tenphg,count(mada) as slDA, CONCAT(HONV , ' ',TENLOT, ' ',TENNV) as tenTP
from phongban p 
join dean d
on p.maphg = d.phong
join nhanvien n
on p.trphg = n.manv
group by maphg
-- 32. Với mỗi phòng ban có mức lương trung bình lớn hơn 40,000, cho biết
-- tên phòng ban và số lượng đề án mà phòng ban đó chủ trì.

select maphg,tenphg,count(mada) as slDA,avg(luong) as tbLuong
from phongban p join dean d
on p.maphg = d.phong
left join nhanvien
on p.maphg=nhanvien.phg
group by maphg 
having tbLuong >40000



-- 33. Cho biết số đề án diễn ra tại từng địa điểm
select ddiem_da, count(mada) as slDA
from dean
group by ddiem_da
-- 34. Với mỗi đề án, cho biết tên đề án và số lượng công việc của đề án
-- này.
select tenda , count(ten_cong_viec) slCV
from dean join congviec
on dean.mada = congviec.mada
group by dean.mada
-- 35. Với mỗi công việc trong đề án có mã đề án là 30, cho biết số lượng
-- nhân viên được phân công .
select tenda , count(p.ma_nvien) slNV
from phancong p join dean
on p.mada = dean.mada
where p.mada=30
group by dean.mada
-- 36. Với mỗi công việc trong đề án có mã đề án là 'Dao Tao', cho biết số
-- lượng nhân viên được phân công.
select tenda , count(p.ma_nvien) slNV
from phancong p join dean
on p.mada = dean.mada
where tenda='Đào tạo'
group by dean.mada
-- 2.3 TRUY VẤN LỒNG + GOM NHÓM
-- 37. Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là
-- 'Đinh' hoặc có người trưởng phòng chủ trì đề án với họ (HONV) là
-- 'Đinh'.
select p.mada
from phancong p join nhanvien n
on p.ma_nvien= n.manv
join phongban pb
where n.honv='Dinh' or n.manv in (select nhanvien.manv from nhanvien join phongban on nhanvien.manv = phongban.trphg where honv='Dinh')
group by p.mada

-- 38. Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân
-- nhân.
select CONCAT(HONV , ' ',TENLOT, ' ',TENNV) as hotennv 
from nhanvien n join thannhan tn
on n.manv = tn.ma_nvien
group by n.manv
having count(*)>2
-- 39. Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân
-- nhân nào.
select CONCAT(HONV , ' ',TENLOT, ' ',TENNV) as hotennv 
from nhanvien n left join thannhan tn
on n.manv = tn.ma_nvien
group by n.manv
having count(ma_nvien) =0 
-- 40. Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu
-- một thân nhân.
select CONCAT(HONV , ' ',TENLOT, ' ',TENNV) as hotennv 
from nhanvien n 
join phongban pb
on n.manv = pb.trphg
left join thannhan tn
on n.manv = tn.ma_nvien
group by n.manv
having count(ma_nvien) >=1
-- 41. Tìm họ (HONV) của những trưởng phòng chưa có gia đình.
select CONCAT(HONV , ' ',TENLOT, ' ',TENNV) as hotennv 
from nhanvien n 
join phongban pb
on n.manv = pb.trphg
left join thannhan tn
on n.manv = tn.ma_nvien
group by n.manv
having count(ma_nvien) =0
-- 42. Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên
-- mức lương trung bình của phòng "Nghiên cứu"

-- pb.tenphg ='Nghiên cứu' and
select CONCAT(HONV , ' ',TENLOT, ' ',TENNV) as hotennv 
from nhanvien n 
join phongban pb
on n.phg = pb.maphg
where  luong > (
											select avg(luong) from nhanvien n 
											join phongban pb
											on n.phg = pb.maphg
                                            where pb.tenphg ='Nghiên cứu'
                                            group by maphg
                                            )

-- 43. Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có
-- đông nhân viên nhất.
explain
analyze
select r2.pTen as tenPhong , CONCAT(tp.HONV , ' ',tp.TENLOT, ' ',tp.TENNV) as hotenTP
from (select * from nhanvien n join phongban pb on n.manv=pb.trphg) tp
join
(select pb.tenphg pTen
from phongban pb join nhanvien n
on pb.maphg = n.phg
group by maphg
having count(manv) >= all (
							select count(manv)
							from phongban pb join nhanvien n
							on pb.maphg = n.phg
							group by maphg
						)) as r2
on tp.tenphg= r2.pTen

-- 44. Cho biết danh sách các mã đề án mà nhân viên có mã là 009 chưa làm.
select mada
from nhanvien n right join phancong p
on n.manv =p.ma_nvien and n.manv=009
where phg is null and mada not in ( select mada
										from nhanvien n  join phancong p on n.manv =p.ma_nvien where n.manv=009  )
group by mada



-- 45. Cho biết danh sách các công việc (tên công việc) trong đề án 'Sản
-- phẩm X' mà nhân viên có mã là 009 chưa làm.
select *
from congviec 
where STT not in  ( select c.stt from phancong p  join congviec c 
on p.mada = c.mada and p.stt = c.stt 
where ma_nvien=009 and p.mada =1 ) 
and mada  in ( select c.mada from phancong p  join congviec c 
on p.mada = c.mada and p.stt = c.stt 
where ma_nvien=009 and p.mada =1 ) 
-- 46. Tìm họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những
-- nhân viên làm việc cho một đề án ở 'TP HCM' nhưng phòng ban mà họ
-- trực thuộc lại không tọa lạc ở thành phố 'TP HCM' .
select CONCAT(HONV , ' ',TENLOT, ' ',TENNV) as hotennv 
from nhanvien join phongban
on nhanvien.phg = phongban.maphg
join (
		select manv
        from nhanvien join phancong
        on nhanvien.manv = phancong.ma_nvien 
        join dean
        on phancong.mada = dean.mada
        where dean.DDIEM_DA ='TP HCM'
        ) as deanHCM
on nhanvien.manv= deanHCM.manv
where maphg not in (select distinct  maphg from diadiem_phg where DIADIEM = 'TP HCM' )
-- 47. Tổng quát câu 16, tìm họ tên và địa chỉ của các nhân viên làm việc cho
-- một đề án ở một thành phố nhưng phòng ban mà họ trực thuộc lại
-- không toạ lạc ở thành phố đó.

-- 2.4 PHÉP CHIA
-- 48. Danh sách những nhân viên (HONV, TENLOT, TENNV) làm việc trong
-- mọi đề án của công ty

-- 49. Danh sách những nhân viên (HONV, TENLOT, TENNV) được phân công
-- tất cả đề án do phòng số 4 chủ trì.
-- 50. Tìm những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả
-- đề án mà nhân viên 'Đinh Bá Tiến' làm việc
-- 51. Cho biết những nhân được phân công cho tất cả các công việc trong đề
-- án 'Sản phẩm X'
-- 52. Cho biết danh sách nhân viên tham gia vào tất cả các đề án ở TP HCM
-- 53. Cho biết phòng ban chủ trì tất cả các đề án ở TP HCM