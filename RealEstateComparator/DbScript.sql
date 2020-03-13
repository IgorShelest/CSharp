USE [master]
GO
/****** Object:  Database [DataAgregationServiceDb]    Script Date: 13.03.2020 19:05:40 ******/
CREATE DATABASE [DataAgregationServiceDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataAgregationServiceDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\DataAgregationServiceDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataAgregationServiceDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\DataAgregationServiceDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DataAgregationServiceDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataAgregationServiceDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataAgregationServiceDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataAgregationServiceDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataAgregationServiceDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DataAgregationServiceDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataAgregationServiceDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DataAgregationServiceDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET RECOVERY FULL 
GO
ALTER DATABASE [DataAgregationServiceDb] SET  MULTI_USER 
GO
ALTER DATABASE [DataAgregationServiceDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataAgregationServiceDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataAgregationServiceDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataAgregationServiceDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DataAgregationServiceDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DataAgregationServiceDb', N'ON'
GO
ALTER DATABASE [DataAgregationServiceDb] SET QUERY_STORE = OFF
GO
USE [DataAgregationServiceDb]
GO
/****** Object:  Table [dbo].[ApartComplexes]    Script Date: 13.03.2020 19:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartComplexes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CityName] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
 CONSTRAINT [PK_ApartComplexes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 13.03.2020 19:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumberOfRooms] [nvarchar](max) NULL,
	[DwellingSpaceMin] [int] NOT NULL,
	[DwellingSpaceMax] [int] NOT NULL,
	[SquareMeterPriceMin] [int] NOT NULL,
	[SquareMeterPriceMax] [int] NOT NULL,
	[ComplexId] [int] NOT NULL,
 CONSTRAINT [PK_Apartments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Apartments_ComplexId]    Script Date: 13.03.2020 19:05:40 ******/
CREATE NONCLUSTERED INDEX [IX_Apartments_ComplexId] ON [dbo].[Apartments]
(
	[ComplexId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_ApartComplexes_ComplexId] FOREIGN KEY([ComplexId])
REFERENCES [dbo].[ApartComplexes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_ApartComplexes_ComplexId]
GO
USE [master]
GO
ALTER DATABASE [DataAgregationServiceDb] SET  READ_WRITE 
GO
