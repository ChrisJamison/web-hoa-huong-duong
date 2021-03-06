USE [master]
GO
/****** Object:  Database [HOAHUONGDUONG]    Script Date: 4/14/2017 7:53:15 AM ******/
CREATE DATABASE [HOAHUONGDUONG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HOAHUONGDUONG', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.JAMESWOLPERT\MSSQL\DATA\HOAHUONGDUONG.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HOAHUONGDUONG_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.JAMESWOLPERT\MSSQL\DATA\HOAHUONGDUONG_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HOAHUONGDUONG] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HOAHUONGDUONG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HOAHUONGDUONG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET ARITHABORT OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HOAHUONGDUONG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HOAHUONGDUONG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HOAHUONGDUONG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HOAHUONGDUONG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HOAHUONGDUONG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HOAHUONGDUONG] SET  MULTI_USER 
GO
ALTER DATABASE [HOAHUONGDUONG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HOAHUONGDUONG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HOAHUONGDUONG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HOAHUONGDUONG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HOAHUONGDUONG] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HOAHUONGDUONG]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cart_ID] [int] NULL,
	[DateOfCreation] [date] NULL,
	[isPayed] [bit] NOT NULL,
	[isOrdered] [bit] NOT NULL,
	[BillTotal] [money] NULL,
	[Product_ID] [int] NULL,
 CONSTRAINT [PK_BILL] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Cart_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[DateOfCreation] [date] NULL,
 CONSTRAINT [PK_CART] PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[Cart_Detail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Quantity] [int] NULL,
	[Cart_ID] [int] NULL,
	[Record_ID] [int] NULL,
	[CartDetailID] [nvarchar](200) NULL,
 CONSTRAINT [PK_CART_DETAIL] PRIMARY KEY CLUSTERED 
(
	[Cart_Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Parent_ID] [int] NULL,
	[Level] [int] NULL,
	[Description] [text] NULL,
	[Is_active] [bit] NULL,
	[Date_create] [datetime] NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](10) NULL,
	[LastName] [nchar](10) NULL,
	[Phone] [nchar](11) NULL,
	[Address] [nvarchar](256) NULL,
	[LastDateAccess] [date] NULL,
	[IdentifyCardNumber] [nchar](9) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[News_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Is_active] [bit] NULL,
	[DateUpload] [date] NULL,
	[DateUpdate] [date] NULL,
	[Is_savedraft] [bit] NULL,
	[Views] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[Thumbnail] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[News_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Category_ID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[URL] [varchar](256) NULL,
	[Image] [varchar](256) NULL,
	[DateUpload] [date] NULL,
	[DateUpdate] [date] NULL,
	[Price] [money] NULL,
	[Price_promotion] [money] NULL,
	[NumberInStock] [int] NULL,
	[Views] [int] NULL,
	[Is_active] [bit] NULL,
	[Is_savedraft] [bit] NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 4/14/2017 7:53:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CartDetail] ON 

