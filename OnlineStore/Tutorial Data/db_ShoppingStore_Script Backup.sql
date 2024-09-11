CREATE DATABASE [db_ShoppingStore]
USE [db_ShoppingStore]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 9/11/2024 11:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Passwor] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 9/11/2024 11:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NULL,
	[BrandImage] [nvarchar](max) NULL,
 CONSTRAINT [PK__Brands__DAD4F3BE20F27CB3] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/11/2024 11:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[CategoryDetails] [nvarchar](max) NULL,
	[CategoryImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/11/2024 11:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](255) NULL,
	[Password] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 9/11/2024 11:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFID] [int] NULL,
	[ProductFID] [int] NULL,
	[FeedbackDate] [datetime] NULL,
	[Rating] [int] NULL,
	[Comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/11/2024 11:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderFID] [int] NULL,
	[ProductFID] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/11/2024 11:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/11/2024 11:02:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[BrandFID] [int] NULL,
	[CategoryFID] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[StockQuantity] [int] NULL,
	[Rating] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[ProductImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandImage]) VALUES (1, N'Apple', N'path_to_apple_logo_image')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandImage]) VALUES (2, N'Dell', N'path_to_dell_logo_image')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandImage]) VALUES (3, N'Samsung', N'path_to_samsung_logo_image')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandImage]) VALUES (4, N'Bose', N'path_to_bose_logo_image')
GO
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandImage]) VALUES (5, N'Sony', N'path_to_sony_logo_image')
GO
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDetails], [CategoryImage]) VALUES (1, N'Smartphones', N'Categegory details here', N'iPods_1.png')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDetails], [CategoryImage]) VALUES (2, N'Laptops', N'Categegory details here', N'laptop_1.png')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDetails], [CategoryImage]) VALUES (3, N'Televisions', N'Categegory details here', N'Monitors_1.png')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDetails], [CategoryImage]) VALUES (4, N'Headphones', N'Categegory details here', N'Over-Ear-_-On-Ear-Wireless-Headphones_1.png')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDetails], [CategoryImage]) VALUES (5, N'Accessories', N'Categegory details here', N'Charge-_-Sync-Cables_2.png')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Email], [Password], [Phone], [Address], [City], [State], [ZipCode]) VALUES (3, N'Khurram', N'Khurram@gmail.com', N'123', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Email], [Password], [Phone], [Address], [City], [State], [ZipCode]) VALUES (4, N'Temp', N'Khurram@gmail.com', N'123', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Email], [Password], [Phone], [Address], [City], [State], [ZipCode]) VALUES (5, N'Khurram', N'Khurram@gmail.com', N'123', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Email], [Password], [Phone], [Address], [City], [State], [ZipCode]) VALUES (6, N'Khurram', N'Khurram@gmail.com', N'1', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandFID], [CategoryFID], [Price], [StockQuantity], [Rating], [Description], [ProductImage]) VALUES (2, N'iPhone 14', 1, 1, CAST(999.99 AS Decimal(10, 2)), 50, 5, N'Latest Apple iPhone 14 with 128GB storage', N'IPhone.jpg')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandFID], [CategoryFID], [Price], [StockQuantity], [Rating], [Description], [ProductImage]) VALUES (3, N'Dell XPS 13', 2, 2, CAST(1299.99 AS Decimal(10, 2)), 30, 4, N'Dell XPS 13 with Intel i7 processor and 16GB RAM', N'XPS.jpg')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandFID], [CategoryFID], [Price], [StockQuantity], [Rating], [Description], [ProductImage]) VALUES (4, N'Samsung 55" QLED', 3, 3, CAST(1499.99 AS Decimal(10, 2)), 20, 5, N'Samsung 55" 4K QLED TV', N'Sam.jpg')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandFID], [CategoryFID], [Price], [StockQuantity], [Rating], [Description], [ProductImage]) VALUES (8, N'MacBook Pro 2022', 1, 2, CAST(650000.00 AS Decimal(10, 2)), 10, 5, N'MacBook Pro 32Gb 2TB', N'MacBook Pro.png')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Feedbacks] ADD  DEFAULT (getdate()) FOR [FeedbackDate]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([CustomerFID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([ProductFID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderFID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductFID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerFID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__BrandF__4D94879B] FOREIGN KEY([BrandFID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__BrandF__4D94879B]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryFID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
