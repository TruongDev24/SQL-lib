/*
	create database BookStore
	drop database BookStore

   Sunday, March 10, 202412:48:37 AM
   User: sa
   Server: TRUONGLEVAN
   Database: BookStore
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.KhuyenMai
	(
	id int NOT NULL IDENTITY (1, 1),
	ten_ct nvarchar(200) NOT NULL,
	ngay_batdau datetime2(7) NOT NULL,
	ngay_ketthuc datetime2(7) NOT NULL,
	kieu_giamgia nvarchar(50) NOT NULL,
	trang_thai nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.KhuyenMai ADD CONSTRAINT
	PK_KhuyenMai PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.KhuyenMai SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.KhachHang
	(
	id int NOT NULL IDENTITY (1, 1),
	ten_khach nvarchar(200) NOT NULL,
	sdt varchar(10) NOT NULL,
	ngay_them datetime2(7) NOT NULL,
	gioi_tinh bit NOT NULL,
	trang_thai nvarchar(50) not null
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.KhachHang ADD CONSTRAINT
	PK_KhachHang PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.KhachHang SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.TheLoai
	(
	id int NOT NULL IDENTITY (1, 1),
	ten_theloai nvarchar(100) NOT NULL,
	mo_ta nvarchar(MAX) NULL,
	trang_thai nvarchar(50) NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.TheLoai ADD CONSTRAINT
	PK_TheLoai PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TheLoai SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Sach
	(
	id int NOT NULL IDENTITY (1, 1),
	ma_sach varchar(50) not null,
	ten_sach nvarchar(200) NOT NULL,
	gia_ban decimal(10, 2) NOT NULL,
	trang_thai nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Sach ADD CONSTRAINT
	PK_Sach PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Sach SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ChiTietKhuyenMai
	(
	id int NOT NULL IDENTITY (1, 1),
	id_sach int NOT NULL,
	giatri_giam decimal(10, 2) NOT NULL,
	id_khuyenmai int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ChiTietKhuyenMai ADD CONSTRAINT
	PK_ChiTietKhuyenMai PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ChiTietKhuyenMai ADD CONSTRAINT
	FK_ChiTietKhuyenMai_KhuyenMai FOREIGN KEY
	(
	id_khuyenmai
	) REFERENCES dbo.KhuyenMai
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietKhuyenMai ADD CONSTRAINT
	FK_ChiTietKhuyenMai_Sach FOREIGN KEY
	(
	id_sach
	) REFERENCES dbo.Sach
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietKhuyenMai SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.NhanVien
	(
	id int NOT NULL IDENTITY (1, 1),
	username varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	ten_nv nvarchar(200) NOT NULL,
	hinh_anh varchar(2000) NOT NULL,
	email varchar(50) NOT NULL,
	ngay_dangki datetime2(7) NOT NULL,
	gioi_tinh bit NOT NULL,
	sdt varchar(10) NOT NULL,
	ngay_sinh date NOT NULL,
	id_vaitro int NOT NULL,
	trang_thai nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.NhanVien ADD CONSTRAINT
	PK_NhanVien PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.NhanVien SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.HoaDon
	(
	id int NOT NULL IDENTITY (1, 1),
	id_tk int NOT NULL,
	id_khach int NOT NULL,
	ngay_tao datetime2(7) NOT NULL,
	ghi_chu nvarchar(MAX) NULL,
	tong_tien decimal(10, 2) NOT NULL,
	id_khuyenmai int NULL,
	id_voucher int null,
	trang_thai nvarchar(50) NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.HoaDon ADD CONSTRAINT
	PK_HoaDon PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.HoaDon ADD CONSTRAINT
	FK_HoaDon_KhachHang FOREIGN KEY
	(
	id_khach
	) REFERENCES dbo.KhachHang
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.HoaDon ADD CONSTRAINT
	FK_HoaDon_NhanVien FOREIGN KEY
	(
	id_tk
	) REFERENCES dbo.NhanVien
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.HoaDon SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ChiTietHoaDon
	(
	id int NOT NULL IDENTITY (1, 1),
	id_hoadon int NOT NULL,
	id_sach int NOT NULL,
	so_luong int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ChiTietHoaDon ADD CONSTRAINT
	PK_ChiTietHoaDon PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ChiTietHoaDon ADD CONSTRAINT
	FK_ChiTietHoaDon_HoaDon FOREIGN KEY
	(
	id_hoadon
	) REFERENCES dbo.HoaDon
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietHoaDon ADD CONSTRAINT
	FK_ChiTietHoaDon_Sach FOREIGN KEY
	(
	id_sach
	) REFERENCES dbo.Sach
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietHoaDon SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.TacGia
	(
	id int NOT NULL IDENTITY (1, 1),
	ten_tacgia nvarchar(100) NOT NULL,
	trang_thai nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.TacGia ADD CONSTRAINT
	PK_TacGia PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TacGia SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.NhaXuatBan
	(
	id int NOT NULL,
	ten_nxb nvarchar(100) NOT NULL,
	trang_thai nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.NhaXuatBan ADD CONSTRAINT
	PK_NhaXuatBan PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.NhaXuatBan SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Voucher
	(
	id int NOT NULL IDENTITY (1, 1),
	ten_vc nvarchar(100) NOT NULL,
	ngay_batdau datetime2(7) NOT NULL,
	ngay_ketThuc datetime2(7) NOT NULL,
	tien_giam decimal(10, 2) NOT NULL,
	trang_thai nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Voucher ADD CONSTRAINT
	PK_Voucher PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Voucher SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ChucVu
	(
	id int NOT NULL IDENTITY (1, 1),
	vai_tro nvarchar(50) NOT NULL,
	trang_thai nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ChucVu ADD CONSTRAINT
	PK_ChucVu PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ChucVu SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.TheLoai SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.TacGia SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Sach SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.NhaXuatBan SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ChiTietSach
	(
	id int NOT NULL IDENTITY (1, 1),
	id_sach int NOT NULL,
	so_luong int NOT NULL,
	ngay_them datetime2(7) NOT NULL,
	id_nxb int NOT NULL,
	id_tacgia int NOT NULL,
	hinh_anh varchar(2000) NOT NULL,
	id_theloai int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ChiTietSach ADD CONSTRAINT
	PK_ChiTietSach PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ChiTietSach ADD CONSTRAINT
	FK_ChiTietSach_Sach FOREIGN KEY
	(
	id_sach
	) REFERENCES dbo.Sach
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietSach ADD CONSTRAINT
	FK_ChiTietSach_TheLoai FOREIGN KEY
	(
	id_theloai
	) REFERENCES dbo.TheLoai
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietSach ADD CONSTRAINT
	FK_ChiTietSach_NhaXuatBan FOREIGN KEY
	(
	id_nxb
	) REFERENCES dbo.NhaXuatBan
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietSach ADD CONSTRAINT
	FK_ChiTietSach_TacGia FOREIGN KEY
	(
	id_tacgia
	) REFERENCES dbo.TacGia
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChiTietSach SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.NhanVien ADD CONSTRAINT
	FK_NhanVien_ChucVu FOREIGN KEY
	(
	id_vaitro
	) REFERENCES dbo.ChucVu
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.NhanVien SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.HoaDon ADD CONSTRAINT
	FK_HoaDon_Voucher FOREIGN KEY
	(
	id_voucher
	) REFERENCES dbo.Voucher
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.HoaDon SET (LOCK_ESCALATION = TABLE)
GO
COMMIT