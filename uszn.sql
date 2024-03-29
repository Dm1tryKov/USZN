USE [master]
GO
/****** Object:  Database [uszn]    Script Date: 28.01.2024 21:53:47 ******/
CREATE DATABASE [uszn]
 CONTAINMENT = NONE
 
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [uszn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [uszn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [uszn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [uszn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [uszn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [uszn] SET ARITHABORT OFF 
GO
ALTER DATABASE [uszn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [uszn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [uszn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [uszn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [uszn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [uszn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [uszn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [uszn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [uszn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [uszn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [uszn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [uszn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [uszn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [uszn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [uszn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [uszn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [uszn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [uszn] SET RECOVERY FULL 
GO
ALTER DATABASE [uszn] SET  MULTI_USER 
GO
ALTER DATABASE [uszn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [uszn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [uszn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [uszn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'uszn', N'ON'
GO
USE [uszn]
GO
/****** Object:  Table [dbo].[Form]    Script Date: 28.01.2024 21:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[fsp] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[type] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[message] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28.01.2024 21:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[priority] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Form] ON 

INSERT [dbo].[Form] ([id], [user_id], [fsp], [status], [type], [email], [message], [created_at]) VALUES (8, 2, N'Ковалев Д. А.', 1, N'Анкета о семейном и материально-бытовом положении', N'kovalev@mail.ru', NULL, CAST(N'2024-01-28T20:58:25.300' AS DateTime))
INSERT [dbo].[Form] ([id], [user_id], [fsp], [status], [type], [email], [message], [created_at]) VALUES (10, 3, N'Шемарулин А. К.', 1, N'Анкета о семейном и материально-бытовом положении', N'shemarulin@mail.ru', NULL, CAST(N'2024-01-28T21:17:17.567' AS DateTime))
INSERT [dbo].[Form] ([id], [user_id], [fsp], [status], [type], [email], [message], [created_at]) VALUES (11, 2, N'Ковалев Д. А.', 1, N'Заявление на оказание материальной помощи', N'kovalev@mail.ru', N'Помогите пж', CAST(N'2024-01-28T21:17:47.870' AS DateTime))
INSERT [dbo].[Form] ([id], [user_id], [fsp], [status], [type], [email], [message], [created_at]) VALUES (12, 3, N'Шемарулин А. К.', 1, N'Заявление на выдачу свидетельства на региональный материнский (семейный) капитал', N'shemarulin@mail.ru', NULL, CAST(N'2024-01-28T21:52:00.813' AS DateTime))
SET IDENTITY_INSERT [dbo].[Form] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [login], [password], [priority], [created_at]) VALUES (1, N'admin', N'123', 1, CAST(N'2024-01-28T20:31:53.030' AS DateTime))
INSERT [dbo].[Users] ([id], [login], [password], [priority], [created_at]) VALUES (2, N'dima', N'123', 0, CAST(N'2024-01-28T20:32:18.443' AS DateTime))
INSERT [dbo].[Users] ([id], [login], [password], [priority], [created_at]) VALUES (3, N'sanya', N'123', 0, CAST(N'2024-01-28T20:58:38.923' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FK_Form_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FK_Form_Users]
GO
USE [master]
GO
ALTER DATABASE [uszn] SET  READ_WRITE 
GO
