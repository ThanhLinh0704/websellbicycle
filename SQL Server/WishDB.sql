USE [master];
GO

ALTER DATABASE Wish SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Wish')
    DROP DATABASE Wish;
GO

CREATE DATABASE Wish;
GO

ALTER DATABASE Wish SET MULTI_USER;
GO

USE Wish
GO

-- Bảng cho tài khoản cũng như quyền hạn của tài khoản (ID tài khoản làm khoá chính)
	-- ID tài khoản
	-- Tên tài khoản
	-- Mật khẩu tài khoản
	-- Có phải là tài khoản người bán không
	-- Có phải là tài khoản admin không
CREATE TABLE [dbo].[Account]
(
	[uID] INT IDENTITY(1,1) NOT NULL,
	[user] VARCHAR(255) NOT NULL,
	[pass] VARCHAR(255) NOT NULL,
	[isSell] BIT NOT NULL,
	[isAdmin] BIT NOT NULL,
	PRIMARY KEY ([uID])
)

-- Bảng cho thông tin của người dùng (ID người dùng làm khoá chính)
	-- ID người dùng (Liên kết 1-1 với ID của tài khoản thuộc bảng Account)
	-- Tên người dùng
	-- Giới tính
	-- Ngày tháng năm sinh
	-- Số điện thoại
	-- Địa chỉ
CREATE TABLE [dbo].[User]
(
    [uID] INT NOT NULL,
    [name] NVARCHAR(255)  NOT NULL,
    [gender] BIT  NOT NULL,
	[dob] DATE NULL,
    [phone] VARCHAR(11) NULL,
	[address] NVARCHAR(255) NULL,
	PRIMARY KEY ([uID]),
    CONSTRAINT [FK_User_Account] FOREIGN KEY ([uID]) REFERENCES [dbo].[Account]([uID])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)

-- Bảng cho nhóm hàng (ID nhóm hàng làm khoá chính)
	-- ID nhóm hàng
	-- Tên nhóm hàng
	-- Url lưu trữ ảnh của nhóm hàng
CREATE TABLE [dbo].[Category]
(
	[cid] INT IDENTITY(1, 1) NOT NULL,
	[cname] NVARCHAR(50) NOT NULL,
	[url] NVARCHAR(100) NOT NULL,
	PRIMARY KEY ([cid])
)

-- Bảng cho mặt hàng cụ thể(ID sản phẩm làm khoá chính)
	-- ID sản phẩm
	-- Tên sản phẩm
	-- Hình ảnh
	-- Đơn giá
	-- Tựa đề của sản phẩm
	-- Nội dung chi tiết
CREATE TABLE [dbo].[Product]
(
	[pid] INT IDENTITY(1,1) NOT NULL,
	[name] NVARCHAR(255) NULL,
	[image] NVARCHAR(255) NULL,
	[amount] INT NULL,
	[price] MONEY NULL,
	[title] NVARCHAR(255) NULL,
	[description] NVARCHAR(255) NULL,
	[cateID] INT NULL,
	[sell_ID] INT NULL,
	PRIMARY KEY ([pid]),
	CONSTRAINT [FK_User_Product] FOREIGN KEY ([cateID]) REFERENCES [dbo].[Category]([cid])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)

-- Bảng cho mặt hàng ở trong giỏ hàng của người dùng (ID mặt hàng trong giỏ hàng, ID sản phẩm, ID người dùng làm khoá chính)
	-- ID mặt hàng trong giỏ hàng
	-- ID tài khoản (Liên kết N-1 với ID của tài khoản thuộc bảng Account)
	-- ID sản phẩm (Liên kết N-1 với ID của sản phẩm thuộc bảng Product)
	-- Số lượng đặt hàng
	-- Thời gian đưa vào giỏ hàng
