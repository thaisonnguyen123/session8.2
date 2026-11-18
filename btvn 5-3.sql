create database luyen_thi;

use luyen_thi;

create table khachhang (
	khachhang_id varchar(10) primary key,
	ho_ten varchar(100),
	email varchar(100),
    so_dt varchar(15),
    dia_chi varchar(200)
);

create table sanpham (
	sanpham_id varchar(10) primary key,
	ten_san_pham varchar(150),
	gia_ban decimal(12,2),
    trang_thai varchar(50),
    so_luong_ton int
);

create table donhang (
	donhang_id int primary key auto_increment,
	khachhang_id varchar(10),
	sanpham_id varchar(10),
	so_luong int ,
	ngay_dat date,
	ngay_giao date,
    tong_tien decimal(12,2),
    foreign key (khachhang_id) references khachhang (khachhang_id),
    foreign key (sanpham_id) references sanpham (sanpham_id)
);

create table thanhtoan (
	thanhtoan_id int primary key,
	donhang_id int,
	phuong_thuc_tt varchar(50),
	ngay_tt date,
	so_tien_tt decimal(12,2),
	foreign key (donhang_id) references donhang (donhang_id)
);

insert into khachhang (khachhang_id,ho_ten,email,so_dt,dia_chi)
values
	("KH001","NGUYEN VAN AN", "an.nguyen@example.com","0911111111","Hanoi,vietnam"),
    ("KH002","TRAN THU HA", "ha.tran@example.com","0922222222","HCM,vietnam"),
    ("KH003","LE MINH KHOA", "khoa.le@example.com","09133333333","danang,vietnam"),
    ("KH004","PHAM QUOC BAO", "bao.pham@example.com","0944444444","Hue,vietnam"),
    ("KH005","HOANG MINH CHAU", "chau.hoang@example.com","0955555555","Haiphong,vietnam"),
    ("KH006","DO THI LAN", "lan.do@example.com","0966666666","Hanoi,vietnam"),
    ("KH007","BUI DUC LONG", "long.bui@example.com","0977777777","cantho,vietnam"),
    ("KH008","VO THANH DAT", "dat.vo@example.com","0988888888","nhatrang,vietnam");

insert into sanpham (sanpham_id,ten_san_pham,gia_ban,trang_thai,so_luong_ton)
values
	("SP001","cà phê hạt Arabica 250g","180","đang bán","100"),
	("SP002","Trà ô long hộp thiếc","120","đang bán","80"),
	("SP003","bánh quy bơ kobani","90","ngừng bán","0"),
	("SP004","bình giữ nhiệt inox","350","đang bán","40"),
	("SP005","cốc sứ kobani","150","đang bán","60"),
	("SP006","máy pha cà phê mini","800","đang bán","15"),
	("SP007","túi vải canvas","120","đang bán","70"),
	("SP008","sỏ tay bìa da","200","ngừng bán","5");

INSERT INTO DonHang (khachhang_id, sanpham_id, so_luong, ngay_dat, ngay_giao, tong_tien)
VALUES
	("KH001","SP001","2","20260109","20260309","360"),
    ("KH002","SP002","1","20260209","20260309","120"),
	("KH003","SP003","3","20260309","20260509","270"),
	("KH004","SP004","1","20260409","20260609","350"),
	("KH005","SP005","2","20260509","20260709","300"),
	("KH006","SP006","1","20260609","20260809","800"),
	("KH007","SP007","2","20260709","20261009","240"),
	("KH008","SP008","1","20260809","20261109","200"),
	("KH001","SP004","2","20261009","20261209","700"),
	("KH006","SP005","1","20261209","20270109","150");
    
insert into thanhtoan (thanhtoan_id,donhang_id ,phuong_thuc_tt,ngay_tt,so_tien_tt)
values
	("1","1","credit card","20260109","360"),
    ("2","2","cash","20260209","120"),
    ("3","3","bank transfer","20260109","270"),
    ("4","4","e-wallet","20260309","350"),
    ("5","5","credit card","20260409","300"),
    ("6","6","bank transfer","20260509","800"),
    ("7","7","cash","20260609","240"),
    ("8","8","e-wallet","20260709","200"),
    ("9","9","bank transfer","20260809","700"),
    ("10","10","cash","20260909","150");

delete from thanhtoan
where phuong_thuc_tt = "cash"
and so_tien_tt < 150.0;

select
	khachhang_id,
	ho_ten,
	email,
	so_dt,
	dia_chi
from khachhang
order by ho_ten asc;

select
	sanpham_id,
	ten_san_pham,
	gia_ban,
	so_luong_ton
from sanpham
order by gia_ban desc;

select
	khachhang
	sanpham_id,
	ngay_dat,
	ngay_giao
from DonHang
join khachhang on donhang.khachhang = khachhang.khachhang_id;


