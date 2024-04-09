USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 3/13/2024 10:55:08 PM ******/
CREATE DATABASE [BookStore]

GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_hoadon] [int] NOT NULL,
	[id_sachct] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietKhuyenMai]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKhuyenMai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_sach] [int] NOT NULL,
	[giatri_giam] [decimal](10, 2) NOT NULL,
	[id_khuyenmai] [int] NOT NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChiTietKhuyenMai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSach]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSach](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_sach] [int] NOT NULL,
	[gia_ban] [decimal](10, 2) NOT NULL,
	[so_luong] [int] NOT NULL,
	[ngay_them] [datetime2](7) NOT NULL,
	[id_nxb] [int] NOT NULL,
	[id_tacgia] [int] NOT NULL,
	[hinh_anh] [varchar](2000) NOT NULL,
	[id_theloai] [int] NOT NULL,
	[mota] [text] NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChiTietSach] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tk] [int] NOT NULL,
	[id_khach] [int] NOT NULL,
	[ngay_tao] [datetime2](7) NOT NULL,
	[ghi_chu] [nvarchar](max) NULL,
	[tong_tien] [decimal](10, 2) NOT NULL,
	[id_khuyenmai] [int] NULL,
	[id_voucher] [int] NULL,
	[thanh_toan] [bit] not null,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_khach] [nvarchar](200) NOT NULL,
	[sdt] [varchar](10) NOT NULL,
	[ngay_them] [datetime2](7) NOT NULL,
	[gioi_tinh] [bit] NOT NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_ct] [nvarchar](200) NOT NULL,
	[ngay_batdau] [datetime2](7) NOT NULL,
	[ngay_ketthuc] [datetime2](7) NOT NULL,
	[kieu_giamgia] [nvarchar](50) NOT NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[ten_nv] [nvarchar](200) NOT NULL,
	[hinh_anh] [varchar](2000) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[cccd] [varchar](50) NOT NULL,
	[ngay_dangki] [datetime2](7) NOT NULL,
	[gioi_tinh] [bit] NOT NULL,
	[sdt] [varchar](10) NOT NULL,
	[ngay_sinh] [date] NOT NULL,
	[vai_tro] [nvarchar](50) NOT NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[id] [int] NOT NULL,
	[ten_nxb] [nvarchar](100) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[so_trang] [int] NOT NULL,
	[ten_sach] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_tacgia] [nvarchar](100) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_theloai] [nvarchar](100) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 3/13/2024 10:55:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_vc] [nvarchar](100) NOT NULL,
	[ngay_batdau] [datetime2](7) NOT NULL,
	[ngay_ketThuc] [datetime2](7) NOT NULL,
	[tien_giam] [decimal](10, 2) NOT NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_ChiTietSach] FOREIGN KEY([id_sachct])