CREATE TABLE [dbo].[Cart]
(	
	[id] INT IDENTITY(1, 1) NOT NULL,
	[accountID] INT NOT NULL,
	[productID] INT NOT NULL,
	[amount] INT NOT NULL,
	[created_at] DATETIME DEFAULT GETDATE()
	PRIMARY KEY ([id], [accountID], [productID]),

	CONSTRAINT [FK_Cart_Product] FOREIGN KEY ([productID]) REFERENCES [dbo].[Product]([pid])
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	CONSTRAINT [FK_Cart_User] FOREIGN KEY ([accountID]) REFERENCES [dbo].[Account]([uID])
		ON UPDATE CASCADE
		ON DELETE CASCADE,
)

-- Bảng cho phương thức thanh toán (ID của phương thức thanh toán làm khoá chính)
	-- ID phương thức thanh toán
	-- Tên phương thức thanh toán
CREATE TABLE [dbo].[PaymentMethod]
(
    [paymentMethodID] INT IDENTITY(1,1) NOT NULL,
    [methodName] NVARCHAR(50) NOT NULL
	PRIMARY KEY ([paymentMethodID]),
)

-- Bảng cho mã giảm giá (ID mã giảm giá làm khoá chính)
	-- ID mã giảm giá
	-- CODE mã giảm giá
	-- Lượng giảm giá
	-- Ngày hết hạn giảm giá
	-- Số lượng mã giảm giá
	-- Mã giảm giá có khả dụng không (mặc định là 1, admin có thể tắt hoặc mở tuỳ ý)

CREATE TABLE [dbo].[DiscountCode]
(
    [codeID] INT IDENTITY(1,1) NOT NULL,
    [code] NVARCHAR(20) NOT NULL UNIQUE,
    [discountPercentage] INT NOT NULL,
	[expiryDate] DATE NULL,
	[amount] INT,
    [isActive] BIT DEFAULT 1,
	PRIMARY KEY ([codeID])
)

-- Bảng cho trạng thái đơn hàng (ID trạng thái đơn hàng làm khoá chính)
	-- ID trạng thái
	-- Tên trạng thái
CREATE TABLE [dbo].[OrderStatus]
(
    [statusID] INT IDENTITY(1,1) NOT NULL,
    [statusName] NVARCHAR(50) NOT NULL,
	PRIMARY KEY ([statusID])
)

-- Bảng cho đơn hàng đã được đặt của mỗi khách hàng (ID đơn đặt hàng làm khoá chính)
	-- ID đơn đặt hàng
	-- ID tài khoản đặt hàng (Liên kết N-1 với ID của tài khoản thuộc bảng Account)
	-- ID trạng thái đơn hàng (Liên kết N-1 với ID của trạng thái đơn hàng thuộc bảng OrderStatus)
	-- Tổng giá thành của đơn hàng đó
	-- Ngày đặt hàng
	-- ID phương thức thanh toán (Liên kết N-1 với ID của phương thức thanh toán thuộc bảng PaymentMethod)
	-- ID mã giảm giá (Liên kết N-1 với ID của mã giảm giá thuộc bảng DiscountCode)
CREATE TABLE [dbo].[Order]
(
    [orderID] VARCHAR(100) NOT NULL,
    [accountID] INT NOT NULL,
	[statusID] INT NOT NULL,
    [totalPrice] MONEY NOT NULL,
    [orderDate] DATETIME DEFAULT GETDATE(),
	[completedDate] DATETIME NULL,
    [paymentMethodID] INT NOT NULL,
    [discountCodeID] INT NULL,
	[note] NVARCHAR(255) NULL,
	PRIMARY KEY ([orderID]),
    CONSTRAINT [FK_Order_Account] FOREIGN KEY ([accountID]) REFERENCES [dbo].[Account]([uID])
        ON UPDATE CASCADE 
		ON DELETE CASCADE,
	CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY ([statusID]) REFERENCES [dbo].[OrderStatus]([statusID])
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
    CONSTRAINT [FK_Order_PaymentMethod] FOREIGN KEY ([paymentMethodID]) REFERENCES [dbo].[PaymentMethod]([paymentMethodID])
		ON UPDATE CASCADE 
		ON DELETE CASCADE,
    CONSTRAINT [FK_Order_DiscountCode] FOREIGN KEY ([discountCodeID]) REFERENCES [dbo].[DiscountCode]([codeID])
		ON UPDATE CASCADE 
		ON DELETE CASCADE
);

