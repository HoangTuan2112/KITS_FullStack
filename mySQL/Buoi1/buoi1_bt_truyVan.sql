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

SELECT * FROM hoadon
where  not exists ( 
					select * from sanpham
					where NUOCSX='Singapore'
					and not exists (
									select * from cthd
									where cthd.MASP = sanpham.MASP AND cthd.SOHD = hoadon.SOHD
								)
				)



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
select MASP, TENSP from sanpham sp JOIN (
					SELECT DISTINCT GIA FROM sanpham
                     ORDER BY GIA DESC
                    LIMIT 3
                ) tmp
WHERE sp.GIA = tmp.GIA


-- 29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức
-- giá cao nhất (của tất cả các sản phẩm).
select MASP, TENSP from sanpham sp JOIN (
					SELECT DISTINCT GIA FROM sanpham
                     ORDER BY GIA DESC
                    LIMIT 3
                ) tmp
WHERE sp.GIA = tmp.GIA and NUOCSX= 'Thai Lan'
-- 30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức
-- giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
select MASP, TENSP from sanpham sp JOIN (
					SELECT DISTINCT GIA FROM sanpham
                    where NUOCSX= 'Trung Quoc'
                     ORDER BY GIA DESC
                    LIMIT 3
                ) tmp
WHERE sp.GIA = tmp.GIA and NUOCSX= 'Trung Quoc'
-- 31. * In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
select MAKH, HOTEN , DOANHSO ,RANK() OVER(ORDER BY DOANHSO DESC) AS ranking from khachhang
limit 3
-- 32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select count(*) from sanpham 
where NUOCSX='Trung Quoc'
-- 33. Tính tổng số sản phẩm của từng nước sản xuất.
select SP.NUOCSX ,count(*) as SoSanPham  from sanpham SP  join (select NUOCSX FROM sanpham group by NUOCSX) TMP
where SP.NUOCSX =TMP.NUOCSX
group by SP.NUOCSX
-- 34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select SP.NUOCSX ,count(*),max(gia),min(gia), avg(gia)  from sanpham SP  join (select NUOCSX FROM sanpham group by NUOCSX) TMP
where SP.NUOCSX =TMP.NUOCSX
group by SP.NUOCSX
-- 35. Tính doanh thu bán hàng mỗi ngày.
select TRIGIA, hoadon.NGHD FROM hoadon join (select NGHD FROM hoadon group by NGHD) TMP
where  hoadon.NGHD =TMP.NGHD
ORDER BY NGHD ASC
-- 36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.

SELECT MASP,SUM(SL) FROM cthd
WHERE SOHD IN (SELECT SOHD FROM hoadon
				where MONTH(NGHD)=10 AND YEAR(NGHD)=2006)
group by MASP


-- 37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) ,SUM(TRIGIA) AS DOANHTHU FROM hoadon
where year(NGHD)=2006
GROUP BY MONTH(NGHD)
-- 38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select SOHD,count(MASP) from cthd
GROUP BY SOHD
HAVING COUNT(MASP)>=4
-- 39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
select cthd.SOHD,count(cthd.MASP) from cthd JOIN sanpham
where cthd.MASP = sanpham.MASP AND sanpham.NUOCSX='Viet Nam'
GROUP BY cthd.SOHD
HAVING COUNT(cthd.MASP)=3
-- 40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
select MAKH,HOTEN from khachhang
where MAKH IN (
				SELECT MAKH FROM hoadon
				group by MAKH
                HAVING COUNT(SOHD) >= ALL (
											SELECT COUNT(SOHD) FROM hoadon
											group by MAKH
                                            ))
-- 41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT month(NGHD) as thang,SUM(TRIGIA) as doanhsocaonhat FROM hoadon
where year(NGHD)=2006
GROUP BY month(NGHD)
HAVING SUM(TRIGIA)>= ALL (
							SELECT SUM(TRIGIA) FROM hoadon 
							where year(NGHD)=2006
							GROUP BY month(NGHD) )
-- 42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select MASP,TENSP from sanpham
where MASP IN  (
				SELECT MASP FROM cthd
				group by MASP
                HAVING SUM(SL) <= ALL (
										SELECT SUM(SL) FROM cthd
										group by MASP
										))
-- 43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT S.NUOCSX,S.MASP,S.TENSP FROM sanpham S JOIN (SELECT NUOCSX,MAX(GIA) AS MAX_GIA FROM sanpham group by NUOCSX) TMP
WHERE S.NUOCSX = TMP.NUOCSX AND S.GIA = TMP.MAX_GIA


-- 44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
select SP.NUOCSX ,count(gia)  from sanpham SP  join (select NUOCSX FROM sanpham group by NUOCSX) TMP
where SP.NUOCSX =TMP.NUOCSX
group by SP.NUOCSX
having count(gia) >=3
-- 45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.

					SELECT hoadon.MAKH, KH.HOTEN FROM hoadon JOIN (
													select * from khachhang
													order by DOANHSO desc
													LIMIT 10) KH
                    where hoadon.MAKH = KH.MAKH
                    group by MAKH
                    HAVING COUNT(SOHD) >= ALL (
												SELECT COUNT(SOHD) FROM hoadon JOIN (
													select * from khachhang
													order by DOANHSO desc
													LIMIT 10) KH
                                                     where hoadon.MAKH = KH.MAKH
                                                group by hoadon.MAKH
											)
		
					

