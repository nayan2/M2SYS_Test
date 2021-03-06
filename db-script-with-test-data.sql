USE [master]
GO
/****** Object:  Database [M2SYS]    Script Date: 12/13/2020 4:02:06 AM ******/
CREATE DATABASE [M2SYS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'M2SYS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\M2SYS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'M2SYS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\M2SYS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [M2SYS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [M2SYS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [M2SYS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [M2SYS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [M2SYS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [M2SYS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [M2SYS] SET ARITHABORT OFF 
GO
ALTER DATABASE [M2SYS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [M2SYS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [M2SYS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [M2SYS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [M2SYS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [M2SYS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [M2SYS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [M2SYS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [M2SYS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [M2SYS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [M2SYS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [M2SYS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [M2SYS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [M2SYS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [M2SYS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [M2SYS] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [M2SYS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [M2SYS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [M2SYS] SET  MULTI_USER 
GO
ALTER DATABASE [M2SYS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [M2SYS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [M2SYS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [M2SYS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [M2SYS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [M2SYS] SET QUERY_STORE = OFF
GO
USE [M2SYS]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/13/2020 4:02:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/13/2020 4:02:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](600) NOT NULL,
	[MiddleName] [nvarchar](600) NULL,
	[LastName] [nvarchar](600) NOT NULL,
	[DOB] [datetime2](7) NOT NULL,
	[JoiningDate] [datetime2](7) NOT NULL,
	[Designation] [tinyint] NOT NULL,
	[Department] [tinyint] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDateUtc] [datetime2](7) NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	[UpdatedDateUtc] [datetime2](7) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leaves]    Script Date: 12/13/2020 4:02:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaves](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[LeaveType] [tinyint] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDateUtc] [datetime2](7) NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	[UpdatedDateUtc] [datetime2](7) NULL,
 CONSTRAINT [PK_Leaves] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201211174757_HRMEntityAdd', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201212195558_LeaveEntityForeignKeyNameChnage', N'5.0.1')
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (1, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:25:58.7500000' AS DateTime2), CAST(N'2020-12-12T17:25:58.7500000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:25:58.7500000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (2, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:06.3400000' AS DateTime2), CAST(N'2020-12-12T17:26:06.3400000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:06.3400000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (3, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:06.6166667' AS DateTime2), CAST(N'2020-12-12T17:26:06.6166667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:06.6166667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (4, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:06.9033333' AS DateTime2), CAST(N'2020-12-12T17:26:06.9033333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:06.9033333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (5, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:07.1566667' AS DateTime2), CAST(N'2020-12-12T17:26:07.1566667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:07.1566667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (6, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:07.4133333' AS DateTime2), CAST(N'2020-12-12T17:26:07.4133333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:07.4133333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (7, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:07.6600000' AS DateTime2), CAST(N'2020-12-12T17:26:07.6600000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:07.6600000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (8, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:07.9133333' AS DateTime2), CAST(N'2020-12-12T17:26:07.9133333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:07.9133333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (9, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:08.1466667' AS DateTime2), CAST(N'2020-12-12T17:26:08.1466667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:08.1466667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (10, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:08.4033333' AS DateTime2), CAST(N'2020-12-12T17:26:08.4033333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:08.4033333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (11, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:08.6533333' AS DateTime2), CAST(N'2020-12-12T17:26:08.6533333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:08.6533333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (12, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:08.9033333' AS DateTime2), CAST(N'2020-12-12T17:26:08.9033333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:08.9033333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (13, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:09.1433333' AS DateTime2), CAST(N'2020-12-12T17:26:09.1433333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:09.1433333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (14, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:09.4633333' AS DateTime2), CAST(N'2020-12-12T17:26:09.4633333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:09.4633333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (15, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:09.7633333' AS DateTime2), CAST(N'2020-12-12T17:26:09.7633333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:09.7633333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (16, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:09.9866667' AS DateTime2), CAST(N'2020-12-12T17:26:09.9866667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:09.9866667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (17, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:10.2500000' AS DateTime2), CAST(N'2020-12-12T17:26:10.2500000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:10.2500000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (18, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:10.5033333' AS DateTime2), CAST(N'2020-12-12T17:26:10.5033333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:10.5033333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (19, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:10.7800000' AS DateTime2), CAST(N'2020-12-12T17:26:10.7800000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:10.7800000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (20, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:11.0300000' AS DateTime2), CAST(N'2020-12-12T17:26:11.0300000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:11.0300000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (21, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:11.2700000' AS DateTime2), CAST(N'2020-12-12T17:26:11.2700000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:11.2700000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (22, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:11.5333333' AS DateTime2), CAST(N'2020-12-12T17:26:11.5333333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:11.5333333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (23, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:11.8233333' AS DateTime2), CAST(N'2020-12-12T17:26:11.8233333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:11.8233333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (24, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:12.0700000' AS DateTime2), CAST(N'2020-12-12T17:26:12.0700000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:12.0700000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (25, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:12.2966667' AS DateTime2), CAST(N'2020-12-12T17:26:12.2966667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:12.2966667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (26, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:12.5633333' AS DateTime2), CAST(N'2020-12-12T17:26:12.5633333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:12.5633333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (27, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:12.9033333' AS DateTime2), CAST(N'2020-12-12T17:26:12.9033333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:12.9033333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (28, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:13.1600000' AS DateTime2), CAST(N'2020-12-12T17:26:13.1600000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:13.1600000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (29, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:13.4066667' AS DateTime2), CAST(N'2020-12-12T17:26:13.4066667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:13.4066667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (30, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:13.6533333' AS DateTime2), CAST(N'2020-12-12T17:26:13.6533333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:13.6533333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (31, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:13.9033333' AS DateTime2), CAST(N'2020-12-12T17:26:13.9033333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:13.9033333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (32, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:14.1533333' AS DateTime2), CAST(N'2020-12-12T17:26:14.1533333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:14.1533333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (33, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:14.4066667' AS DateTime2), CAST(N'2020-12-12T17:26:14.4066667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:14.4066667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (34, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:14.6600000' AS DateTime2), CAST(N'2020-12-12T17:26:14.6600000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:14.6600000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (35, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:14.9066667' AS DateTime2), CAST(N'2020-12-12T17:26:14.9066667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:14.9066667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (36, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:15.1600000' AS DateTime2), CAST(N'2020-12-12T17:26:15.1600000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:15.1600000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (37, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:15.4200000' AS DateTime2), CAST(N'2020-12-12T17:26:15.4200000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:15.4200000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (38, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:15.6800000' AS DateTime2), CAST(N'2020-12-12T17:26:15.6800000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:15.6800000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (39, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:15.9400000' AS DateTime2), CAST(N'2020-12-12T17:26:15.9400000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:15.9400000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (40, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:16.1833333' AS DateTime2), CAST(N'2020-12-12T17:26:16.1833333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:16.1833333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (41, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:16.5200000' AS DateTime2), CAST(N'2020-12-12T17:26:16.5200000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:16.5200000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (42, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:16.8100000' AS DateTime2), CAST(N'2020-12-12T17:26:16.8100000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:16.8100000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (43, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:17.0666667' AS DateTime2), CAST(N'2020-12-12T17:26:17.0666667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:17.0666667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (44, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:17.3166667' AS DateTime2), CAST(N'2020-12-12T17:26:17.3166667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:17.3166667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (45, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:17.5766667' AS DateTime2), CAST(N'2020-12-12T17:26:17.5766667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:17.5766667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (46, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:17.8500000' AS DateTime2), CAST(N'2020-12-12T17:26:17.8500000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:17.8500000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (47, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:18.1266667' AS DateTime2), CAST(N'2020-12-12T17:26:18.1266667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:18.1266667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (48, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:18.3866667' AS DateTime2), CAST(N'2020-12-12T17:26:18.3866667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:18.3866667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (49, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:18.6466667' AS DateTime2), CAST(N'2020-12-12T17:26:18.6466667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:18.6466667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (50, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:18.9033333' AS DateTime2), CAST(N'2020-12-12T17:26:18.9033333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:18.9033333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (51, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:19.1600000' AS DateTime2), CAST(N'2020-12-12T17:26:19.1600000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:19.1600000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (52, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:19.4133333' AS DateTime2), CAST(N'2020-12-12T17:26:19.4133333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:19.4133333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (53, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:19.6500000' AS DateTime2), CAST(N'2020-12-12T17:26:19.6500000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:19.6500000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (54, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:19.9966667' AS DateTime2), CAST(N'2020-12-12T17:26:19.9966667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:19.9966667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (55, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:20.2500000' AS DateTime2), CAST(N'2020-12-12T17:26:20.2500000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:20.2500000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (56, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:20.5166667' AS DateTime2), CAST(N'2020-12-12T17:26:20.5166667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:20.5166667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (57, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:20.8200000' AS DateTime2), CAST(N'2020-12-12T17:26:20.8200000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:20.8200000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (58, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:21.0800000' AS DateTime2), CAST(N'2020-12-12T17:26:21.0800000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:21.0800000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (59, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:21.3866667' AS DateTime2), CAST(N'2020-12-12T17:26:21.3866667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:21.3866667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (60, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:21.6466667' AS DateTime2), CAST(N'2020-12-12T17:26:21.6466667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:21.6466667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (61, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:21.9200000' AS DateTime2), CAST(N'2020-12-12T17:26:21.9200000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:21.9200000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (62, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:22.1700000' AS DateTime2), CAST(N'2020-12-12T17:26:22.1700000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:22.1700000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (63, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:22.4233333' AS DateTime2), CAST(N'2020-12-12T17:26:22.4233333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:22.4233333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (64, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:22.7300000' AS DateTime2), CAST(N'2020-12-12T17:26:22.7300000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:22.7300000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (65, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:22.9700000' AS DateTime2), CAST(N'2020-12-12T17:26:22.9700000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:22.9700000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (66, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:23.3066667' AS DateTime2), CAST(N'2020-12-12T17:26:23.3066667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:23.3066667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (67, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:23.5733333' AS DateTime2), CAST(N'2020-12-12T17:26:23.5733333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:23.5733333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (68, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:23.8800000' AS DateTime2), CAST(N'2020-12-12T17:26:23.8800000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:23.8800000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (69, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:24.1500000' AS DateTime2), CAST(N'2020-12-12T17:26:24.1500000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:24.1500000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (70, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:24.4233333' AS DateTime2), CAST(N'2020-12-12T17:26:24.4233333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:24.4233333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (71, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:24.6800000' AS DateTime2), CAST(N'2020-12-12T17:26:24.6800000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:24.6800000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (72, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:24.9533333' AS DateTime2), CAST(N'2020-12-12T17:26:24.9533333' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:24.9533333' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (73, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:25.2266667' AS DateTime2), CAST(N'2020-12-12T17:26:25.2266667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:25.2266667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (74, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:25.4900000' AS DateTime2), CAST(N'2020-12-12T17:26:25.4900000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:25.4900000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (75, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:25.7900000' AS DateTime2), CAST(N'2020-12-12T17:26:25.7900000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:25.7900000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (76, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:26.0600000' AS DateTime2), CAST(N'2020-12-12T17:26:26.0600000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:26.0600000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (77, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:26.3066667' AS DateTime2), CAST(N'2020-12-12T17:26:26.3066667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:26.3066667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (78, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:26.6600000' AS DateTime2), CAST(N'2020-12-12T17:26:26.6600000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:26.6600000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (79, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:26.9266667' AS DateTime2), CAST(N'2020-12-12T17:26:26.9266667' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:26.9266667' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (80, N'test1', N'test2', N'test3', CAST(N'2020-12-12T17:26:27.1900000' AS DateTime2), CAST(N'2020-12-12T17:26:27.1900000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T17:26:27.1900000' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (85, N'Amjad', N'', N'Hossain', CAST(N'1995-02-25T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-15T18:00:00.0000000' AS DateTime2), 3, 3, 0, CAST(N'2020-12-12T18:34:43.3460657' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (86, N'Amjad', N'Test123', N'Hossain-Updated', CAST(N'2020-12-02T18:00:00.0000000' AS DateTime2), CAST(N'2020-12-14T18:00:00.0000000' AS DateTime2), 3, 2, 0, CAST(N'2020-12-12T21:46:37.2940001' AS DateTime2), 0, CAST(N'2020-12-12T21:46:37.2941638' AS DateTime2))
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (87, N'final', N'', N'test', CAST(N'2020-11-30T18:00:00.0000000' AS DateTime2), CAST(N'2020-12-15T18:00:00.0000000' AS DateTime2), 1, 1, 0, CAST(N'2020-12-12T21:45:42.4342787' AS DateTime2), 0, NULL)
INSERT [dbo].[Employees] ([Id], [FirstName], [MiddleName], [LastName], [DOB], [JoiningDate], [Designation], [Department], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (88, N'amjad', N'test', N'final', CAST(N'2020-11-30T18:00:00.0000000' AS DateTime2), CAST(N'2020-12-16T18:00:00.0000000' AS DateTime2), 1, 2, 0, CAST(N'2020-12-12T21:46:56.1316769' AS DateTime2), 0, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Leaves] ON 

INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (1, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:47.4498894' AS DateTime2), CAST(N'2020-12-13T01:22:47.4498894' AS DateTime2), 0, CAST(N'2020-12-13T01:22:47.4498894' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (2, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:49.3889694' AS DateTime2), CAST(N'2020-12-13T01:22:49.3889694' AS DateTime2), 0, CAST(N'2020-12-13T01:22:49.3889694' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (3, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:50.1213948' AS DateTime2), CAST(N'2020-12-13T01:22:50.1213948' AS DateTime2), 0, CAST(N'2020-12-13T01:22:50.1213948' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (4, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:50.4639517' AS DateTime2), CAST(N'2020-12-13T01:22:50.4639517' AS DateTime2), 0, CAST(N'2020-12-13T01:22:50.4639517' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (5, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:50.8435817' AS DateTime2), CAST(N'2020-12-13T01:22:50.8435817' AS DateTime2), 0, CAST(N'2020-12-13T01:22:50.8435817' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (6, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:51.1625662' AS DateTime2), CAST(N'2020-12-13T01:22:51.1625662' AS DateTime2), 0, CAST(N'2020-12-13T01:22:51.1625662' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (7, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:51.4807269' AS DateTime2), CAST(N'2020-12-13T01:22:51.4807269' AS DateTime2), 0, CAST(N'2020-12-13T01:22:51.4807269' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (8, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:51.8399418' AS DateTime2), CAST(N'2020-12-13T01:22:51.8399418' AS DateTime2), 0, CAST(N'2020-12-13T01:22:51.8399418' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (9, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:52.1484565' AS DateTime2), CAST(N'2020-12-13T01:22:52.1484565' AS DateTime2), 0, CAST(N'2020-12-13T01:22:52.1484565' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (10, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:52.4704453' AS DateTime2), CAST(N'2020-12-13T01:22:52.4704453' AS DateTime2), 0, CAST(N'2020-12-13T01:22:52.4704453' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (11, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:52.8461604' AS DateTime2), CAST(N'2020-12-13T01:22:52.8461604' AS DateTime2), 0, CAST(N'2020-12-13T01:22:52.8461604' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (12, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:53.1601443' AS DateTime2), CAST(N'2020-12-13T01:22:53.1601443' AS DateTime2), 0, CAST(N'2020-12-13T01:22:53.1601443' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (13, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:53.4701692' AS DateTime2), CAST(N'2020-12-13T01:22:53.4701692' AS DateTime2), 0, CAST(N'2020-12-13T01:22:53.4701692' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (14, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:53.8321405' AS DateTime2), CAST(N'2020-12-13T01:22:53.8321405' AS DateTime2), 0, CAST(N'2020-12-13T01:22:53.8321405' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (15, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:54.1567246' AS DateTime2), CAST(N'2020-12-13T01:22:54.1567246' AS DateTime2), 0, CAST(N'2020-12-13T01:22:54.1567246' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (16, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:54.4657544' AS DateTime2), CAST(N'2020-12-13T01:22:54.4657544' AS DateTime2), 0, CAST(N'2020-12-13T01:22:54.4657544' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (17, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:54.8682423' AS DateTime2), CAST(N'2020-12-13T01:22:54.8682423' AS DateTime2), 0, CAST(N'2020-12-13T01:22:54.8682423' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (18, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:55.1835460' AS DateTime2), CAST(N'2020-12-13T01:22:55.1835460' AS DateTime2), 0, CAST(N'2020-12-13T01:22:55.1835460' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (19, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:55.4935266' AS DateTime2), CAST(N'2020-12-13T01:22:55.4935266' AS DateTime2), 0, CAST(N'2020-12-13T01:22:55.4935266' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (20, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:55.8266900' AS DateTime2), CAST(N'2020-12-13T01:22:55.8266900' AS DateTime2), 0, CAST(N'2020-12-13T01:22:55.8266900' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (21, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:56.1446903' AS DateTime2), CAST(N'2020-12-13T01:22:56.1446903' AS DateTime2), 0, CAST(N'2020-12-13T01:22:56.1446903' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (22, 85, 1, N'Test Leave', CAST(N'2020-12-13T01:22:56.4501336' AS DateTime2), CAST(N'2020-12-13T01:22:56.4501336' AS DateTime2), 0, CAST(N'2020-12-13T01:22:56.4501336' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (28, 86, 1, N'Test Leave 1', CAST(N'2020-12-08T18:00:00.0000000' AS DateTime2), CAST(N'2020-12-13T01:23:20.1271479' AS DateTime2), 0, CAST(N'2020-12-12T21:40:47.9841960' AS DateTime2), 0, CAST(N'2020-12-12T21:40:52.6209158' AS DateTime2))
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (29, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:20.3621303' AS DateTime2), CAST(N'2020-12-13T01:23:20.3621303' AS DateTime2), 0, CAST(N'2020-12-13T01:23:20.3621303' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (30, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:20.5981284' AS DateTime2), CAST(N'2020-12-13T01:23:20.5981284' AS DateTime2), 0, CAST(N'2020-12-13T01:23:20.5981284' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (31, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:20.9151301' AS DateTime2), CAST(N'2020-12-13T01:23:20.9151301' AS DateTime2), 0, CAST(N'2020-12-13T01:23:20.9151301' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (32, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:21.1611304' AS DateTime2), CAST(N'2020-12-13T01:23:21.1611304' AS DateTime2), 0, CAST(N'2020-12-13T01:23:21.1611304' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (33, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:21.3928379' AS DateTime2), CAST(N'2020-12-13T01:23:21.3928379' AS DateTime2), 0, CAST(N'2020-12-13T01:23:21.3928379' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (34, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:21.6240575' AS DateTime2), CAST(N'2020-12-13T01:23:21.6240575' AS DateTime2), 0, CAST(N'2020-12-13T01:23:21.6240575' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (35, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:21.9390519' AS DateTime2), CAST(N'2020-12-13T01:23:21.9390519' AS DateTime2), 0, CAST(N'2020-12-13T01:23:21.9390519' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (36, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:22.1860526' AS DateTime2), CAST(N'2020-12-13T01:23:22.1860526' AS DateTime2), 0, CAST(N'2020-12-13T01:23:22.1860526' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (37, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:22.4240584' AS DateTime2), CAST(N'2020-12-13T01:23:22.4240584' AS DateTime2), 0, CAST(N'2020-12-13T01:23:22.4240584' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (38, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:22.6573020' AS DateTime2), CAST(N'2020-12-13T01:23:22.6573020' AS DateTime2), 0, CAST(N'2020-12-13T01:23:22.6573020' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (39, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:22.9766705' AS DateTime2), CAST(N'2020-12-13T01:23:22.9766705' AS DateTime2), 0, CAST(N'2020-12-13T01:23:22.9766705' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (40, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:23.2366596' AS DateTime2), CAST(N'2020-12-13T01:23:23.2366596' AS DateTime2), 0, CAST(N'2020-12-13T01:23:23.2366596' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (41, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:23.4676572' AS DateTime2), CAST(N'2020-12-13T01:23:23.4676572' AS DateTime2), 0, CAST(N'2020-12-13T01:23:23.4676572' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (42, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:23.7786573' AS DateTime2), CAST(N'2020-12-13T01:23:23.7786573' AS DateTime2), 0, CAST(N'2020-12-13T01:23:23.7786573' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (43, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:24.1016104' AS DateTime2), CAST(N'2020-12-13T01:23:24.1016104' AS DateTime2), 0, CAST(N'2020-12-13T01:23:24.1016104' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (44, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:24.3746114' AS DateTime2), CAST(N'2020-12-13T01:23:24.3746114' AS DateTime2), 0, CAST(N'2020-12-13T01:23:24.3746114' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (45, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:24.6061540' AS DateTime2), CAST(N'2020-12-13T01:23:24.6061540' AS DateTime2), 0, CAST(N'2020-12-13T01:23:24.6061540' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (46, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:24.9090843' AS DateTime2), CAST(N'2020-12-13T01:23:24.9090843' AS DateTime2), 0, CAST(N'2020-12-13T01:23:24.9090843' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (47, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:25.2495352' AS DateTime2), CAST(N'2020-12-13T01:23:25.2495352' AS DateTime2), 0, CAST(N'2020-12-13T01:23:25.2495352' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (48, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:25.5045387' AS DateTime2), CAST(N'2020-12-13T01:23:25.5045387' AS DateTime2), 0, CAST(N'2020-12-13T01:23:25.5045387' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (49, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:25.7864861' AS DateTime2), CAST(N'2020-12-13T01:23:25.7864861' AS DateTime2), 0, CAST(N'2020-12-13T01:23:25.7864861' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (50, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:26.0334845' AS DateTime2), CAST(N'2020-12-13T01:23:26.0334845' AS DateTime2), 0, CAST(N'2020-12-13T01:23:26.0334845' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (51, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:26.3657503' AS DateTime2), CAST(N'2020-12-13T01:23:26.3657503' AS DateTime2), 0, CAST(N'2020-12-13T01:23:26.3657503' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (52, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:26.6251013' AS DateTime2), CAST(N'2020-12-13T01:23:26.6251013' AS DateTime2), 0, CAST(N'2020-12-13T01:23:26.6251013' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (53, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:26.9051023' AS DateTime2), CAST(N'2020-12-13T01:23:26.9051023' AS DateTime2), 0, CAST(N'2020-12-13T01:23:26.9051023' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (54, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:27.1431082' AS DateTime2), CAST(N'2020-12-13T01:23:27.1431082' AS DateTime2), 0, CAST(N'2020-12-13T01:23:27.1431082' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (55, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:27.4671011' AS DateTime2), CAST(N'2020-12-13T01:23:27.4671011' AS DateTime2), 0, CAST(N'2020-12-13T01:23:27.4671011' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (56, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:27.7574471' AS DateTime2), CAST(N'2020-12-13T01:23:27.7574471' AS DateTime2), 0, CAST(N'2020-12-13T01:23:27.7574471' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (57, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:28.0053975' AS DateTime2), CAST(N'2020-12-13T01:23:28.0053975' AS DateTime2), 0, CAST(N'2020-12-13T01:23:28.0053975' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (58, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:28.2589141' AS DateTime2), CAST(N'2020-12-13T01:23:28.2589141' AS DateTime2), 0, CAST(N'2020-12-13T01:23:28.2589141' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (59, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:28.5999162' AS DateTime2), CAST(N'2020-12-13T01:23:28.5999162' AS DateTime2), 0, CAST(N'2020-12-13T01:23:28.5999162' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (60, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:28.9054476' AS DateTime2), CAST(N'2020-12-13T01:23:28.9054476' AS DateTime2), 0, CAST(N'2020-12-13T01:23:28.9054476' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (61, 86, 1, N'Test Leave 1', CAST(N'2020-12-13T01:23:30.4026880' AS DateTime2), CAST(N'2020-12-13T01:23:30.4026880' AS DateTime2), 0, CAST(N'2020-12-13T01:23:30.4026880' AS DateTime2), 0, NULL)
INSERT [dbo].[Leaves] ([Id], [EmployeeId], [LeaveType], [Description], [StartDate], [EndDate], [CreatedBy], [CreatedDateUtc], [UpdatedBy], [UpdatedDateUtc]) VALUES (62, 86, 1, N'demp', CAST(N'2020-11-30T18:00:00.0000000' AS DateTime2), CAST(N'2020-12-23T18:00:00.0000000' AS DateTime2), 0, CAST(N'2020-12-12T21:40:31.5343000' AS DateTime2), 0, NULL)
SET IDENTITY_INSERT [dbo].[Leaves] OFF
GO
/****** Object:  Index [IX_Leaves_EmployeeId]    Script Date: 12/13/2020 4:02:06 AM ******/
CREATE NONCLUSTERED INDEX [IX_Leaves_EmployeeId] ON [dbo].[Leaves]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Leaves]  WITH CHECK ADD  CONSTRAINT [FK_Leaves_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Leaves] CHECK CONSTRAINT [FK_Leaves_Employees_EmployeeId]
GO
USE [master]
GO
ALTER DATABASE [M2SYS] SET  READ_WRITE 
GO
