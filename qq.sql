USE [магазин]
GO
/****** Object:  Table [dbo].[Адрес]    Script Date: 31.05.2023 18:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Адрес](
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Street] [nvarchar](50) NULL,
	[House] [nvarchar](50) NULL,
	[Appartments] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Адрес] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 31.05.2023 18:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Order_number] [int] NOT NULL,
	[Order_date] [date] NULL,
	[Login] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Delivery_Type] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[Order_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ_товара]    Script Date: 31.05.2023 18:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ_товара](
	[Order_number] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Заказ_товара] PRIMARY KEY CLUSTERED 
(
	[Order_number] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категории]    Script Date: 31.05.2023 18:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категории](
	[Category_name] [nvarchar](50) NULL,
	[Comments] [nvarchar](50) NULL,
	[Category_ID] [int] NOT NULL,
	[Is_Deleted] [bit] NULL,
 CONSTRAINT [PK_Категории] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оценка_товара]    Script Date: 31.05.2023 18:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оценка_товара](
	[Product_ID] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Grade] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Оценка_товара] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC,
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 31.05.2023 18:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NULL,
	[Birthday] [date] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Пользователи] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товар]    Script Date: 31.05.2023 18:13:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товар](
	[Product_ID] [int] NOT NULL,
	[Product_Price] [float] NULL,
	[Product_weight] [float] NULL,
	[Product_Lenght] [float] NULL,
	[Product_width] [float] NULL,
	[Comment] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Sum_product] [int] NULL,
 CONSTRAINT [PK_Товар] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пользователи] FOREIGN KEY([Login])
REFERENCES [dbo].[Пользователи] ([Login])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пользователи]
GO
ALTER TABLE [dbo].[Заказ_товара]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_товара_Заказ] FOREIGN KEY([Order_number])
REFERENCES [dbo].[Заказ] ([Order_number])
GO
ALTER TABLE [dbo].[Заказ_товара] CHECK CONSTRAINT [FK_Заказ_товара_Заказ]
GO
ALTER TABLE [dbo].[Заказ_товара]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_товара_Товар] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Товар] ([Product_ID])
GO
ALTER TABLE [dbo].[Заказ_товара] CHECK CONSTRAINT [FK_Заказ_товара_Товар]
GO
ALTER TABLE [dbo].[Оценка_товара]  WITH CHECK ADD  CONSTRAINT [FK_Оценка_товара_Пользователи] FOREIGN KEY([Login])
REFERENCES [dbo].[Пользователи] ([Login])
GO
ALTER TABLE [dbo].[Оценка_товара] CHECK CONSTRAINT [FK_Оценка_товара_Пользователи]
GO
ALTER TABLE [dbo].[Оценка_товара]  WITH CHECK ADD  CONSTRAINT [FK_Оценка_товара_Товар] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Товар] ([Product_ID])
GO
ALTER TABLE [dbo].[Оценка_товара] CHECK CONSTRAINT [FK_Оценка_товара_Товар]
GO
ALTER TABLE [dbo].[Пользователи]  WITH CHECK ADD  CONSTRAINT [FK_Пользователи_Адрес] FOREIGN KEY([Login])
REFERENCES [dbo].[Адрес] ([Login])
GO
ALTER TABLE [dbo].[Пользователи] CHECK CONSTRAINT [FK_Пользователи_Адрес]
GO
ALTER TABLE [dbo].[Товар]  WITH CHECK ADD  CONSTRAINT [FK_Товар_Категории] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Категории] ([Category_ID])
GO
ALTER TABLE [dbo].[Товар] CHECK CONSTRAINT [FK_Товар_Категории]
GO