REFERENCES [dbo].[ChiTietSach] ([id])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_ChiTietSach]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([id_hoadon])
REFERENCES [dbo].[HoaDon] ([id])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKhuyenMai_KhuyenMai] FOREIGN KEY([id_khuyenmai])
REFERENCES [dbo].[KhuyenMai] ([id])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai] CHECK CONSTRAINT [FK_ChiTietKhuyenMai_KhuyenMai]
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKhuyenMai_Sach] FOREIGN KEY([id_sach])
REFERENCES [dbo].[Sach] ([id])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai] CHECK CONSTRAINT [FK_ChiTietKhuyenMai_Sach]
GO
ALTER TABLE [dbo].[ChiTietSach]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSach_NhaXuatBan] FOREIGN KEY([id_nxb])
REFERENCES [dbo].[NhaXuatBan] ([id])
GO
ALTER TABLE [dbo].[ChiTietSach] CHECK CONSTRAINT [FK_ChiTietSach_NhaXuatBan]
GO
ALTER TABLE [dbo].[ChiTietSach]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSach_Sach] FOREIGN KEY([id_sach])
REFERENCES [dbo].[Sach] ([id])
GO
ALTER TABLE [dbo].[ChiTietSach] CHECK CONSTRAINT [FK_ChiTietSach_Sach]
GO
ALTER TABLE [dbo].[ChiTietSach]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSach_TacGia] FOREIGN KEY([id_tacgia])
REFERENCES [dbo].[TacGia] ([id])
GO
ALTER TABLE [dbo].[ChiTietSach] CHECK CONSTRAINT [FK_ChiTietSach_TacGia]
GO
ALTER TABLE [dbo].[ChiTietSach]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSach_TheLoai] FOREIGN KEY([id_theloai])
REFERENCES [dbo].[TheLoai] ([id])
GO
ALTER TABLE [dbo].[ChiTietSach] CHECK CONSTRAINT [FK_ChiTietSach_TheLoai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([id_khach])
REFERENCES [dbo].[KhachHang] ([id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([id_tk])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Voucher] FOREIGN KEY([id_voucher])
REFERENCES [dbo].[Voucher] ([id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Voucher]
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO


-- Chèn dữ liệu vào bảng Sach
INSERT INTO [dbo].[Sach] ([so_trang], [ten_sach])
VALUES (300, N'Tiếng Chim Hót Trong Bụi Mận Gai'),
       (250, N'Người Mẹ Tốt'),
       (200, N'Bố Già'),
       (350, N'Nhà Giả Kim'),
       (280, N'Cô Gái Đến Từ Hôm Qua'),
       (320, N'Đắc Nhân Tâm'),
       (180, N'Tiếng Gọi Của Hoang Dã'),
       (400, N'Harry Potter và Hòn Đá Phù Thủy'),
       (220, N'Cuộc Phiêu Lưu Của Alice'),
       (270, N'Tâm Lý Học Cơ Bản');

-- Chèn dữ liệu vào bảng TheLoai
INSERT INTO [dbo].[TheLoai] ([ten_theloai], [mo_ta], [trang_thai])
VALUES (N'Tiểu Thuyết', N'Tiểu thuyết và tiểu thuyết giả tưởng', N'Hoạt động'),
       (N'Truyện Ngắn', N'Các câu chuyện ngắn', N'Hoạt động'),
       (N'Sách Kỹ Năng Sống', N'Sách hướng dẫn kỹ năng sống', N'Hoạt động');

-- Chèn dữ liệu vào bảng TacGia
INSERT INTO [dbo].[TacGia] ([ten_tacgia], [mo_ta], [trang_thai])
VALUES (N'Harper Lee', N'', N'Hoạt động'),
       (N'Mario Puzo', N'', N'Hoạt động'),
       (N'Paulo Coelho', N'', N'Hoạt động'),
       (N'Jane Austen', N'', N'Hoạt động'),
       (N'Dale Carnegie', N'', N'Hoạt động'),
       (N'Jack London', N'', N'Hoạt động'),
       (N'J.K. Rowling', N'', N'Hoạt động'),
       (N'Lewis Carroll', N'', N'Hoạt động'),
       (N'Sigmund Freud', N'', N'Hoạt động'),
       (N'George Orwell', N'', N'Hoạt động');

-- Chèn dữ liệu vào bảng NhaXuatBan
INSERT INTO [dbo].[NhaXuatBan] ([id], [ten_nxb], [mo_ta], [trang_thai])
VALUES (1, N'Nhà Xuất Bản Trẻ', N'', N'Hoạt động'),
       (2, N'Nhà Xuất Bản Kim Đồng', N'', N'Hoạt động'),
       (3, N'Nhà Xuất Bản Thế Giới', N'', N'Hoạt động'),
       (4, N'Nhà Xuất Bản Lao Động Xã Hội', N'', N'Hoạt động'),
       (5, N'Nhà Xuất Bản Văn Học', N'', N'Hoạt động'),
       (6, N'Nhà Xuất Bản Hội Nhà Văn', N'', N'Hoạt động'),
       (7, N'Nhà Xuất Bản Tổng Hợp Thành Phố Hồ Chí Minh', N'', N'Hoạt động'),
       (8, N'Nhà Xuất Bản Phụ Nữ', N'', N'Hoạt động'),
       (9, N'Nhà Xuất Bản Đại Học Quốc Gia Hà Nội', N'', N'Hoạt động'),
       (10, N'Nhà Xuất Bản Đại Học Sư Phạm', N'', N'Hoạt động');

-- Chèn dữ liệu vào bảng KhachHang
INSERT INTO [dbo].[KhachHang] ([ten_khach], [sdt], [ngay_them], [gioi_tinh], [trang_thai])
VALUES (N'Trần Văn A', '0987654321', GETDATE(), 1, N'Hoạt động'),
       (N'Nguyễn Thị B', '0123456789', GETDATE(), 0, N'Hoạt động'),
       (N'Lê Văn C', '0909090909', GETDATE(), 1, N'Hoạt động'),
       (N'Phạm Thị D', '0111111111', GETDATE(), 0, N'Hoạt động'),
       (N'Hồ Văn E', '0222222222', GETDATE(), 1, N'Hoạt động'),
       (N'Trần Thị F', '0333333333', GETDATE(), 0, N'Hoạt động'),
       (N'Vũ Văn G', '0444444444', GETDATE(), 1, N'Hoạt động'),
       (N'Lê Thị H', '0555555555', GETDATE(), 0, N'Hoạt động'),
       (N'Nguyễn Văn I', '0666666666', GETDATE(), 1, N'Hoạt động'),
       (N'Trần Thị K', '0777777777', GETDATE(), 0, N'Hoạt động');

-- Chèn dữ liệu vào bảng NhanVien
INSERT INTO [dbo].[NhanVien] ([username], [password], [ten_nv], [hinh_anh], [email], [cccd], [ngay_dangki], [gioi_tinh], [sdt], [ngay_sinh], [vai_tro], [trang_thai])
VALUES ('admin', 'admin123', N'Admin', '', 'admin@example.com', '123456789', GETDATE(), 1, '0987654321', '1990-01-01', N'Quản trị viên', N'Hoạt động'),
       ('nhanvien1', 'nhanvien123', N'Nhân viên 1', '', 'nhanvien1@example.com', '987654321', GETDATE(), 0, '0123456789', '1995-05-05', N'Nhân viên bán hàng', N'Hoạt động'),
       ('nhanvien2', 'nhanvien123', N'Nhân viên 2', '', 'nhanvien2@example.com', '123123123', GETDATE(), 1, '0909090909', '1992-12-12', N'Nhân viên bán hàng', N'Hoạt động');

-- Chèn dữ liệu vào bảng Voucher
INSERT INTO [dbo].[Voucher] ([ten_vc], [ngay_batdau], [ngay_ketThuc], [tien_giam], [trang_thai])
VALUES (N'VOUCHER10', '2024-04-01', '2024-04-30', 10000, N'Hoạt động'),
       (N'VOUCHER20', '2024-04-01', '2024-04-30', 20000, N'Hoạt động'),
       (N'VOUCHER30', '2024-04-01', '2024-04-30', 30000, N'Hoạt động');

-- Chèn dữ liệu vào bảng KhuyenMai
INSERT INTO [dbo].[KhuyenMai] ([ten_ct], [ngay_batdau], [ngay_ketthuc], [kieu_giamgia], [trang_thai])
VALUES (N'Khuyến mãi 1', '2024-04-01', '2024-04-30', N'Tiền giảm giá', N'Hoạt động'),
       (N'Khuyến mãi 2', '2024-04-01', '2024-04-30', N'Tiền giảm giá', N'Hoạt động'),
       (N'Khuyến mãi 3', '2024-04-01', '2024-04-30', N'Tiền giảm giá', N'Hoạt động');

-- Chèn dữ liệu vào bảng HoaDon
INSERT INTO [dbo].[HoaDon] ([id_tk], [id_khach], [ngay_tao], [ghi_chu], [tong_tien], [id_khuyenmai], [id_voucher], [thanh_toan], [trang_thai])
VALUES (1, 1, '2024-04-01', N'Đơn hàng số 1', 150000, 1, NULL, 1, N'Đã thanh toán'),
       (2, 2, '2024-04-02', N'Đơn hàng số 2', 200000, NULL, 1, 1, N'Đã thanh toán'),
       (1, 3, '2024-04-03', N'Đơn hàng số 3', 300000, 2, NULL, 1, N'Chưa thanh toán');

-- Chèn dữ liệu vào bảng ChiTietSach
INSERT INTO [dbo].[ChiTietSach] ([id_sach], [gia_ban], [so_luong], [ngay_them], [id_nxb], [id_tacgia], [hinh_anh], [id_theloai], [mota], [trang_thai])
VALUES (1, 100000, 50, '2024-04-01', 1, 1, '', 1, NULL, N'Hoạt động'),
       (2, 120000, 30, '2024-04-02', 2, 2, '', 1, NULL, N'Hoạt động'),
       (3, 150000, 40, '2024-04-03', 3, 3, '', 2, NULL, N'Hoạt động'),
       (4, 90000, 60, '2024-04-04', 4, 4, '', 2, NULL, N'Hoạt động'),
       (5, 80000, 70, '2024-04-05', 5, 5, '', 1, NULL, N'Hoạt động'),
       (6, 70000, 80, '2024-04-06', 6, 6, '', 1, NULL, N'Hoạt động'),
       (7, 110000, 45, '2024-04-07', 7, 7, '', 3, NULL, N'Hoạt động'),
       (8, 130000, 55, '2024-04-08', 8, 8, '', 3, NULL, N'Hoạt động'),
       (9, 180000, 25, '2024-04-09', 9, 9, '', 1, NULL, N'Hoạt động'),
       (10, 200000, 35, '2024-04-10', 10, 10, '', 2, NULL, N'Hoạt động');

-- Chèn dữ liệu vào bảng ChiTietKhuyenMai
INSERT INTO [dbo].[ChiTietKhuyenMai] ([id_sach], [giatri_giam], [id_khuyenmai], [trang_thai])
VALUES (1, 20000, 1, N'Hoạt động'),
       (2, 30000, 1, N'Hoạt động'),
       (3, 40000, 2, N'Hoạt động'),
       (4, 25000, 2, N'Hoạt động'),
       (5, 30000, 3, N'Hoạt động'),
       (6, 35000, 3, N'Hoạt động');

-- Chèn dữ liệu vào bảng ChiTietHoaDon
INSERT INTO [dbo].[ChiTietHoaDon] ([id_hoadon], [id_sachct], [so_luong])
VALUES (1, 1, 2),
       (1, 2, 3),
       (2, 3, 1),
       (2, 4, 2),
       (3, 5, 3),
       (3, 6, 4);
