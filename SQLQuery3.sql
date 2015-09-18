USE [Shop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18.09.2015 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryCategoryType]    Script Date: 18.09.2015 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryCategoryType](
	[CategoryId] [int] NOT NULL,
	[CategoryTypeId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryCategoryType] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[CategoryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryGood]    Script Date: 18.09.2015 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryGood](
	[GoodId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryGood] PRIMARY KEY CLUSTERED 
(
	[GoodId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryTypes]    Script Date: 18.09.2015 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CategoriesTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Goods]    Script Date: 18.09.2015 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParentCategories]    Script Date: 18.09.2015 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentCategories](
	[ParentCategoryId] [int] NOT NULL,
	[ChildCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ParentCategories] PRIMARY KEY CLUSTERED 
(
	[ParentCategoryId] ASC,
	[ChildCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 18.09.2015 14:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL CONSTRAINT [DF_Purchases_Date]  DEFAULT (getdate()),
	[GoodId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[PurchasePricePerItem] [int] NOT NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CategoryCategoryType]  WITH CHECK ADD  CONSTRAINT [FK_CategoryCategoryType_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryCategoryType] CHECK CONSTRAINT [FK_CategoryCategoryType_Categories]
GO
ALTER TABLE [dbo].[CategoryCategoryType]  WITH CHECK ADD  CONSTRAINT [FK_CategoryCategoryType_CategoriesTypes] FOREIGN KEY([CategoryTypeId])
REFERENCES [dbo].[CategoryTypes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryCategoryType] CHECK CONSTRAINT [FK_CategoryCategoryType_CategoriesTypes]
GO
ALTER TABLE [dbo].[CategoryGood]  WITH CHECK ADD  CONSTRAINT [FK_CategoryGood_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryGood] CHECK CONSTRAINT [FK_CategoryGood_Categories]
GO
ALTER TABLE [dbo].[CategoryGood]  WITH CHECK ADD  CONSTRAINT [FK_CategoryGood_Goods] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Goods] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryGood] CHECK CONSTRAINT [FK_CategoryGood_Goods]
GO
ALTER TABLE [dbo].[ParentCategories]  WITH CHECK ADD  CONSTRAINT [FK_ParentCategories_Categories] FOREIGN KEY([ParentCategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ParentCategories] CHECK CONSTRAINT [FK_ParentCategories_Categories]
GO
ALTER TABLE [dbo].[ParentCategories]  WITH CHECK ADD  CONSTRAINT [FK_ParentCategories_Categories1] FOREIGN KEY([ChildCategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[ParentCategories] CHECK CONSTRAINT [FK_ParentCategories_Categories1]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_Goods] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Goods] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_Goods]
GO
