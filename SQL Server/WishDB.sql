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

CREATE TABLE [dbo].[Account]
(
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NOT NULL,
	[pass] [varchar](255) NOT NULL,
	[isSell] [bit] NOT NULL,
	[isAdmin] [bit] NOT NULL,
	PRIMARY KEY ([uID])
)

CREATE TABLE [dbo].[User]
(
    [uID] [int] NOT NULL,
    [name] [nvarchar](255)  NOT NULL,
    [gender] [bit]  NOT NULL,
	[dob] [date] NULL,
    [phone] [varchar](11) NULL,
	[address] [nvarchar](255) NULL,
	PRIMARY KEY ([uID]),
    CONSTRAINT [FK_User_Account] FOREIGN KEY ([uID]) REFERENCES [dbo].[Account]([uID])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)

CREATE TABLE [dbo].[Category]
(
	[cid] [int] IDENTITY(1, 1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
	PRIMARY KEY ([cid])
)

CREATE TABLE [dbo].[Product]
(
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[price] [money] NULL,
	[title] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
	PRIMARY KEY ([pid]),
	CONSTRAINT [FK_User_Product] FOREIGN KEY ([cateID]) REFERENCES [dbo].[Category]([cid])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)

CREATE TABLE [dbo].[Cart]
(	
	[id] [int] IDENTITY(1, 1) NOT NULL,
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[created_at] DATETIME DEFAULT GETDATE()
	PRIMARY KEY ([id], [accountID], [productID]),

	CONSTRAINT [FK_Cart_Product] FOREIGN KEY ([productID]) REFERENCES [dbo].[Product]([pid])
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	CONSTRAINT [FK_Cart_User] FOREIGN KEY ([accountID]) REFERENCES [dbo].[Account]([uID])
		ON UPDATE CASCADE
		ON DELETE CASCADE,
)

GO

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
INSERT [dbo].[Category] ([cid], [cname]) 
	VALUES 
		(1, N'XE ĐẠP PHỔ THÔNG'),
		(2, N'XE ĐẠP TRẺ EM'),
		(3, N'XE ĐẠP THỂ THAO')
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