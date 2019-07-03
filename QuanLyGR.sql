﻿create database QuanLyGaRa
go

use QuanLyGaRa
go

create table Xe
(
	Maxe int primary key,
	BienSo nvarchar (100) not null default N'Trống',
	TenHieuXe nvarchar(100) not null default N'Trống',
)
go

create table PhuTung
(
	MaPhuTung int primary key,
	TenPhuTung nvarchar(100) not null default N'Trống',
	DonGia float not null default 0,
	TonKho int not null default 0,	
)
go

create table ChuXe
(	
	MaChuXe int primary key,
	SoDienThoai int not null default 0,
	TenChuXe nvarchar(100) not null default N'Trống',
	DiaChi nvarchar(1000) not null default N'Trống',
	Email nvarchar(100) not null default N'Trống',
)
go

create table PhieuThuTien
(
	id int primary key,
	ngaythutien date not null default getdate(),
	sotienthu float not null default 0,
    bienso nvarchar (100),
    ht nvarchar(100) not null default N'Trống',
    sdt int not null default 0,
    email nvarchar(100) not null default N'Trống',


	
)
go

create table PhieuTiepNhan
(
	matiepnhan int primary key,
	ngaytiepnhan date not null default getdate(),
	bienso nvarchar (100),
    ht nvarchar(100) not null default N'Trống',
    sdt int not null default 0,
	diachi nvarchar(100) not null default N'Trống',
	hieuxe nvarchar (100),
)
go

create table PhieuSuaChua
(
	MaPhieuSuaChua int primary key,
	MaXe int not null,
	BienSo nvarchar(100),
	NgayLapPhieu date not null default getdate(),
	NoiDungSuaChua nvarchar (1000) not null default N'Trống',
	MaPhuTung int not null,
	SoLuongPhuTung int not null default 0,
	TienCong float not null default 0,

	foreign key (MaXe) references dbo.Xe(MaXe),
	foreign key(MaPhuTung) references dbo.PhuTung(MaPhuTung),
)
go

create table BaoCaoTon
(
	MaBaoCaoTon int primary key,
	NgayBaoCao date not null default getdate(),
	MaPhuTung int not null,
	MaPhieuSuaChua int not null,
	TonDau float not null default 0,
	TonCuoi float not null default 0,
	PhatSinh float not null default 0,

	foreign key(MaPhuTung) references dbo.PhuTung(MaPhuTung),
	foreign key(MaPhieuSuaChua) references dbo.PhieuSuaChua(MaPhieuSuaChua),
)
go

create table BaoCaoDoanhSo
(
	MaBaoCaoDoanhSo int primary key,
	NgayBaoCao date not null default getdate(),
	SoLuotSuaChua int not null default 0,
	TongDoanhThu float not null default 0,
	MaPhieuSuaChua int not null,

	foreign key(MaPhieuSuaChua) references dbo.PhieuSuaChua(MaPhieuSuaChua),
)
go

create table NguoiDung
(
	TenDangNhap nvarchar(100) primary key,
	TenHienThi nvarchar(100) not null default N'User',	
	PassWord nvarchar(1000) not null default 0,
	Type int not null default 0 --1: admin	&& 0: staff
)
go

insert into dbo.NguoiDung values ('admin','GaraQTV','1',1)