-- Bảng cho những mặt hàng cụ thể cho đơn đặt hàng đó (ID chi tiết mặt hàng làm khoá chính)
	-- ID chi tiết đơn hàng
	-- ID đơn hàng (Liên kết N-1 với ID của đơn hàng thuộc bảng Order)
	-- ID sản phẩm (Liên kết N-1 với ID của sản phẩm thuộc bảng Product)
	-- Số lượng
	-- Tổng giá thành của sản phẩm đó

CREATE TABLE [dbo].[OrderDetail]
(
    [detailID] INT IDENTITY(1,1) NOT NULL,
    [orderID] VARCHAR(100) NOT NULL,
    [productID] INT NOT NULL,
    [quantity] INT NOT NULL,
    [price] MONEY NOT NULL,
	[priceChange] MONEY NOT NULL,
	PRIMARY KEY ([detailID]),
    CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY ([orderID]) REFERENCES [dbo].[Order]([orderID])
        ON UPDATE CASCADE 
		ON DELETE CASCADE,
    CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY ([productID]) REFERENCES [dbo].[Product]([pid])
        ON UPDATE CASCADE 
		ON DELETE CASCADE
)
GO

-- Dữ liệu đầu vào tạm thời (Bạn có thể thay đổi đề phù hợp hơn)
SET IDENTITY_INSERT [dbo].[Account] ON 
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) 
	VALUES 
		(1, 'admin', '123', 1, 1),
		(2, 'hiepgacute1989@gmail.com', 'hiepgacute', 1, 0),
		(3, 'user', 'user', 0, 0)