INSERT [dbo].[CartDetail] ([Cart_Detail_ID], [Product_ID], [Quantity], [Cart_ID], [Record_ID], [CartDetailID]) VALUES (20, 1, 2, NULL, NULL, N'0161b374-7769-4bea-a7ab-067777c35e4c')
SET IDENTITY_INSERT [dbo].[CartDetail] OFF
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (1, N'Mỹ phẩm', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (2, N'Sữa xách tay', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (3, N'Thực phẩm dinh dưỡng', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (4, N'Thực phẩm chức năng', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (5, N'Collagen, Placenta làm đẹp', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (6, N' Đồ dùng gia đình', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (7, N'Sản phẩm cho bé yêu', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (8, N'Sản phẩm cho mẹ bầu', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (9, N'Thời trang cho bạn', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (10, N'Sản phẩm từ Hàn Quốc', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (11, N'Rượu ngoại', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (12, N'Dưỡng Da', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (13, N'Dưỡng Thể', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (14, N'Chăm sóc tóc', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (15, N'Nước hoa', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (16, N'Trang điểm làm đẹp', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (17, N'Bộ mini Dùng thử', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (18, N'SKY-II cao cấp', 12, 3, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (19, N'TRIOLOGY', 12, 3, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (20, N'KIEHL''S', 12, 3, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (21, N'Thương hiệu từ Hàn Quốc', 12, 3, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (22, N'Thương hiệu khác', 12, 3, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (23, N'Sữa Nhật', 2, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (24, N'Sữa Úc', 2, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (25, N'Sữa Đức', 2, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (26, N'Sữa Nga', 2, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (27, N'Sữa Pháp', 2, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (28, N'Bánh kẹo ngoại nhập', 3, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (29, N'Cháo ăn liền, đồ ăn dặm', 3, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (30, N'Đồ nêm, ga vị nấu ăn', 3, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (31, N'Thức ăn bổ dưỡng', 3, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (32, N'Chống đột quỵ', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (33, N'Giải độc gan', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (34, N'Bổ mắt, tăng cường thị lực', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (35, N'Bổ não, tăng cường trí nhớ', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (36, N'Viêm xương khớp', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (37, N'Hỗ trợ tim mạch', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (38, N'Hỗ trợ bệnh tiểu đường', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (39, N'Hỗ trợ chống ung thư', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (40, N'Đồ dùng cho bé', 7, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (41, N'Đồ chơi giáo dục', 7, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (42, N'Thời trang cho bé', 7, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (43, N'Vitamin bổ sung cho bé', 7, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (44, N'Thực phẩm cho bé', 7, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (45, N'Dưỡng da, làm đẹp', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (46, N'Thực phẩm cho mẹ bầu', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (47, N'Đồ dùng cho mẹ bầu', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (48, N'Vitamin bổ sung cho mẹ bầu', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (49, N'Các loại Mặt nạ', 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Category] ([Category_ID], [Name], [Parent_ID], [Level], [Description], [Is_active], [Date_create]) VALUES (50, N'Hàng Order', 0, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Fullname], [PhoneNumber], [Email], [Address], [Content], [CreatedDate]) VALUES (1, N'Khoa Huynh ', N'06632346', N'huynhducdangkhoa1@gmail.com', N'sasasa', N'test send mail', CAST(N'2017-04-05 23:30:58.643' AS DateTime))
INSERT [dbo].[Contact] ([Id], [Fullname], [PhoneNumber], [Email], [Address], [Content], [CreatedDate]) VALUES (2, N'sadada', N'036032323', N'test@gmail.com', N'assas', N'Test Send mail', CAST(N'2017-04-05 23:54:42.433' AS DateTime))
INSERT [dbo].[Contact] ([Id], [Fullname], [PhoneNumber], [Email], [Address], [Content], [CreatedDate]) VALUES (3, N'Huynh Duc Dang Khoa', N'111111223232656', N'huynhducdangkhoa@gmail.com', N'Q.Tan Phu', N'test gui thong tin lien lac tu khach hang', CAST(N'2017-04-06 00:02:50.677' AS DateTime))
INSERT [dbo].[Contact] ([Id], [Fullname], [PhoneNumber], [Email], [Address], [Content], [CreatedDate]) VALUES (4, N'Huỳnh Đức Đăng Khoa', N'0123232354545', N'huynhducdangkhoa@gmail.com', N'Q.Tan Phu, TP.HCM', N'test send email lần cuối trước khi deploy lên server', CAST(N'2017-04-06 00:08:04.857' AS DateTime))
INSERT [dbo].[Contact] ([Id], [Fullname], [PhoneNumber], [Email], [Address], [Content], [CreatedDate]) VALUES (5, N'huynh duc da', N'sâsa', N'sa@gmail.com', N'sa', N'sấ', CAST(N'2017-04-06 00:33:14.013' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([News_ID], [Title], [Is_active], [DateUpload], [DateUpdate], [Is_savedraft], [Views], [Content], [Thumbnail]) VALUES (1, N'Nước chanh có thực sự giúp giảm cân?', 1, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 0, 0, N' <div class="_mota"><div style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: center;"><a href="http://mapu.vn" target="_blank"><img alt="Nước chanh có thực sự giúp giảm cân" src="/useruploads/userfiles/513168/images/nuoc-chanh-co-thuc-su-giup-giam-can.jpg" style="border: none; height: 636px; width: 576px;" title="Nước chanh có thực sự giúp giảm cân" /></a><br  />
&nbsp;</div>

<p><span style="font-size:22px;"><span style="font-family: Arial; line-height: 25.2px; text-align: justify; background-color: rgb(255, 255, 255);">Nhiều người cho rằng nước chanh ấm gi&uacute;p l&agrave;m&nbsp;</span>giảm c&acirc;n<span style="font-family: Arial; line-height: 25.2px; text-align: justify; background-color: rgb(255, 255, 255);">. Tuy nhi&ecirc;n, Alissa Rumsey, chuy&ecirc;n gia dinh dưỡng, ph&aacute;t ng&ocirc;n vi&ecirc;n của EatRight - một trang web về ăn ki&ecirc;ng nổi tiếng của Mỹ, cho biết: &ldquo;Bản th&acirc;n nước chanh kh&ocirc;ng hề c&oacute; t&aacute;c dụng giảm c&acirc;n&rdquo;. Nước chanh chỉ gi&uacute;p c&oacute; t&aacute;c dụng n&agrave;y nếu bạn uống n&oacute; thay thế cho c&aacute;c loại nước gi&agrave;u calo kh&aacute;c như c&agrave; ph&ecirc; đường hay nước hoa quả. Tuy nhi&ecirc;n, khi đ&oacute; giảm c&acirc;n l&agrave; kết quả tất yếu của việc giảm lượng calo, chứ kh&ocirc;ng phải chỉ đơn thuần nhờ v&agrave;o nước chanh.</span><br style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: justify;" />
<span style="font-family: Arial; line-height: 25.2px; text-align: justify; background-color: rgb(255, 255, 255);">Uống nước, lạnh hay n&oacute;ng, c&oacute; hay kh&ocirc;ng c&oacute; chanh, đều gi&uacute;p cho sự trao đổi chất của cơ thể. &ldquo;Uống nhiều nước l&agrave; điều quan trọng của một chế độ ăn ki&ecirc;ng l&agrave;nh mạnh&rdquo;, Rumsey n&oacute;i. &ldquo;Nếu bạn kh&ocirc;ng th&iacute;ch uống nước lọc, th&ecirc;m chanh l&agrave; giải ph&aacute;p để th&ecirc;m hương vị m&agrave; kh&ocirc;ng l&agrave;m tăng lượng calo&rdquo;.</span><br style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: justify;" />
<span style="font-family: Arial; line-height: 25.2px; text-align: justify; background-color: rgb(255, 255, 255);">Uống nước chanh c&oacute; thể l&agrave;m giảm đầy bụng v&agrave; gi&uacute;p lợi tiểu. Tuy nhi&ecirc;n những t&aacute;c dụng n&agrave;y kh&aacute; ngắn ngủi. Nếu như bạn bị đầy bụng trong thời gian d&agrave;i, tốt nhất l&agrave; cố gắng t&igrave;m ra nguy&ecirc;n nh&acirc;n để khắc phục. C&oacute; thể bạn đ&atilde; ăn qu&aacute; nhanh, ăn qu&aacute; nhiều muối hoặc qu&aacute; nhiều đường.</span><br style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: justify;" />
<span style="font-family: Arial; line-height: 25.2px; text-align: justify; background-color: rgb(255, 255, 255);">Ngo&agrave;i ra, bạn cũng kh&ocirc;ng n&ecirc;n uống nước chanh nếu đang bị ợ chua hay tr&agrave;o ngược dạ d&agrave;y, bởi thứ nước n&agrave;y sẽ l&agrave;m c&aacute;c triệu chứng nặng hơn.</span><br style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: justify;" />
<span style="font-family: Arial; line-height: 25.2px; text-align: justify; background-color: rgb(255, 255, 255);">&nbsp;</span></span></p>

<div style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: right;"><em><strong>Nguồn: Vnexpress</strong></em></div></div>
            <div class="btn_chiase_bg" style="padding-bottom:10px; padding-top:10px;"> ', N'nuocchanh.jpg')
INSERT [dbo].[News] ([News_ID], [Title], [Is_active], [DateUpload], [DateUpdate], [Is_savedraft], [Views], [Content], [Thumbnail]) VALUES (2, N'Nước chanh có thực sự giúp giảm cân?', 1, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 0, 0, N' <div class="_mota"><div style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: center;"><a href="http://mapu.vn" target="_blank"><img alt="Nước chanh có thực sự giúp giảm cân" src="/useruploads/userfiles/513168/images/nuoc-chanh-co-thuc-su-giup-giam-can.jpg" style="border: none; height: 636px; width: 576px;" title="Nước chanh có thực sự giúp giảm cân" /></a><br  />', N'nuocchanh.jpg')
INSERT [dbo].[News] ([News_ID], [Title], [Is_active], [DateUpload], [DateUpdate], [Is_savedraft], [Views], [Content], [Thumbnail]) VALUES (3, N'Nước chanh có thực sự giúp giảm cân?', 1, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 0, 0, N' <div class="_mota"><div style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: center;"><a href="http://mapu.vn" target="_blank"><img alt="Nước chanh có thực sự giúp giảm cân" src="/useruploads/userfiles/513168/images/nuoc-chanh-co-thuc-su-giup-giam-can.jpg" style="border: none; height: 636px; width: 576px;" title="Nước chanh có thực sự giúp giảm cân" /></a><br  />', N'nuocchanh.jpg')
INSERT [dbo].[News] ([News_ID], [Title], [Is_active], [DateUpload], [DateUpdate], [Is_savedraft], [Views], [Content], [Thumbnail]) VALUES (4, N'Nước chanh có thực sự giúp giảm cân?', 1, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 0, 0, N' <div class="_mota"><div style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: center;"><a href="http://mapu.vn" target="_blank"><img alt="Nước chanh có thực sự giúp giảm cân" src="/useruploads/userfiles/513168/images/nuoc-chanh-co-thuc-su-giup-giam-can.jpg" style="border: none; height: 636px; width: 576px;" title="Nước chanh có thực sự giúp giảm cân" /></a><br  />', N'nuocchanh.jpg')
INSERT [dbo].[News] ([News_ID], [Title], [Is_active], [DateUpload], [DateUpdate], [Is_savedraft], [Views], [Content], [Thumbnail]) VALUES (5, N'Nước chanh có thực sự giúp giảm cân?', 1, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 0, 0, N' <div class="_mota"><div style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: center;"><a href="http://mapu.vn" target="_blank"><img alt="Nước chanh có thực sự giúp giảm cân" src="/useruploads/userfiles/513168/images/nuoc-chanh-co-thuc-su-giup-giam-can.jpg" style="border: none; height: 636px; width: 576px;" title="Nước chanh có thực sự giúp giảm cân" /></a><br  />', N'nuocchanh.jpg')
INSERT [dbo].[News] ([News_ID], [Title], [Is_active], [DateUpload], [DateUpdate], [Is_savedraft], [Views], [Content], [Thumbnail]) VALUES (6, N'Nước chanh có thực sự giúp giảm cân?', 1, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 0, 0, N' <div class="_mota"><div style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: center;"><a href="http://mapu.vn" target="_blank"><img alt="Nước chanh có thực sự giúp giảm cân" src="/useruploads/userfiles/513168/images/nuoc-chanh-co-thuc-su-giup-giam-can.jpg" style="border: none; height: 636px; width: 576px;" title="Nước chanh có thực sự giúp giảm cân" /></a><br  />', N'nuocchanh.jpg')
INSERT [dbo].[News] ([News_ID], [Title], [Is_active], [DateUpload], [DateUpdate], [Is_savedraft], [Views], [Content], [Thumbnail]) VALUES (7, N'Nước chanh có thực sự giúp giảm cân?', 1, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 0, 0, N' <div class="_mota"><div style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: center;"><a href="http://mapu.vn" target="_blank"><img alt="Nước chanh có thực sự giúp giảm cân" src="/useruploads/userfiles/513168/images/nuoc-chanh-co-thuc-su-giup-giam-can.jpg" style="border: none; height: 636px; width: 576px;" title="Nước chanh có thực sự giúp giảm cân" /></a><br  />', N'nuocchanh.jpg')
INSERT [dbo].[News] ([News_ID], [Title], [Is_active], [DateUpload], [DateUpdate], [Is_savedraft], [Views], [Content], [Thumbnail]) VALUES (8, N'Nước chanh có thực sự giúp giảm cân?', 1, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 0, 0, N' <div class="_mota"><div style="font-family: Arial; font-size: 14px; line-height: 25.200000762939453px; text-align: center;"><a href="http://mapu.vn" target="_blank"><img alt="Nước chanh có thực sự giúp giảm cân" src="/useruploads/userfiles/513168/images/nuoc-chanh-co-thuc-su-giup-giam-can.jpg" style="border: none; height: 636px; width: 576px;" title="Nước chanh có thực sự giúp giảm cân" /></a><br  />', N'nuocchanh.jpg')
INSERT [dbo].[News] ([News_ID], [Title], [Is_active], [DateUpload], [DateUpdate], [Is_savedraft], [Views], [Content], [Thumbnail]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'nuocchanh.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (1, N'Collagen Dhc Dạng Nước 12000mg Ex Hàng Nội Địa Nhật Bản', 5, N'<p> Collagen DHC Beauty 7000mg dạng nước, hàng nội địa Nhật Bản, là dòng sản phẩm collagen giúp nuôi dưỡng da và chống lão hoá hoàn hảo nhất của hãng DHC nổi tiếng của Nhật với sự kết hợp của collagen 7000mg, axit hiaruloric 30mg, ceramid 1200, co enzyme Q10 30mg. </p> 
<p> Có mùi vị thơm ngon ngọt dịu như nước ép bưởi và mật ong.Đây là điểm khác biệt so với các sản phẩm khác.</p>
<p> Được tách từ cá biển, món ăn giúp người Nhật sống lâu, khỏe mạnh và minh mẫn.</p>
<p> Liệu trình uống 3 hộp trong vòng 1 tháng. Sau đó ngưng 1-2 tháng và tiếp tục uống.</p>', N'null', N'Images/sanpham/collagen-placenta-lam-dep/collagen-dhc-beauty-7000mg.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 640000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (2, N'Viên Uống Shiseido the Collagen Enriched', 5, N'<p>Shiseido collagen enriched là dòng sản phẩm cao cấp nhất của shiseido, chứa hàm lượng collagen cao nhất (lên đến 1000 mg), cung cấp lượng collagen cần thiết cho quá trình tái tạo và nuôi dưỡng da, sụn khớp, các tế bào trong cơ thể. Công dụng chính của sản phẩm:</p><p>  Cung cấp collagen cần thiết cho cơ thể để duy trì sự mịn màn, săn chắc</p><p>Giúp làn da hồng hào, tăng độ đàn hồi, làm chậm quá trình lão hóa của làn da, cơ, xương, khớp</p><p>  Giúp xương cứng cáp, cải thiện sự linh hoạt của khớp, gân và sụn khỏe mạnh dẻo dai.</p><p>Thành phần chứa trong mỗi 04 viên collagen enriched dạng viên gồm:</p><p>Collagen peptide (có nguồn gốc từ cá), nước trái cây nam việt quất, chiết xuất từ ​​trái cây Amla, chiết xuất từ ​​khoai tây konjac, coenzyme Q10, dextrin, dầu thực vật bột, elastin peptide (có nguồn gốc từ cá), chiết xuất từ ​​hạt tiêu đen, tinh thể cellulose, vitamin C, HPC, silicon dioxide tốt, keo phí (methyl cellulose), chất tạo màu (titanium dioxide), vitamin B6, acid hyaluronic, calcium stearate, vitamin B2, sáp carnauba (bao gồm một số gelatin liệu)</p><p>Năng lượng: 7.6kcal
Protein: 1.1g
lipid: 0.088g
Carbohydrate: 0.55g
natri: 20mg
Vitamin B2: 4mg
Vitamin B6: 10mg
Vitamin C: 100mg
Vitamin E: 10mg
collagen: 1000mg
hyaluronic acid: 10mg
coenzyme Q10: 30mg
ceramide: 1,200μg</p><p>Hướng dẫn sử dụng shiseido the collagen enriched dạng viên:</p><p>Dùng 02 gói (08 viên) shiseido enriched/ ngày, có thể uống làm 02 lần: buổi sáng, buổi tối</p><p>Shiseido enriched có bổ sung vitamin C, do đó nên uống sau khi ăn
Uống nhiều nước trong quá trình sử dụng để cơ thể có thể hấp thụ hết sản phẩm</p><p>Tập thể dục, thể thao thường xuyên, kết hợp với một chế độ ăn uống hợp lý: nhiều rau củ quả tươi, rau xanh
Nếu nhìn thấy trong sản phẩm có các hạt hay kết tủa thì chất lượng sản phẩm không bị ảnh hưởng và vẫn được đảm bảo.
Phụ nữ mang thai và cho con bú: tham khảo ý kiến bác sĩ trước khi sử dụng</p>', N'null', N'Images/sanpham/collagen-placenta-lam-dep/vien-uong-shiseido-the-collagen-enriched.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (3, N'Tinh Chất Nhau Thai Dr Select Placenta  300000mg ', 5, N'<p> Tinh chất nhau thai Dr Select Placenta 300000mg  được thu hoạch từ những trang trại sạch dưới sự quản lý nghiêm ngặt tuyệt đối. Tinh chất nhau thai Dr Select có cấu trúc phân tử tương đồng với con người nên khả năng tương thích và hấp thụ dễ dàng vào cơ thể.</p> <p> Đặc biệt, tinh chất nhau thai Dr Select Placenta có hàm lượng cao đến 300000mg nên khả năng phục hồi làn da rất nhanh chóng. Nó giúp làm đầy lớp đệm ở bề mặt da, làm cho những vùng da quanh mắt, quanh miệng nhăn nheo trở nên đầy đặn và căng mịn. Những sắc tố melanin ở lớp biểu bì da sẽ được phóng thích, làm mờ dần đốm nâu và đều màu da. Làn da sẽ trở nên căng mịn, hồng hào hơn.</p> <p>  Nhà sản xuất Excelity thực sự thành công trong khả năng giảm thiểu tối da mùi tanh của nhau thai heo mà không làm phá hủy các thành phần hoạt chất trong nó. Trong quá trình sản xuất và thành phẩm trước khi đưa ra thị trường, những sản phẩm tinh chất nhau thai Dr Select Placenta 300000 phải trải qua nhiều đợt kiểm tra đạt chuẩn và thực sự an toàn tuyệt đối khi nó không hề chứa hormone gây ra tác dụng phụ. </p> <p>Dr.Select Placenta 300000 Drink là một thức uống dưỡng da thật hoàn hảo khi được pha trộn cùng với 71 loại thực phẩm lên men, đó là những thực vật hoang dã tự nhiên, trái cây, ngũ cốc, nấm hay rong biển… Thực phẩm lên men chứa một lượng enzyme chống lão hóa từ bên trong cơ thể, nó được bổ sung dưỡng chất, cân bằng cơ thể hỗ trợ cho sức khỏe và vẻ trẻ đẹp từ bên trong từ những nguyên liệu thật sự thiên nhiên. </p><p>Ngoài những thực phẩm cần thiết cho sức khỏe và làn da, Dr.Select còn kết hợp những enzyme, vitamin và dưỡng chất có trong rượu vang, tổ yến, collagen, acid hyaluronic, elastin, proteoglycans… mang lại hiệu quả cao trong việc cải thiện vấn đề về da khác nhau. </p> <p>Hướng dẫn sử dụng nhau thai heo DR SELECT PLACENTA 300000mg hiệu quả: </p> <p> Mỗi ngày 1 cốc nhỏ (đi kèm bên trong hộp) 15ml uống đặc hoặc pha loãng tùy sở thích.
Sau khi mở nắp nên được bảo quản trong tủ lạnh.</p>', N'null', N'Images/sanpham/collagen-placenta-lam-dep/tinh-chat-nhau-thai-dr-select-placenta-300000mg-den.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 2400000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (4, N'Tinh Chất Nhau Thai Dr Select Placenta  300000mg', 5, N'<p>Tinh chất nhau thai Dr Select Placenta 300000mg  được thu hoạch từ những trang trại sạch dưới sự quản lý nghiêm ngặt tuyệt đối. Tinh chất nhau thai Dr Select có cấu trúc phân tử tương đồng với con người nên khả năng tương thích và hấp thụ dễ dàng vào cơ thể.</p> <p> Đặc biệt, tinh chất nhau thai Dr Select Placenta có hàm lượng cao đến 300000mg nên khả năng phục hồi làn da rất nhanh chóng. Nó giúp làm đầy lớp đệm ở bề mặt da, làm cho những vùng da quanh mắt, quanh miệng nhăn nheo trở nên đầy đặn và căng mịn. Những sắc tố melanin ở lớp biểu bì da sẽ được phóng thích, làm mờ dần đốm nâu và đều màu da. Làn da sẽ trở nên căng mịn, hồng hào hơn.</p> <p> Nhà sản xuất Excelity thực sự thành công trong khả năng giảm thiểu tối da mùi tanh của nhau thai heo mà không làm phá hủy các thành phần hoạt chất trong nó. Trong quá trình sản xuất và thành phẩm trước khi đưa ra thị trường, những sản phẩm tinh chất nhau thai Dr Select Placenta 300000 phải trải qua nhiều đợt kiểm tra đạt chuẩn và thực sự an toàn tuyệt đối khi nó không hề chứa hormone gây ra tác dụng phụ.  </p> <p>Dr.Select Placenta 300000 Drink là một thức uống dưỡng da thật hoàn hảo khi được pha trộn cùng với 71 loại thực phẩm lên men, đó là những thực vật hoang dã tự nhiên, trái cây, ngũ cốc, nấm hay rong biển… Thực phẩm lên men chứa một lượng enzyme chống lão hóa từ bên trong cơ thể, nó được bổ sung dưỡng chất, cân bằng cơ thể hỗ trợ cho sức khỏe và vẻ trẻ đẹp từ bên trong từ những nguyên liệu thật sự thiên nhiên. </p> <p> Ngoài những thực phẩm cần thiết cho sức khỏe và làn da, Dr.Select còn kết hợp những enzyme, vitamin và dưỡng chất có trong rượu vang, tổ yến, collagen, acid hyaluronic, elastin, proteoglycans… mang lại hiệu quả cao trong việc cải thiện vấn đề về da khác nhau. </p> <p>Hướng dẫn sử dụng nhau thai heo DR SELECT PLACENTA 300000mg hiệu quả: </p> <p>Mỗi ngày uống 1 gói. </p>', N'null', N'Images/sanpham/collagen-placenta-lam-dep/tinh-chat-nhau-thai-dr-select-300000.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1900000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (5, N'Viên Uống Trắng Da Shiseido Pure White Hộp 270 Viên', 5, N'<p>Xuất xứ: Shiseido, hàng nội địa Nhật Bản, cam kết hàng chính hãng. </p> <p> Shiseido Pure White dạng viên là sản phẩm làm trắng da, trị nám cao cấp của Nhật Bản, được sản xuất bởi Shiseido Pharmaceutical Co, có tác dụng làm trắng da một cách tự nhiên từ bên trong, xóa tan tàn nhang, xua tan vết nám, cải thiện hắc tố của làn da, giúp bạn có được một làn da trắng sáng tự nhiên chỉ sau 30 ngày sử dụng.</p> <p> Viên uống trắng da Shiseido Pure White - bí quyết chăm sóc sắc đẹp cổ xưa, sản phẩm được chiết xuất từ quả kỷ tử (khởi tử), lúa mạch kết hợp với bột ngọc trai và các vitamin khác như: vitamin C 1000mg, enzyme chế biến vitamin P, adlay, licorice, GABA, ceramide, và vitamin E. </p><p> Công dụng: </p> <p> Xóa mờ hoàn toàn các đốm đen, đồi mồi, tàn nhang, sạm nắng đã hình thành trên bề mặt da.</p> <p>  Ngăn chặn tuyệt đối sự kết tụ melanin từ sâu bên trong biểu bì da, bảo vệ da an toàn suốt cả ngày khỏi tác hại của tia cực tím từ bên ngoài. </p> <p>   Nuôi dưỡng làn da mịn màng, trắng đẹp thuần khiết và hoàn hảo.</p> <p> Hoàn toàn không tác dụng phụ. </p> <p>Thành phần 9 viên (3,25g tương đương lượng uống hàng ngày) Collagen (0) Protein (0.27g), Energy (8.8kcal), Lipid (0.11g), Carbohydrate (1.7g), Natrium (1.02mg), Vitamin B2 (10mg), Vitamin B6 (10mg), Vitamin C (1000mg), Vitamin E(8mg) và chiết xuất thảo dược. </p> <p>Cách dùng: </p><p>Ngày dùng 03 lần, mỗi lần 3 viên </p> <p>  Khuyên dùng trước 17h, không cần phải nhai.</p> <p> Uống nhiều nước trong quá trình sử dụng (1,5 – 2 lít nước/ ngày).</p> ', N'null', N'Images/sanpham/collagen-placenta-lam-dep/shiseido-pure-white .JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 600000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (6, N'Máy Đuổi Muỗi Bằng Tinh Dầu Nhật Bản', 6, N'<p> Máy được sản xuất dựa trên công nghệ tiên tiến, tinh dầu chiết xuất từ thiên nhiên nên không gây độc hại cho người sử dụng, đặc biệt cho cả trẻ em.</p><p> Máy gồm thiết bị làm bốc hơi tinh dầu và lọ tinh dầu có tác dụng đuổi muỗi bằng cơ chế sử dụng công dụng bốc hơi tinh dầu dưới dạng ion làm ức chế phổi của muỗi làm muỗi khó chịu và bay đi. Khi sử dụng không tạo ra bất kỳ mùi và âm thanh khó chịu nào.</p> <p> Chai tinh dầu dùng trong 60 ngày. Khi hết có thể mua riêng để thay thế.</p>', N'null', N'Images/sanpham/do-dung-gia-dinh/may-duoi-muoi-bang-tinh-dau-nhat-ban.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 290000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (7, N'Viên Giặt Sả Gel Ball Nhật Bản', 6, N'<p>Túi viên nước giặt xả Gel Ball (bold) hương hoa hồng sẽ giúp đánh bật vết bẩn, làm trắng sáng vượt trội và cho mùi hương lưu lại quần áo thơm lâu nhẹ nhàng mà không làm phai màu quần áo. </p> <p> Công thức độc đáo của viên giặt giúp hoà tan nhanh chóng trong nước nóng hoặc nước lạnh và đem lại hiệu quả bất ngờ với chỉ 1 viên nước giặt bé nhỏ cho mỗi lần giặt.</p> <p>An toàn cho cả quần áo màu, quần áo thể thao, bộ đồ em bé,…. </p> <p>Với công thức ít bọt, không làm trào bọt làm hư hỏng các vi mạch điện nên viên nước giặt xả Gel Bold hương hoa có thể sử dụng cho tất cả các loại máy giặt đồng thời cũng có thể dùng được cho giặt máy và giặt tay. </p> <p>Sản phẩm viên nước giặt xả Gel Bold kết hợp hương thơm dịu và làm mềm vải nên bạn không cần dùng thêm nước xả, vì thế cũng giúp bạn tiết kiệm chi phí đáng kể cho việc giặt giũ hàng ngày. Một tính năng nổi bật nữa là viên giặt Bold có tính kháng khuẩn rất cao, do đó trong trường hợp trời mưa hoặc bạn phải phơi quần áo trong nhà thì quần áo vẫn không có mùi ẩm mốc. Sản phẩm rất thích hợp với điều kiện thời tiết nóng ẩm tại Việt Nam, đặc biệt là ở các tỉnh nắng ít, mưa nhiều. </p> ', N'null', N'Images/sanpham/do-dung-gia-dinh/vien-giat-xa-gel-ball-36-vien-nhat-ban.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (8, N'Set Sk-ii Mini Trắng Da', 17, N'<p>Set gồm: </p><p> 1 tuýp sữa rửa mặt 20gr.</p><p> 1 chai nước thần 30ml.</p><p> 1 hũ kem làm trắng da 15gr.</p>', N'null', N'Images/sanpham/my-pham/bo-mini-dung-thu/set-sk-ii-mini-trang-da.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1000000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (9, N'Sk-ii Set Mini Phục Hồi Da, Chống Lão Hoá Mang Lại Cho Bạn Làn Da Tươi Trẻ', 17, N'<p>Set gồm:  </p><p> 1 tuýp sữa rửa mặt 20gr</p><p> 1 chai nước thần 30ml.</p><p> 1 hũ kem chống lão hoá thế hệ mới 15gr.</p>', N'null', N'Images/sanpham/my-pham/bo-mini-dung-thu/sk-ii-set-mini-phuc-hoi-da.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1000000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (10, N'Sk-ii Set Mini 3 Món', 17, N'<p>Set gồm: </p><p> 1 tuýp sữa rửa mặt 20gr.</p><p> 1 chai nước thần 30ml.</p><p> 1 mặt nạ.</p>', N'null', N'Images/sanpham/my-pham/bo-mini-dung-thu/set-sk-ii-mini-ba-mon.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 750000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (11, N'Set Sk-ii Mini 4 Món', 17, N'<p>Set gồm: </p><p>1 chai nước hoa hồng 30ml.</p><p> 1 chai nước thần 30ml.</p><p> 1 mặt nạ.</p><p>1 hũ kem chống lão hoá r.n.a 15gr.</p>', N'null', N'Images/sanpham/my-pham/bo-mini-dung-thu/set-sk-ii-mini-bon-mon.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1150000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (12, N'Hũ Kem Sk-ii Chống Lão Hoá 15gr', 17, N'<p> Chưa có thông tin mô tả.</p>', N'null', N'Images/sanpham/my-pham/bo-mini-dung-thu/hu-kem-sk-ii-chong-lao-hoa-15gr.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 450000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (13, N'Sữa Rửa Mặt Sk-ii 15gr.', 17, N'<p>Phù hợp với mọi loại da, làm sạch sâu các lớp bụi bẩn mà không làm khô da.</p>', N'null', N'Images/sanpham/my-pham/bo-mini-dung-thu/sua-rua-mat-sk-ii-15gr.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 200000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (14, N'Mặt Nạ Sk-ii Facial Treatment Mask ', 17, N'<p>Với đầy đủ dưỡng chất cung cấp cho da bạn căng mướt chỉ sau một đêm. Da bạn sẽ trở nên mịn màng, trắng hồng.</p>', N'null', N'Images/sanpham/my-pham/bo-mini-dung-thu/mat-na-sk-ii-facial-treatment-mask.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 200000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (15, N'Dầu Gội Chống Rụng Tóc Cao Cấp Từ Thảo Dược 400ml', 14, N'<p>Dầu gội cao cấp chống rụng tóc chiết xuất từ nhân sâm và các thảo dược phương đông từ Hàn Quốc cho bạn một mái tóc suôn mượt.</p>', N'null', N'Images/sanpham/my-pham/cham-soc-toc/dau-goi-chong-rung-toc-cao-cap-tu-thao-duoc-400ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 420000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (16, N'Dầu Gội Sả Tsubaki Đỏ ', 14, N'<p>Gồm 1 chai dầu gội 550ml, 1 chai dầu sả 550ml. </p><p>Tsubaki (nghĩa là hoa trà đỏ) với các sản phẩm được thiết kế với màu đỏ gợi cảm nhằm mục đích nhấn mạnh thành phần độc đáo của dòng sản phẩm chăm sóc tóc mới đang rất “hot” tại Nhật Bản. Với hương thơm ngọt ngào, Bộ dầu gội, dầu xả, kem ủ Shiseido Tsubaki Đỏ giúp tăng cường độ ẩm, mang đến vẻ óng ánh mềm mại cho tóc thường, tóc khô, và cả tóc dầy. Bạn sẽ cảm nhận được sự khác biệt ngay sau lần đầu sử dụng.</p>', N'null', N'Images/sanpham/my-pham/cham-soc-toc/dau-goi-sa-tsubaki-do.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (17, N'Bộ Dầu Gội Shiseido Tsubaki Volume Touch Màu Tím', 14, N'<p>Shiseido Tsubaki Volume Touch là dòng sản phẩm chăm sóc tóc với công thức đặc biệt mới chứa nhiều tinh dầu từ hoa trà và nhiều chất dưỡng tóc giúp mái tóc bạn luôn bồng bềnh tràn đầy sức sống. Bộ dầu gội và dầu xả Shiseido Tsubaki màu tím làm phồng tóc rất thích hợp cho các bạn tóc mỏng, da đầu dễ bị bệt, tóc dầu… nó sẽ mang lại mái tóc nhẹ như bông, phồng hơn và trông dày hơn cho bạn cảm giác tự tin suốt cả ngày. </p> <p>Bộ dầu gội Tsubaki Volume Touch màu tím hương thơm từ tinh dầu hoa trà không chỉ lưu mùi đến tận 36 tiếng mà còn mang lại mái tóc bồng bềnh, óng ả và mềm mại mọi lúc mọi nơi. </p>', N'null', N'Images/sanpham/my-pham/cham-soc-toc/bo-dau-goi-shiseido-tsubaki-volume-touch-mau-tim.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 350000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (18, N'Dầu Gội Shiseido Prior Chống Tóc Bạc Và Giữ Màu Tóc Nhuộm', 14, N'<p>Là sản phẩm có xuất xứ từ Nhật Bản, là sản phẩm của thương hiệu Shishedo.
 Thương hiệu sản phẩm không chỉ  là dầu gội và dưỡng tóc – mà còn là biểu tượng cảm xúc trong tình yêu và cuộc sống tươi đẹp. </p> <p>Sản phẩm giúp chống tóc bạc và giữ được màu tóc nhuộm.
Sản phẩm suôn mềm & óng mượt đóng vai trò kích thích với độ ẩm cao. Chất dưỡng ẩm tăng cường giúp bổ sung cân bằng độ ẩm từ trong ra ngoài. </p> <p>Ngoài ra sản phẩm còn kết hợp với dầu xả, giúp tóc mềm mượt, đem đến cho bạn vẻ đẹp quý phái sang trọng.
Được đặc chế với công thức hỗn hợp những nguyên liệu chăm sóc và xả tóc giúp bảo vệ bề mặt tóc khỏi hư tổn và cải thiện vẻ bề ngoài của sợi tóc - mà không làm sợi tóc nặng hơn.</p>', N'null', N'Images/sanpham/my-pham/cham-soc-toc/dau-goi-shiseido-prior-chong-toc-bac-va-giu-mau-toc-nhuom.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (19, N'Dầu Sả Shiseido Prior Chống Tóc Bạc Và Giữ Màu Tóc Nhuộm', 14, N'<p>Là sản phẩm có xuất xứ từ Nhật Bản, là sản phẩm của thương hiệu Shishedo.
Thương hiệu sản phẩm không chỉ  là dầu xả và dưỡng tóc – mà còn là biểu tượng cảm xúc trong tình yêu và cuộc sống tươi đẹp. </p> <p>Sản phẩm giúp chống tóc bạc và giữ được màu tóc nhuộm.
Sản phẩm suôn mềm & óng mượt đóng vai trò kích thích với độ ẩm cao.Chất dưỡng ẩm tăng cường giúp bổ sung cân bằng độ ẩm từ trong ra ngoài.
Giúp tóc mềm mượt, đem đến cho bạn vẻ đẹp quý phái sang trọng. </p> <p>Được đặc chế với công thức hỗn hợp những nguyên liệu chăm sóc và xả tóc giúp bảo vệ bề mặt tóc khỏi hư tổn và cải thiện vẻ bề ngoài của sợi tóc - mà không làm sợi tóc nặng hơn. </p>', N'null', N'Images/sanpham/my-pham/cham-soc-toc/dau-sa-shiseido-prior-chong-toc-bac-va-giu-mau-toc-nhuom.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (20, N'Mặt Nạ Đất Sét Keihl''s Rare Earth Deep Pore Cleansing Masque 142g', 20, N'<p>Mặt nạ làm nhỏ lỗ chân lông, thải độc và thanh lọc cho làn da của bạn </p> <p> Với thành phần từ nguồn đất sét vùng Amazon giàu khoáng chất giúp loại bỏ độc tố trên da, làm sạch da, thu nhỏ lỗ chân lông, đẩy mụn dưới da, mụn đầu đen, kiểm soát dầu cho da nhờn. </p> <p> Phù hợp cho da thường và da dầu. Dùng được cho cả nam và nữ. Tuần 2 lần. Rửa mặt sạch và bôi 1 lớp mỏng lên mặt để khoảng 10-15 phút, sau đó rửa sạch bằng nước. </p> ', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/mat-na-dat-set-keihl-s-rare-earth-deep-pore-cleansing-masque-142g.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 680000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (21, N'Kiehl''s Blue Herbal Spot Treatment- Gel Trị Mụn Siêu Tốc Của Kiehl''s 15ml', 20, N'<p> Gel trị mụn siêu tốc KIEHL''S thảo dược lành tính trong suốt, thấm nhanh.</p> <p> Chiết xuất từ vỏ quế chứa tinh dầu không chỉ có tác dụng làm dịu giảm sưng mà còn có tác dụng kháng khuẩn hiệu quả.</p> <p>Có thể bôi trực tiếp lên các đốm mụn, tiêu trừ mụn bọc đã hình thành hay hạn chế nốt mụn có dấu hiệu hình thành.</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kiehl-s-blue-herbal-spot-treatment-gel-tri-mun-sieu-toc.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 520000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (22, N'Kielh''s Calendula Herbal Extract Toner- Toner Chiết Xuất Từ Hoa Cúc Của Kielh''s 250ml', 20, N'<p>Chiết xuất từ hoa cúc và các thành phần thảo dược giúp làm dịu nhẹ làn da bị viêm, hết viêm sạch mụn.</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kiehl-s-calendula-herbal-extract-toner.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 890000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (23, N'Kiehl''s Ultra Facial Cleanser- Sữa Rửa Mặt Kielh''s Ultra 150ml', 20, N'<p> Nhẹ nhàng làm sạch mà không làm khô da, giúp cân bằng độ ẩm của da.</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kiehl-s-ultra-facial-cleaner.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 520000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (24, N'Sk-ii Set Genoptics Aura Essence', 18, N'<P> Set gồm:  </p> <p>1 chai tinh chất SK-II GENOPTICS Aura Essence 30ml.</p> <P> 1 chai nước thần 10ml. </p> <P> 1 chai nước hoa hồng 10ml. </p><P>1 hũ kem chống lão hoá 2.5gr. </p><P> SK-II GENOPTICS AURA ESSENCE phiên bản mới làm trắng da với thành phần hoạt chất làm trắng D- Merano™, Geno-flop caustics aura Cocktail cho bạn làn da trắng tỏa sáng. SK-II GENOPTICS ngăn chặn melanin, tàn nhang, cho làn da tỏa sáng từ bên trong.</p> <P>Với thiết kế nắp lọ thông minh giúp bạn lấy một lượng serum vừa đủ cho một lần sử dụng. </p> <P> SK-II GENOPTICS nhẹ và nhanh chóng thẩm thấu da, giữ ẩm và điều chỉnh độ ẩn cho da, loại bỏ melanin trên da giúp da trắng sáng và căng mịn dần lên trong 2-3 tuần sử dụng. </p>', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/sk-ii-set-genoptics-aura-essence.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 3200000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (25, N'Sk-ii Facial Treatment Essence 230ml', 18, N'<p> Nước thần SK-II ,phiên bản đặc biệt " Cánh bướm vườn xuân", chứa tới hơn 90% Pitera™, hoạt chất độc quyền của SK-II đem đến cho bạn một làn da mịn màng luôn bừng sáng. Được phát minh vào những năm 1980, với tinh chất Pitera™, chiết xuất từ rượu sake hảo hạng, được biết đến như một dưỡng chất thần thánh giúp tái tạo tế bào, nuôi dưỡng làn da một cách hoàn hảo nhất. </p> <p> FACIAL TREATMENT Essence của SK-II là một thứ chất lỏng hết sức kì diệu có tác dụng dưỡng ẩm, cải thiện cấu trúc da, nuôi dưỡng và giúp da căng bóng, khỏe mạnh. </p> <p> Làn da bạn sẽ trở nên căng bóng và tràn đầy sức sống. </p> <p>Vết thâm, nám và các tì vết sẽ được cải thiện đáng kể. </p> <p>Vết nhăn giảm một cách rõ rệt. </p> <p> Giảm bã nhờn cho da, se khít lỗ chân lông. </p>', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/sk-ii-facial-treatment-essence-230-ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 3200000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (26, N'Set Sk-ii Kem Rna Chống Lão Hoá 50gr', 18, N'<p> Chưa có thông tin mô tả.</p>', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/set-sk-ii-kem-rna-chong-lao-hoa-50-gr.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (27, N'Sk-ii Full Line Trial Kit Phiên Bản Hoa Anh Đào.', 18, N'<p>Set gồm: </p><p> 1 chai nước thần 75ml. </p><p>1 tuýp sữa rửa mặt 20gr. </p><p> 1 hũ gel tẩy trang 15gr. </p><p>1 hũ kem chống lão hoá 15gr. </p>', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/sk-ii-full-line-trial-kit-phien-ban-hoa-anh-dao.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1700000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (28, N'Sk-ii Set Trị Thâm Nám', 18, N'<p>Set gồm: </p><p> 1 chai tinh chất trị thâm nám 30ml. </p><p> 1 chai nước thần 10ml.. </p><p> 1 chai nước hoa hồng 10ml. </p><p>1 hũ kem chống lão hoá 25gr. </p>', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/sk-ii-set-tri-tham-nam.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 2250000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (29, N'Tinh Chất Chống Lão Hoá Sk-ii R.n.a Power Radial 50ml', 18, N'<p>Dòng tinh chất R.N.A Power Essence chống lão hóa thế hệ mới mang đến cho bạn một đẳng cấp mới về một làn da khỏe mạnh, săn chắc từ mọi góc độ chỉ sau 10 ngày sử dụng.
Chỉ sau 1 ngày sử dụng bạn có thể cảm nhận được làn da săn chắc. Sau 10 ngày, làn da của bạn sẽ săn chắc hơn, mịn màng hơn, và rạng rỡ hơn rất nhiều. </p> <p>– Pitera + Radical New Age Complex (Thủy phân hóa Đậu nành và protein từ nấm men): tăng độ đàn hồi cho da theo cả chiều ngang và dọc </p> <p>– Chlolleragan: lấp đầy những nếp nhăn </p> <p>– Glyco Repair (chiết xuất từ Carob): thay đổi, tác động tái tạo bề mặt da </p>', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/tinh-chat-chong-lao-hoa-sk-ii-r-n-a-power-radial-50ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (30, N'Kem Đêm Skii Whitening Source Derm Brightener 75gr (Làm Trắng, Trị Nám, Tàn Nhang)', 18, N'<p>Kem dưỡng làm trắng, trị nám tàn nhan Whitening Source Derm Brightener SK II được đặc chế với tinh chất SK-II Exfoliation ( bao gồm  Pitera™, salicylic acid và phytic acid ) giúp lên tone ,tại tạo da do bị tàn phá bởi tia uv,giữ gìn vẽ đẹp tự nhiên cho da ,làm mờ các vết thâm nám tàn nhan hiệu quả chỉ sau 1 tháng sử dụng.</p> <p></p>Công nghệ MD-Magnet  loại bỏ melanin ngay trên bề mặt da,Công thức chăm sóc DNA special releasing  cung cấp vitamin C và E trực tiếp trên da khô ráp nhất. <p>Chống Lão hóa,Ngăn ngừa da dưới tác động của quá trinh oxy hóa,làm mịn cho làn da không đồng đều và thô.</p> <p>Công thức đặc biệt của SKII còn giữ ẩm sâu, kiểm soát  mụn, cho da bạn đẹp mịn màng không tì vết.</p> ', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/kem-dem-sk-ii-whitening-source-derm-brighterner.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 2300000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (31, N'Sk-ii Stempower Eye Cream- Kem Dưỡng Mắt Sk-ii 15gr', 18, N'<p> SK-II STEMPOWER EYE CREAM với công thức chống lão hoá mạnh được kết hợp với Stem-Accanex Eye và Pitera™ giúp phục hồi từ bên trong, tăng cường khả năng chống oxy hoá, giảm thâm quầng và ngăn ngừa sự xuất hiện của các nếp nhăn.</p>', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/sk-ii-stempower-eye-cream.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 2050000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (32, N'Sữa Rửa Mặt Sk-ii Facial Treatment Gentle Cleanser 120gr', 18, N'<p> Phù hợp với mọi loại da, nhẹ nhàng loại bỏ các tạp chất, bụi bẩn trên da nhưng vẫn không làm khô da.</p>', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/sua-rua-mat-sk-ii-facial-treatment-gentle-cleanser-120gr.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1150000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (33, N'Sk-ii  Full Line Trial Kit ', 18, N'<p>SK-II  FULL LINE TRIAL KIT cho làn da căng mướt, giảm mụn, giảm bã nhờn và se khít lỗ chân lông. </p> <p>Set gồm:   </p> <p>  1 chai nước thần 75ml.</p> <p> 1 tuýp sữa rửa mặt 20gr. </p> <p> 1 hũ gel tẩy trang 15gr. </p> <p> 1 hũ kem chống lão hoá 15gr. </p>', N'null', N'Images/sanpham/my-pham/duong-da/sky-ii-cao-cap/sk-ii-full-line-trial-kit.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1700000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (34, N'Trilogy Rosehip Oil Antioxidant-tinh Dầu Hoa Tầm Xuân 30ml', 19, N'<p>TRILOGY là hãng mỹ phẩm của New Zealand được chứng nhận là hãng mỹ phẩm thiên nhiên sạch hữu cơ, được chiết xuất hoàn toàn từ thiên nhiên và hữu cơ không chứa hương liệu cũng như các thành phần gây hại đến sức khỏe con người. Vì vậy, sản phẩm lành tính ngay cả với làn da nhạy cảm nhất. </p> <p>Trilogy rất nổi tiếng với sản phẩm tinh dầu nụ tầm xuân Rosehip Oil với rất nhiều giải thưởng đình đám và được rất nhiều ngôi sao nổi tiếng yêu thích tin dùng.Công nương Kate, vợ của hoàng tử Anh William đã tin dùng Trilogy Rosehip Oil để chăm sóc da trong suốt thai kỳ. </p> <p>Khi được hỏi về bí quyết làm đẹp cải mình, cựu siêu mẫu của Victoria Secret Mỉranda Kerr đã tiết lộ rằng cô dùng Rosehip Oil mỗi tối trước khi đi ngủ bởi nó chứa rất nhiều chất chống oxy hoá nên sẽ trẻ hoá tế bào và làm tươi trẻ làn da. </p><p>Trilogy Rosehip Oil có tác dụng điều trị thâm mụn, làm đều màu da, chữa các vết da rạn, các nếp nhăn do lão hoá và 
cung cấp nước cho da, giúp da căng bóng. </p> ', N'null', N'Images/sanpham/my-pham/duong-da/trilogy/trilogy-rosehip-oil-antioxidant.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 750000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (35, N'Trilogy Balancing Face Lotion 100ml ', 19, N'<p>TRILOGY Balancing Face Lotion với tinh dầu cây tầm xuân,hoa cúc kim tiền, tinh dầu quả mơ,lá trà xanh giúp cân bằng độ ẩm, thẩm thấu nhanh, là lớp dưỡng tuyệt vời trước khi bôi các lớp kem dưỡng khác.</p>', N'null', N'Images/sanpham/my-pham/duong-da/trilogy/trilogy-balancing-face-lotion-100ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 990000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (36, N'Trilogy Raspence Night Cream 60ml', 19, N'<p>Kem dưỡng da ban đêm TRILOGY Rosapene Night Cream chứa tinh dầu tầm xuân và mật ong manuka với nhiều vitamin A,C, các axit béo thiết yếu như omega 3, omega 6 rất cần thiết cho da. </p> <p>Tinh dầu tầm xuân có tác dụng tái tạo trẻ hoá da, phục hồi các vết chân chim quanh mắt, giảm hiện tượng khô da, giúp da sáng bóng. </p>', N'null', N'Images/sanpham/my-pham/duong-da/trilogy/trilogy-raspence-night-cream-60ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1050000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (37, N'Trilogy Very Gentle Cleasing Cream 150gr', 19, N'<p>Sữa rửa mặt TRILOGY Cream CLEANSER với tinh chất dầu tầm xuân kết hợp với các dưỡng chất từ thiên nhiên, là sự kết hợp 2 trong 1 giữa sữa rửa mặt và kem tẩy trang mang đến cho bạn một làn da sạch bụi bẩn, mịn màng mà không bị khô da.</p>', N'null', N'Images/sanpham/my-pham/duong-da/trilogy/trilogy-very-gentle-cleasing-cream-150gr.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 790000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (38, N'Tẩy Tế Bào Chết Trilogy Gentle Facial Exfoliant 75 Ml', 19, N'<p>TRILOGY Gentle Facial Exfoliant với chiết xuất hoàn toàn từ thiên nhiên: </p> <p>Sáp jojoba với các hạt mềm dịu siêu nhỏ không gây kích ứng da mà chỉ làm sạch sâu lấy đi các tế bào chết.   </p> <p>Rosehip Oil tinh dầu hoa tầm xuân không pha trộn giúp da bạn mềm và được dưỡng ẩm. </p> <p>Tinh dầu chi trà( camellia Oil) rất nổi tiếng ở Nhật Bản với nhiều hoạt chất chống oxy hoá, có khả năng làm sạch cao nhưng vẫn nhẹ nhàng và an toàn tuyệt đối cho làn da của bạn. </p> <p>Mật ong Manuka từ New Zealand chứa rất nhiều chất khoáng, vitamin và enzyme giúp chữa lành vết thương hay làn da đang bị bong tróc. </p> <p>Có thể sử dụng 1-2 lần/ tuần. </p><p>Xoa đều lượng vừa đủ lên mặt đã được làm ẩm theo hình tròn.
Sau khi massage, rửa sạch lại với nước ấm. </p>', N'null', N'Images/sanpham/my-pham/duong-da/trilogy/trilogy-gentle-facial-exfoliant-75ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (39, N'Trilogy Coq10 Eye Recovery Concentrate 7.5ml', 19, N' <p>Làm giảm các vết nhăn, vết chân chim, chống lão hoá, làm trẻ hoá vùng da quanh mắt. </p> <p>Green coffee extract cho ta chất caffein trong lá cà phê vừa giúp các tế bào da rắn chắn ngay tức thì cũng như có tác dụng lâu dài. </p> <p>Horse chestnut extract là loại thảo dược vốn được biết đến với các công sụng làm lành da của nó. Horse chestnut khá giàu silica, magnesium nên nó hỗ trợ cho da được khoẻ mạnh, dưỡng da mềm mịn, làm cho da căng bóng, từ đó sẽ có làn da trẻ hơn. </p> <p>Mulberry root extract (chiết xuất rễ cây mạn việt quất) có hiệu quả khả quan trong việc nuôi dưỡng làn da trắng sáng và đem lại cho da độ căng bóng rạng rỡ trẻ trung. </p> <p>Licorice root extract có độ ẩm giúp ổn định da, chữa lành da khỏi các loại kích ứng; khả năng khử trùng, chống lão hoá da. Làm trắng da cũng là một trong những tác dụng hiệu quả của licorice root extract
Cucumber fruit extract (chiết xuất cây dưa leo) giúp làm dịu mát, giảm độ nhạy cảm cho da đang bị căng thẳng, kích ứng. Ngoài ra dưa leo còn cung cấp nước cho da độ ẩm cao và làm trắng sáng da. </p> <p>Coenzyme Q10 là một hợp chất tự nhiên trong cơ thể đóng vai trò chống oxy hóa bảo vệ màng lipid tế bào, đặc biệt góp phần ngăn quá trình oxy hóa. Do đó, Coenzyme Q10 vẫn thường được nhắc đến như một thành phần chống bảo vệ làn da khỏi sự tàn phá của lão hóa như xóa nếp nhăn, tăng đàn hồi giúp da căng mịn. </p> <p>Lắc đều chai trước khi lăn vào vùng dưới mắt. </p>', N'null', N'Images/sanpham/my-pham/duong-da/trilogy/trilogy-coq10-eye-recovery-concentrate-7-5ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (40, N'Trilogy Starter Set for Combination/oily Skin-set Dùng Thử Dành Cho Da Dầu, Da Hỗn Hộp', 19, N'<p>Set dùng thử cho da hỗn hợp/ da dầu gồm 1 tuýp rửa mặt 30 ml, 1 chai Rosehip Oil Antioxidant 10 ml và 1 tuýp kem Balancing Lotion 20 ml.</p>', N'null', N'Images/sanpham/my-pham/duong-da/trilogy/trilogy-starter-set-for-combination-only-skin-set.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 660000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (41, N'Trilogy Starter Set for Sensitive-set Dùng Thử Cho Da Nhạy Cảm', 19, N'<p>Set dùng thử dành cho da nhạy cảm gồm 1 tuýp sữa rửa mặt dịu nhẹ 30ml, 1 chai tinh chất Very Gentle Calming Serum dành cho da nhạy cảm và 1 tuýp kem dưỡng 20ml.</p>', N'null', N'Images/sanpham/my-pham/duong-da/trilogy/trilogy-starter-set-for-sensitive-set.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (42, N'Trilogy Starter Set for Normal/dry Skin-set Dùng Thử Dành Cho Da Thường', 19, N'<p> Set dùng thử dành cho da thường/ khô gồm 1 tuýp sữa rửa mặt 30ml, 1 chai tinh dầu rosehip Antioxidant 10ml và 1 tuýp kem dưỡng  20 ml.</p>', N'null', N'Images/sanpham/my-pham/duong-da/trilogy/trilogy-starter-set-for-normal-dry-skin-set.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (43, N'Set Nước Hoa Prada Candy Kiss!', 15, N' <p>Gồm 3 chai nước hoa Prada sang chảnh mỗi chai 20ml: </p> <p>PRADA Candy Eau De Parfum 20ml với phong cách hiện đại, quyến rũ và sang trọng. Mùi hương đặc trưng: xạ hương, vanilla và caramel. </p> <p>PRADA Candy L''eau 20ml với hương thơm của xạ hương trắng, caramel, hoa đậu ngọt, mùi cam quýt pha trộn vào nhau tạo nên sự tươi mới và lãng mạn. </p> <p>PRADA Candy Florale 20ml được lấy cảm hứng từ vẻ mềm mại và tỏa sáng của các loài hoa với mùi hương giống như một viên kẹo ngọt hay là một bó hoa trên quầy của một cửa hàng kem ở Ý. </p>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/set-nuoc-hoa-prada-candy-kiss.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1980000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (44, N'Set Nước Hoa Marc Jacobs', 15, N'<p> Chưa có thông tin mô tả.</p>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1350000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (45, N'Nước Hoa Lancome La Vie Est Belle Edp 50ml', 15, N'<p> Chưa có thông tin mô tả.</p>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/nuoc-hoa-lancome-la-vie-est-belle-edp-50ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (46, N'Marc Jacobs Decadence 100ml', 15, N'<p>Hương thơm DECADENCE quyến rũ là sự kết hợp đỉnh cao của hương đầu gồm mận Ý, hoa Diên Vỹ, nghệ tây. Kế đến là tầng hương lãng mạn của hoa hồng Bulgari,hoa nhài, tinh dầu cây Orris và hương cuối đầy vấn vương với cỏ vetiver, gỗ Papyrus và hổ phách. </p> <p>Marc Jacobs Decadence mang đến cho các cô gái hương thơm sexy rất tinh tế. Đó là lí do thiên thần mang vẻ đẹp nóng bỏng và hoang dại của Victoria''s Secret - Adriana Lima được chọn là gương mặt đại diện cho dòng nước hoa này. </p> <p>Không chỉ độc đáo với mùi hương của niềm đam mê đầy sang trọng,Marc Jacobs Decadence còn được thiết kế như một chiếc túi xách màu xanh ngọc bích vương giả, nắp đậy mô phỏng lớp da rắn uy quyền điểm xuyết bằng sợi xích vàng gợi lên sự sang trọng và quyến rũ. </p>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/marc-jacobs-decandence-100ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 2800000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (47, N'Set Nước Hoa Lancome Mini Dành Cho Nữ', 15, N'<p> Chưa có thông tin mô tả.</p>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/set-nuoc-hoa-lancome-mini-danh-cho-nu.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1200000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (48, N'Set Nước Hoa Bvlgari Mini Dành Cho Nam', 15, N'<p>Set nước hoa mini Bvlgari dành cho nam với 5 hương thơm tiêu biểu và đặc sắc được thiết kế nhỏ gọn và sang trọng dành cho quý ông thanh lịch. </p> <p>Set gồm 1 chai Bvlgari Pour Homme 5 ml 
                           1 chai Bvlgari Aqva Amara 5ml.
                           1 chai Bvlgari Aqva Pour Homme 5ml.
                           1 chai Bvlgari Man In Black 5ml.
                           1 chai Bvlgari Man Extreme 5ml. </p>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/set-nuoc-hoa-bvlgari-danh-cho-nam.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1300000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (49, N'Set Nước Hoa Mini Lancome - the Best of Lancome Dành Cho Nữ', 15, N'<p>Là món quà rất dễ thương, xinh xắn và giá trị dành cho những người thương yêu nhất! </p> <p>Bộ sản phẩm này gồm 5 mùi hương của 5 loại nước hoa nổi tiếng gắn liền với tên tuổi của hãng mỹ phẩm lừng danh của nước Pháp- Lancome. </p> <p>Set gồm:  Miracle Eau De Parfum 5ml.

                      Tresor In Love Eau De Parfum 5ml.

                      Tresor Eau De Parfum 7.5ml.

                      Hypnôse Eau De Parfum 5ml.

                      Poême Eau De Parfum 4ml. </p>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/set-nuoc-hoa-mini-lancome-the-best-of-lancome-danh-cho-nu.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1050000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (50, N'Set Nước Hoa Burberry Dành Cho Nữ', 15, N'<pre>1 chai Burberry Brit Rhythm For Her Floral Eau De Toilette 5ml.
1 chai Burberry Brit For Her Eau De ParFum 5ml.
1 chai Burberry Brit Sheer For Her Eau De Toilette 5ml.
1 chai Burberry Brit Rhythm For Her Eau De Toilette 5ml.
1 chai Burberry Brit For Her Eau De Toilette 5ml.</pre>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/set-nuoc-hoa-burberry-danh-cho-nu.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1300000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (51, N'Set Nước Hoa Burberry Mini Dành Cho Nữ', 15, N'<p>Set nước hoa mini Burberry dành cho nữ với những mùi hương đầy đam mê và quyến rũ. </p> <pre>1 chai Burberry Eau De Parfum 4.5ml.
           1 chai Burberry Brit Rhythm For Her 5ml.
           1 chai Burberry Body Eau De Parfum 5ml.
           1 chai Burberry London Eau De Parfum 4.5ml.
           1 chai Burberry Brit Sheer For Her Eau De Toilette 5ml. </pre>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/set-nuoc-hoa-burberry-mini-danh-cho-nu.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1300000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (52, N'Set Nước Hoa Mini Bvlgari Dành Cho Nữ', 15, N'<p>Set nước hoa mini Bvlgari dành cho nữ với hương thơm quyến rũ, nồng nàn. </p> <pre>1 chai Bvlgari Jasmin Noir Eau De Parfum 5ml.
           1 chai Bvlgari Mon Jasmin Noir Eau De Toilette 5ml.
           1 chai Bvlgari Omnia Indian Garnet Eau De Toilette 5ml.
           1 chai Bvlgari Omnia Amethyste Eau De Toilette 5ml.
           1 chai Bvlgari Omnia Crystaline Eau De Toilette 5ml. </pre>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/set-nuoc-hoa-mini-bvlgari-danh-cho-nu.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1350000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (53, N'Nước Hoa Aqua Di Gio 30ml', 15, N'<p>Acqua Di Gio Pour Homme được lấy cảm hứng từ những gì tinh túy nhất của biển khơi, ánh mặt trời, đất mẹ và những cơn gió lồng lộng của những hòn đảo miền biển Địa Trung Hải. Với hương thơm tinh khiết, ngào ngạt và nồng nàn mùi gỗ, mùi hương thoang thoảng của gió biển, quả chín, và cây cỏ, Acqua Di Gio Pour Homme là sự thể hiện rõ ràng nhất của nam tính ở mỗi người đàn ông. </p> <pre>Mùi hương đặc trưng:

Hương đầu: Hương thơm của biển, Quýt, Chanh yên

Hương giữa: Dầu hoa cam, Hương thảo, Hoa sung.

Hương cuối: Hoắc hương, vani, Xạ hương.

Phong cách:

Tinh khiết, hiện đại, nam tính </pre>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/nuoc-hoa-aqua-di-gio-30ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 750000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (54, N'Lancome Miracle Edp 30ml ', 15, N'<p>Vẻ đẹp của con người nằm trong sự tận hưởng và cảm thụ sự diệu kỳ của cuộc sống, trong khả năng biến từng giây phút cuộc đời thành một phép mầu. Lancôme đã chọn cho Miracle gương mặt của Uma Thurman: một người phụ nữ đương đại, tự chủ, xinh đẹp và tao nhã; một người vừa lãng mạn vừa thực tế, ẩn chứa nét bí ẩn trong từng bước chuyển động. </p> <p>Miracle của Lancôme mang đầy đủ tính chất của một loại nước hoa Phương Đông hiện đại, với mùi hương mọng nước của quả vải, hỗn hợp hoa mộc lan và huệ tím, kết hợp cùng gừng, tiêu để rồi lưu lại trên cơ thể bạn là mùi hương nồng nàn của xạ hương và hổ phách. </p> <p>Mùi hương đặc trưng: Lan Nam Phi, Quả vải, Hoa mộc lan, Hoa huệ, Hoa lài, Gừng, Tiêu, Hổ phách, Xạ hương. </p> <p>Phong cách: Hiện đại, tao nhã, kì diệu. </p>', N'null', N'Images/sanpham/my-pham/nuoc-hoa/lancome-miracle-edp-30ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (55, N'Miếng Thấm Hút Mồ Hôi Nách Riff Nhật Bản Hộp 40 Miếng ', 9, N'<p>+ Miếng lót thấm mồ hôi nách sẽ hút thật khô mồ hôi, không để thấm ra ngoài gây mất thẩm mỹ, đồng thời giữ cho nách luôn khô thoáng… </p> <p>+ Đặc biệt miếng dán sẽ vô cùng hữu dụng khi bạn hoạt động ngoài trời, khi đi du lịch hay chơi thể thao… </p> <p>+ Phù hợp sử dụng trong mùa hè. </p>  <p>+ Có lớp keo dính siêu mỏng tiện dụng dùng 1 lần trong ngày. </p>  <p>Gỡ lớp keo ra và dán vào nách áo. </p>', N'null', N'Images/sanpham/thoi-trang-cho-ban/mieng-dan-chong-mo-hoi-nach-riff-nhat-ban-40-mieng.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 260000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (56, N'Tảo Xoắn Spirulina Nhật Bản', 39, N'<p>Tảo xoắn Spirulina Nhật Bản đã được các người dân nhật bản sử dụng thường xuyên như 1 món ăn hàng ngày của họ vậy. Các nhà khoa học người Nhật nghiên cứu cho rằng người trung niên và người già dùng tảo Spirulina Nhật Bản và chịu khó vận động sẽ là bí quyết trường trọ hiệu quả nhất</p> <p>Sau khi chúng ta dùng tảo xoắn Spirulina Nhật Bản tất cả các loại dinh dưỡng mà cơ thể cần đều được bổ sung đồng thời cùng lúc, làm thúc đẩy quá trình trao đổi chất, đồng hóa tổ chức, tăng cường sức đề kháng từ đó đạt được mục đích phòng chống bệnh tật và thúc đẩy phục hồi sức khỏe.</p> <p>Đặc điểm nổi bật của tảo xoắn Spirulina, hàng nội địa Nhật Bản:.</p>*  Giàu chất chống oxy hoá.<p> <p>*  Tăng cường hệ miễn dịch cho cơ thể.</p> <p>*  Chứa hơn 60% protein tự nhiên, dễ tiêu hoá.</p> <p>*  Đa dạng dưỡng chất có nguồn gốc thực vật.</p> <p>*  Chứa nhiều Acid béo cần thiết GLA, Sắt dễ hấp thu.</p> <p>*  Không có caffeine và hoàn toàn không có thuốc trừ sâu, thuốc diệt cỏ.</p> <p>Sản phẩm hỗ trợ tăng cân này có chứa nhiều loại chất chống lão hóa như β-caroten, axít γ-linoleic, vitamin E. Những chất này có khả năng loại bỏ các gốc tự do thông qua tác dụng chống ôxi hóa, làm chậm sự lão hóa của tế bào, đồng thời sắt, canxi có nhiều trong tảo vừa dễ hấp thụ vừa có tác dụng phòng và hỗ trợ điều trị các bệnh thường gặp ở người già như lão hóa, thiếu máu và loãng xương.</p>  <p>Tác dụng của Tảo Xoắn Spirulina, hàng nội địa Nhật Bản:</p> <p> *  Hỗ trợ ngăn ngừa nguy cơ gây ung thư,hỗ trợ hệ tim mạch, hệ tiêu hoá</p> <p> *  Tăng cường sinh lực cho đàn ông, tráng dương bổ thận.</p> <p>*  Giảm Cholesterol trong máu.</p><p>*  Chống lão hóa da.</p> <p>  *  Nâng cao sức đề kháng, giảm béo phì, tăng thị lực.</p> <p>*  Giảm các bệnh mỡ máu, tiểu đường, gout.</p> <p>*  Làm da mặt phụ nữ mịn màng hơn, giảm các vết nhăn, nám …</p> <p>Cách sử dụng: </p> <p> *  Dùng từ 20 - 40 viên/ngày theo tiêu chuẩn của người Nhật.</p> <p> *  Trẻ em trên 5 tuổi có thể uống từ 10 - 20 viên mỗi ngày. </p>  <p> *  Trẻ em dưới 5 tuổi uống từ 3 - 5 viên mỗi ngày. </p>  <p> *  Nên uống thật nhiều nước khi dùng tảo để có kết quả tốt hơn.</p>  <p>  *  Nếu bạn muốn giảm cân thì nên uống trước bữa ăn 30 phút. Còn bạn muốn tăng cân thì nên uống sau bữa ăn. </p>  ', N'null', N'Images/sanpham/thuc-pham-chuc-nang/ho-tro-chong-ung-thu/tao-xoan-spirulina-nhat-ban.jpg', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (57, N'Cháo Hải Sản Nhật Bản', 29, N'<p>Cháo hải sản Nhật Bản thơm ngon, bổ dưỡng.Chỉ cần hâm nóng là đã có một tô cháo đầy đủ chất dinh dưỡng.<p>', N'null', N'Images/sanpham/thuc-pham-dinh-duong/chao-an-lien-do-an-dam/chao-hai-san-nhat-ban.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (58, N'Giấy Tẩy Trang Bifesta', 16, N'<p>Giấy Tẩy Trang Bifesta, hàng nội địa NHẬT BẢN, giúp tẩy trang lớp trang điểm trên da bạn mà không gây kích ứng, không khô da và không bí lỗ chân lông.</p><p>  Mặt nạ làm nhỏ lỗ chân lông, thải độc và thanh lọc cho làn da của bạn.</p><p> Với thành phần từ nguồn đất sét vùng Amazon giàu khoáng chất giúp loại bỏ độc tố trên da, làm sạch da, thu nhỏ lỗ chân lông, đẩy mụn dưới da, mụn đầu đen, kiểm soát dầu cho da nhờn. </p> <p> Phù hợp cho da thường và da dầu. Dùng được cho cả nam và nữ. Tuần 2 lần. Rửa mặt sạch và bôi 1 lớp mỏng lên mặt để khoảng 10-15 phút, sau đó rửa sạch bằng nước. </p>', N'null', N'Images/sanpham/my-pham/trang-diem-lam-dep/giay-tay-trang-bifesta.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (59, N'Tinh Chất KIEHL''S Daily Reviving Concentrate 15ML', 20, N'<p>Tinh chất dưỡng ngày Kiehl''s Daily Reviving CONCENTRATE được chiết xuất từ củ gừng và tinh dầu hoa hướng dương với hương thơm thảo mộc dịu nhẹ giúp bạn khởi đầu một ngày mới với tinh thần thật sảng khoái với một làn da rạng ngời.</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/tinh_chat_kiehl_s_daily_reviving_concentrate_15ml.jpg', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 700000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (60, N'Tinh Chất KIEHL''S Midnight Recovery Concentrate 15ML', 20, N'<p>Tinh chất dưỡng đêm Kiehl''s Midnight RECOVERY Concentrate là sản phẩm đoạt nhiều giải thưởng uy tín nhất về làm đẹp và chăm sóc da. Đặc biệt 1100K/30ML</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/tinh-chat-kiehl-s-midnight-recovery-concentrate-15ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 700000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (61, N'Mặt Nạ Kiehl''s Cilantro & Orange Extract 75ml', 20, N'<p>Mặt nạ KIEHL''S Cilantro & 0range chiết xuất từ rau ngò và cam bảo vệ da khỏi chất gây hại của ô nhiễm môi trường, giúp da mềm mại và tái tạo da.</> <p>Được chiết xuất từ cam có rất nhiều vitamin A,B, C và P và axit folid và nhiều khoáng chất và chất xơ giúp sáng da, làm sạch da và phục hồi làn da.</p> <p>Ngoài ra, với tính năng detox thải độc giúp da không bị xỉn màu, hết mụn nhọt và chống lão hoá.</p> <p>Rửa mặt sạch, bôi một lớp mỏng lên mặt và để khoảng 10 phút.
Bạn sẽ có một làn da tràn đầy sức sống và tươi trẻ vào sáng hôm sau </p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/mat-na-kiehl-s-cilantro-orange-extract-75ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 680000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (62, N'Mặt Nạ Kiehl''s Turmeric & Cranberry Seed 75ml.', 20, N'<p> Chiết xuất từ nghệ và quả nam Việt quất giúp thanh lọc và làm sáng da ngay tức thì, nhẹ nhàng tế bào chết.</p> <p> Từ xưa, trong y học phương Đông đã rất coi trọng dược tính của củ nghệ trong việc kháng viêm, chống oxy hoá và tăng khả năng tái tạo tế bào.</p>  <p>Nghệ giúp giảm thâm, mụn, sáng da,chống oxy hoá,làm mờ sẹo, giúp da sáng và đều màu. Giảm lượng dầu trên da và bài tiết bã nhờn. </p>  <p> Quả nam Việt quất chứa rất nhiều omega 3 và omega 9 giúp da căng mọng, chống oxy hoá và giúp da khỏe.</p> ', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/mat-na-kiehl-s-turmeric-cranberry-seed-75ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 680000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (63, N'Nước Thần Kiehl''s Iris Extract Activing Treatment Essence 200ml', 20, N'<p>Nước thần KIEHL''S IRIS EXTRACT ACTIVATING TREATMENT ESSENCE </p>  <p>KIEHL''S IRIS EXTRACT ACTIVATING TREATMENT ESSENCE được coi là bước thiết yếu đầu tiên trong chu trình dưỡng da để duy trì kết cấu trẻ trung của làn da, giảm nếp nhăn, và kích hoạt đánh thức da hấp thụ các bước dưỡng sau được hiệu quả. </p>  <p>GIÁ mới: 850K/ chai 200ML,   220K/ chai 40ML. </p> ', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/nuoc-than-kiehl-s-iris-extract-activing-treatment-essence-200ml.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 850000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (64, N'Kem Dưỡng Ẩm Trị Thâm Thâm Nám Keihl''s Deep Moisture Clarifying Cream 50ml', 20, N'<p>Kem dưỡng ẩm trị thâm nám , làm trắng da Kiehls Clearly Corrective White - biện pháp cứu cánh cho những làn da không đều màu, bằng cách ngăn chặn các sắc tố, giảm bớt các điểm tối trên da ( như thâm, sạm, nám...) khiến da bừng sáng và mịn màng. Làn da bạn sẽ được cải thiện thấy rõ trong vòng từ 4 -12 tuần. </p> <p>Clearly Correactive white là kem dưỡng ẩm được sử dụng sau bước huyết thanh Clearly Correactive Dark Spot Sution, giúp dưỡng ẩm da và cung cấp độ ẩm trong 24h đồng hồ, cùng với huyết thanh hỗ trợ làm giảm các đốm đen giúp da sáng đều màu lên trông thấy. Không những vậy, kem còn giúp chăm sóc da săn và căng bóng, trắng sáng và khoẻ hơn. Sản phẩm không chứa Paraben. Sản phẩm đã được thử nghiệm bởi các bác sĩ da liễu và rất được tin dùng. </p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kem-duong-am-tri-tham-nam.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1000000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (65, N'Tinh Chất Trị Thâm Nám Làm Trắng Da Kiehl''s Clearly Corective Dark Spot Solution ', 20, N'<p>Lấy lại vẻ rạng rỡ, mịn màng của làn da với tinh chất trị thâm nám KIEHL''S  Clearly Corrective Dark Spot Solution.  </p> <p>Được tăng cường hoạt chất Vitamin C thế hệ mới và chiết xuất từ những bông hoa mẫu đơn quý giá, tinh chất giúp làm mờ các vết thâm do mụn, giảm sự xuất hiện của hắc sắc tố và cải thiện cấu trúc tổng thể của da.  </p> <p>GIÁ 30ML: 1090K,  50ML : 1350K. </p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/tinh-chat-tri-tham-nam-lam-trang-da.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 0.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (66, N'Sữa Meiji số 0 - 1 Mẫu 800g', 23, N'<p> Sữa Meiji số 0 - 1 (mẫu mới 800g) cho bé từ 0 đến 1 tuổi hàng xách tay có bill mua từ siêu thị Nhật. </p>
<p> Sữa Meiji số 0 rất giống sữa mẹ, sữa mát, tăng sức đề kháng, nhiều DHA. Sữa Meiji giúp bé bú ngon không ngán, không táo bón, giúp bé thông minh, phát triển chiều cao tối ưu. </p>
<p> Trọng lượng:  Mẫu mới 800g, dạng lon thiếc. </p>
<p> Sữa Meiji số 0 là sản phẩm sữa cao cấp dành cho thị trường nội địa Nhật Bản, sữa cho bé trong độ tuổi từ 0-12 tháng, cung cấp những dưỡng chất để bé phát triển tốt nhất. </p>
<ul>
​<li> Bổ xung vi chất.</li>
<li> Phát triển trí não.</li>
<li> Tăng trưởng cơ thể.</li>
<li> Bổ sung chất sắt và canxi.</li>
<li> Tăng cân, tiêu hoá tốt.</li>
<li> Sữa mát, chống táo bón, giúp bé tăng cân tối ưu. Sữa có thành phần DHA giúp bé phát triển não bộ & thị lực tốt nhất.</li>
<li> Đặc biệt sữa không ngọt như các loại sữa khác và hòa tan trong nước ấm rất nhanh, không bị vón cụt, vì thế trẻ uống sẽ không bị ngán.</li>
</ul>
<p> Thành phần:</p>
<p> Lactose, các loại dầu ăn và chất béo, protein whey, casein, fructo-oligosaccharide, sữa bơ, dextrin, sữa bột tách kem, muối, chiết xuất phospholipid sữa, nấm men, pyrophosphate sắt, cacbonat Ca, axit photphoric Ca, cacbonat K, clorua Mg, vitamin C, inositol, clorua K, cholesterol, taurine, vitamin E, clorua Ca, kẽm sulfat, cytidylate Na, vitamin A, vitamin D, pantothenic axit Ca, Na uridylate, L-carnitine, niacin, acid inosinic Na, guanyl axit Na, 5''-AMP, đồng sunfat, vitamin B1, vitamin B2, vitamin B6, carotene, acid folic, vitamin K.</p>
<p> GIÁ: 600K/lon 800GR. </p>', N'null', N'Images/sanpham/sua-xach-tay/sua-nhat/sua_nhat_meji_so_0_1_800g.jpg', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 800000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (67, N'Bột nêm topvalu 192g cho trẻ em', 30, N'<p>Bột nêm topvalu 192g cho trẻ em làm từ cá ngừ đại dương.</p>
<p>Hạt nêm topvalu 192g nhật bản, hạt nêm với thành phần tự nhiên, tuyệt đối an toàn dùng để nêm trong chế biến thức ăn cho bé và gia đình bạn.</p>
<p>Thành phần:  Bột cá ngừ, bột tảo bẹ, thủy phân protein, men chiết xuất gia vị (amino acid), muối, dextrose.</p>
<ul>Bảng năng lượng trong 01 gram hạt nêm:
<li>Năng lượng 2kcal</li>
<li>Protein 0,2g</li>
<li>Lipid 0,0g</li>
<li>Carbohydrate11,2 0.3g</li>
<li>Natri 180mg</li>
</ul>
<p>Công dụng: Dùng để nêm trong quá trình chế biến thức ăn của gia đình, đặc biệt dùng nêm trong việc chế biến thức ăn cho trẻ em.</p>', N'null', N'Images/sanpham/thuc-pham-dinh-duong/do-nem-gia-vi-nau-an/bot_nem_topvalu_192g.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 150000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (68, N'Bột nêm Ajinomoto chiết xuất từ rong biển Nhật Bản', 30, N'<p>
- Bột nêm Ajinomoto chiết xuất từ rong biển, tạo nên vị ngọt thanh tự nhiên cho các món ăn của bé , giúp các món ăn có vị đậm đà hoàn toàn từ tự nhiên.
- Đặc biệt phù hợp chế biến cháo ăn dặm, ướp các món từ cá, thịt cho bé yêu.
</p>
<p>GIá: 140.000/gói gồm 8grx18 gói.</p>', N'null', N'Images/sanpham/thuc-pham-dinh-duong/do-nem-gia-vi-nau-an/bot_nem_ajinomoto_chiet_xuat_rong_bien.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 140000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (69, N'Máy Chụp Ảnh Ra Hình Liền Của Hãng Fujifilm Instax Mini Hello Kitty!', 50, N'<p>Xuất xứ: Fujifilm, hàng nội địa Nhật Bản, có bill mua hàng tại Nhật đầy đủ.</p>
<p>Dòng máy chụp ra ảnh luôn mà Fujifilm Nhật Bản mới sản xuất nhân sự kiện 40 năm ra mắt nhân vật Hello Kitty đình đám... Bản thân nó vốn là của mini 8 nhưng được thiết thế theo hình tượng của chú mèo Kitty dễ thương!</p>
<p>Chỉ cần bấm nút và chờ đợi vài giây là bạn có ngay tấm hình dễ thương.</p>
<p>Với kích thước nhỏ gọn chỉ hơn 300gr với ống kính tiêu cự cố định 60mm ở mặt trước và một đèn flash trợ sáng tích hợp sẵn trên thân máy giúp bạn chụp các bức ảnh trong môi trường ánh sáng yếu.</p>
<p>Để sử dụng máy, chỉ cần trang bị 2 quả pin tiểu đơn giản và tiện dụng.</p>
<p>Thiết kế cực dễ thương cùng với dây đeo tiện dụng và thời trang.</p>', N'null', N'Images/sanpham/hang-order/may_chup_anh_ra_hinh_lien_fujifilm_hello_kitty.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 2500000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (70, N'Máy Chụp Ảnh Lấy Ngay Fujifilm Instamini8 ', 50, N'<p>Máy được mua tại Nhật có bill mua hàng đầy đủ.</p>
<p>Máy chụp ảnh lấy ngay chính hãng Fujifilm với công nghệ Polaroid: Instax Mini 8. Màu sắc rực rỡ, thiết kế chuẩn mực.</p>
<p>Kích thước: 11.6 x 11.8 x 6.8 cm</p>
<p>Thông số kĩ thuật: </p>
<ul>
<li>Kích thước ảnh: 62 x 46 mm</li>
<li>Focus: 0.6 --> vô cùng</li>
<li>Tốc độ màn trập: 1/60s</li>
<li>Flash: 0.6m - 2.7m</li>
<li>Film: Instant mini film</li>
<li>Sử dụng pin AA</li>
</ul>', N'null', N'Images/sanpham/hang-order/may_chup_anh_ra_hinh_lien_fujifilm_instamini8.JPG', CAST(N'2016-09-17' AS Date), CAST(N'2016-09-17' AS Date), 1500000.0000, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (74, N'Sâm tươi Hàn Quốc loại 4 củ 1Kg', 10, N'<p> Chưa có thông tin mô tả.</p>', N'null', N'Images/sanpham/san-pham-tu-han-quoc/nhan_sam_han_quoc_loai_4_cu_1_kg.JPG', CAST(N'2016-09-14' AS Date), CAST(N'2016-09-17' AS Date), 2950000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (75, N'Sâm tươi Hàn Quốc loại 5 củ 1Kg', 10, N'<p> Chưa có thông tin mô tả.</p>', N'null', N'Images/sanpham/san-pham-tu-han-quoc/nhan_sam_han_quoc_loai_5_cu_1_kg.JPG', CAST(N'2016-09-14' AS Date), CAST(N'2016-09-17' AS Date), 2500000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (76, N'Sâm tươi Hàn Quốc loại 6 củ 1Kg', 10, N'<p> Chưa có thông tin mô tả.</p>', N'null', N'Images/sanpham/san-pham-tu-han-quoc/nhan_sam_han_quoc_loai_6_cu_1_kg.JPG', CAST(N'2016-09-14' AS Date), CAST(N'2016-09-17' AS Date), 2300000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (77, N'Sâm tươi Hàn Quốc loại 7 củ 1Kg', 10, N'<p> Chưa có thông tin mô tả.</p>', N'null', N'Images/sanpham/san-pham-tu-han-quoc/nhan_sam_han_quoc_loai_7_cu_1_kg.JPG', CAST(N'2016-09-14' AS Date), CAST(N'2016-09-17' AS Date), 2200000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (79, N'Mặt Nạ Ngủ Gekka Nhật Bản 80gr', 49, N'<p>Mặt nạ ngủ GEKKA thần thánh, đang là best seller làm mưa làm gió trên thị trường Nhật Bản với khả năng hữu hiệu trong việc làm trắng, chống lão hoá và se khít lỗ chân lông.</p>', NULL, N'Images/sanpham/my-pham/cac_loai_mat_na/mat_na_ngu_gekka_nhat_ban_80gr.JPG', CAST(N'2016-09-14' AS Date), CAST(N'2016-09-17' AS Date), 690000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (117, N'Rượu Phật Di Lặc Xuất Xứ Đài Loan', 11, N'<p>Rượu Phật Di Lặc là một loại rượu truyền thống đặc trưng cho văn hóa Đài Loan. Tượng Phật Di Lặc được làm bằng thủ công với chất liệu gốm sứ cao cấp, được phủ men sáng bóng tinh tế. Phật Di Lặc đứng tướng vai thùy lớn, khuôn mặt luôn nở nụ cười, tay trái cầm thỏi vàng được phủ vàng 24kara, mang lại niềm hy vọng, hạnh phúc, may mắn và giàu có.</p>', NULL, N'Images/sanpham/ruou-ngoai/ruou_ngoai_phat_di_lac_dai_loan.JPG', CAST(N'2016-09-27' AS Date), NULL, 950000.0000, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (119, N'Nước Súc Miệng Cao Cấp Nhật Bản Dành Cho Bé Yêu.', 40, N'<p>Chai họa tiết Disney ngộ nghĩnh, mùi thơm ngọt hấp dẫn chắc chắn sẽ giúp bé siêng vệ sinh răng miệng hơn.</p>', NULL, N'Images/sanpham/san-pham-cho-be-yeu/do-dung/nuoc_suc_mieng_cao_cap_nhat_ban.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 250000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (121, N'Kem Đánh Răng Lion Dành Cho Trẻ Em Hàng Nội Địa Nhật Bản', 40, N'

<p>Kem đánh răng Lion được triết xuất từ vị hoa quả tự nhiên, có vị thơm ngọt mát của dâu tây, kem đánh răng Lion không những không gây cảm giác sợ cho bé mà còn tạo ra sự thích thú cho bé khi bắt đầu làm quen với việc tập đánh răng.</p>

<p>Có thể nuốt được mẹ hoàn toàn yên tâm để bé tự chải răng cho mình với loại kem đánh răng đặc biệt này vì trong trường hợp nếu nuốt phải thì vẫn rất an toàn cho bé.</p>

<p>Sản phẩm có tác dụng thúc đẩy sự tạo men răng, giúp cung cấp canxi để răng chắc khoẻ ngừa sâu răng tối đa, bảo vệ và làm bóng men răng, chăm sóc răng và nướu còn non nớt của bé, giảm thiểu mảng bám răng, giúp cho bé luôn có hàng răng chắc khoẻ.</p>

<p>100 % Chiết xuất từ tự nhiên hoàn toàn an toàn cho bé.</p>

<p>Giá: 75K/ tuýp 60gr.</p>', NULL, N'Images/sanpham/san-pham-cho-be-yeu/do-dung/kem_danh_rang_lion_nhat_ban.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 75000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (123, N'Kính Ray-Ban sản xuất tại Ý', 50, N'<p> Vui lòng liên hệ để biết thêm chi tiết</p>', N'null', N'Images/sanpham/hang-order/Kinh_ray_italia.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 0.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (124, N'Sữa Bầu Morinaga Vị Cà Phê Hàng Xách Tay', 46, N'<p>Sữa Morinaga cho phụ nữ mang thai rất tốt,  phù hợp với chế độ dinh dưỡng cân bằng cần thiết cho mẹ và cho con. Dinh dưỡng trong sữa tập trung vào con nên không làm mẹ béo sau khi sinh, vị ngon, dễ uống kể cả những mẹ bị ốm nghén nặng.</p>', NULL, N'Images/sanpham/san-pham-cho-me-bau/thuc-pham/sua_bau_morigana_vi_ca_phe_hang_xach_tay.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 270000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (126, N'Sữa Bầu Morinaga Hàng Xách Tay Vị Trà Xanh', 46, N'<p> Vui lòng liên hệ để biết thêm chi tiết</p>', N'null', N'Images/sanpham/san-pham-cho-me-bau/thuc-pham/sua_bau_morigana_vi_tra_xanh_hang_xach_tay.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 0.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (127, N'Nấm Linh Chi Hàn Quốc', 10, N'<p>Theo các tài liệu cổ và những nghiên cứu khoa học gần đây, có thể tóm tắt tác dụng chủ yếu của Linh chi như sau:</p>', NULL, N'Images/sanpham/san-pham-tu-han-quoc/nam_linh_chi.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 1300000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (129, N'Mặt Nạ Ngủ Kiehl''s Ultra Facial Overnight Hydrating Masque 125ml', 20, N'<p>Mặt nạ ngủ phiên bản mới, đã được bổ sung thêm chiết xuất từ cỏ thực vật Fountain, có tính chịu hạn hán cao, nhờ đó càng làm tăng khả năng ngậm nước dưỡng ẩm và thực sự đem lại một làn da khỏe mạnh.</p>', NULL, N'Images/sanpham/my-pham/cac_loai_mat_na/mat_na_ngu_kiehls_ultra_facial_overnight.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 800000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (133, N'Mặt Nạ Lush Of Magnamity ', 20, N'<p>Lush Mask Of Magnaminty – mặt nạ được yêu thích qua “mọi thời đại” và luôn là một trong những best seller “đình đám” của nhà Lush. Sở hữu bảng thành phần “không chê vào đâu được” với những nguyên liệu “tươi” đến từ thiên nhiên phù hợp cho tất cả các loại da, với thành phần chính là China clay, Bentonite Gel, mật ong và bạc hà sẽ giúp làm sạch và thu nhỏ lỗ chân lông, làn da sẽ mềm mịn và sảng khoái hơn. Magnaminty còn có đậu Aduki xay nhỏ giúp tẩy da chết khi massage nhẹ nhàng trên da, đặc biệt phù hợp cho những ngày hè, da sẽ mát lạnh và sáng khỏe, hương thơm tươi mát của peppermint oil còn giúp thư giãn đầu óc.</p>', NULL, N'Images/sanpham/my-pham/cac_loai_mat_na/mat_na_lush_of_magnamity.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 320000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (135, N'Kem Trị Thâm Quầng Mắt Kiehl''s Midnight Recovery Eye 15ml', 20, N'<p>Kem dưỡng mắt Kiehl''s Midnight Recovery giúp giảm thâm quầng vùng mắt, giảm vết nhăn và trẻ hoá vùng da quanh mắt. Với chiết xuất từ:</p>', NULL, N'Images/sanpham/my-pham/duong-da/kiehl''s/kem_tri_tham_quang_mat_kiehls_midnight_recovery.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 790000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (137, N'Sữa Rửa Mặt Đất Sét Keihl''s Rare Earth Deep Pore 150ml', 20, N'<p>Sữa rửa mặt đất sét 150ml Kiehl''s Rare Earth Deep Pore Daily CLEANSER có sẵn, thành phần từ đất sét trắng Amazon, lô hội và yếm mạch giúp làm sạch sâu lỗ chân lông, lấy đi lượng bã nhờn và dầu thừa trên da, trị mụn và làm se nhỏ lỗ chân lông hiệu quả. </p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/sua_rua_mat_dat_set_kiehls_rare_earth_deep_pore.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 590000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (138, N'Tinh Chất Se Nhỏ Lỗ Chân Lông Kiehl''s Precision Lifting & Pore Tighting Concentrate 50ml', 20, N'<p>Chai tinh chất se nhỏ lỗ chân lông và săn chắc da mặt Kiehl''s Precision lifting & pore tightening concentrate Chai serum luôn có mặt trong list những sản phẩm se khít lỗ chân lông đạt hiệu quả cao và được yêu thích trên thế giới.</p>', NULL, N'Images/sanpham/my-pham/duong-da/kiehl''s/tinh_chat_se_nho_lo_chan_long_precision_lifting.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 1520000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (140, N'Tinh Chất Trị Nám, Thâm Sạm Kiehl''s Clearly 50ml', 20, N'<p>KIEHL''S CLEARLY CORRECTIVE DARK SP</p>', NULL, N'Images/sanpham/my-pham/duong-da/kiehl''s/tinh_chat_tri_nam_tham_san_clearly.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 1350000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (142, N'Nước Hoa Hồng Dành Cho Da Dầu Kiehl''s Ultra Facial Oil Free 250ml', 20, N'<p>Dành cho da dầu</p>', NULL, N'Images/sanpham/my-pham/duong-da/kiehl''s/nuoc_hoa_hong_cho_da_dau.JPG
', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 520000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (144, N'Kem Dưỡng Kiehl''s Ultra Facial Oil Free Gel Cream 125ml', 20, N'<p> Vui lòng liên hệ để biết thêm chi tiết</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kem_duong_da_ultra_facial_oil_free_gel_cream_125ml.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 1250000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (145, N'Tinh Chất Kiehl''s Midnight Recovery 30ml', 20, N'<p>Là sản phẩm đạt được nhiều giải thưởng uy tín nhất về sắc đẹp của Kiehl''s.</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/tinh-chat-kiehl-s-midnight-recovery-concentrate-30ml.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 1100000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (146, N'Kiehl''s Toner Calendular 500ml', 20, N'<p>Được chiết xuất từ những cánh hoa cúc to khỏe giúp cân bằng làn da dịu nhẹ thư giãn và an toàn tuyệt đối ngay cả với làn da nhạy cảm nhất.</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kiehls-toner-calendular-500ml.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 1400000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (147, N'Nước Thần Kiehl''s Iris Extract Activating Treatment Essence 200ml', 20, N'<p> Vui lòng liên hệ để biết thêm chi tiết</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kiehls_iris_extract_activating_treatment_essence_200ml.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 850000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (148, N'Tinh Chất Kiehl''s Midnight Concentrate 50ml', 20, N'<p> Vui lòng liên hệ để biết thêm chi tiết</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kiehls_midnight_concentrate_50ml.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 1350000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (149, N'Sữa Rữa Mặt Dành Cho Da Dầu Kịel''s Ultra Facial Oily Cleanser 150ml', 20, N'<p> Vui lòng liên hệ để biết thêm chi tiết</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kiehls-ultra-facial-oily-cleanser-150ml.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 520000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (150, N'Kem Dưỡng Kiehl''s Creamy Eye Treatment 15 Ml', 20, N'<p> Chiết xuất từ tinh dầu quả bơ giúp giảm thâm quầng bọng mắt, làm tươi trẻ vùng da quanh mắt.</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/kiehls-creamy-eye-treatment-15ml.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 690000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (151, N'Hydro-plumping Re-texturizing Serum Concentrate 75ml', 20, N'<p>Tinh chất dưỡng ẩm và phục hồi da hằng ngày, nhẹ nhàng nuôi dưỡng và xóa tan các dấu hiệu mệt mỏi trên da một cách nhanh chóng và hiệu quả.</p>', N'null', N'Images/sanpham/my-pham/duong-da/kiehl''s/hydro-plumping re-texturizing serum concentrate 75ml.JPG', CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 1580000.0000, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Product_ID], [Name], [Category_ID], [Description], [URL], [Image], [DateUpload], [DateUpdate], [Price], [Price_promotion], [NumberInStock], [Views], [Is_active], [Is_savedraft]) VALUES (155, N'test sp', 13, N'<h3>HTML Color Picker</h3>

<p><strong>Click on the image to get the html codes.</strong>.</p>

<p>Use the online image color picker right to select a color and get the html Color Code of this pixel.&nbsp;<br />
Also you get the HEX value, RGB value and HSV value.<br />
You can put a picture url in the textbox below or upload your own image. (for example an screenshot of your desktop). Or use an website url, you will see a thumbnail on the right side.</p>

<table>
	<tbody>
		<tr>
			<td rowspan="3">&nbsp;</td>
			<td>HTML code:</td>
			<td>#5DBCD2</td>
		</tr>
		<tr>
			<td>RGB code:</td>
			<td>R: 93 G: 188 B: 210</td>
		</tr>
		<tr>
			<td>HSV:</td>
			<td>191.28&deg; 55.71% 82.35%</td>
		</tr>
		<tr>
		</tr>
	</tbody>
</table>
', NULL, N'Images/sanpham/sanphammoi/Xab1IjotFEWVt7H1xGygXQ.jpg', CAST(N'2017-04-05' AS Date), CAST(N'2017-04-05' AS Date), 45656.0000, NULL, 415, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (1, N'Khoa.Huynh')
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(N'2016-09-14 13:57:09.617' AS DateTime), NULL, 1, CAST(N'2016-09-14 15:24:02.483' AS DateTime), 0, N'AGNMPTtGFjYAG1X7B1ywXY/rAF6PPKkofV/k+LemP9LsP6FWFq3XK8doUvThXk57Pw==', CAST(N'2016-09-14 13:57:09.617' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(N'2016-09-14 15:17:23.263' AS DateTime), NULL, 1, CAST(N'2016-09-14 15:42:01.797' AS DateTime), 0, N'AH7lF/I9BFCivVyaVpgqwjIWzL45hGn5TycaFkFbSW4+XHgXSJbMfaIydHkYprjP/A==', CAST(N'2016-09-14 15:17:23.263' AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Administrator')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 2)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B6160CA231C9F]    Script Date: 4/14/2017 7:53:15 AM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_BILL_CART] FOREIGN KEY([Cart_ID])
REFERENCES [dbo].[Cart] ([Cart_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_BILL_CART]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_CART_CUSTOMER] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_CART_CUSTOMER]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CART_DETAIL_CART] FOREIGN KEY([Cart_ID])
REFERENCES [dbo].[Cart] ([Cart_ID])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CART_DETAIL_CART]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CART_DETAIL_PRODUCT] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CART_DETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_CATEGORY] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_PRODUCT_CATEGORY]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [HOAHUONGDUONG] SET  READ_WRITE 
GO
