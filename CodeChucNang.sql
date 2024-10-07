CREATE DATABASE QuanLiNhaHang1;
USE QuanLiNhaHang1;
-- Tạo bảng Khach_Hang
CREATE TABLE Khach_Hang (
    SDT VARCHAR(10) PRIMARY KEY, -- Khóa chính là số điện thoại khách hàng
    Ho_Ten NVARCHAR(100) NOT NULL -- Tên khách hàng
);

-- Tạo bảng Nhan_Vien
CREATE TABLE Nhan_Vien (
    Id_NhanVien INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính tự tăng
    Ho_Ten NVARCHAR(100) NOT NULL, -- Tên nhân viên
    Chuc_Vu NVARCHAR(50), -- Chức vụ của nhân viên
    SDT VARCHAR(10), -- Số điện thoại của nhân viên
	MatKhau CHAR(100)--Mật Khẩu Nhân viên
);

-- Tạo bảng Ban
CREATE TABLE Ban (
    Id_Ban INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính tự tăng
    So_Cho_Ngoi INT, -- Số chỗ ngồi
    Trang_Thai NVARCHAR(50) -- Trạng thái của bàn (VD: trống, đã đặt)
);

-- Tạo bảng DanhMuc
CREATE TABLE DanhMuc (
    Id_DanhMuc INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính tự tăng
    Ten NVARCHAR(100) NOT NULL, -- Tên danh mục
    MoTa NVARCHAR(255) -- Mô tả danh mục
);

-- Tạo bảng MonAn
CREATE TABLE MonAn (
    Id_MonAn INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính tự tăng
    Id_DanhMuc INT, -- Khóa ngoại tham chiếu đến bảng DanhMuc
    Ten NVARCHAR(100) NOT NULL, -- Tên món ăn
    MoTa NVARCHAR(255), -- Mô tả món ăn
    Gia DECIMAL(18,2) NOT NULL, -- Giá món ăn
    CONSTRAINT FK_MonAn_DanhMuc FOREIGN KEY (Id_DanhMuc) REFERENCES DanhMuc(Id_DanhMuc) -- Khóa ngoại
);

-- Tạo bảng Don_Hang
CREATE TABLE Don_Hang (
    Id_DonHang INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính tự tăng
    SDT_KhachHang VARCHAR(10), -- Khóa ngoại tham chiếu đến bảng Khach_Hang
    Id_NhanVien INT, -- Khóa ngoại tham chiếu đến bảng Nhan_Vien
    PhuongThucThanhToan NVARCHAR(50), -- Phương thức thanh toán
    Id_Ban INT, -- Khóa ngoại tham chiếu đến bảng Ban
    NgayGio DATETIME NOT NULL, -- Ngày giờ đặt hàng
    TongTien DECIMAL(18,2), -- Tổng tiền đơn hàng
    TrangThai NVARCHAR(50), -- Trạng thái đơn hàng
    CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY (SDT_KhachHang) REFERENCES Khach_Hang(SDT), -- Khóa ngoại đến bảng Khach_Hang
    CONSTRAINT FK_DonHang_NhanVien FOREIGN KEY (Id_NhanVien) REFERENCES Nhan_Vien(Id_NhanVien), -- Khóa ngoại đến bảng Nhan_Vien
    CONSTRAINT FK_DonHang_Ban FOREIGN KEY (Id_Ban) REFERENCES Ban(Id_Ban) -- Khóa ngoại đến bảng Ban
);

-- Tạo bảng ChiTietDonHang
CREATE TABLE ChiTietDonHang (
    Id_ChiTietDonHang INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính tự tăng
    Id_DonHang INT, -- Khóa ngoại tham chiếu đến bảng Don_Hang
    Id_MonAn INT, -- Khóa ngoại tham chiếu đến bảng MonAn
    SoLuong INT NOT NULL, -- Số lượng món ăn
    ThanhTien DECIMAL(18,2) NOT NULL, -- Thành tiền cho món ăn
    CONSTRAINT FK_ChiTietDonHang_DonHang FOREIGN KEY (Id_DonHang) REFERENCES Don_Hang(Id_DonHang), -- Khóa ngoại đến bảng Don_Hang
    CONSTRAINT FK_ChiTietDonHang_MonAn FOREIGN KEY (Id_MonAn) REFERENCES MonAn(Id_MonAn) -- Khóa ngoại đến bảng MonAn
);