INSERT [dbo].[User]([uID], [name], [gender], [dob], [phone])
	VALUES
		(1, 'admin', 1, NULL, NULL),
		(2, 'hiepgacute', 1, '2004-10-29', '0966755095'),
		(3, 'user', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO

SET IDENTITY_INSERT [dbo].[Category] ON 
INSERT [dbo].[Category] ([cid], [cname], [url]) 
	VALUES 
		(1, N'XE ĐẠP PHỔ THÔNG', N'BasicalBicycle'),
		(2, N'XE ĐẠP TRẺ EM', N'SmallBicycle'),
		(3, N'XE ĐẠP THỂ THAO', N'SportBicycle')
SET IDENTITY_INSERT [dbo].[Category] OFF 
GO

SET IDENTITY_INSERT [dbo].[Product] ON 
INSERT [dbo].[Product] ([pid], [name], [image], [price], [title], [description], [cateID], [sell_ID]) 
	VALUES 
		(1, N'MTB 26 – 02', N'picture\BasicalBicycle\MTB26 –02.png', 2990000, N'Xe đạp phổ thông MTB 26 – 02', N'Xe đạp phổ thông MTB 26 – 02', 1, 1),
		(2, N'NEW 24” 2023', N'picture\BasicalBicycle\NEW24”2023.png', 2590000, N'Xe đạp phổ thông NEW 24” 2023', N'Xe đạp phổ thông NEW 24” 2023', 1, 1),
		(3, N'New 26” 2023', N'picture\BasicalBicycle\New 26”2023.png', 2690000, N'Xe đạp phổ thông New 26” 2023', N'Xe đạp phổ thông New 26” 2023', 1, 1),
		(4, N'GN 2.0 24″', N'picture\BasicalBicycle\GN2.024″.png', 2550000, N'Xe đạp phổ thông GN 2.0 24', N'Xe đạp phổ thông GN 2.0 24', 1, 1),
		(5, N'GN 2.0 27″', N'picture\BasicalBicycle\GN2.027″.png', 2750000, N'Xe đạp phổ thông GN 2.0 27″', N'Xe đạp phổ thông GN 2.0 27″', 1, 1),
		(6, N'LD 24″ – 01 2023', N'picture\BasicalBicycle\LD24″–012023.png', 2800000, N'Xe đạp phổ thông LD 24″ – 01 2023', N'Xe đạp phổ thông LD 24″ – 01 2023', 1, 1),
		(7, N'MTB 24″ – 03', N'picture\BasicalBicycle\MTB24″–03.png', 2690000, N'Xe đạp phổ thông MTB 24″ – 03', N'Xe đạp phổ thông MTB 24″ – 03', 1, 1),
		(8, N'M 27″ – 01', N'picture\BasicalBicycle\M27″–01.png', 3090000, N'Xe đạp phổ thông M 27″ – 01', N'Xe đạp phổ thông M 27″ – 01', 1, 1),
		(9, N'GN 05 – 27″', N'picture\BasicalBicycle\GN05–27″.png', 2590000, N'Xe đạp phổ thông GN 05 – 27″', N'Xe đạp phổ thông GN 05 – 27″', 1, 1),
		(10, N'219 – 26″', N'picture\BasicalBicycle\219–26″.png', 2390000, N'Xe đạp phổ thông 219 – 26', N'Xe đạp phổ thông 219 – 26', 1, 1),

		(11, N'The Power Puff Girls', N'picture\SmallBicycle\ThePowerPuffGirls.png', 2090000, N'Xe đạp trẻ em The Power Puff Girls', N'Xe đạp trẻ em The Power Puff Girls', 2, 1),
		(12, N'Wonder Woman', N'picture\SmallBicycle\WonderWoman.png', 2390000, N'Xe đạp trẻ em Wonder Woman', N'Xe đạp trẻ em Wonder Woman', 2, 1),
		(13, N'Ben 10 – 16”', N'picture\SmallBicycle\Ben10–16”.png', 1990000, N'Xe đạp trẻ em Ben 10 – 16”', N'Xe đạp trẻ em Ben 10 – 16”', 2, 1),
		(14, N'Teen Titans Go – 16”', N'picture\SmallBicycle\TeenTitansGo–16”.png', 1990000, N'Xe đạp trẻ em Teen Titans Go – 16”', N'Xe đạp trẻ em Teen Titans Go – 16”', 2, 1),
		(15, N'Space Boy', N'picture\SmallBicycle\SpaceBoy.png', 1590000, N'Xe đạp trẻ em Space Boy', N'Xe đạp trẻ em Space Boy', 2, 1),
		(16, N'Robot', N'picture\SmallBicycle\Robot.png', 1590000, N'Xe đạp trẻ em Robot', N'Xe đạp trẻ em Robot', 2, 1),
		(17, N'Love', N'picture\SmallBicycle\Love.png', 1590000, N'Xe đạp trẻ em Love', N'Xe đạp trẻ em Love', 2, 1),
		(18, N'Bunny', N'picture\SmallBicycle\Bunny.png', 1590000, N'Xe đạp trẻ em Bunny', N'Xe đạp trẻ em Bunny', 2, 1),
		(19, N'Superman', N'picture\SmallBicycle\Superman.png', 2590000, N'Xe đạp trẻ em Superman', N'Xe đạp trẻ em Superman', 2, 1),
		(20, N'Batman', N'picture\SmallBicycle\Batman.png', 2590000, N'Xe đạp trẻ em Batman', N'Xe đạp trẻ em Batman', 2, 1),

		(21, N'highway pro', N'picture\SportBicycle\highwaypro.png', 4490000, N'Xe đạp thể thao highway pro', N'Xe đạp thể thao highway pro', 3, 1),
		(22, N'RPD', N'picture\SportBicycle\RPD.png', 4890000, N'Xe đạp thể thao RPD', N'Xe đạp thể thao RPD', 3, 1),
		(23, N'SPD', N'picture\SportBicycle\SPD.png', 4890000, N'Xe đạp thể thao SPD', N'Xe đạp thể thao SPD', 3, 1),
		(24, N'Blade', N'picture\SportBicycle\Blade.png', 5890000, N'Xe đạp thể thao Blade', N'Xe đạp thể thao Blade', 3, 1),
		(25, N'Cyper', N'picture\SportBicycle\Cyper.png', 5490000, N'Xe đạp thể thao Cyper', N'Xe đạp thể thao Cyper', 3, 1),
		(26, N'Touring Highway', N'picture\SportBicycle\TouringHighway.png', 4190000, N'Xe đạp thể thao Touring Highway', N'Xe đạp thể thao Touring Highway', 3, 1),
		(27, N'GN 2.0 Pro – Đặc biệt', N'picture\SportBicycle\GN2.0Pro–Đặcbiệt.png', 3890000, N'Xe đạp thể thao GN 2.0 Pro – Đặc biệt', N'Xe đạp thể thao GN 2.0 Pro – Đặc biệt', 3, 1),
		(28, N'GN 2.0 Pro 26', N'picture\SportBicycle\GN2.0Pro26.png', 3490000, N'Xe đạp thể thao GN 2.0 Pro 26', N'Xe đạp thể thao GN 2.0 Pro 26', 3, 1),
		(29, N'GN 2.0 Pro 27″', N'picture\SportBicycle\GN2.0Pro27″.png', 3590000, N'Xe đạp thể thao GN 2.0 Pro 27″', N'Xe đạp thể thao GN 2.0 Pro 27″', 3, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO

SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 
INSERT INTO [dbo].[PaymentMethod] ([paymentMethodID], [methodName])
	VALUES
		(1, N'Chuyển khoản ngân hàng'),
		(2, N'Thanh toán tại nhà')
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
GO

SET IDENTITY_INSERT [dbo].[DiscountCode] ON 
INSERT INTO [dbo].[DiscountCode] ([codeID], [code], [discountPercentage], [expiryDate], [amount], [isActive])
	VALUES
		(0, N'NO_DISCOUNT', 0, NULL, 0, 0),
		(1, N'WISH30', 30, '2024-10-31', 1000, 1)
SET IDENTITY_INSERT [dbo].[DiscountCode] OFF 
GO

SET IDENTITY_INSERT [dbo].[OrderStatus] ON 
INSERT INTO [dbo].[OrderStatus] ([statusID], [statusName])
	VALUES
		(1, N'Đang xử lý'),
		(2, N'Xác nhân thanh toán'),
		(3, N'Đang vận chuyển'),
		(4, N'Đã giao hàng'),
		(5, N'Đã huỷ')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO

-- Dữ liệu testcase
--INSERT INTO [dbo].[Order] ([orderID], [accountID], [statusID], [totalPrice], [paymentMethodID], [discountCodeID])
--	VALUES
--		(N'Test1', 1, 1, 5580000, 1, 0),
--		(N'Test2', 1, 2, 5580000, 2, 0),
--		(N'Test3', 1, 3, 5580000, 2, 0),
--		(N'Test4', 1, 4, 5580000, 1, 0),
--		(N'Test5', 1, 5, 5580000, 2, 0)
--GO

--SET IDENTITY_INSERT [dbo].[OrderDetail] ON 
--INSERT INTO [dbo].[OrderDetail] ([detailID], [orderID], [productID], [quantity], [price], [priceChange])
--	VALUES
--		(1, N'Test1', 1, 1, 2990000, 2990000),
--		(2, N'Test2', 1, 1, 2990000, 2990000),
--		(3, N'Test3', 1, 1, 2990000, 2990000),
--		(4, N'Test4', 1, 1, 2990000, 2990000),
--		(5, N'Test5', 1, 1, 2990000, 2990000),
--		(6, N'Test1', 2, 1, 2590000, 2990000),
--		(7, N'Test2', 2, 1, 2590000, 2990000),
--		(8, N'Test3', 2, 1, 2590000, 2990000),
--		(9, N'Test4', 2, 1, 2590000, 2990000),
--		(10, N'Test5', 2, 1, 2590000, 2990000)
--SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
--GO