-- P1. Xuất ra toàn bộ danh sách giáo viên.
-- P2. Tính số lượng đề tài mà một giáo viênđang thực hiện. 
drop procedure if exists  sp_TinhLuongGiaoVienDeTai;
delimiter //
create procedure sp_TinhLuongGiaoVienDeTai(
)
begin
	select MAGV, (select count(distinct MADT)) as SoLuongDeTai
    from thamgiadt
    GROUP BY MAGV;
end //
-- P3. In thông tin chi tiết của một giáo viên(sử dụng lệnh print):
-- Thông tin cá nhân, Số lượng đề tài tham gia, Số lượng thân nhân của giáo viên đó.
-- P4. Kiểm tra xem một giáo viên có tồn tại hay không (dựa vào HOTEN, NGSINH, DIACHI).
-- P5. Kiểm tra quy định của một giáo viên:
-- Chỉ được thực hiện các đề tài mà bộ môn của giáo viên đó làm chủ nhiệm.
-- P6. Thực hiện thêm một phân công cho giáo viên thực hiện một công việc của đề tài:

delimiter //
create procedure tinhsl_detai(out sldt int, in magv varchar(3))
begin
set sldt = ( select count(distinct MADT) from thamgiadt where thamgiadt.MAGV = magv);
end;
// delimiter;
delimiter //
create DEFINER=`root`@`localhost` procedure ktra_gv_tontai(inout existgv boolean, in magv varchar(3))
begin
set existgv = exists( select thamgiadt.MAGV from thamgiadt where thamgiadt.MAGV = magv);
end;
// delimiter
delimiter //
create DEFINER=`root`@`localhost` procedure ktra_cv_tontai(inout existcv boolean, in madt varchar(3))
begin
set existcv = exists( select tdt.MADT FROM thamgiadt tdt
join congviec cv on cv.MADT = tdt.MADT);
end;
// delimiter
delimiter //
create DEFINER=`root`@`localhost` procedure ktra__thoigian(inout checktime boolean, in madt varchar(3), in sttcv int)
begin
set @dayend = ( select cv.NGAYKT from congviec cv where cv.MADT = madt and cv.SOTT = sttcv );
set @timecv = datediff(now(), @dayend);
if(@timecv < 0) then
	set checktime = true;
else
	set checktime = false;
end if;
end;
// delimiter
delimiter //
create DEFINER=`root`@`localhost` procedure ktra_cungbomon(inout checkbm boolean, in magv varchar(3))
begin
set @mabm = ( select gv.MABM from giaovien gv where gv.MAGV = magv );
set checkbm = exists(select bangcn.TenBM from (select distinct gv.MAGV as MACN,gv.MABM as TenBM from giaovien gv join detai dt on dt.GVCNDT = gv.MAGV) as bangcn
where bangcn.MACN <> magv and bangcn.TenBM = @mabm);
end;
// delimiter
delimiter //
create DEFINER=`root`@`localhost` procedure phan_cong(in magv varchar(3), in madt varchar(3), in sttcv int, out pMessage varchar(50))
begin
declare flag boolean default true;
set @check1 = false;
call c0323h1_quanlidetai.ktra_cv_tontai(@check1,madt);
set @check2 = false;
call c0323h1_quanlidetai.ktra_gv_tontai(@check2,magv);
set @check3 = false;
call c0323h1_quanlidetai.ktra__thoigian(@check3,madt,sttcv);
set @check4 = false;
call c0323h1_quanlidetai.ktra_cungbomon(@check4,magv);
set flag =  @check1 and @check2 and @check3 and @check4;
if ( flag = TRUE ) then
	insert into thamgiadt(MAGV,MADT,STT) values (magv,madt,sttcv);	
end if;
end;
-- 	o Kiểm tra thông tin đầu vào hợp lệ: giáo viên phải tồn tại,
-- công việc phải tồn tại, thời gian tham gia phải >0
-- 	o Giáo viên chỉ tham gia đề tài cùng bộ môn với giáo viên làm chủ nhiệm đề tài đó..
-- P7. Thực hiện xoá một giáo viên theo mã. Nếu giáo viên có thông tin
-- liên quan (Có thân nhân, có làm đề tài, …) thì báo lỗi.
-- P8. In ra danh sách giáo viên của một phòng ban nào đó cùng với số lượng
-- đề tài mà giáo viên tham gia, số thân nhân,
-- số giáo viên mà giáo viên đó quản lý nếu có, …
-- P9. Kiểm tra quy định của 2 giáo viên a, b: Nếu a là trưởng bộ môn của b
-- thì lương của a phải cao hơn lương của b. (a, b: mã giáo viên)
-- P10. Khi thêm một giáo viên cần kiểm tra các quy định:
-- Không trùng tên, tuổi > 18, lương > 0
-- P11. Mã giáo viên được phát sinh tự động theo quy tắc:
-- Nếu đã có giáo viên 001, 002, 003 thì MAGV của giáo viên mới sẽ là 004.
-- Nếu đã có giáo viên 001, 002, 005 thì MAGV của giáo viên mới là 003.