--Data khách hàng
INSERT INTO Khach_Hang (SDT, Ho_Ten) VALUES
('0123456789', 'Nguyễn Văn A'),
('0123456790', 'Trần Thị B'),
('0123456791', 'Lê Văn C'),
('0123456792', 'Phạm Thị D'),
('0123456793', 'Nguyễn Thị E'),
('0123456794', 'Trương Văn F'),
('0123456795', 'Đặng Thị G'),
('0123456796', 'Bùi Văn H'),
('0123456797', 'Hoàng Thị I'),
('0123456798', 'Ngô Văn J'),
('0123456799', 'Nguyễn Văn K'),
('0123456800', 'Lê Thị L'),
('0123456801', 'Trần Văn M'),
('0123456802', 'Phạm Văn N'),
('0123456803', 'Đỗ Thị O');
--Data nhân viên
INSERT INTO Nhan_Vien (Ho_Ten, Chuc_Vu, SDT, MatKhau) VALUES
('Nguyễn Văn P', 'Quản lý', '0987654321', 'password1'),
('Trần Thị Q', 'Phục vụ', '0987654322', 'password2'),
('Lê Văn R', 'Bếp trưởng', '0987654323', 'password3'),
('Phạm Thị S', 'Kế toán', '0987654324', 'password4'),
('Nguyễn Thị T', 'Thu ngân', '0987654325', 'password5'),
('Trương Văn U', 'Bảo vệ', '0987654326', 'password6'),
('Đặng Thị V', 'Phục vụ', '0987654327', 'password7'),
('Bùi Văn W', 'Quản lý', '0987654328', 'password8'),
('Hoàng Thị X', 'Bếp phụ', '0987654329', 'password9'),
('Ngô Văn Y', 'Kế toán', '0987654300', 'password10'),
('Nguyễn Văn Z', 'Thu ngân', '0987654301', 'password11'),
('Lê Thị AA', 'Phục vụ', '0987654302', 'password12'),
('Trần Văn BB', 'Bếp trưởng', '0987654303', 'password13'),
('Phạm Văn CC', 'Quản lý', '0987654304', 'password14'),
('Đỗ Thị DD', 'Bảo vệ', '0987654305', 'password15');
--Data bàn
INSERT INTO Ban (So_Cho_Ngoi, Trang_Thai) VALUES
(4, 'trống'),
(2, 'đã đặt'),
(6, 'trống'),
(4, 'trống'),
(8, 'đã đặt'),
(2, 'trống'),
(4, 'trống'),
(6, 'trống'),
(8, 'đã đặt'),
(10, 'trống'),
(4, 'trống'),
(2, 'đã đặt'),
(6, 'trống'),
(4, 'trống'),
(8, 'trống');
--Data danh mục
INSERT INTO DanhMuc (Ten, MoTa) VALUES
('Món chính', 'Các món ăn chính của nhà hàng'),
('Món phụ', 'Các món ăn phụ đi kèm'),
('Tráng miệng', 'Món ăn tráng miệng'),
('Đồ uống', 'Các loại đồ uống'),
('Món chay', 'Món ăn dành cho người ăn chay'),
('Món hải sản', 'Các món ăn từ hải sản'),
('Món đặc sản', 'Đặc sản vùng miền'),
('Món Âu', 'Các món ăn phong cách Âu'),
('Món Á', 'Các món ăn phong cách Á'),
('Món nướng', 'Các món ăn nướng'),
('Món xào', 'Các món ăn xào'),
('Món luộc', 'Các món ăn luộc'),
('Món kho', 'Các món ăn kho'),
('Món xông khói', 'Các món ăn xông khói'),
('Món salad', 'Các món salad tươi ngon');
--Data món ăn
INSERT INTO MonAn (Id_DanhMuc, Ten, MoTa, Gia) VALUES
(1, 'Cơm tấm', 'Cơm tấm sườn nướng', 60000),
(1, 'Phở', 'Phở bò truyền thống', 70000),
(1, 'Bún thịt nướng', 'Bún thịt nướng với rau sống', 65000),
(2, 'Gỏi cuốn', 'Gỏi cuốn tôm thịt', 30000),
(2, 'Nem rán', 'Nem rán giòn tan', 40000),
(3, 'Bánh flan', 'Bánh flan trứng sữa', 20000),
(3, 'Chè bưởi', 'Chè bưởi thanh mát', 25000),
(4, 'Nước ngọt', 'Nước ngọt có ga', 15000),
(4, 'Trà sữa', 'Trà sữa với nhiều hương vị', 35000),
(5, 'Đậu hũ xào rau', 'Đậu hũ xào với rau củ', 50000),
(6, 'Mực xào chua ngọt', 'Món mực xào chua ngọt hấp dẫn', 80000),
(7, 'Bánh xèo', 'Bánh xèo nhân tôm thịt', 70000),
(8, 'Pizza', 'Pizza phô mai nóng hổi', 90000),
(9, 'Sushi', 'Sushi cá hồi tươi ngon', 120000),
(10, 'Thịt nướng', 'Thịt nướng BBQ hấp dẫn', 85000);
--Data đơn hàng
INSERT INTO Don_Hang (SDT_KhachHang, Id_NhanVien, PhuongThucThanhToan, Id_Ban, NgayGio, TongTien, TrangThai) VALUES
('0123456789', 1, 'Tiền mặt', 1, GETDATE(), 60000, 'Hoàn thành'),
('0123456790', 2, 'Chuyển khoản', 2, GETDATE(), 70000, 'Đang xử lý'),
('0123456791', 1, 'Tiền mặt', 3, GETDATE(), 65000, 'Hoàn thành'),
('0123456792', 3, 'Tiền mặt', 4, GETDATE(), 30000, 'Đang xử lý'),
('0123456793', 2, 'Chuyển khoản', 5, GETDATE(), 40000, 'Hoàn thành'),
('0123456794', 1, 'Tiền mặt', 6, GETDATE(), 20000, 'Đang xử lý'),
('0123456795', 2, 'Tiền mặt', 7, GETDATE(), 25000, 'Hoàn thành'),
('0123456796', 3, 'Chuyển khoản', 8, GETDATE(), 15000, 'Đang xử lý'),
('0123456797', 2, 'Tiền mặt', 9, GETDATE(), 35000, 'Hoàn thành'),
('0123456798', 1, 'Tiền mặt', 10, GETDATE(), 85000, 'Đang xử lý'),
('0123456799', 2, 'Chuyển khoản', 1, GETDATE(), 90000, 'Hoàn thành'),
('0123456800', 3, 'Tiền mặt', 2, GETDATE(), 80000, 'Đang xử lý'),
('0123456801', 1, 'Chuyển khoản', 3, GETDATE(), 75000, 'Hoàn thành'),
('0123456802', 2, 'Tiền mặt', 4, GETDATE(), 70000, 'Đang xử lý'),
('0123456803', 3, 'Tiền mặt', 5, GETDATE(), 95000, 'Hoàn thành');
--Data chi tiết đơn hàng
INSERT INTO ChiTietDonHang (Id_DonHang, Id_MonAn, SoLuong, ThanhTien) VALUES
(1, 1, 1, 60000),
(1, 2, 1, 70000),
(2, 1, 1, 65000),
(3, 4, 2, 60000),
(4, 3, 1, 30000),
(5, 5, 1, 40000),
(6, 6, 3, 60000);
--Lọc danh sách các đơn hàng theo ngày,tháng,năm
go;
create function LocDonHangTheoGiaTien(@ThoiGian Date)
returns table
as
return(
	select * from Don_Hang where Convert(Date,Don_Hang.NgayGio)=@ThoiGian
);
go;

