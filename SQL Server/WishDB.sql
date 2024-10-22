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
	PRIMARY KEY ([uID]),
    CONSTRAINT [FK_User_Account] FOREIGN KEY ([uID]) REFERENCES [dbo].[Account]([uID])
		ON UPDATE CASCADE
		ON DELETE CASCADE
)

CREATE TABLE [dbo].[Cart]
(	
	[id] [int] IDENTITY(1, 1) NOT NULL,
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[Amount] [int] NULL,
	PRIMARY KEY ([id])
)


CREATE TABLE [dbo].[Category]
(
	[cid] [int] IDENTITY(1, 1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
	PRIMARY KEY ([cid])
)

CREATE TABLE [dbo].[Product]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[price] [money] NULL,
	[title] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
	PRIMARY KEY ([id])
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
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) 
VALUES 
    (1, N'MTB 26 – 02', N'picture\BasicalBicycle\MTB26 –02.png', 2990000, N'Xe phổ thông MTB 26 – 02', N'Xe phổ thông MTB 26 – 02', 1, 1),
    (2, N'NEW 24” 2023', N'picture\BasicalBicycle\NEW24”2023.png', 2590000, N'Xe phổ thông NEW 24” 2023', N'Xe phổ thông NEW 24” 2023', 1, 1),
	(3, N'New 26” 2023', N'picture\BasicalBicycle\New 26”2023.png', 2690000, N'Xe phổ thông New 26” 2023', N'Xe phổ thông New 26” 2023', 1, 1),
	(4, N'GN 2.0 24″', N'picture\BasicalBicycle\GN2.024″.png', 2550000, N'Xe phổ thông GN 2.0 24', N'Xe phổ thông GN 2.0 24', 1, 1),
	(5, N'GN 2.0 27″', N'picture\BasicalBicycle\GN2.027″.png', 2750000, N'Xe phổ thông GN 2.0 27″', N'Xe phổ thông GN 2.0 27″', 1, 1),
	(6, N'LD 24″ – 01 2023', N'picture\BasicalBicycle\LD24″–012023.png', 2800000, N'Xe phổ thông LD 24″ – 01 2023', N'Xe phổ thông LD 24″ – 01 2023', 1, 1),
	(7, N'MTB 24″ – 03', N'picture\BasicalBicycle\MTB24″–03.png', 2690000, N'Xe phổ thông MTB 24″ – 03', N'Xe phổ thông MTB 24″ – 03', 1, 1),
	(8, N'M 27″ – 01', N'picture\BasicalBicycle\M27″–01.png', 3090000, N'Xe phổ thông M 27″ – 01', N'Xe phổ thông M 27″ – 01', 1, 1),
	(9, N'GN 05 – 27″', N'picture\BasicalBicycle\GN05–27″.png', 2590000, N'Xe phổ thông GN 05 – 27″', N'Xe phổ thông GN 05 – 27″', 1, 1),
	(10, N'219 – 26″', N'picture\BasicalBicycle\219–26″.png', 2390000, N'Xe phổ thông 219 – 26', N'Xe phổ thông 219 – 26', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF