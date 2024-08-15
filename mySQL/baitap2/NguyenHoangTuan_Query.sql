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
FROM nhanvien NV join (SELECT * FROM nhanvien) as QL
where NV.MA_NQL = QL.MANV
-- 16. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người
-- trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó.
SELECT CONCAT(NV.HONV , ' ',NV.TENLOT, ' ',NV.TENNV) AS hotenNV , CONCAT(QL.HONV , ' ',QL.TENLOT, ' ',QL.TENNV) AS hotenQL
FROM nhanvien NV join (SELECT * FROM nhanvien) as QL 
where NV.MA_NQL = QL.MANV 


-- 17. Tên những nhân viên phòng số 5 có tham gia vào đề án "Sản phẩm X"
-- và nhân viên này do "Nguyễn Thanh Tùng" quản lý trực tiếp.
-- 18. Cho biết tên các đề án mà nhân viên Đinh Bá Tiến đã tham gia.

-- 2.2 GOM NHÓM
-- 19. Cho biết số lượng đề án của công ty
-- 20. Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì
-- 21. Cho biết lương trung bình của các nữ nhân viên
-- 22. Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'
-- 23. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của
-- tất cả các nhân viên tham dự đề án đó.
-- 24. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó
-- 25. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân
-- của nhân viên đó.
-- 26. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà
-- nhân viên đó đã tham gia.
-- 27. Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản
-- lý trực tiếp.
-- 28. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của
-- những nhân viên làm việc cho phòng ban đó.
-- 29. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên
-- phòng ban và số lượng nhân viên của phòng ban đó.
-- 30. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà
-- phòng ban đó chủ trì
-- 31. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng
-- phòng và số lượng đề án mà phòng ban đó chủ trì
-- 32. Với mỗi phòng ban có mức lương trung bình lớn hơn 40,000, cho biết
-- tên phòng ban và số lượng đề án mà phòng ban đó chủ trì.
-- 33. Cho biết số đề án diễn ra tại từng địa điểm
-- 34. Với mỗi đề án, cho biết tên đề án và số lượng công việc của đề án
-- này.

-- 35. Với mỗi công việc trong đề án có mã đề án là 30, cho biết số lượng
-- nhân viên được phân công .
-- 36. Với mỗi công việc trong đề án có mã đề án là 'Dao Tao', cho biết số
-- lượng nhân viên được phân công.
-- 2.3 TRUY VẤN LỒNG + GOM NHÓM
-- 37. Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là
-- 'Đinh' hoặc có người trưởng phòng chủ trì đề án với họ (HONV) là
-- 'Đinh'.
-- 38. Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân
-- nhân.
-- 39. Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân
-- nhân nào.
-- 40. Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu
-- một thân nhân.
-- 41. Tìm họ (HONV) của những trưởng phòng chưa có gia đình.
-- 42. Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên
-- mức lương trung bình của phòng "Nghiên cứu"
-- 43. Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có
-- đông nhân viên nhất.
-- 44. Cho biết danh sách các mã đề án mà nhân viên có mã là 009 chưa làm.
-- 45. Cho biết danh sách các công việc (tên công việc) trong đề án 'Sản
-- phẩm X' mà nhân viên có mã là 009 chưa làm.
-- 46. Tìm họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những
-- nhân viên làm việc cho một đề án ở 'TP HCM' nhưng phòng ban mà họ
-- trực thuộc lại không tọa lạc ở thành phố 'TP HCM' .

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