--lọc hóa đơn theo giá tiền
create function LocHoaDonTheoGiaTien(@Min decimal,@Max decimal)
returns table
as
return(
	select * from Don_Hang where TongTien between @Min and @Max
);
go;
--lọc món ăn theo giá tiền
create function LocMonAnTheoGiaTien(@Min decimal,@Max decimal)
returns table
as
return(
	select * from MonAn where Gia between @Min and @Max
);
go;
--Thống kê các món và số lượng được order theo ngày,tháng,năm
create function ThongKeMonAnSLOrderTheoThoiGian(@ThoiGian date)
returns table
as
return(
	select MonAn.Id_MonAn,MonAn.Ten,IdMon_SL.SLOrder
	from (select DonHang_CTDonHang.Id_MonAn,SUM(SoLuong)as SLOrder
	 from (select Id_ChiTietDonHang,Don_Hang.Id_DonHang,Id_MonAn,SoLuong,NgayGio from ChiTietDonHang,Don_Hang 
	where ChiTietDonHang.Id_DonHang=Don_Hang.Id_DonHang 
	and CONVERT(date,Don_Hang.NgayGio)=@ThoiGian) as DonHang_CTDonHang
	group by DonHang_CTDonHang.Id_MonAn) as IdMon_SL,MonAn where IdMon_SL.Id_MonAn=MonAn.Id_MonAn
);
go;

