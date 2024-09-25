CREATE DATABASE [db_ShoppingStore]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 9/25/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[Brands]    Script Date: 9/25/2024 12:18:38 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 9/25/2024 12:18:38 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 9/25/2024 12:18:38 PM ******/
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
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 9/25/2024 12:18:38 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/25/2024 12:18:38 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 9/25/2024 12:18:38 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 9/25/2024 12:18:38 PM ******/
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
