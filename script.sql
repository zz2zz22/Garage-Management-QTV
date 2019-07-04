USE [master]
GO
/****** Object:  Database [QuanLyGaRa]    Script Date: 7/4/2019 5:43:54 PM ******/
CREATE DATABASE [QuanLyGaRa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyGaRa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuanLyGaRa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyGaRa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuanLyGaRa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuanLyGaRa] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyGaRa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyGaRa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyGaRa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyGaRa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyGaRa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyGaRa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyGaRa] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyGaRa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyGaRa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyGaRa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyGaRa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyGaRa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyGaRa] SET QUERY_STORE = OFF
GO
USE [QuanLyGaRa]
GO
/****** Object:  Table [dbo].[HieuXe]    Script Date: 7/4/2019 5:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HieuXe](
	[hieuxe] [nvarchar](100) NOT NULL,
	[mahieuxe] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuThuTien]    Script Date: 7/4/2019 5:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThuTien](
	[id] [int] NOT NULL,
	[ngaythutien] [date] NOT NULL,
	[sotienthu] [float] NOT NULL,
	[bienso] [nvarchar](100) NULL,
	[ht] [nvarchar](100) NOT NULL,
	[sdt] [int] NOT NULL,
	[email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuTiepNhan]    Script Date: 7/4/2019 5:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuTiepNhan](
	[matiepnhan] [int] NOT NULL,
	[ngaytiepnhan] [date] NOT NULL,
	[bienso] [nvarchar](100) NULL,
	[ht] [nvarchar](100) NOT NULL,
	[sdt] [int] NOT NULL,
	[diachi] [nvarchar](100) NOT NULL,
	[hieuxe] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[matiepnhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuTung]    Script Date: 7/4/2019 5:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuTung](
	[maphutung] [int] NOT NULL,
	[tenphutung] [nvarchar](100) NOT NULL,
	[dongia] [float] NOT NULL,
	[tondau] [int] NOT NULL,
	[toncuoi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maphutung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'Audi', 1)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'BMW', 2)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'Ferrari', 3)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'Ford', 4)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'Honda', 5)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'Hyundai', 6)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'Jeep', 7)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'Lamborghini', 8)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'Toyota', 9)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'VinFast', 10)
INSERT [dbo].[HieuXe] ([hieuxe], [mahieuxe]) VALUES (N'Mercedes-Benz', 11)
INSERT [dbo].[PhieuThuTien] ([id], [ngaythutien], [sotienthu], [bienso], [ht], [sdt], [email]) VALUES (1, CAST(N'1999-01-01' AS Date), 1200000, N'AVC123', N'Bùi A ', 123123123, N'ACB@gm.com')
INSERT [dbo].[PhieuTiepNhan] ([matiepnhan], [ngaytiepnhan], [bienso], [ht], [sdt], [diachi], [hieuxe]) VALUES (1, CAST(N'1999-01-01' AS Date), N'123KJ-M', N'Hoàng A', 123123123, N'123 Hà Nội', N'Mercedes-Benz')
INSERT [dbo].[PhieuTiepNhan] ([matiepnhan], [ngaytiepnhan], [bienso], [ht], [sdt], [diachi], [hieuxe]) VALUES (2, CAST(N'1999-02-02' AS Date), N'1234AC', N'Bùi Hoàng ', 123123123, N'12 Ngô Quyền', N'Ford')
INSERT [dbo].[PhieuTiepNhan] ([matiepnhan], [ngaytiepnhan], [bienso], [ht], [sdt], [diachi], [hieuxe]) VALUES (3, CAST(N'2001-03-03' AS Date), N'1234', N'Bùi Á Nam', 123123123, N'1234', N'Ford')
INSERT [dbo].[PhuTung] ([maphutung], [tenphutung], [dongia], [tondau], [toncuoi]) VALUES (1, N'Phuộc trước', 1200000, 1000, 1000)
INSERT [dbo].[PhuTung] ([maphutung], [tenphutung], [dongia], [tondau], [toncuoi]) VALUES (2, N'Máy phát điện', 7200000, 1000, 1000)
ALTER TABLE [dbo].[PhieuThuTien] ADD  DEFAULT (getdate()) FOR [ngaythutien]
GO
ALTER TABLE [dbo].[PhieuThuTien] ADD  DEFAULT ((0)) FOR [sotienthu]
GO
ALTER TABLE [dbo].[PhieuThuTien] ADD  DEFAULT (N'Trống') FOR [ht]
GO
ALTER TABLE [dbo].[PhieuThuTien] ADD  DEFAULT ((0)) FOR [sdt]
GO
ALTER TABLE [dbo].[PhieuThuTien] ADD  DEFAULT (N'Trống') FOR [email]
GO
ALTER TABLE [dbo].[PhieuTiepNhan] ADD  DEFAULT (getdate()) FOR [ngaytiepnhan]
GO
ALTER TABLE [dbo].[PhieuTiepNhan] ADD  DEFAULT (N'Trống') FOR [ht]
GO
ALTER TABLE [dbo].[PhieuTiepNhan] ADD  DEFAULT ((0)) FOR [sdt]
GO
ALTER TABLE [dbo].[PhieuTiepNhan] ADD  DEFAULT (N'Trống') FOR [diachi]
GO
ALTER TABLE [dbo].[PhuTung] ADD  DEFAULT (N'Trống') FOR [tenphutung]
GO
ALTER TABLE [dbo].[PhuTung] ADD  DEFAULT ((0)) FOR [dongia]
GO
ALTER TABLE [dbo].[PhuTung] ADD  DEFAULT ((0)) FOR [tondau]
GO
ALTER TABLE [dbo].[PhuTung] ADD  DEFAULT ((0)) FOR [toncuoi]
GO
USE [master]
GO
ALTER DATABASE [QuanLyGaRa] SET  READ_WRITE 
GO
