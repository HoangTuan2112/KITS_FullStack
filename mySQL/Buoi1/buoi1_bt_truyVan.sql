use quan_ly_ban_hang
-- 1 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
select MASP,TENSP from sanpham
where NUOCSX = "Trung Quoc";

-- 2 In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
select MASP,TENSP from sanpham
where DVT in ('cay','quyen');

-- 3 In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
select MASP,TENSP from sanpham
where MASP like 'B%01';  -- % many _ one

-- 4 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000. 
select MASP,TENSP from sanpham
where NUOCSX = "Trung Quoc" and GIA between 30000 and 40000

-- 5 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000. 
select MASP,TENSP from sanpham
where NUOCSX in ('Thai Lan','Trung Quoc') and GIA between 30000 and 40000

-- 6 In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
select * from hoadon
where NGHD between '07/1/1' and '07/1/2'

-- 7 In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select SOHD,TRIGIA from hoadon
where NGHD between '07/1/1' and '07/1/31'
order by NGHD ASC ,TRIGIA DESC

-- 8 In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select khachhang.MAKH, khachhang.HOTEN from  khachhang INNER JOIN hoadon
where hoadon.NGHD between '07/1/1' and '07/1/31'
order by hoadon.NGHD DESC

-- 9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày
-- 28/10/2006.
select hoadon.SOHD, hoadon.TRIGIA from  hoadon  INNER JOIN nhanvien
where hoadon.NGHD = '06/10/28' and  nhanvien.HOTEN ='Nguyen Van B'

-- 10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong
-- tháng 10/2006.
select * from  khachhang   JOIN hoadon  join cthd  JOIN sanpham 
where  khachhang.MAKH = hoadon.MAKH and hoadon.SOHD = cthd.SOHD and cthd.MASP = sanpham.MASP AND  khachhang.HOTEN = 'Nguyen Van A' and hoadon.NGHD between '06/10/01' and '06/10/31' 



-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
select hoadon.SOHD from hoadon join cthd join sanpham
where sanpham.MASP in ( 'BB01','BB02' ) and hoadon.SOHD = cthd.SOHD and  cthd.MASP = sanpham.MASP


-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số
-- lượng từ 10 đến 20.
select hoadon.SOHD   from hoadon join cthd join sanpham
where sanpham.MASP in ( 'BB01','BB02' ) and hoadon.SOHD = cthd.SOHD and  cthd.MASP = sanpham.MASP and cthd.SL between 10 and 20


-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với
-- số lượng từ 10 đến 20.
-- UNION / INTERSECT
select  hoadon.SOHD  from hoadon join cthd join sanpham
where sanpham.MASP in ( 'BB01' ) and hoadon.SOHD = cthd.SOHD and  cthd.MASP = sanpham.MASP and cthd.SL between 10 and 20
INTERSECT
select  hoadon.SOHD  from hoadon join cthd join sanpham
where sanpham.MASP in ( 'BB02' ) and hoadon.SOHD = cthd.SOHD and  cthd.MASP = sanpham.MASP and cthd.SL between 10 and 20

-- 14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được
-- bán ra trong ngày 1/1/2007.
select sanpham.MASP,sanpham.TENSP,NUOCSX,NGHD from sanpham JOIN cthd JOIN hoadon
where (sanpham.MASP = cthd.MASP AND cthd.SOHD =hoadon.SOHD) AND
(NUOCSX = "Trung Quoc" OR NGHD = '07/1/1')



-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
select MASP, TENSP FROM sanpham
where MASP  NOT in  (select MASP FROM cthd )
-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
select MASP , TENSP FROM sanpham
where MASP  NOT in  (
						select MASP FROM cthd
						where SOHD In (
										SELECT SOHD FROM hoadon
                                        where YEAR(NGHD)=2006
									)
					)
-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong
-- năm 2006.
select MASP , TENSP FROM sanpham
where MASP  NOT in  (
						select MASP FROM cthd
						where SOHD In (
										SELECT SOHD FROM hoadon
                                        where YEAR(NGHD)=2006
									)
					)
			AND NUOCSX='Trung Quoc'
-- 18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.

-- 19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.

-- 20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*) AS SOLUONGKHONGPHAIKHACHHANG FROM hoadon
where MAKH IS NULL
-- 21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
select count(*) as SoLuongSanPham  from sanpham
where MASP in (
				select MASP FROM cthd
                where SOHD IN(
								SELECT SOHD FROM hoadon
                                where YEAR(NGHD)=2006
                                )
			)

                
-- 22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?

select max(TRIGIA) AS MAX , MIN(TRIGIA) AS MIN FROM hoadon

-- 23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?

SELECT avg(TRIGIA) AS AVG FROM hoadon
where YEAR(NGHD)=2006

-- 24. Tính doanh thu bán hàng trong năm 2006.

SELECT SUM(TRIGIA) AS SUM FROM hoadon
where YEAR(NGHD)=2006

-- 25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT MAX(TRIGIA) AS SUM FROM hoadon
where YEAR(NGHD)=2006
-- 26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HOTEN FROM khachhang
where MAKH IN (
SELECT MAKH  FROM hoadon
where YEAR(NGHD)=2006 
ORDER BY TRIGIA DESC
) 
LIMIT 1


-- 27. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT HOTEN FROM khachhang
where MAKH IN (
SELECT MAKH  FROM hoadon
where YEAR(NGHD)=2006 
ORDER BY TRIGIA DESC
) 
LIMIT 3
-- 28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
-- 29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức
-- giá cao nhất (của tất cả các sản phẩm).
-- 30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức
-- giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
-- 31. * In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
-- 32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
-- 33. Tính tổng số sản phẩm của từng nước sản xuất.
-- 34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
-- 35. Tính doanh thu bán hàng mỗi ngày.
-- 36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
-- 37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
-- 38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
-- 39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
-- 40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
-- 41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
-- 42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
-- 43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
-- 44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
-- 45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
