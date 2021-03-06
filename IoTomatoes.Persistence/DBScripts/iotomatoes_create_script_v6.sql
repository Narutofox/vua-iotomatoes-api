USE [master]
GO
/****** Object:  Database [iotomatoes]    Script Date: 12.10.2020. 8:04:19 ******/
CREATE DATABASE [iotomatoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'iotomatoes', FILENAME = N'H:\SQLServer2017\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\iotomatoes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'iotomatoes_log', FILENAME = N'H:\SQLServer2017\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\iotomatoes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [iotomatoes] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iotomatoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [iotomatoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [iotomatoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [iotomatoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [iotomatoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [iotomatoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [iotomatoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [iotomatoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [iotomatoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [iotomatoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [iotomatoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [iotomatoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [iotomatoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [iotomatoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [iotomatoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [iotomatoes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [iotomatoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [iotomatoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [iotomatoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [iotomatoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [iotomatoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [iotomatoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [iotomatoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [iotomatoes] SET RECOVERY FULL 
GO
ALTER DATABASE [iotomatoes] SET  MULTI_USER 
GO
ALTER DATABASE [iotomatoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [iotomatoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [iotomatoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [iotomatoes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [iotomatoes] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'iotomatoes', N'ON'
GO
ALTER DATABASE [iotomatoes] SET QUERY_STORE = OFF
GO
USE [iotomatoes]
GO
/****** Object:  Table [dbo].[Actuators]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actuators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[ActutatorTypeId] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK__Actuator__3214EC076FBB0A5E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActuatorTypes]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActuatorTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [char](10) NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[Version] [int] NULL,
 CONSTRAINT [PK__Actuator__3214EC07D6551D3E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [char](3) NULL,
	[PostalCode] [varchar](5) NULL,
	[CountryId] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[Version] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [char](3) NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[Version] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FarmActutators]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FarmActutators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FarmId] [int] NULL,
	[ActuatorId] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FarmPlants]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FarmPlants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FarmId] [int] NULL,
	[PlantId] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farms]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](3000) NULL,
	[Address] [nvarchar](255) NULL,
	[CityId] [int] NULL,
	[RuleSetId] [int] NULL,
	[Latitude] [decimal](18, 7) NULL,
	[Longitude] [decimal](18, 7) NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[IpAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK__Farms__3214EC0792F4FF75] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FarmSensorMeasurements]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FarmSensorMeasurements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FarmSensorId] [int] NULL,
	[Value] [decimal](18, 2) NULL,
	[DateCreated] [datetime2](7) NULL,
 CONSTRAINT [PK__FarmSens__3214EC07A78E5E2B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FarmSensors]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FarmSensors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](10) NULL,
	[FarmId] [int] NULL,
	[SensorId] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK__FarmSens__3214EC07FF2B8539] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasuringUnits]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasuringUnits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](10) NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[Version] [int] NULL,
 CONSTRAINT [PK__Measurin__3214EC0701B3E8D6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](10) NULL,
	[Description] [nvarchar](3000) NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[Version] [int] NULL,
 CONSTRAINT [PK__Plants__3214EC073EBD75C6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [char](1) NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[Version] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rules]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [varchar](3) NULL,
	[Conditions] [nvarchar](max) NULL,
	[Active] [int] NULL,
	[RuleSetId] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RuleSets]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleSets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [char](3) NULL,
	[Active] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensors]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[SensorTypeId] [int] NULL,
	[MeasuringUnitId] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[Version] [int] NULL,
 CONSTRAINT [PK__Sensors__3214EC07C09CF42F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SensorTypes]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SensorTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [char](3) NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[Version] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.10.2020. 8:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[RoleId] [int] NULL,
	[Active] [int] NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actuators] ON 

INSERT [dbo].[Actuators] ([Id], [Code], [ActutatorTypeId], [DateCreated], [DateModified]) VALUES (1, N'JT180AL-01', 1, CAST(N'2019-02-07T20:52:17.7633333' AS DateTime2), CAST(N'2019-02-07T20:52:17.7633333' AS DateTime2))
INSERT [dbo].[Actuators] ([Id], [Code], [ActutatorTypeId], [DateCreated], [DateModified]) VALUES (2, N'Led Grow E27', 2, CAST(N'2019-02-07T20:55:00.5866667' AS DateTime2), CAST(N'2019-02-07T20:55:00.5866667' AS DateTime2))
INSERT [dbo].[Actuators] ([Id], [Code], [ActutatorTypeId], [DateCreated], [DateModified]) VALUES (3, N'TEC1-12706', 5, CAST(N'2020-08-22T15:06:43.8400000' AS DateTime2), CAST(N'2020-08-22T15:06:43.8400000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Actuators] OFF
GO
SET IDENTITY_INSERT [dbo].[ActuatorTypes] ON 

INSERT [dbo].[ActuatorTypes] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (1, N'Pump', N'PMP       ', CAST(N'2019-02-07T20:46:53.6900000' AS DateTime2), CAST(N'2019-02-07T20:46:53.6900000' AS DateTime2), 1)
INSERT [dbo].[ActuatorTypes] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (2, N'Light', N'LGT       ', CAST(N'2019-02-07T20:46:59.9266667' AS DateTime2), CAST(N'2019-02-07T20:46:59.9266667' AS DateTime2), 1)
INSERT [dbo].[ActuatorTypes] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (3, N'Cooling', N'CLG       ', CAST(N'2019-02-07T20:47:21.8033333' AS DateTime2), CAST(N'2019-02-07T20:47:21.8033333' AS DateTime2), 1)
INSERT [dbo].[ActuatorTypes] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (4, N'Heating', N'HTG       ', CAST(N'2019-02-07T20:47:34.6800000' AS DateTime2), CAST(N'2019-02-07T20:47:34.6800000' AS DateTime2), 1)
INSERT [dbo].[ActuatorTypes] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (5, N'Cooling/Heating', N'CLG/HTG   ', CAST(N'2020-08-22T15:04:33.4433333' AS DateTime2), CAST(N'2020-08-22T15:04:33.4433333' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[ActuatorTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (1, N'Šibenik', N'ŠIB', N'22000', 51, CAST(N'2019-01-28T16:40:36.9966667' AS DateTime2), CAST(N'2019-01-28T16:40:36.9966667' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (2, N'Zagreb', N'ZAG', N'10000', 51, CAST(N'2019-01-24T18:14:44.1200000' AS DateTime2), CAST(N'2019-01-24T18:14:44.1200000' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (3, N'Slavonski Brod', N'SLB', N'35105', 51, CAST(N'2019-01-28T16:41:14.5833333' AS DateTime2), CAST(N'2019-01-28T16:41:14.5833333' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (4, N'Požega', N'POŽ', N'34000', 51, CAST(N'2019-01-28T16:41:14.5866667' AS DateTime2), CAST(N'2019-01-28T16:41:14.5866667' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (5, N'Virovitica', N'VIR', N'33000', 51, CAST(N'2019-01-28T16:41:14.5933333' AS DateTime2), CAST(N'2019-01-28T16:41:14.5933333' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (6, N'Rijeka', N'RIJ', N'51000', 51, CAST(N'2019-01-28T16:41:14.5933333' AS DateTime2), CAST(N'2019-01-28T16:41:14.5933333' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (7, N'Krapina', N'KRA', N'49000', 51, CAST(N'2019-01-28T16:41:14.5933333' AS DateTime2), CAST(N'2019-01-28T16:41:14.5933333' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (8, N'Dubrovnik', N'DUB', N'20000', 51, CAST(N'2019-01-28T16:41:14.5966667' AS DateTime2), CAST(N'2019-01-28T16:41:14.5966667' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (9, N'Sisak', N'SIS', N'44000', 51, CAST(N'2019-01-28T16:41:14.5966667' AS DateTime2), CAST(N'2019-01-28T16:41:14.5966667' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (10, N'Osijek', N'OSJ', N'31000', 51, CAST(N'2019-01-28T16:41:14.6000000' AS DateTime2), CAST(N'2019-01-28T16:41:14.6000000' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (11, N'Koprivnica', N'KOP', N'48000', 51, CAST(N'2019-01-28T16:41:14.6000000' AS DateTime2), CAST(N'2019-01-28T16:41:14.6000000' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (12, N'Cakovec', N'CAK', N'40000', 51, CAST(N'2019-01-28T16:41:14.6000000' AS DateTime2), CAST(N'2019-01-28T16:41:14.6000000' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (13, N'Vukovar', N'VUK', N'32000', 51, CAST(N'2019-01-28T16:41:14.6000000' AS DateTime2), CAST(N'2019-01-28T16:41:14.6000000' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (14, N'Zadar', N'ZAD', N'23000', 51, CAST(N'2019-01-28T16:41:14.6066667' AS DateTime2), CAST(N'2019-01-28T16:41:14.6066667' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (15, N'Gospic', N'GOS', N'53000', 51, CAST(N'2019-01-28T16:41:14.6066667' AS DateTime2), CAST(N'2019-01-28T16:41:14.6066667' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (16, N'Varaždin', N'VAŽ', N'42000', 51, CAST(N'2019-01-28T16:41:14.6100000' AS DateTime2), CAST(N'2019-01-28T16:41:14.6100000' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (17, N'Split', N'SPL', N'21000', 51, CAST(N'2019-01-28T16:41:14.6100000' AS DateTime2), CAST(N'2019-01-28T16:41:14.6100000' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (18, N'Pazin', N'PAZ', N'52000', 51, CAST(N'2019-01-28T16:41:14.6100000' AS DateTime2), CAST(N'2019-01-28T16:41:14.6100000' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (19, N'Karlovac', N'KAR', N'10000', 51, CAST(N'2019-01-28T16:41:14.6100000' AS DateTime2), CAST(N'2019-01-28T16:41:14.6100000' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (20, N'Bjelovar', N'BJE', N'43000', 51, CAST(N'2019-01-28T16:41:14.6133333' AS DateTime2), CAST(N'2019-01-28T16:41:14.6133333' AS DateTime2), 1)
INSERT [dbo].[Cities] ([Id], [Name], [Code], [PostalCode], [CountryId], [DateCreated], [DateModified], [Version]) VALUES (21, N'Pula', N'PUL', N'52100', 51, CAST(N'2019-01-28T16:41:14.6133333' AS DateTime2), CAST(N'2019-01-28T16:41:14.6133333' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (1, N'Afghanistan', N'AFG', CAST(N'2019-01-24T18:14:10.8633333' AS DateTime2), CAST(N'2019-01-24T18:14:10.8633333' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (2, N'Albania ', N'ALB', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (3, N'Algeria ', N'ALG', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (4, N'American Samoa ', N'AME', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (5, N'Andorra ', N'AND', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (6, N'Angola ', N'ANG', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (7, N'Anguilla ', N'ANG', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (8, N'Antigua & Barbuda ', N'ANT', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (9, N'Argentina ', N'ARG', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (10, N'Armenia ', N'ARM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (11, N'Aruba ', N'ARU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (12, N'Australia ', N'AUS', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (13, N'Austria ', N'AUS', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (14, N'Azerbaijan ', N'AZE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (15, N'Bahamas', N'BAH', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (16, N'Bahrain ', N'BAH', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (17, N'Bangladesh ', N'BAN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (18, N'Barbados ', N'BAR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (19, N'Belarus ', N'BEL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (20, N'Belgium ', N'BEL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (21, N'Belize ', N'BEL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (22, N'Benin ', N'BEN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (23, N'Bermuda ', N'BER', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (24, N'Bhutan ', N'BHU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (25, N'Bolivia ', N'BOL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (26, N'Bosnia & Herzegovina ', N'BOS', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (27, N'Botswana ', N'BOT', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (28, N'Brazil ', N'BRA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (29, N'British Virgin Is. ', N'BRI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (30, N'Brunei ', N'BRU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (31, N'Bulgaria ', N'BUL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (32, N'Burkina Faso ', N'BUR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (33, N'Burma ', N'BUR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (34, N'Burundi ', N'BUR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (35, N'Cambodia ', N'CAM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (36, N'Cameroon ', N'CAM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (37, N'Canada ', N'CAN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (38, N'Cape Verde ', N'CAP', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (39, N'Cayman Islands ', N'CAY', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (40, N'Central African Rep. ', N'CEN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (41, N'Chad ', N'CHA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (42, N'Chile ', N'CHI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (43, N'China ', N'CHI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (44, N'Colombia ', N'COL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (45, N'Comoros ', N'COM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (46, N'Congo - Dem. Rep.', N'CON', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (47, N'Congo - Repub. of the', N'CON', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (48, N'Cook Islands ', N'COO', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (49, N'Costa Rica ', N'COS', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (50, N'Cote d''Ivoire ', N'COT', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (51, N'Croatia ', N'CRO', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (52, N'Cuba ', N'CUB', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (53, N'Cyprus ', N'CYP', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (54, N'Czech Republic ', N'CZE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (55, N'Denmark ', N'DEN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (56, N'Djibouti ', N'DJI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (57, N'Dominica ', N'DOM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (58, N'Dominican Republic ', N'DOM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (59, N'East Timor ', N'EAS', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (60, N'Ecuador ', N'ECU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (61, N'Egypt ', N'EGY', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (62, N'El Salvador ', N'EL ', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (63, N'Equatorial Guinea ', N'EQU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (64, N'Eritrea ', N'ERI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (65, N'Estonia ', N'EST', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (66, N'Ethiopia ', N'ETH', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (67, N'Faroe Islands ', N'FAR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (68, N'Fiji ', N'FIJ', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (69, N'Finland ', N'FIN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (70, N'France ', N'FRA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (71, N'French Guiana ', N'FRE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (72, N'French Polynesia ', N'FRE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (73, N'Gabon', N'GAB', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (74, N'Gambia', N'GAM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (75, N'Gaza Strip ', N'GAZ', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (76, N'Georgia ', N'GEO', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (77, N'Germany ', N'GER', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (78, N'Ghana ', N'GHA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (79, N'Gibraltar ', N'GIB', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (80, N'Greece ', N'GRE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (81, N'Greenland ', N'GRE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (82, N'Grenada ', N'GRE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (83, N'Guadeloupe ', N'GUA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (84, N'Guam ', N'GUA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (85, N'Guatemala ', N'GUA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (86, N'Guernsey ', N'GUE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (87, N'Guinea ', N'GUI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (88, N'Guinea-Bissau ', N'GUI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (89, N'Guyana ', N'GUY', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (90, N'Haiti ', N'HAI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (91, N'Honduras ', N'HON', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (92, N'Hong Kong ', N'HON', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (93, N'Hungary ', N'HUN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (94, N'Iceland ', N'ICE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (95, N'India ', N'IND', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (96, N'Indonesia ', N'IND', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (97, N'Iran ', N'IRA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (98, N'Iraq ', N'IRA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (99, N'Ireland ', N'IRE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
GO
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (100, N'Isle of Man ', N'ISL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (101, N'Israel ', N'ISR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (102, N'Italy ', N'ITA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (103, N'Jamaica ', N'JAM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (104, N'Japan ', N'JAP', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (105, N'Jersey ', N'JER', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (106, N'Jordan ', N'JOR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (107, N'Kazakhstan ', N'KAZ', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (108, N'Kenya ', N'KEN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (109, N'Kiribati ', N'KIR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (110, N'Korea - North', N'KOR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (111, N'Korea - South', N'KOR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (112, N'Kuwait ', N'KUW', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (113, N'Kyrgyzstan ', N'KYR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (114, N'Laos ', N'LAO', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (115, N'Latvia ', N'LAT', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (116, N'Lebanon ', N'LEB', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (117, N'Lesotho ', N'LES', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (118, N'Liberia ', N'LIB', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (119, N'Libya ', N'LIB', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (120, N'Liechtenstein ', N'LIE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (121, N'Lithuania ', N'LIT', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (122, N'Luxembourg ', N'LUX', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (123, N'Macau ', N'MAC', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (124, N'Macedonia ', N'MAC', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (125, N'Madagascar ', N'MAD', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (126, N'Malawi ', N'MAL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (127, N'Malaysia ', N'MAL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (128, N'Maldives ', N'MAL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (129, N'Mali ', N'MAL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (130, N'Malta ', N'MAL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (131, N'Marshall Islands ', N'MAR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (132, N'Martinique ', N'MAR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (133, N'Mauritania ', N'MAU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (134, N'Mauritius ', N'MAU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (135, N'Mayotte ', N'MAY', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (136, N'Mexico ', N'MEX', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (137, N'Micronesia - Fed. St.', N'MIC', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (138, N'Moldova ', N'MOL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (139, N'Monaco ', N'MON', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (140, N'Mongolia ', N'MON', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (141, N'Montserrat ', N'MON', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (142, N'Morocco ', N'MOR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (143, N'Mozambique ', N'MOZ', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (144, N'Namibia ', N'NAM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (145, N'Nauru ', N'NAU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (146, N'Nepal ', N'NEP', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (147, N'Netherlands ', N'NET', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (148, N'Netherlands Antilles ', N'NET', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (149, N'New Caledonia ', N'NEW', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (150, N'New Zealand ', N'NEW', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (151, N'Nicaragua ', N'NIC', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (152, N'Niger ', N'NIG', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (153, N'Nigeria ', N'NIG', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (154, N'N. Mariana Islands ', N'N. ', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (155, N'Norway ', N'NOR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (156, N'Oman ', N'OMA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (157, N'Pakistan ', N'PAK', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (158, N'Palau ', N'PAL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (159, N'Panama ', N'PAN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (160, N'Papua New Guinea ', N'PAP', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (161, N'Paraguay ', N'PAR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (162, N'Peru ', N'PER', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (163, N'Philippines ', N'PHI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (164, N'Poland ', N'POL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (165, N'Portugal ', N'POR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (166, N'Puerto Rico ', N'PUE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (167, N'Qatar ', N'QAT', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (168, N'Reunion ', N'REU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (169, N'Romania ', N'ROM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (170, N'Russia ', N'RUS', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (171, N'Rwanda ', N'RWA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (172, N'Saint Helena ', N'SAI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (173, N'Saint Kitts & Nevis ', N'SAI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (174, N'Saint Lucia ', N'SAI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (175, N'St Pierre & Miquelon ', N'ST ', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (176, N'Saint Vincent and the Grenadines ', N'SAI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (177, N'Samoa ', N'SAM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (178, N'San Marino ', N'SAN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (179, N'Sao Tome & Principe ', N'SAO', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (180, N'Saudi Arabia ', N'SAU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (181, N'Senegal ', N'SEN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (182, N'Serbia ', N'SER', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (183, N'Seychelles ', N'SEY', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (184, N'Sierra Leone ', N'SIE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (185, N'Singapore ', N'SIN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (186, N'Slovakia ', N'SLO', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (187, N'Slovenia ', N'SLO', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (188, N'Solomon Islands ', N'SOL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (189, N'Somalia ', N'SOM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (190, N'South Africa ', N'SOU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (191, N'Spain ', N'SPA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (192, N'Sri Lanka ', N'SRI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (193, N'Sudan ', N'SUD', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (194, N'Suriname ', N'SUR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (195, N'Swaziland ', N'SWA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (196, N'Sweden ', N'SWE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (197, N'Switzerland ', N'SWI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (198, N'Syria ', N'SYR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (199, N'Taiwan ', N'TAI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
GO
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (200, N'Tajikistan ', N'TAJ', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (201, N'Tanzania ', N'TAN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (202, N'Thailand ', N'THA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (203, N'Togo ', N'TOG', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (204, N'Tonga ', N'TON', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (205, N'Trinidad & Tobago ', N'TRI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (206, N'Tunisia ', N'TUN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (207, N'Turkey ', N'TUR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (208, N'Turkmenistan ', N'TUR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (209, N'Turks & Caicos Is ', N'TUR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (210, N'Tuvalu ', N'TUV', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (211, N'Uganda ', N'UGA', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (212, N'Ukraine ', N'UKR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (213, N'United Arab Emirates ', N'UNI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (214, N'United Kingdom ', N'UNI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (215, N'United States ', N'UNI', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (216, N'Uruguay ', N'URU', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (217, N'Uzbekistan ', N'UZB', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (218, N'Vanuatu ', N'VAN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (219, N'Venezuela ', N'VEN', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (220, N'Vietnam ', N'VIE', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (221, N'Virgin Islands ', N'VIR', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (222, N'Wallis and Futuna ', N'WAL', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (223, N'West Bank ', N'WES', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (224, N'Western Sahara ', N'WES', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (225, N'Yemen ', N'YEM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (226, N'Zambia ', N'ZAM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
INSERT [dbo].[Countries] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (227, N'Zimbabwe ', N'ZIM', CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), CAST(N'2019-01-27T15:17:48.2400000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Farms] ON 

INSERT [dbo].[Farms] ([Id], [UserId], [Name], [Description], [Address], [CityId], [RuleSetId], [Latitude], [Longitude], [DateCreated], [DateModified], [IpAddress]) VALUES (1, 1, N'Algebra Farm', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies fringilla volutpat. Praesent condimentum, neque et fringilla accumsan, risus est iaculis metus, in pretium mi eros et quam. Aenean tempus odio enim, iaculis dapibus nibh auctor vitae. Fusce et augue sed sapien sodales accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam nec dictum neque. Fusce lobortis, ipsum nec dictum pharetra, sapien tortor gravida libero, in accumsan dui elit vitae nisi. Sed sit amet lobortis lacus. Nulla tincidunt nunc nunc, quis sodales eros commodo sed. Pellentesque vitae quam enim. Sed non convallis nunc. In eget nisi ut risus pellentesque imperdiet. Sed augue neque, dictum ultrices vulputate eu, viverra ut nisi. Mauris at tellus sit amet mauris semper molestie et at sem. Morbi vel urna commodo, suscipit quam at, aliquam ligula.', N'Ilica 242', 2, 1, CAST(45.7821599 AS Decimal(18, 7)), CAST(15.8672717 AS Decimal(18, 7)), CAST(N'2019-02-07T21:10:07.6800000' AS DateTime2), CAST(N'2020-08-23T18:29:34.9252992' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Farms] OFF
GO
SET IDENTITY_INSERT [dbo].[FarmSensorMeasurements] ON 

INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1, 4, CAST(38.35 AS Decimal(18, 2)), CAST(N'2018-05-28T11:46:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (2, 4, CAST(24.92 AS Decimal(18, 2)), CAST(N'2018-02-24T03:04:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (3, 3, CAST(17.24 AS Decimal(18, 2)), CAST(N'2018-05-09T19:42:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (4, 3, CAST(13.24 AS Decimal(18, 2)), CAST(N'2018-05-16T15:15:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (5, 1, CAST(75.42 AS Decimal(18, 2)), CAST(N'2018-03-02T08:05:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (6, 2, CAST(79.17 AS Decimal(18, 2)), CAST(N'2018-04-21T09:04:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (7, 2, CAST(53.31 AS Decimal(18, 2)), CAST(N'2018-06-01T08:55:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (8, 1, CAST(90.68 AS Decimal(18, 2)), CAST(N'2018-05-15T19:14:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (9, 2, CAST(18.46 AS Decimal(18, 2)), CAST(N'2018-03-10T20:43:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (10, 4, CAST(51.58 AS Decimal(18, 2)), CAST(N'2018-05-20T19:01:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (11, 3, CAST(59.91 AS Decimal(18, 2)), CAST(N'2018-04-07T01:16:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (12, 4, CAST(19.25 AS Decimal(18, 2)), CAST(N'2018-05-05T09:25:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (13, 3, CAST(66.28 AS Decimal(18, 2)), CAST(N'2018-05-05T07:49:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (14, 1, CAST(77.64 AS Decimal(18, 2)), CAST(N'2018-04-10T21:33:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (15, 2, CAST(16.39 AS Decimal(18, 2)), CAST(N'2018-05-02T07:56:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (16, 2, CAST(87.00 AS Decimal(18, 2)), CAST(N'2018-02-18T20:48:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (17, 1, CAST(6.06 AS Decimal(18, 2)), CAST(N'2018-02-22T20:52:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (18, 3, CAST(79.66 AS Decimal(18, 2)), CAST(N'2018-03-04T11:58:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (19, 3, CAST(22.71 AS Decimal(18, 2)), CAST(N'2018-05-02T06:32:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (20, 1, CAST(75.39 AS Decimal(18, 2)), CAST(N'2018-03-28T06:26:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (21, 1, CAST(41.46 AS Decimal(18, 2)), CAST(N'2018-03-23T01:54:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (22, 4, CAST(28.87 AS Decimal(18, 2)), CAST(N'2018-03-24T08:31:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (23, 3, CAST(27.90 AS Decimal(18, 2)), CAST(N'2018-03-20T09:16:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (24, 4, CAST(2.46 AS Decimal(18, 2)), CAST(N'2018-04-09T23:31:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (25, 2, CAST(46.81 AS Decimal(18, 2)), CAST(N'2018-03-09T00:55:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (26, 4, CAST(20.59 AS Decimal(18, 2)), CAST(N'2018-04-08T19:43:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (27, 2, CAST(14.21 AS Decimal(18, 2)), CAST(N'2018-03-26T07:09:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (28, 4, CAST(33.35 AS Decimal(18, 2)), CAST(N'2018-04-12T23:09:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (29, 3, CAST(27.31 AS Decimal(18, 2)), CAST(N'2018-03-10T23:38:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (30, 1, CAST(11.64 AS Decimal(18, 2)), CAST(N'2018-05-09T23:12:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (31, 3, CAST(57.87 AS Decimal(18, 2)), CAST(N'2018-02-20T21:24:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (32, 1, CAST(85.04 AS Decimal(18, 2)), CAST(N'2018-04-30T21:21:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (33, 3, CAST(3.98 AS Decimal(18, 2)), CAST(N'2018-03-08T20:10:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (34, 1, CAST(46.78 AS Decimal(18, 2)), CAST(N'2018-04-16T20:18:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (35, 4, CAST(1.89 AS Decimal(18, 2)), CAST(N'2018-04-08T16:07:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (36, 1, CAST(13.36 AS Decimal(18, 2)), CAST(N'2018-03-29T01:50:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (37, 1, CAST(33.77 AS Decimal(18, 2)), CAST(N'2018-02-07T12:38:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (38, 3, CAST(63.79 AS Decimal(18, 2)), CAST(N'2018-05-02T00:39:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (39, 2, CAST(25.18 AS Decimal(18, 2)), CAST(N'2018-05-21T11:07:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (40, 1, CAST(66.65 AS Decimal(18, 2)), CAST(N'2018-02-08T15:06:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (41, 3, CAST(25.02 AS Decimal(18, 2)), CAST(N'2018-04-16T13:21:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (42, 4, CAST(40.58 AS Decimal(18, 2)), CAST(N'2018-04-07T17:30:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (43, 3, CAST(51.69 AS Decimal(18, 2)), CAST(N'2018-05-08T09:23:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (44, 2, CAST(4.94 AS Decimal(18, 2)), CAST(N'2018-03-26T14:03:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (45, 3, CAST(63.91 AS Decimal(18, 2)), CAST(N'2018-02-18T06:22:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (46, 3, CAST(49.64 AS Decimal(18, 2)), CAST(N'2018-02-23T19:18:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (47, 3, CAST(37.75 AS Decimal(18, 2)), CAST(N'2018-05-15T21:44:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (48, 2, CAST(96.15 AS Decimal(18, 2)), CAST(N'2018-04-11T11:06:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (49, 4, CAST(84.43 AS Decimal(18, 2)), CAST(N'2018-04-22T15:21:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (50, 1, CAST(42.07 AS Decimal(18, 2)), CAST(N'2018-04-30T17:20:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (51, 3, CAST(61.64 AS Decimal(18, 2)), CAST(N'2018-02-07T13:56:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (52, 4, CAST(39.92 AS Decimal(18, 2)), CAST(N'2018-03-15T07:08:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (53, 2, CAST(14.29 AS Decimal(18, 2)), CAST(N'2018-04-27T17:28:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (54, 3, CAST(94.45 AS Decimal(18, 2)), CAST(N'2018-05-14T16:43:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (55, 2, CAST(79.21 AS Decimal(18, 2)), CAST(N'2018-04-04T20:58:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (56, 1, CAST(74.75 AS Decimal(18, 2)), CAST(N'2018-03-17T06:37:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (57, 1, CAST(69.41 AS Decimal(18, 2)), CAST(N'2018-02-20T21:25:19.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (58, 1, CAST(6.56 AS Decimal(18, 2)), CAST(N'2018-04-12T16:18:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (59, 1, CAST(32.47 AS Decimal(18, 2)), CAST(N'2018-05-18T00:53:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (60, 4, CAST(55.27 AS Decimal(18, 2)), CAST(N'2018-05-02T08:10:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (61, 2, CAST(75.02 AS Decimal(18, 2)), CAST(N'2018-03-02T10:41:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (62, 4, CAST(27.40 AS Decimal(18, 2)), CAST(N'2018-02-12T09:51:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (63, 2, CAST(45.49 AS Decimal(18, 2)), CAST(N'2018-02-20T12:06:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (64, 3, CAST(13.31 AS Decimal(18, 2)), CAST(N'2018-03-24T22:09:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (65, 1, CAST(24.04 AS Decimal(18, 2)), CAST(N'2018-04-27T06:09:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (66, 4, CAST(32.29 AS Decimal(18, 2)), CAST(N'2018-03-05T15:09:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (67, 1, CAST(56.92 AS Decimal(18, 2)), CAST(N'2018-02-14T11:30:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (68, 2, CAST(54.58 AS Decimal(18, 2)), CAST(N'2018-05-29T08:39:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (69, 2, CAST(25.49 AS Decimal(18, 2)), CAST(N'2018-03-13T10:00:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (70, 3, CAST(45.24 AS Decimal(18, 2)), CAST(N'2018-05-08T11:18:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (71, 1, CAST(23.49 AS Decimal(18, 2)), CAST(N'2018-05-03T10:19:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (72, 3, CAST(2.90 AS Decimal(18, 2)), CAST(N'2018-03-17T20:15:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (73, 4, CAST(65.50 AS Decimal(18, 2)), CAST(N'2018-02-22T09:23:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (74, 4, CAST(66.74 AS Decimal(18, 2)), CAST(N'2018-05-24T21:10:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (75, 4, CAST(94.57 AS Decimal(18, 2)), CAST(N'2018-03-27T08:42:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (76, 2, CAST(47.72 AS Decimal(18, 2)), CAST(N'2018-02-16T15:45:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (77, 1, CAST(16.14 AS Decimal(18, 2)), CAST(N'2018-03-18T12:44:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (78, 4, CAST(23.27 AS Decimal(18, 2)), CAST(N'2018-04-03T12:32:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (79, 4, CAST(79.40 AS Decimal(18, 2)), CAST(N'2018-05-19T13:48:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (80, 4, CAST(63.55 AS Decimal(18, 2)), CAST(N'2018-03-04T02:55:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (81, 3, CAST(87.82 AS Decimal(18, 2)), CAST(N'2018-05-01T06:45:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (82, 3, CAST(92.58 AS Decimal(18, 2)), CAST(N'2018-03-01T08:39:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (83, 4, CAST(25.40 AS Decimal(18, 2)), CAST(N'2018-05-22T05:01:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (84, 3, CAST(71.13 AS Decimal(18, 2)), CAST(N'2018-03-10T00:10:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (85, 4, CAST(50.38 AS Decimal(18, 2)), CAST(N'2018-02-20T21:26:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (86, 3, CAST(47.30 AS Decimal(18, 2)), CAST(N'2018-05-14T06:00:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (87, 4, CAST(52.27 AS Decimal(18, 2)), CAST(N'2018-04-23T02:43:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (88, 3, CAST(49.81 AS Decimal(18, 2)), CAST(N'2018-04-07T04:28:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (89, 3, CAST(68.45 AS Decimal(18, 2)), CAST(N'2018-02-22T15:47:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (90, 1, CAST(44.19 AS Decimal(18, 2)), CAST(N'2018-03-06T23:32:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (91, 2, CAST(41.08 AS Decimal(18, 2)), CAST(N'2018-03-14T16:49:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (92, 3, CAST(73.37 AS Decimal(18, 2)), CAST(N'2018-04-04T04:54:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (93, 1, CAST(24.92 AS Decimal(18, 2)), CAST(N'2018-05-16T13:29:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (94, 2, CAST(17.31 AS Decimal(18, 2)), CAST(N'2018-03-07T22:57:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (95, 1, CAST(31.37 AS Decimal(18, 2)), CAST(N'2018-05-08T04:53:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (96, 4, CAST(62.18 AS Decimal(18, 2)), CAST(N'2018-02-16T00:06:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (97, 3, CAST(15.24 AS Decimal(18, 2)), CAST(N'2018-03-04T23:50:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (98, 2, CAST(71.03 AS Decimal(18, 2)), CAST(N'2018-05-08T11:59:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (99, 3, CAST(64.43 AS Decimal(18, 2)), CAST(N'2018-03-25T14:09:35.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (100, 2, CAST(96.36 AS Decimal(18, 2)), CAST(N'2018-03-22T07:36:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (101, 4, CAST(30.62 AS Decimal(18, 2)), CAST(N'2018-02-13T08:47:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (102, 4, CAST(60.98 AS Decimal(18, 2)), CAST(N'2018-06-01T18:59:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (103, 4, CAST(82.48 AS Decimal(18, 2)), CAST(N'2018-02-20T10:25:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (104, 2, CAST(23.84 AS Decimal(18, 2)), CAST(N'2018-05-02T16:28:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (105, 3, CAST(77.28 AS Decimal(18, 2)), CAST(N'2018-03-20T20:54:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (106, 2, CAST(14.28 AS Decimal(18, 2)), CAST(N'2018-04-05T16:11:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (107, 3, CAST(58.81 AS Decimal(18, 2)), CAST(N'2018-02-26T12:51:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (108, 4, CAST(70.79 AS Decimal(18, 2)), CAST(N'2018-04-14T17:37:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (109, 3, CAST(62.99 AS Decimal(18, 2)), CAST(N'2018-04-27T22:35:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (110, 2, CAST(73.45 AS Decimal(18, 2)), CAST(N'2018-05-23T22:04:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (111, 1, CAST(17.44 AS Decimal(18, 2)), CAST(N'2018-02-18T10:49:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (112, 3, CAST(32.28 AS Decimal(18, 2)), CAST(N'2018-02-14T05:12:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (113, 4, CAST(89.44 AS Decimal(18, 2)), CAST(N'2018-04-21T13:15:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (114, 4, CAST(38.28 AS Decimal(18, 2)), CAST(N'2018-05-13T16:09:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (115, 3, CAST(33.38 AS Decimal(18, 2)), CAST(N'2018-05-29T02:33:30.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (116, 3, CAST(26.71 AS Decimal(18, 2)), CAST(N'2018-04-15T22:36:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (117, 2, CAST(88.71 AS Decimal(18, 2)), CAST(N'2018-04-14T05:35:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (118, 3, CAST(47.97 AS Decimal(18, 2)), CAST(N'2018-03-27T15:36:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (119, 2, CAST(40.97 AS Decimal(18, 2)), CAST(N'2018-03-19T10:44:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (120, 3, CAST(53.70 AS Decimal(18, 2)), CAST(N'2018-03-12T21:07:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (121, 3, CAST(72.26 AS Decimal(18, 2)), CAST(N'2018-04-27T23:35:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (122, 4, CAST(93.54 AS Decimal(18, 2)), CAST(N'2018-05-19T14:09:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (123, 2, CAST(38.79 AS Decimal(18, 2)), CAST(N'2018-02-26T14:39:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (124, 3, CAST(15.23 AS Decimal(18, 2)), CAST(N'2018-03-09T18:50:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (125, 2, CAST(6.83 AS Decimal(18, 2)), CAST(N'2018-02-28T17:19:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (126, 3, CAST(84.62 AS Decimal(18, 2)), CAST(N'2018-05-08T06:51:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (127, 3, CAST(58.03 AS Decimal(18, 2)), CAST(N'2018-05-04T07:32:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (128, 1, CAST(18.47 AS Decimal(18, 2)), CAST(N'2018-03-06T12:34:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (129, 4, CAST(1.29 AS Decimal(18, 2)), CAST(N'2018-03-13T14:24:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (130, 2, CAST(27.94 AS Decimal(18, 2)), CAST(N'2018-04-10T08:16:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (131, 2, CAST(36.72 AS Decimal(18, 2)), CAST(N'2018-02-26T16:29:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (132, 4, CAST(43.59 AS Decimal(18, 2)), CAST(N'2018-02-16T01:45:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (133, 2, CAST(55.68 AS Decimal(18, 2)), CAST(N'2018-04-04T08:03:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (134, 1, CAST(23.60 AS Decimal(18, 2)), CAST(N'2018-02-10T12:31:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (135, 1, CAST(98.77 AS Decimal(18, 2)), CAST(N'2018-02-10T08:30:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (136, 3, CAST(59.27 AS Decimal(18, 2)), CAST(N'2018-04-02T08:35:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (137, 4, CAST(60.33 AS Decimal(18, 2)), CAST(N'2018-04-23T07:23:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (138, 1, CAST(89.31 AS Decimal(18, 2)), CAST(N'2018-04-29T14:56:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (139, 3, CAST(46.32 AS Decimal(18, 2)), CAST(N'2018-04-01T21:19:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (140, 1, CAST(31.23 AS Decimal(18, 2)), CAST(N'2018-04-04T11:43:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (141, 4, CAST(77.36 AS Decimal(18, 2)), CAST(N'2018-05-25T17:20:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (142, 3, CAST(25.16 AS Decimal(18, 2)), CAST(N'2018-04-01T13:32:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (143, 1, CAST(35.96 AS Decimal(18, 2)), CAST(N'2018-02-15T18:56:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (144, 3, CAST(63.11 AS Decimal(18, 2)), CAST(N'2018-03-02T03:01:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (145, 3, CAST(19.95 AS Decimal(18, 2)), CAST(N'2018-03-12T22:39:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (146, 2, CAST(60.26 AS Decimal(18, 2)), CAST(N'2018-02-07T13:52:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (147, 1, CAST(81.56 AS Decimal(18, 2)), CAST(N'2018-02-20T16:27:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (148, 4, CAST(52.92 AS Decimal(18, 2)), CAST(N'2018-03-31T11:31:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (149, 4, CAST(40.45 AS Decimal(18, 2)), CAST(N'2018-03-30T13:41:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (150, 2, CAST(31.56 AS Decimal(18, 2)), CAST(N'2018-02-16T14:53:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (151, 2, CAST(77.89 AS Decimal(18, 2)), CAST(N'2018-02-13T13:33:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (152, 1, CAST(22.67 AS Decimal(18, 2)), CAST(N'2018-02-12T12:44:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (153, 4, CAST(76.11 AS Decimal(18, 2)), CAST(N'2018-02-23T04:54:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (154, 1, CAST(87.53 AS Decimal(18, 2)), CAST(N'2018-04-05T07:21:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (155, 4, CAST(35.88 AS Decimal(18, 2)), CAST(N'2018-04-09T19:38:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (156, 4, CAST(27.83 AS Decimal(18, 2)), CAST(N'2018-05-24T02:50:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (157, 3, CAST(31.51 AS Decimal(18, 2)), CAST(N'2018-04-22T02:18:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (158, 4, CAST(5.44 AS Decimal(18, 2)), CAST(N'2018-04-15T10:24:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (159, 3, CAST(30.28 AS Decimal(18, 2)), CAST(N'2018-04-14T15:37:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (160, 3, CAST(61.50 AS Decimal(18, 2)), CAST(N'2018-05-06T14:32:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (161, 1, CAST(71.73 AS Decimal(18, 2)), CAST(N'2018-05-05T13:02:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (162, 2, CAST(94.11 AS Decimal(18, 2)), CAST(N'2018-05-02T16:14:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (163, 3, CAST(56.30 AS Decimal(18, 2)), CAST(N'2018-05-15T06:18:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (164, 3, CAST(94.85 AS Decimal(18, 2)), CAST(N'2018-03-25T07:49:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (165, 2, CAST(28.31 AS Decimal(18, 2)), CAST(N'2018-03-17T23:11:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (166, 2, CAST(71.91 AS Decimal(18, 2)), CAST(N'2018-04-24T09:27:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (167, 2, CAST(60.95 AS Decimal(18, 2)), CAST(N'2018-02-26T04:57:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (168, 2, CAST(76.04 AS Decimal(18, 2)), CAST(N'2018-03-25T22:50:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (169, 2, CAST(97.80 AS Decimal(18, 2)), CAST(N'2018-03-13T23:50:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (170, 2, CAST(36.33 AS Decimal(18, 2)), CAST(N'2018-04-10T03:47:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (171, 1, CAST(74.03 AS Decimal(18, 2)), CAST(N'2018-02-28T17:49:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (172, 2, CAST(15.98 AS Decimal(18, 2)), CAST(N'2018-04-22T11:10:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (173, 3, CAST(89.97 AS Decimal(18, 2)), CAST(N'2018-05-28T22:24:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (174, 4, CAST(30.74 AS Decimal(18, 2)), CAST(N'2018-03-08T21:35:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (175, 1, CAST(62.17 AS Decimal(18, 2)), CAST(N'2018-04-26T02:21:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (176, 1, CAST(67.04 AS Decimal(18, 2)), CAST(N'2018-05-27T13:52:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (177, 1, CAST(12.05 AS Decimal(18, 2)), CAST(N'2018-03-16T17:00:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (178, 3, CAST(20.50 AS Decimal(18, 2)), CAST(N'2018-03-11T12:33:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (179, 3, CAST(3.86 AS Decimal(18, 2)), CAST(N'2018-04-10T11:05:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (180, 4, CAST(44.25 AS Decimal(18, 2)), CAST(N'2018-02-22T04:32:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (181, 1, CAST(39.78 AS Decimal(18, 2)), CAST(N'2018-03-06T23:11:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (182, 3, CAST(60.85 AS Decimal(18, 2)), CAST(N'2018-04-22T06:27:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (183, 4, CAST(31.11 AS Decimal(18, 2)), CAST(N'2018-04-12T13:05:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (184, 1, CAST(54.50 AS Decimal(18, 2)), CAST(N'2018-02-25T09:53:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (185, 4, CAST(21.92 AS Decimal(18, 2)), CAST(N'2018-03-28T09:25:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (186, 3, CAST(73.27 AS Decimal(18, 2)), CAST(N'2018-04-01T05:41:19.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (187, 4, CAST(59.09 AS Decimal(18, 2)), CAST(N'2018-05-16T05:07:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (188, 1, CAST(62.55 AS Decimal(18, 2)), CAST(N'2018-02-25T19:41:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (189, 1, CAST(15.87 AS Decimal(18, 2)), CAST(N'2018-02-21T23:47:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (190, 4, CAST(22.14 AS Decimal(18, 2)), CAST(N'2018-04-18T07:02:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (191, 1, CAST(95.59 AS Decimal(18, 2)), CAST(N'2018-04-04T00:04:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (192, 4, CAST(76.49 AS Decimal(18, 2)), CAST(N'2018-04-14T07:41:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (193, 3, CAST(54.29 AS Decimal(18, 2)), CAST(N'2018-03-03T20:32:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (194, 1, CAST(19.24 AS Decimal(18, 2)), CAST(N'2018-03-02T19:33:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (195, 3, CAST(75.50 AS Decimal(18, 2)), CAST(N'2018-03-19T23:57:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (196, 4, CAST(5.13 AS Decimal(18, 2)), CAST(N'2018-05-27T12:57:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (197, 3, CAST(21.60 AS Decimal(18, 2)), CAST(N'2018-02-16T08:59:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (198, 2, CAST(65.56 AS Decimal(18, 2)), CAST(N'2018-03-18T22:23:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (199, 1, CAST(31.66 AS Decimal(18, 2)), CAST(N'2018-04-25T04:45:02.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (200, 1, CAST(1.36 AS Decimal(18, 2)), CAST(N'2018-05-30T09:29:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (201, 2, CAST(80.43 AS Decimal(18, 2)), CAST(N'2018-05-08T09:15:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (202, 1, CAST(7.51 AS Decimal(18, 2)), CAST(N'2018-03-18T19:12:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (203, 3, CAST(27.79 AS Decimal(18, 2)), CAST(N'2018-05-10T04:13:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (204, 1, CAST(39.66 AS Decimal(18, 2)), CAST(N'2018-03-19T22:18:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (205, 1, CAST(20.71 AS Decimal(18, 2)), CAST(N'2018-05-11T09:53:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (206, 3, CAST(40.87 AS Decimal(18, 2)), CAST(N'2018-05-27T03:26:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (207, 3, CAST(65.85 AS Decimal(18, 2)), CAST(N'2018-05-27T00:06:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (208, 3, CAST(27.70 AS Decimal(18, 2)), CAST(N'2018-05-15T20:22:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (209, 2, CAST(44.86 AS Decimal(18, 2)), CAST(N'2018-05-31T04:47:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (210, 2, CAST(96.30 AS Decimal(18, 2)), CAST(N'2018-05-22T15:37:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (211, 1, CAST(82.46 AS Decimal(18, 2)), CAST(N'2018-04-29T12:35:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (212, 1, CAST(54.93 AS Decimal(18, 2)), CAST(N'2018-05-13T13:04:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (213, 1, CAST(96.06 AS Decimal(18, 2)), CAST(N'2018-03-21T04:50:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (214, 3, CAST(72.50 AS Decimal(18, 2)), CAST(N'2018-04-02T02:33:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (215, 3, CAST(79.43 AS Decimal(18, 2)), CAST(N'2018-04-20T11:16:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (216, 2, CAST(33.46 AS Decimal(18, 2)), CAST(N'2018-04-22T04:32:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (217, 2, CAST(91.29 AS Decimal(18, 2)), CAST(N'2018-05-19T16:56:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (218, 2, CAST(27.07 AS Decimal(18, 2)), CAST(N'2018-05-05T02:18:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (219, 2, CAST(47.29 AS Decimal(18, 2)), CAST(N'2018-05-11T01:28:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (220, 3, CAST(83.70 AS Decimal(18, 2)), CAST(N'2018-04-16T16:34:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (221, 3, CAST(93.71 AS Decimal(18, 2)), CAST(N'2018-03-30T23:40:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (222, 2, CAST(59.26 AS Decimal(18, 2)), CAST(N'2018-02-24T11:11:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (223, 4, CAST(63.55 AS Decimal(18, 2)), CAST(N'2018-04-19T02:33:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (224, 1, CAST(80.57 AS Decimal(18, 2)), CAST(N'2018-04-30T19:02:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (225, 4, CAST(47.68 AS Decimal(18, 2)), CAST(N'2018-05-14T10:55:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (226, 3, CAST(64.43 AS Decimal(18, 2)), CAST(N'2018-03-20T20:41:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (227, 4, CAST(98.99 AS Decimal(18, 2)), CAST(N'2018-05-07T03:32:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (228, 3, CAST(52.96 AS Decimal(18, 2)), CAST(N'2018-05-01T17:33:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (229, 3, CAST(89.41 AS Decimal(18, 2)), CAST(N'2018-03-22T21:25:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (230, 2, CAST(32.24 AS Decimal(18, 2)), CAST(N'2018-04-09T16:44:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (231, 1, CAST(83.95 AS Decimal(18, 2)), CAST(N'2018-02-13T08:02:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (232, 2, CAST(56.95 AS Decimal(18, 2)), CAST(N'2018-06-01T23:38:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (233, 3, CAST(41.16 AS Decimal(18, 2)), CAST(N'2018-02-20T04:13:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (234, 4, CAST(60.69 AS Decimal(18, 2)), CAST(N'2018-03-30T01:38:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (235, 2, CAST(72.08 AS Decimal(18, 2)), CAST(N'2018-02-28T01:12:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (236, 3, CAST(41.75 AS Decimal(18, 2)), CAST(N'2018-04-26T09:12:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (237, 4, CAST(18.35 AS Decimal(18, 2)), CAST(N'2018-03-10T18:35:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (238, 4, CAST(69.97 AS Decimal(18, 2)), CAST(N'2018-04-01T09:23:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (239, 4, CAST(14.86 AS Decimal(18, 2)), CAST(N'2018-05-29T21:22:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (240, 4, CAST(54.35 AS Decimal(18, 2)), CAST(N'2018-02-15T02:52:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (241, 3, CAST(99.63 AS Decimal(18, 2)), CAST(N'2018-04-12T13:42:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (242, 3, CAST(77.14 AS Decimal(18, 2)), CAST(N'2018-05-20T19:08:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (243, 3, CAST(16.01 AS Decimal(18, 2)), CAST(N'2018-05-18T22:59:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (244, 4, CAST(40.19 AS Decimal(18, 2)), CAST(N'2018-02-14T06:08:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (245, 2, CAST(21.74 AS Decimal(18, 2)), CAST(N'2018-02-28T05:35:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (246, 4, CAST(19.16 AS Decimal(18, 2)), CAST(N'2018-02-27T02:58:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (247, 3, CAST(37.98 AS Decimal(18, 2)), CAST(N'2018-02-17T22:27:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (248, 1, CAST(46.04 AS Decimal(18, 2)), CAST(N'2018-03-30T20:54:30.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (249, 1, CAST(60.14 AS Decimal(18, 2)), CAST(N'2018-02-28T20:19:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (250, 2, CAST(12.89 AS Decimal(18, 2)), CAST(N'2018-05-24T13:04:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (251, 2, CAST(51.37 AS Decimal(18, 2)), CAST(N'2018-03-10T09:51:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (252, 4, CAST(67.21 AS Decimal(18, 2)), CAST(N'2018-04-03T08:52:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (253, 4, CAST(43.66 AS Decimal(18, 2)), CAST(N'2018-02-20T13:48:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (254, 4, CAST(49.27 AS Decimal(18, 2)), CAST(N'2018-05-19T21:13:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (255, 2, CAST(46.53 AS Decimal(18, 2)), CAST(N'2018-02-28T12:47:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (256, 4, CAST(93.15 AS Decimal(18, 2)), CAST(N'2018-05-25T01:20:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (257, 1, CAST(35.34 AS Decimal(18, 2)), CAST(N'2018-05-17T06:25:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (258, 4, CAST(86.16 AS Decimal(18, 2)), CAST(N'2018-03-31T09:37:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (259, 3, CAST(25.08 AS Decimal(18, 2)), CAST(N'2018-05-03T16:31:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (260, 1, CAST(22.77 AS Decimal(18, 2)), CAST(N'2018-03-11T01:17:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (261, 1, CAST(75.29 AS Decimal(18, 2)), CAST(N'2018-05-21T07:15:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (262, 3, CAST(3.14 AS Decimal(18, 2)), CAST(N'2018-05-07T10:58:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (263, 4, CAST(85.73 AS Decimal(18, 2)), CAST(N'2018-03-21T20:19:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (264, 4, CAST(80.06 AS Decimal(18, 2)), CAST(N'2018-05-19T00:52:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (265, 4, CAST(87.89 AS Decimal(18, 2)), CAST(N'2018-04-22T10:31:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (266, 1, CAST(44.05 AS Decimal(18, 2)), CAST(N'2018-03-29T13:03:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (267, 2, CAST(90.28 AS Decimal(18, 2)), CAST(N'2018-04-08T10:50:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (268, 1, CAST(63.96 AS Decimal(18, 2)), CAST(N'2018-03-18T10:09:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (269, 1, CAST(95.28 AS Decimal(18, 2)), CAST(N'2018-03-25T08:13:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (270, 2, CAST(21.16 AS Decimal(18, 2)), CAST(N'2018-03-11T21:06:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (271, 2, CAST(54.32 AS Decimal(18, 2)), CAST(N'2018-05-08T18:31:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (272, 1, CAST(21.48 AS Decimal(18, 2)), CAST(N'2018-05-16T04:24:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (273, 1, CAST(46.61 AS Decimal(18, 2)), CAST(N'2018-05-25T15:14:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (274, 4, CAST(25.61 AS Decimal(18, 2)), CAST(N'2018-05-25T23:54:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (275, 2, CAST(93.11 AS Decimal(18, 2)), CAST(N'2018-05-09T23:04:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (276, 1, CAST(99.99 AS Decimal(18, 2)), CAST(N'2018-05-10T01:18:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (277, 2, CAST(48.40 AS Decimal(18, 2)), CAST(N'2018-05-23T04:22:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (278, 2, CAST(81.29 AS Decimal(18, 2)), CAST(N'2018-02-07T00:13:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (279, 1, CAST(87.47 AS Decimal(18, 2)), CAST(N'2018-03-12T12:37:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (280, 3, CAST(87.90 AS Decimal(18, 2)), CAST(N'2018-03-17T17:38:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (281, 4, CAST(29.44 AS Decimal(18, 2)), CAST(N'2018-02-15T05:55:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (282, 1, CAST(84.68 AS Decimal(18, 2)), CAST(N'2018-02-16T08:50:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (283, 3, CAST(23.04 AS Decimal(18, 2)), CAST(N'2018-03-01T01:16:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (284, 1, CAST(68.10 AS Decimal(18, 2)), CAST(N'2018-05-16T07:58:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (285, 2, CAST(33.00 AS Decimal(18, 2)), CAST(N'2018-03-08T06:01:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (286, 3, CAST(58.24 AS Decimal(18, 2)), CAST(N'2018-05-11T17:53:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (287, 2, CAST(32.93 AS Decimal(18, 2)), CAST(N'2018-03-27T20:24:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (288, 1, CAST(91.67 AS Decimal(18, 2)), CAST(N'2018-05-09T00:56:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (289, 1, CAST(26.95 AS Decimal(18, 2)), CAST(N'2018-04-05T11:17:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (290, 4, CAST(75.08 AS Decimal(18, 2)), CAST(N'2018-03-09T11:06:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (291, 2, CAST(1.66 AS Decimal(18, 2)), CAST(N'2018-04-11T21:10:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (292, 4, CAST(30.54 AS Decimal(18, 2)), CAST(N'2018-03-09T06:03:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (293, 4, CAST(50.45 AS Decimal(18, 2)), CAST(N'2018-04-04T08:00:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (294, 1, CAST(24.44 AS Decimal(18, 2)), CAST(N'2018-04-15T05:02:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (295, 1, CAST(81.16 AS Decimal(18, 2)), CAST(N'2018-02-24T16:32:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (296, 1, CAST(21.82 AS Decimal(18, 2)), CAST(N'2018-04-26T04:19:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (297, 1, CAST(86.34 AS Decimal(18, 2)), CAST(N'2018-04-30T13:14:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (298, 3, CAST(85.54 AS Decimal(18, 2)), CAST(N'2018-03-07T05:02:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (299, 3, CAST(47.87 AS Decimal(18, 2)), CAST(N'2018-04-25T19:37:22.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (300, 2, CAST(83.38 AS Decimal(18, 2)), CAST(N'2018-03-24T02:38:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (301, 3, CAST(65.64 AS Decimal(18, 2)), CAST(N'2018-02-23T15:42:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (302, 2, CAST(8.22 AS Decimal(18, 2)), CAST(N'2018-03-01T06:58:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (303, 4, CAST(56.45 AS Decimal(18, 2)), CAST(N'2018-04-18T05:50:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (304, 2, CAST(57.18 AS Decimal(18, 2)), CAST(N'2018-04-08T05:12:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (305, 3, CAST(27.14 AS Decimal(18, 2)), CAST(N'2018-05-18T22:28:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (306, 1, CAST(52.14 AS Decimal(18, 2)), CAST(N'2018-04-14T07:50:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (307, 2, CAST(57.12 AS Decimal(18, 2)), CAST(N'2018-03-12T06:44:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (308, 1, CAST(17.66 AS Decimal(18, 2)), CAST(N'2018-05-01T03:07:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (309, 1, CAST(37.24 AS Decimal(18, 2)), CAST(N'2018-03-04T03:13:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (310, 1, CAST(92.71 AS Decimal(18, 2)), CAST(N'2018-03-24T00:55:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (311, 2, CAST(37.93 AS Decimal(18, 2)), CAST(N'2018-04-09T23:46:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (312, 4, CAST(31.69 AS Decimal(18, 2)), CAST(N'2018-03-09T20:31:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (313, 2, CAST(57.50 AS Decimal(18, 2)), CAST(N'2018-04-24T12:31:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (314, 4, CAST(16.08 AS Decimal(18, 2)), CAST(N'2018-02-25T00:18:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (315, 4, CAST(63.29 AS Decimal(18, 2)), CAST(N'2018-05-23T18:57:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (316, 3, CAST(44.56 AS Decimal(18, 2)), CAST(N'2018-02-22T07:57:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (317, 3, CAST(86.11 AS Decimal(18, 2)), CAST(N'2018-03-06T19:26:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (318, 3, CAST(51.55 AS Decimal(18, 2)), CAST(N'2018-02-11T05:27:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (319, 4, CAST(26.44 AS Decimal(18, 2)), CAST(N'2018-02-10T07:53:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (320, 1, CAST(69.76 AS Decimal(18, 2)), CAST(N'2018-05-31T17:33:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (321, 2, CAST(7.41 AS Decimal(18, 2)), CAST(N'2018-02-21T10:51:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (322, 2, CAST(61.53 AS Decimal(18, 2)), CAST(N'2018-04-25T22:04:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (323, 3, CAST(70.62 AS Decimal(18, 2)), CAST(N'2018-05-26T20:40:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (324, 1, CAST(80.74 AS Decimal(18, 2)), CAST(N'2018-05-23T22:47:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (325, 4, CAST(21.22 AS Decimal(18, 2)), CAST(N'2018-02-19T21:07:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (326, 2, CAST(38.91 AS Decimal(18, 2)), CAST(N'2018-04-07T09:27:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (327, 3, CAST(47.64 AS Decimal(18, 2)), CAST(N'2018-02-17T19:59:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (328, 2, CAST(61.32 AS Decimal(18, 2)), CAST(N'2018-05-28T01:30:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (329, 3, CAST(49.72 AS Decimal(18, 2)), CAST(N'2018-04-25T08:22:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (330, 3, CAST(71.00 AS Decimal(18, 2)), CAST(N'2018-04-25T13:07:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (331, 2, CAST(83.83 AS Decimal(18, 2)), CAST(N'2018-04-18T11:10:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (332, 1, CAST(49.02 AS Decimal(18, 2)), CAST(N'2018-04-15T20:36:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (333, 1, CAST(1.60 AS Decimal(18, 2)), CAST(N'2018-03-31T00:39:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (334, 2, CAST(9.97 AS Decimal(18, 2)), CAST(N'2018-02-18T23:37:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (335, 1, CAST(8.60 AS Decimal(18, 2)), CAST(N'2018-05-31T06:41:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (336, 4, CAST(82.59 AS Decimal(18, 2)), CAST(N'2018-03-31T16:38:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (337, 1, CAST(6.64 AS Decimal(18, 2)), CAST(N'2018-02-14T19:00:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (338, 4, CAST(15.89 AS Decimal(18, 2)), CAST(N'2018-04-04T06:12:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (339, 3, CAST(82.89 AS Decimal(18, 2)), CAST(N'2018-04-25T04:49:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (340, 2, CAST(83.78 AS Decimal(18, 2)), CAST(N'2018-05-03T00:18:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (341, 4, CAST(23.50 AS Decimal(18, 2)), CAST(N'2018-02-21T09:56:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (342, 2, CAST(83.58 AS Decimal(18, 2)), CAST(N'2018-04-16T02:11:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (343, 3, CAST(10.64 AS Decimal(18, 2)), CAST(N'2018-03-14T21:55:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (344, 1, CAST(47.58 AS Decimal(18, 2)), CAST(N'2018-02-24T06:07:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (345, 1, CAST(84.18 AS Decimal(18, 2)), CAST(N'2018-04-01T10:36:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (346, 2, CAST(30.13 AS Decimal(18, 2)), CAST(N'2018-02-11T22:22:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (347, 1, CAST(12.00 AS Decimal(18, 2)), CAST(N'2018-04-14T20:52:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (348, 4, CAST(68.53 AS Decimal(18, 2)), CAST(N'2018-03-27T03:11:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (349, 3, CAST(73.32 AS Decimal(18, 2)), CAST(N'2018-02-24T14:05:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (350, 4, CAST(32.52 AS Decimal(18, 2)), CAST(N'2018-04-05T21:36:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (351, 3, CAST(68.53 AS Decimal(18, 2)), CAST(N'2018-04-07T16:16:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (352, 4, CAST(79.54 AS Decimal(18, 2)), CAST(N'2018-02-21T13:33:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (353, 2, CAST(54.85 AS Decimal(18, 2)), CAST(N'2018-04-01T13:27:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (354, 1, CAST(47.34 AS Decimal(18, 2)), CAST(N'2018-05-18T20:33:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (355, 2, CAST(40.66 AS Decimal(18, 2)), CAST(N'2018-02-26T16:34:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (356, 4, CAST(19.78 AS Decimal(18, 2)), CAST(N'2018-05-26T03:13:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (357, 2, CAST(93.98 AS Decimal(18, 2)), CAST(N'2018-04-13T04:41:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (358, 4, CAST(77.02 AS Decimal(18, 2)), CAST(N'2018-04-21T15:13:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (359, 4, CAST(69.79 AS Decimal(18, 2)), CAST(N'2018-03-14T08:45:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (360, 2, CAST(49.87 AS Decimal(18, 2)), CAST(N'2018-03-02T13:42:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (361, 4, CAST(87.80 AS Decimal(18, 2)), CAST(N'2018-03-16T14:56:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (362, 2, CAST(67.26 AS Decimal(18, 2)), CAST(N'2018-03-17T23:24:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (363, 1, CAST(10.55 AS Decimal(18, 2)), CAST(N'2018-05-02T09:43:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (364, 3, CAST(48.43 AS Decimal(18, 2)), CAST(N'2018-05-06T16:50:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (365, 2, CAST(50.59 AS Decimal(18, 2)), CAST(N'2018-02-10T01:29:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (366, 3, CAST(39.41 AS Decimal(18, 2)), CAST(N'2018-04-14T00:53:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (367, 4, CAST(43.20 AS Decimal(18, 2)), CAST(N'2018-02-09T01:45:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (368, 1, CAST(59.57 AS Decimal(18, 2)), CAST(N'2018-04-18T08:17:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (369, 1, CAST(70.63 AS Decimal(18, 2)), CAST(N'2018-03-04T03:28:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (370, 3, CAST(10.28 AS Decimal(18, 2)), CAST(N'2018-04-27T02:06:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (371, 4, CAST(30.27 AS Decimal(18, 2)), CAST(N'2018-05-13T08:46:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (372, 1, CAST(94.76 AS Decimal(18, 2)), CAST(N'2018-04-27T04:43:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (373, 1, CAST(60.59 AS Decimal(18, 2)), CAST(N'2018-03-25T06:13:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (374, 4, CAST(2.15 AS Decimal(18, 2)), CAST(N'2018-05-24T22:23:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (375, 2, CAST(24.47 AS Decimal(18, 2)), CAST(N'2018-04-12T19:44:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (376, 3, CAST(96.51 AS Decimal(18, 2)), CAST(N'2018-05-14T16:53:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (377, 2, CAST(17.07 AS Decimal(18, 2)), CAST(N'2018-05-09T04:30:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (378, 3, CAST(13.88 AS Decimal(18, 2)), CAST(N'2018-03-07T10:24:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (379, 2, CAST(91.13 AS Decimal(18, 2)), CAST(N'2018-02-19T12:48:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (380, 2, CAST(66.14 AS Decimal(18, 2)), CAST(N'2018-03-23T23:26:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (381, 1, CAST(90.56 AS Decimal(18, 2)), CAST(N'2018-05-29T01:23:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (382, 4, CAST(73.03 AS Decimal(18, 2)), CAST(N'2018-03-12T08:14:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (383, 2, CAST(12.24 AS Decimal(18, 2)), CAST(N'2018-02-19T02:17:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (384, 2, CAST(67.58 AS Decimal(18, 2)), CAST(N'2018-04-16T16:15:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (385, 1, CAST(70.09 AS Decimal(18, 2)), CAST(N'2018-03-14T09:03:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (386, 4, CAST(46.89 AS Decimal(18, 2)), CAST(N'2018-04-14T22:05:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (387, 3, CAST(27.20 AS Decimal(18, 2)), CAST(N'2018-02-18T12:28:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (388, 4, CAST(17.83 AS Decimal(18, 2)), CAST(N'2018-04-17T04:29:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (389, 4, CAST(55.03 AS Decimal(18, 2)), CAST(N'2018-05-23T10:56:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (390, 2, CAST(80.44 AS Decimal(18, 2)), CAST(N'2018-04-30T09:03:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (391, 2, CAST(54.25 AS Decimal(18, 2)), CAST(N'2018-04-20T09:40:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (392, 3, CAST(40.67 AS Decimal(18, 2)), CAST(N'2018-05-25T02:20:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (393, 3, CAST(33.20 AS Decimal(18, 2)), CAST(N'2018-05-15T00:24:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (394, 1, CAST(69.84 AS Decimal(18, 2)), CAST(N'2018-04-19T13:02:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (395, 1, CAST(13.37 AS Decimal(18, 2)), CAST(N'2018-03-11T08:07:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (396, 3, CAST(59.17 AS Decimal(18, 2)), CAST(N'2018-04-09T07:11:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (397, 2, CAST(45.70 AS Decimal(18, 2)), CAST(N'2018-05-06T23:41:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (398, 1, CAST(15.75 AS Decimal(18, 2)), CAST(N'2018-04-14T02:06:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (399, 1, CAST(77.49 AS Decimal(18, 2)), CAST(N'2018-05-10T11:16:55.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (400, 4, CAST(99.14 AS Decimal(18, 2)), CAST(N'2018-03-18T12:19:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (401, 2, CAST(69.83 AS Decimal(18, 2)), CAST(N'2018-05-01T17:44:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (402, 4, CAST(46.30 AS Decimal(18, 2)), CAST(N'2018-05-22T23:45:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (403, 2, CAST(96.04 AS Decimal(18, 2)), CAST(N'2018-02-10T21:25:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (404, 2, CAST(66.75 AS Decimal(18, 2)), CAST(N'2018-03-29T12:26:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (405, 3, CAST(67.05 AS Decimal(18, 2)), CAST(N'2018-02-07T05:06:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (406, 3, CAST(59.93 AS Decimal(18, 2)), CAST(N'2018-03-11T12:31:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (407, 1, CAST(49.75 AS Decimal(18, 2)), CAST(N'2018-04-12T06:20:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (408, 3, CAST(57.89 AS Decimal(18, 2)), CAST(N'2018-03-11T09:27:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (409, 2, CAST(95.96 AS Decimal(18, 2)), CAST(N'2018-04-04T02:40:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (410, 1, CAST(12.03 AS Decimal(18, 2)), CAST(N'2018-04-23T08:50:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (411, 2, CAST(75.47 AS Decimal(18, 2)), CAST(N'2018-06-01T22:52:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (412, 1, CAST(82.44 AS Decimal(18, 2)), CAST(N'2018-03-29T10:33:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (413, 1, CAST(4.18 AS Decimal(18, 2)), CAST(N'2018-05-01T03:35:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (414, 4, CAST(42.33 AS Decimal(18, 2)), CAST(N'2018-02-07T10:59:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (415, 1, CAST(55.80 AS Decimal(18, 2)), CAST(N'2018-05-02T08:25:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (416, 4, CAST(27.57 AS Decimal(18, 2)), CAST(N'2018-04-05T10:46:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (417, 4, CAST(75.37 AS Decimal(18, 2)), CAST(N'2018-02-19T07:02:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (418, 2, CAST(83.24 AS Decimal(18, 2)), CAST(N'2018-04-16T16:02:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (419, 3, CAST(11.40 AS Decimal(18, 2)), CAST(N'2018-04-05T03:23:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (420, 1, CAST(28.80 AS Decimal(18, 2)), CAST(N'2018-05-24T10:23:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (421, 4, CAST(26.97 AS Decimal(18, 2)), CAST(N'2018-02-22T00:03:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (422, 2, CAST(42.45 AS Decimal(18, 2)), CAST(N'2018-04-24T21:23:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (423, 2, CAST(32.97 AS Decimal(18, 2)), CAST(N'2018-04-28T01:54:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (424, 2, CAST(93.18 AS Decimal(18, 2)), CAST(N'2018-04-12T10:25:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (425, 2, CAST(3.28 AS Decimal(18, 2)), CAST(N'2018-03-30T10:35:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (426, 2, CAST(45.86 AS Decimal(18, 2)), CAST(N'2018-02-10T01:11:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (427, 2, CAST(48.90 AS Decimal(18, 2)), CAST(N'2018-04-05T18:44:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (428, 3, CAST(5.58 AS Decimal(18, 2)), CAST(N'2018-05-01T13:38:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (429, 2, CAST(74.75 AS Decimal(18, 2)), CAST(N'2018-03-18T02:09:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (430, 1, CAST(67.10 AS Decimal(18, 2)), CAST(N'2018-02-20T23:43:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (431, 4, CAST(1.57 AS Decimal(18, 2)), CAST(N'2018-04-01T02:40:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (432, 2, CAST(60.92 AS Decimal(18, 2)), CAST(N'2018-04-11T02:07:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (433, 2, CAST(44.52 AS Decimal(18, 2)), CAST(N'2018-04-23T07:13:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (434, 4, CAST(47.47 AS Decimal(18, 2)), CAST(N'2018-03-04T14:43:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (435, 3, CAST(83.37 AS Decimal(18, 2)), CAST(N'2018-02-13T23:55:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (436, 1, CAST(91.90 AS Decimal(18, 2)), CAST(N'2018-05-20T00:48:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (437, 4, CAST(96.96 AS Decimal(18, 2)), CAST(N'2018-05-03T11:12:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (438, 1, CAST(27.90 AS Decimal(18, 2)), CAST(N'2018-02-22T21:13:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (439, 4, CAST(11.78 AS Decimal(18, 2)), CAST(N'2018-03-31T11:42:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (440, 3, CAST(23.99 AS Decimal(18, 2)), CAST(N'2018-03-19T22:32:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (441, 1, CAST(31.77 AS Decimal(18, 2)), CAST(N'2018-05-08T23:27:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (442, 1, CAST(49.82 AS Decimal(18, 2)), CAST(N'2018-05-30T02:40:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (443, 1, CAST(68.46 AS Decimal(18, 2)), CAST(N'2018-03-20T20:30:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (444, 2, CAST(36.80 AS Decimal(18, 2)), CAST(N'2018-05-22T16:29:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (445, 2, CAST(63.49 AS Decimal(18, 2)), CAST(N'2018-03-21T00:49:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (446, 3, CAST(96.46 AS Decimal(18, 2)), CAST(N'2018-05-14T19:05:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (447, 1, CAST(71.05 AS Decimal(18, 2)), CAST(N'2018-05-21T14:40:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (448, 2, CAST(79.11 AS Decimal(18, 2)), CAST(N'2018-03-22T00:40:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (449, 3, CAST(59.57 AS Decimal(18, 2)), CAST(N'2018-05-09T10:55:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (450, 1, CAST(76.31 AS Decimal(18, 2)), CAST(N'2018-05-14T13:34:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (451, 3, CAST(20.16 AS Decimal(18, 2)), CAST(N'2018-02-13T11:43:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (452, 1, CAST(59.30 AS Decimal(18, 2)), CAST(N'2018-02-12T06:29:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (453, 2, CAST(63.01 AS Decimal(18, 2)), CAST(N'2018-02-08T08:20:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (454, 2, CAST(76.89 AS Decimal(18, 2)), CAST(N'2018-05-27T08:54:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (455, 3, CAST(64.85 AS Decimal(18, 2)), CAST(N'2018-03-24T22:28:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (456, 2, CAST(25.18 AS Decimal(18, 2)), CAST(N'2018-02-23T18:05:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (457, 4, CAST(82.87 AS Decimal(18, 2)), CAST(N'2018-05-02T06:36:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (458, 1, CAST(65.94 AS Decimal(18, 2)), CAST(N'2018-05-24T01:45:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (459, 3, CAST(97.04 AS Decimal(18, 2)), CAST(N'2018-03-16T11:33:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (460, 2, CAST(23.24 AS Decimal(18, 2)), CAST(N'2018-05-03T07:02:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (461, 4, CAST(73.73 AS Decimal(18, 2)), CAST(N'2018-05-28T07:17:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (462, 4, CAST(51.61 AS Decimal(18, 2)), CAST(N'2018-04-15T07:36:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (463, 2, CAST(62.49 AS Decimal(18, 2)), CAST(N'2018-05-31T06:22:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (464, 1, CAST(91.67 AS Decimal(18, 2)), CAST(N'2018-05-19T06:18:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (465, 2, CAST(84.56 AS Decimal(18, 2)), CAST(N'2018-05-27T08:58:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (466, 3, CAST(47.55 AS Decimal(18, 2)), CAST(N'2018-03-16T22:33:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (467, 4, CAST(7.23 AS Decimal(18, 2)), CAST(N'2018-02-22T17:51:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (468, 3, CAST(89.12 AS Decimal(18, 2)), CAST(N'2018-05-27T02:38:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (469, 4, CAST(29.96 AS Decimal(18, 2)), CAST(N'2018-03-28T02:39:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (470, 1, CAST(66.77 AS Decimal(18, 2)), CAST(N'2018-04-04T01:48:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (471, 4, CAST(98.62 AS Decimal(18, 2)), CAST(N'2018-05-14T11:33:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (472, 1, CAST(44.19 AS Decimal(18, 2)), CAST(N'2018-02-11T20:45:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (473, 2, CAST(17.28 AS Decimal(18, 2)), CAST(N'2018-02-08T21:28:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (474, 3, CAST(56.77 AS Decimal(18, 2)), CAST(N'2018-02-16T13:02:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (475, 4, CAST(38.42 AS Decimal(18, 2)), CAST(N'2018-05-30T14:59:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (476, 4, CAST(2.27 AS Decimal(18, 2)), CAST(N'2018-04-24T04:25:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (477, 2, CAST(72.32 AS Decimal(18, 2)), CAST(N'2018-02-09T03:09:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (478, 4, CAST(53.44 AS Decimal(18, 2)), CAST(N'2018-02-22T06:44:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (479, 2, CAST(74.35 AS Decimal(18, 2)), CAST(N'2018-02-27T22:39:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (480, 4, CAST(69.45 AS Decimal(18, 2)), CAST(N'2018-03-31T20:24:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (481, 2, CAST(49.22 AS Decimal(18, 2)), CAST(N'2018-03-25T07:30:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (482, 4, CAST(38.35 AS Decimal(18, 2)), CAST(N'2018-03-25T19:42:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (483, 4, CAST(64.65 AS Decimal(18, 2)), CAST(N'2018-02-10T13:13:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (484, 3, CAST(68.96 AS Decimal(18, 2)), CAST(N'2018-03-27T17:34:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (485, 4, CAST(59.16 AS Decimal(18, 2)), CAST(N'2018-05-13T13:03:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (486, 3, CAST(5.77 AS Decimal(18, 2)), CAST(N'2018-02-10T01:19:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (487, 2, CAST(20.84 AS Decimal(18, 2)), CAST(N'2018-02-08T00:23:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (488, 3, CAST(5.35 AS Decimal(18, 2)), CAST(N'2018-04-21T07:17:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (489, 1, CAST(74.78 AS Decimal(18, 2)), CAST(N'2018-04-25T05:18:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (490, 1, CAST(32.94 AS Decimal(18, 2)), CAST(N'2018-02-13T19:40:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (491, 2, CAST(4.59 AS Decimal(18, 2)), CAST(N'2018-03-24T12:08:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (492, 1, CAST(51.50 AS Decimal(18, 2)), CAST(N'2018-03-12T15:47:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (493, 2, CAST(32.23 AS Decimal(18, 2)), CAST(N'2018-05-06T14:50:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (494, 2, CAST(21.81 AS Decimal(18, 2)), CAST(N'2018-02-19T01:08:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (495, 3, CAST(73.02 AS Decimal(18, 2)), CAST(N'2018-03-25T14:10:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (496, 1, CAST(61.42 AS Decimal(18, 2)), CAST(N'2018-03-31T04:34:30.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (497, 3, CAST(96.96 AS Decimal(18, 2)), CAST(N'2018-03-01T23:44:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (498, 3, CAST(44.18 AS Decimal(18, 2)), CAST(N'2018-04-16T01:28:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (499, 3, CAST(47.58 AS Decimal(18, 2)), CAST(N'2018-02-13T02:22:36.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (500, 1, CAST(59.17 AS Decimal(18, 2)), CAST(N'2018-03-14T11:11:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (501, 2, CAST(63.25 AS Decimal(18, 2)), CAST(N'2018-04-14T02:51:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (502, 1, CAST(99.46 AS Decimal(18, 2)), CAST(N'2018-03-15T02:51:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (503, 3, CAST(22.31 AS Decimal(18, 2)), CAST(N'2018-04-12T09:11:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (504, 3, CAST(16.06 AS Decimal(18, 2)), CAST(N'2018-02-14T23:48:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (505, 1, CAST(96.82 AS Decimal(18, 2)), CAST(N'2018-04-03T16:32:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (506, 2, CAST(67.57 AS Decimal(18, 2)), CAST(N'2018-03-13T20:37:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (507, 4, CAST(66.76 AS Decimal(18, 2)), CAST(N'2018-02-20T10:46:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (508, 3, CAST(69.28 AS Decimal(18, 2)), CAST(N'2018-03-19T18:47:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (509, 3, CAST(91.71 AS Decimal(18, 2)), CAST(N'2018-05-10T07:26:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (510, 1, CAST(74.20 AS Decimal(18, 2)), CAST(N'2018-03-15T14:56:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (511, 2, CAST(61.06 AS Decimal(18, 2)), CAST(N'2018-02-19T06:23:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (512, 1, CAST(93.90 AS Decimal(18, 2)), CAST(N'2018-05-22T12:35:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (513, 2, CAST(61.89 AS Decimal(18, 2)), CAST(N'2018-03-26T19:06:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (514, 3, CAST(10.57 AS Decimal(18, 2)), CAST(N'2018-04-12T09:01:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (515, 3, CAST(20.71 AS Decimal(18, 2)), CAST(N'2018-04-24T01:24:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (516, 4, CAST(62.95 AS Decimal(18, 2)), CAST(N'2018-02-10T10:50:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (517, 3, CAST(31.33 AS Decimal(18, 2)), CAST(N'2018-03-17T11:52:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (518, 2, CAST(91.01 AS Decimal(18, 2)), CAST(N'2018-04-24T07:04:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (519, 4, CAST(47.30 AS Decimal(18, 2)), CAST(N'2018-04-10T07:15:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (520, 4, CAST(73.66 AS Decimal(18, 2)), CAST(N'2018-05-10T18:53:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (521, 4, CAST(14.02 AS Decimal(18, 2)), CAST(N'2018-05-26T02:28:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (522, 2, CAST(77.10 AS Decimal(18, 2)), CAST(N'2018-05-12T11:51:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (523, 3, CAST(75.01 AS Decimal(18, 2)), CAST(N'2018-05-30T13:48:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (524, 3, CAST(39.03 AS Decimal(18, 2)), CAST(N'2018-03-14T02:17:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (525, 3, CAST(40.55 AS Decimal(18, 2)), CAST(N'2018-03-19T23:05:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (526, 1, CAST(11.24 AS Decimal(18, 2)), CAST(N'2018-05-06T21:10:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (527, 2, CAST(87.70 AS Decimal(18, 2)), CAST(N'2018-04-07T10:33:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (528, 3, CAST(66.97 AS Decimal(18, 2)), CAST(N'2018-05-18T07:22:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (529, 2, CAST(96.42 AS Decimal(18, 2)), CAST(N'2018-05-31T03:22:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (530, 2, CAST(31.78 AS Decimal(18, 2)), CAST(N'2018-05-20T17:53:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (531, 1, CAST(89.08 AS Decimal(18, 2)), CAST(N'2018-04-04T19:06:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (532, 2, CAST(74.71 AS Decimal(18, 2)), CAST(N'2018-05-19T04:14:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (533, 1, CAST(94.10 AS Decimal(18, 2)), CAST(N'2018-05-22T01:47:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (534, 2, CAST(2.10 AS Decimal(18, 2)), CAST(N'2018-05-27T07:19:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (535, 3, CAST(6.28 AS Decimal(18, 2)), CAST(N'2018-03-16T16:54:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (536, 3, CAST(57.94 AS Decimal(18, 2)), CAST(N'2018-03-05T01:26:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (537, 4, CAST(4.57 AS Decimal(18, 2)), CAST(N'2018-03-07T03:11:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (538, 1, CAST(79.59 AS Decimal(18, 2)), CAST(N'2018-04-18T06:52:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (539, 1, CAST(38.11 AS Decimal(18, 2)), CAST(N'2018-05-09T15:05:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (540, 2, CAST(96.70 AS Decimal(18, 2)), CAST(N'2018-02-19T14:05:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (541, 1, CAST(89.03 AS Decimal(18, 2)), CAST(N'2018-05-09T13:08:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (542, 1, CAST(12.67 AS Decimal(18, 2)), CAST(N'2018-02-09T01:07:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (543, 4, CAST(47.16 AS Decimal(18, 2)), CAST(N'2018-04-09T22:26:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (544, 2, CAST(69.75 AS Decimal(18, 2)), CAST(N'2018-02-15T05:58:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (545, 1, CAST(21.66 AS Decimal(18, 2)), CAST(N'2018-05-14T10:35:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (546, 1, CAST(2.16 AS Decimal(18, 2)), CAST(N'2018-03-21T10:08:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (547, 4, CAST(59.38 AS Decimal(18, 2)), CAST(N'2018-03-29T01:49:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (548, 3, CAST(68.90 AS Decimal(18, 2)), CAST(N'2018-04-20T13:19:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (549, 3, CAST(70.04 AS Decimal(18, 2)), CAST(N'2018-03-14T20:06:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (550, 4, CAST(1.43 AS Decimal(18, 2)), CAST(N'2018-02-21T22:31:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (551, 2, CAST(32.25 AS Decimal(18, 2)), CAST(N'2018-04-16T14:27:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (552, 4, CAST(86.59 AS Decimal(18, 2)), CAST(N'2018-04-16T05:44:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (553, 2, CAST(36.81 AS Decimal(18, 2)), CAST(N'2018-05-04T04:24:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (554, 2, CAST(73.94 AS Decimal(18, 2)), CAST(N'2018-04-21T12:29:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (555, 4, CAST(20.61 AS Decimal(18, 2)), CAST(N'2018-03-14T13:55:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (556, 2, CAST(54.78 AS Decimal(18, 2)), CAST(N'2018-05-16T21:09:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (557, 3, CAST(88.29 AS Decimal(18, 2)), CAST(N'2018-05-14T22:26:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (558, 4, CAST(52.76 AS Decimal(18, 2)), CAST(N'2018-05-07T21:50:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (559, 2, CAST(34.07 AS Decimal(18, 2)), CAST(N'2018-04-03T09:21:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (560, 3, CAST(12.07 AS Decimal(18, 2)), CAST(N'2018-04-10T03:07:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (561, 1, CAST(22.58 AS Decimal(18, 2)), CAST(N'2018-04-09T18:19:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (562, 1, CAST(92.80 AS Decimal(18, 2)), CAST(N'2018-05-05T05:16:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (563, 4, CAST(21.85 AS Decimal(18, 2)), CAST(N'2018-04-09T19:56:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (564, 3, CAST(51.17 AS Decimal(18, 2)), CAST(N'2018-05-03T07:22:19.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (565, 1, CAST(81.12 AS Decimal(18, 2)), CAST(N'2018-05-25T21:49:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (566, 1, CAST(13.74 AS Decimal(18, 2)), CAST(N'2018-04-27T19:49:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (567, 2, CAST(58.59 AS Decimal(18, 2)), CAST(N'2018-04-10T16:17:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (568, 2, CAST(15.34 AS Decimal(18, 2)), CAST(N'2018-02-07T01:59:19.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (569, 2, CAST(2.54 AS Decimal(18, 2)), CAST(N'2018-03-30T15:06:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (570, 2, CAST(34.57 AS Decimal(18, 2)), CAST(N'2018-03-23T20:50:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (571, 2, CAST(27.68 AS Decimal(18, 2)), CAST(N'2018-04-15T22:50:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (572, 1, CAST(85.41 AS Decimal(18, 2)), CAST(N'2018-03-30T12:04:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (573, 3, CAST(14.07 AS Decimal(18, 2)), CAST(N'2018-04-19T06:16:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (574, 3, CAST(43.51 AS Decimal(18, 2)), CAST(N'2018-03-29T04:31:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (575, 4, CAST(1.36 AS Decimal(18, 2)), CAST(N'2018-04-27T13:27:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (576, 2, CAST(23.33 AS Decimal(18, 2)), CAST(N'2018-05-28T15:58:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (577, 2, CAST(10.05 AS Decimal(18, 2)), CAST(N'2018-02-24T11:33:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (578, 1, CAST(40.64 AS Decimal(18, 2)), CAST(N'2018-03-31T07:31:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (579, 4, CAST(4.47 AS Decimal(18, 2)), CAST(N'2018-05-16T15:54:19.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (580, 4, CAST(8.43 AS Decimal(18, 2)), CAST(N'2018-02-18T12:07:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (581, 2, CAST(33.77 AS Decimal(18, 2)), CAST(N'2018-03-09T22:16:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (582, 1, CAST(81.62 AS Decimal(18, 2)), CAST(N'2018-03-03T22:48:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (583, 2, CAST(69.88 AS Decimal(18, 2)), CAST(N'2018-03-25T12:18:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (584, 3, CAST(88.35 AS Decimal(18, 2)), CAST(N'2018-02-08T21:04:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (585, 4, CAST(5.56 AS Decimal(18, 2)), CAST(N'2018-03-14T06:12:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (586, 3, CAST(20.05 AS Decimal(18, 2)), CAST(N'2018-05-14T23:29:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (587, 3, CAST(28.79 AS Decimal(18, 2)), CAST(N'2018-03-22T22:33:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (588, 4, CAST(12.28 AS Decimal(18, 2)), CAST(N'2018-05-26T08:56:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (589, 3, CAST(58.49 AS Decimal(18, 2)), CAST(N'2018-05-07T23:40:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (590, 1, CAST(36.16 AS Decimal(18, 2)), CAST(N'2018-02-11T21:27:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (591, 3, CAST(22.08 AS Decimal(18, 2)), CAST(N'2018-04-28T12:28:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (592, 3, CAST(60.24 AS Decimal(18, 2)), CAST(N'2018-04-18T03:33:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (593, 1, CAST(26.29 AS Decimal(18, 2)), CAST(N'2018-04-24T03:12:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (594, 2, CAST(87.17 AS Decimal(18, 2)), CAST(N'2018-02-09T09:18:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (595, 4, CAST(51.56 AS Decimal(18, 2)), CAST(N'2018-05-30T18:01:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (596, 4, CAST(48.93 AS Decimal(18, 2)), CAST(N'2018-02-11T13:21:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (597, 3, CAST(91.51 AS Decimal(18, 2)), CAST(N'2018-05-13T19:04:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (598, 3, CAST(25.41 AS Decimal(18, 2)), CAST(N'2018-05-23T03:54:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (599, 3, CAST(13.20 AS Decimal(18, 2)), CAST(N'2018-05-16T02:06:21.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (600, 3, CAST(55.58 AS Decimal(18, 2)), CAST(N'2018-05-05T07:59:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (601, 3, CAST(30.58 AS Decimal(18, 2)), CAST(N'2018-05-18T15:28:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (602, 1, CAST(39.21 AS Decimal(18, 2)), CAST(N'2018-04-04T09:13:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (603, 4, CAST(3.50 AS Decimal(18, 2)), CAST(N'2018-03-15T19:43:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (604, 1, CAST(31.99 AS Decimal(18, 2)), CAST(N'2018-03-30T16:38:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (605, 2, CAST(30.73 AS Decimal(18, 2)), CAST(N'2018-02-15T03:28:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (606, 4, CAST(20.36 AS Decimal(18, 2)), CAST(N'2018-03-22T17:13:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (607, 1, CAST(26.52 AS Decimal(18, 2)), CAST(N'2018-04-09T09:38:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (608, 2, CAST(69.23 AS Decimal(18, 2)), CAST(N'2018-02-10T10:14:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (609, 3, CAST(71.91 AS Decimal(18, 2)), CAST(N'2018-04-14T07:37:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (610, 2, CAST(34.53 AS Decimal(18, 2)), CAST(N'2018-05-27T11:18:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (611, 1, CAST(81.77 AS Decimal(18, 2)), CAST(N'2018-05-29T13:41:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (612, 4, CAST(8.03 AS Decimal(18, 2)), CAST(N'2018-05-25T03:42:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (613, 2, CAST(10.90 AS Decimal(18, 2)), CAST(N'2018-04-10T04:08:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (614, 1, CAST(42.53 AS Decimal(18, 2)), CAST(N'2018-05-26T11:59:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (615, 3, CAST(84.57 AS Decimal(18, 2)), CAST(N'2018-05-16T15:10:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (616, 4, CAST(86.76 AS Decimal(18, 2)), CAST(N'2018-03-16T21:11:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (617, 3, CAST(9.20 AS Decimal(18, 2)), CAST(N'2018-04-28T17:11:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (618, 2, CAST(9.81 AS Decimal(18, 2)), CAST(N'2018-03-05T17:14:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (619, 3, CAST(4.38 AS Decimal(18, 2)), CAST(N'2018-05-09T22:21:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (620, 2, CAST(98.43 AS Decimal(18, 2)), CAST(N'2018-05-05T05:57:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (621, 4, CAST(8.54 AS Decimal(18, 2)), CAST(N'2018-05-19T15:55:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (622, 3, CAST(10.16 AS Decimal(18, 2)), CAST(N'2018-03-24T06:56:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (623, 3, CAST(58.63 AS Decimal(18, 2)), CAST(N'2018-03-27T14:36:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (624, 4, CAST(17.01 AS Decimal(18, 2)), CAST(N'2018-03-02T10:35:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (625, 1, CAST(71.08 AS Decimal(18, 2)), CAST(N'2018-03-15T17:31:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (626, 4, CAST(95.32 AS Decimal(18, 2)), CAST(N'2018-05-31T01:00:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (627, 2, CAST(2.88 AS Decimal(18, 2)), CAST(N'2018-03-28T07:14:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (628, 3, CAST(95.17 AS Decimal(18, 2)), CAST(N'2018-05-28T06:46:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (629, 4, CAST(26.33 AS Decimal(18, 2)), CAST(N'2018-04-18T13:09:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (630, 4, CAST(10.83 AS Decimal(18, 2)), CAST(N'2018-05-09T00:21:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (631, 2, CAST(14.58 AS Decimal(18, 2)), CAST(N'2018-05-28T01:24:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (632, 4, CAST(27.25 AS Decimal(18, 2)), CAST(N'2018-03-05T06:51:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (633, 2, CAST(15.52 AS Decimal(18, 2)), CAST(N'2018-02-26T10:10:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (634, 3, CAST(50.95 AS Decimal(18, 2)), CAST(N'2018-03-09T12:21:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (635, 1, CAST(42.00 AS Decimal(18, 2)), CAST(N'2018-05-01T10:32:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (636, 3, CAST(98.42 AS Decimal(18, 2)), CAST(N'2018-02-10T17:21:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (637, 3, CAST(30.37 AS Decimal(18, 2)), CAST(N'2018-04-03T21:34:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (638, 3, CAST(32.40 AS Decimal(18, 2)), CAST(N'2018-02-14T19:08:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (639, 2, CAST(14.48 AS Decimal(18, 2)), CAST(N'2018-02-25T16:40:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (640, 1, CAST(52.19 AS Decimal(18, 2)), CAST(N'2018-03-13T18:56:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (641, 3, CAST(42.29 AS Decimal(18, 2)), CAST(N'2018-03-12T05:44:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (642, 1, CAST(18.73 AS Decimal(18, 2)), CAST(N'2018-04-30T20:32:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (643, 3, CAST(88.47 AS Decimal(18, 2)), CAST(N'2018-04-21T23:29:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (644, 2, CAST(54.74 AS Decimal(18, 2)), CAST(N'2018-03-11T08:54:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (645, 2, CAST(45.07 AS Decimal(18, 2)), CAST(N'2018-02-27T13:08:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (646, 3, CAST(33.08 AS Decimal(18, 2)), CAST(N'2018-02-10T04:31:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (647, 4, CAST(72.40 AS Decimal(18, 2)), CAST(N'2018-04-08T16:27:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (648, 1, CAST(99.43 AS Decimal(18, 2)), CAST(N'2018-02-15T21:50:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (649, 3, CAST(43.20 AS Decimal(18, 2)), CAST(N'2018-05-11T20:53:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (650, 1, CAST(28.67 AS Decimal(18, 2)), CAST(N'2018-02-27T01:25:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (651, 3, CAST(90.53 AS Decimal(18, 2)), CAST(N'2018-04-06T23:31:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (652, 1, CAST(40.08 AS Decimal(18, 2)), CAST(N'2018-05-05T21:43:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (653, 2, CAST(53.57 AS Decimal(18, 2)), CAST(N'2018-05-15T04:36:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (654, 2, CAST(70.09 AS Decimal(18, 2)), CAST(N'2018-02-22T08:09:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (655, 4, CAST(99.53 AS Decimal(18, 2)), CAST(N'2018-03-24T17:28:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (656, 2, CAST(7.68 AS Decimal(18, 2)), CAST(N'2018-03-19T22:32:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (657, 1, CAST(57.65 AS Decimal(18, 2)), CAST(N'2018-04-04T16:59:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (658, 3, CAST(45.25 AS Decimal(18, 2)), CAST(N'2018-03-16T23:36:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (659, 2, CAST(65.47 AS Decimal(18, 2)), CAST(N'2018-04-06T22:15:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (660, 3, CAST(26.61 AS Decimal(18, 2)), CAST(N'2018-04-06T08:33:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (661, 4, CAST(93.83 AS Decimal(18, 2)), CAST(N'2018-03-16T09:16:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (662, 4, CAST(82.91 AS Decimal(18, 2)), CAST(N'2018-03-29T18:38:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (663, 4, CAST(6.03 AS Decimal(18, 2)), CAST(N'2018-02-07T19:35:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (664, 4, CAST(60.86 AS Decimal(18, 2)), CAST(N'2018-05-09T05:21:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (665, 3, CAST(89.23 AS Decimal(18, 2)), CAST(N'2018-04-01T04:27:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (666, 3, CAST(58.54 AS Decimal(18, 2)), CAST(N'2018-02-21T10:21:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (667, 4, CAST(55.62 AS Decimal(18, 2)), CAST(N'2018-03-23T10:20:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (668, 2, CAST(53.42 AS Decimal(18, 2)), CAST(N'2018-03-29T23:20:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (669, 3, CAST(42.28 AS Decimal(18, 2)), CAST(N'2018-04-16T16:42:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (670, 2, CAST(26.37 AS Decimal(18, 2)), CAST(N'2018-02-09T05:47:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (671, 2, CAST(98.15 AS Decimal(18, 2)), CAST(N'2018-04-22T19:12:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (672, 3, CAST(22.25 AS Decimal(18, 2)), CAST(N'2018-03-28T03:36:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (673, 3, CAST(65.50 AS Decimal(18, 2)), CAST(N'2018-04-04T00:33:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (674, 2, CAST(8.76 AS Decimal(18, 2)), CAST(N'2018-02-21T07:18:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (675, 4, CAST(16.93 AS Decimal(18, 2)), CAST(N'2018-05-30T13:39:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (676, 1, CAST(54.40 AS Decimal(18, 2)), CAST(N'2018-02-14T15:04:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (677, 2, CAST(69.12 AS Decimal(18, 2)), CAST(N'2018-02-11T09:38:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (678, 3, CAST(58.21 AS Decimal(18, 2)), CAST(N'2018-03-07T03:42:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (679, 4, CAST(62.55 AS Decimal(18, 2)), CAST(N'2018-05-28T21:16:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (680, 4, CAST(44.84 AS Decimal(18, 2)), CAST(N'2018-05-31T06:15:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (681, 2, CAST(89.87 AS Decimal(18, 2)), CAST(N'2018-02-10T02:14:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (682, 1, CAST(26.78 AS Decimal(18, 2)), CAST(N'2018-02-16T20:07:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (683, 2, CAST(31.27 AS Decimal(18, 2)), CAST(N'2018-03-01T23:46:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (684, 3, CAST(58.99 AS Decimal(18, 2)), CAST(N'2018-03-18T17:05:29.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (685, 1, CAST(80.28 AS Decimal(18, 2)), CAST(N'2018-05-26T13:05:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (686, 4, CAST(66.81 AS Decimal(18, 2)), CAST(N'2018-05-26T06:15:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (687, 4, CAST(14.66 AS Decimal(18, 2)), CAST(N'2018-04-09T14:06:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (688, 4, CAST(26.19 AS Decimal(18, 2)), CAST(N'2018-05-25T19:53:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (689, 1, CAST(21.25 AS Decimal(18, 2)), CAST(N'2018-05-24T05:31:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (690, 3, CAST(45.07 AS Decimal(18, 2)), CAST(N'2018-03-08T09:14:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (691, 2, CAST(73.07 AS Decimal(18, 2)), CAST(N'2018-05-16T21:01:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (692, 3, CAST(68.06 AS Decimal(18, 2)), CAST(N'2018-03-27T07:41:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (693, 2, CAST(57.35 AS Decimal(18, 2)), CAST(N'2018-03-05T19:10:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (694, 4, CAST(94.24 AS Decimal(18, 2)), CAST(N'2018-03-03T18:53:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (695, 2, CAST(22.52 AS Decimal(18, 2)), CAST(N'2018-04-25T16:38:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (696, 2, CAST(34.62 AS Decimal(18, 2)), CAST(N'2018-03-24T13:57:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (697, 2, CAST(24.59 AS Decimal(18, 2)), CAST(N'2018-04-06T15:50:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (698, 4, CAST(47.19 AS Decimal(18, 2)), CAST(N'2018-02-21T06:15:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (699, 3, CAST(39.06 AS Decimal(18, 2)), CAST(N'2018-05-01T09:57:34.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (700, 2, CAST(9.30 AS Decimal(18, 2)), CAST(N'2018-05-21T22:11:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (701, 2, CAST(27.00 AS Decimal(18, 2)), CAST(N'2018-04-02T06:18:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (702, 3, CAST(99.46 AS Decimal(18, 2)), CAST(N'2018-03-09T04:44:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (703, 2, CAST(68.87 AS Decimal(18, 2)), CAST(N'2018-03-27T08:27:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (704, 2, CAST(92.30 AS Decimal(18, 2)), CAST(N'2018-04-17T09:43:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (705, 3, CAST(34.18 AS Decimal(18, 2)), CAST(N'2018-04-02T12:24:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (706, 4, CAST(87.65 AS Decimal(18, 2)), CAST(N'2018-04-30T09:00:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (707, 2, CAST(22.02 AS Decimal(18, 2)), CAST(N'2018-05-09T15:07:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (708, 1, CAST(69.39 AS Decimal(18, 2)), CAST(N'2018-03-01T19:11:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (709, 1, CAST(77.32 AS Decimal(18, 2)), CAST(N'2018-05-08T00:51:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (710, 2, CAST(73.48 AS Decimal(18, 2)), CAST(N'2018-04-23T05:49:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (711, 4, CAST(35.64 AS Decimal(18, 2)), CAST(N'2018-03-28T18:23:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (712, 4, CAST(55.01 AS Decimal(18, 2)), CAST(N'2018-03-01T18:28:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (713, 3, CAST(94.51 AS Decimal(18, 2)), CAST(N'2018-04-04T17:45:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (714, 3, CAST(42.05 AS Decimal(18, 2)), CAST(N'2018-03-21T10:03:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (715, 3, CAST(31.87 AS Decimal(18, 2)), CAST(N'2018-05-09T03:29:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (716, 2, CAST(77.43 AS Decimal(18, 2)), CAST(N'2018-03-24T18:01:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (717, 3, CAST(37.04 AS Decimal(18, 2)), CAST(N'2018-04-16T07:20:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (718, 4, CAST(93.44 AS Decimal(18, 2)), CAST(N'2018-05-01T16:02:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (719, 4, CAST(9.80 AS Decimal(18, 2)), CAST(N'2018-03-20T03:33:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (720, 1, CAST(20.20 AS Decimal(18, 2)), CAST(N'2018-03-09T11:17:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (721, 3, CAST(1.75 AS Decimal(18, 2)), CAST(N'2018-02-12T03:22:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (722, 2, CAST(93.68 AS Decimal(18, 2)), CAST(N'2018-04-27T18:25:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (723, 4, CAST(72.85 AS Decimal(18, 2)), CAST(N'2018-02-10T10:08:30.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (724, 2, CAST(78.69 AS Decimal(18, 2)), CAST(N'2018-05-07T03:10:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (725, 3, CAST(78.90 AS Decimal(18, 2)), CAST(N'2018-05-28T18:52:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (726, 4, CAST(62.86 AS Decimal(18, 2)), CAST(N'2018-04-30T16:45:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (727, 3, CAST(48.97 AS Decimal(18, 2)), CAST(N'2018-04-16T08:15:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (728, 2, CAST(69.04 AS Decimal(18, 2)), CAST(N'2018-04-29T11:09:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (729, 1, CAST(52.02 AS Decimal(18, 2)), CAST(N'2018-05-06T23:26:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (730, 3, CAST(76.85 AS Decimal(18, 2)), CAST(N'2018-04-24T09:36:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (731, 3, CAST(85.47 AS Decimal(18, 2)), CAST(N'2018-04-17T22:54:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (732, 1, CAST(11.75 AS Decimal(18, 2)), CAST(N'2018-04-23T21:30:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (733, 4, CAST(94.87 AS Decimal(18, 2)), CAST(N'2018-02-18T23:33:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (734, 4, CAST(52.80 AS Decimal(18, 2)), CAST(N'2018-04-07T08:43:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (735, 1, CAST(10.70 AS Decimal(18, 2)), CAST(N'2018-04-18T11:27:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (736, 1, CAST(26.70 AS Decimal(18, 2)), CAST(N'2018-04-19T06:01:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (737, 2, CAST(81.14 AS Decimal(18, 2)), CAST(N'2018-03-11T23:13:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (738, 3, CAST(17.32 AS Decimal(18, 2)), CAST(N'2018-05-20T00:53:30.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (739, 4, CAST(16.91 AS Decimal(18, 2)), CAST(N'2018-03-17T02:40:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (740, 1, CAST(86.16 AS Decimal(18, 2)), CAST(N'2018-02-24T04:58:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (741, 2, CAST(56.77 AS Decimal(18, 2)), CAST(N'2018-03-19T07:32:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (742, 3, CAST(83.53 AS Decimal(18, 2)), CAST(N'2018-04-24T15:28:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (743, 3, CAST(84.34 AS Decimal(18, 2)), CAST(N'2018-04-15T16:27:12.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (744, 2, CAST(11.59 AS Decimal(18, 2)), CAST(N'2018-03-15T08:06:34.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (745, 4, CAST(10.12 AS Decimal(18, 2)), CAST(N'2018-03-17T00:35:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (746, 2, CAST(81.74 AS Decimal(18, 2)), CAST(N'2018-04-30T20:52:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (747, 2, CAST(44.05 AS Decimal(18, 2)), CAST(N'2018-03-30T15:23:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (748, 1, CAST(57.53 AS Decimal(18, 2)), CAST(N'2018-03-26T23:22:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (749, 1, CAST(92.61 AS Decimal(18, 2)), CAST(N'2018-04-26T08:21:19.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (750, 2, CAST(45.69 AS Decimal(18, 2)), CAST(N'2018-02-18T09:05:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (751, 4, CAST(69.36 AS Decimal(18, 2)), CAST(N'2018-05-12T06:09:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (752, 4, CAST(85.25 AS Decimal(18, 2)), CAST(N'2018-03-19T17:42:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (753, 2, CAST(57.43 AS Decimal(18, 2)), CAST(N'2018-03-13T14:53:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (754, 1, CAST(99.20 AS Decimal(18, 2)), CAST(N'2018-03-05T17:09:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (755, 2, CAST(38.58 AS Decimal(18, 2)), CAST(N'2018-02-19T03:51:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (756, 3, CAST(43.70 AS Decimal(18, 2)), CAST(N'2018-05-31T02:19:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (757, 2, CAST(36.22 AS Decimal(18, 2)), CAST(N'2018-02-08T06:57:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (758, 3, CAST(23.32 AS Decimal(18, 2)), CAST(N'2018-03-30T09:18:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (759, 4, CAST(59.81 AS Decimal(18, 2)), CAST(N'2018-04-25T03:49:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (760, 4, CAST(37.27 AS Decimal(18, 2)), CAST(N'2018-04-03T10:03:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (761, 1, CAST(5.54 AS Decimal(18, 2)), CAST(N'2018-04-27T13:25:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (762, 4, CAST(31.11 AS Decimal(18, 2)), CAST(N'2018-02-23T00:12:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (763, 3, CAST(55.99 AS Decimal(18, 2)), CAST(N'2018-03-18T18:09:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (764, 3, CAST(46.26 AS Decimal(18, 2)), CAST(N'2018-05-20T04:52:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (765, 2, CAST(98.65 AS Decimal(18, 2)), CAST(N'2018-02-24T19:13:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (766, 1, CAST(42.35 AS Decimal(18, 2)), CAST(N'2018-02-12T00:00:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (767, 4, CAST(5.64 AS Decimal(18, 2)), CAST(N'2018-03-28T14:46:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (768, 3, CAST(94.79 AS Decimal(18, 2)), CAST(N'2018-03-01T00:24:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (769, 4, CAST(83.01 AS Decimal(18, 2)), CAST(N'2018-04-12T14:35:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (770, 3, CAST(93.52 AS Decimal(18, 2)), CAST(N'2018-05-24T17:41:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (771, 1, CAST(8.11 AS Decimal(18, 2)), CAST(N'2018-04-25T11:07:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (772, 3, CAST(12.28 AS Decimal(18, 2)), CAST(N'2018-02-21T18:24:30.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (773, 1, CAST(43.20 AS Decimal(18, 2)), CAST(N'2018-06-01T03:11:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (774, 1, CAST(66.61 AS Decimal(18, 2)), CAST(N'2018-02-15T00:56:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (775, 1, CAST(28.65 AS Decimal(18, 2)), CAST(N'2018-02-22T07:53:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (776, 3, CAST(76.92 AS Decimal(18, 2)), CAST(N'2018-05-18T13:33:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (777, 3, CAST(79.41 AS Decimal(18, 2)), CAST(N'2018-03-07T04:26:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (778, 2, CAST(64.86 AS Decimal(18, 2)), CAST(N'2018-03-03T00:26:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (779, 3, CAST(32.58 AS Decimal(18, 2)), CAST(N'2018-03-11T03:20:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (780, 2, CAST(2.78 AS Decimal(18, 2)), CAST(N'2018-03-08T10:32:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (781, 3, CAST(32.69 AS Decimal(18, 2)), CAST(N'2018-04-28T23:04:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (782, 2, CAST(1.74 AS Decimal(18, 2)), CAST(N'2018-05-03T15:15:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (783, 1, CAST(74.27 AS Decimal(18, 2)), CAST(N'2018-05-31T02:46:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (784, 3, CAST(48.60 AS Decimal(18, 2)), CAST(N'2018-02-19T19:40:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (785, 1, CAST(8.65 AS Decimal(18, 2)), CAST(N'2018-02-09T02:16:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (786, 1, CAST(24.34 AS Decimal(18, 2)), CAST(N'2018-03-05T12:12:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (787, 1, CAST(2.36 AS Decimal(18, 2)), CAST(N'2018-03-27T16:32:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (788, 1, CAST(37.45 AS Decimal(18, 2)), CAST(N'2018-04-26T08:51:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (789, 4, CAST(99.94 AS Decimal(18, 2)), CAST(N'2018-03-07T11:57:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (790, 1, CAST(51.05 AS Decimal(18, 2)), CAST(N'2018-05-19T20:11:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (791, 2, CAST(72.87 AS Decimal(18, 2)), CAST(N'2018-04-09T16:16:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (792, 2, CAST(73.53 AS Decimal(18, 2)), CAST(N'2018-03-31T00:50:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (793, 2, CAST(33.26 AS Decimal(18, 2)), CAST(N'2018-02-08T03:52:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (794, 4, CAST(54.61 AS Decimal(18, 2)), CAST(N'2018-05-03T09:48:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (795, 2, CAST(68.99 AS Decimal(18, 2)), CAST(N'2018-05-18T17:11:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (796, 4, CAST(96.10 AS Decimal(18, 2)), CAST(N'2018-02-18T11:39:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (797, 2, CAST(36.74 AS Decimal(18, 2)), CAST(N'2018-04-06T03:34:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (798, 1, CAST(45.30 AS Decimal(18, 2)), CAST(N'2018-05-04T14:03:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (799, 1, CAST(52.78 AS Decimal(18, 2)), CAST(N'2018-03-12T05:30:27.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (800, 1, CAST(1.06 AS Decimal(18, 2)), CAST(N'2018-04-12T23:51:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (801, 1, CAST(95.53 AS Decimal(18, 2)), CAST(N'2018-05-31T05:27:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (802, 4, CAST(90.45 AS Decimal(18, 2)), CAST(N'2018-04-20T00:39:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (803, 4, CAST(28.40 AS Decimal(18, 2)), CAST(N'2018-05-25T12:54:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (804, 4, CAST(16.26 AS Decimal(18, 2)), CAST(N'2018-04-13T03:37:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (805, 2, CAST(32.24 AS Decimal(18, 2)), CAST(N'2018-05-27T20:54:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (806, 1, CAST(82.65 AS Decimal(18, 2)), CAST(N'2018-02-17T04:55:55.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (807, 2, CAST(28.91 AS Decimal(18, 2)), CAST(N'2018-04-05T16:26:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (808, 2, CAST(30.03 AS Decimal(18, 2)), CAST(N'2018-05-09T05:21:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (809, 2, CAST(5.78 AS Decimal(18, 2)), CAST(N'2018-05-19T07:22:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (810, 4, CAST(10.34 AS Decimal(18, 2)), CAST(N'2018-02-16T19:48:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (811, 4, CAST(99.65 AS Decimal(18, 2)), CAST(N'2018-03-29T11:14:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (812, 4, CAST(36.84 AS Decimal(18, 2)), CAST(N'2018-04-06T06:08:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (813, 1, CAST(50.89 AS Decimal(18, 2)), CAST(N'2018-03-25T14:32:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (814, 4, CAST(81.52 AS Decimal(18, 2)), CAST(N'2018-03-03T02:29:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (815, 1, CAST(9.36 AS Decimal(18, 2)), CAST(N'2018-03-11T01:05:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (816, 3, CAST(38.89 AS Decimal(18, 2)), CAST(N'2018-05-16T17:46:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (817, 4, CAST(96.89 AS Decimal(18, 2)), CAST(N'2018-05-22T10:19:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (818, 2, CAST(53.35 AS Decimal(18, 2)), CAST(N'2018-05-05T05:26:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (819, 2, CAST(82.78 AS Decimal(18, 2)), CAST(N'2018-02-19T22:13:19.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (820, 2, CAST(61.90 AS Decimal(18, 2)), CAST(N'2018-02-26T21:39:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (821, 3, CAST(85.51 AS Decimal(18, 2)), CAST(N'2018-05-12T21:59:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (822, 2, CAST(50.97 AS Decimal(18, 2)), CAST(N'2018-05-07T16:09:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (823, 3, CAST(60.87 AS Decimal(18, 2)), CAST(N'2018-05-23T11:47:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (824, 2, CAST(29.05 AS Decimal(18, 2)), CAST(N'2018-03-27T11:31:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (825, 2, CAST(4.72 AS Decimal(18, 2)), CAST(N'2018-03-25T14:53:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (826, 4, CAST(80.27 AS Decimal(18, 2)), CAST(N'2018-02-12T20:58:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (827, 3, CAST(28.18 AS Decimal(18, 2)), CAST(N'2018-04-08T05:45:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (828, 4, CAST(23.63 AS Decimal(18, 2)), CAST(N'2018-05-03T20:38:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (829, 2, CAST(33.17 AS Decimal(18, 2)), CAST(N'2018-03-20T22:45:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (830, 1, CAST(70.94 AS Decimal(18, 2)), CAST(N'2018-03-20T13:09:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (831, 3, CAST(70.95 AS Decimal(18, 2)), CAST(N'2018-02-22T01:41:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (832, 3, CAST(25.40 AS Decimal(18, 2)), CAST(N'2018-03-13T23:44:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (833, 4, CAST(80.08 AS Decimal(18, 2)), CAST(N'2018-03-14T21:48:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (834, 4, CAST(39.07 AS Decimal(18, 2)), CAST(N'2018-04-13T06:05:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (835, 1, CAST(13.25 AS Decimal(18, 2)), CAST(N'2018-04-06T20:26:38.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (836, 3, CAST(25.80 AS Decimal(18, 2)), CAST(N'2018-04-08T23:51:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (837, 4, CAST(48.07 AS Decimal(18, 2)), CAST(N'2018-02-16T01:02:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (838, 2, CAST(91.15 AS Decimal(18, 2)), CAST(N'2018-02-07T09:51:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (839, 4, CAST(63.27 AS Decimal(18, 2)), CAST(N'2018-03-16T19:12:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (840, 3, CAST(99.75 AS Decimal(18, 2)), CAST(N'2018-02-25T17:01:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (841, 3, CAST(16.61 AS Decimal(18, 2)), CAST(N'2018-03-10T19:12:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (842, 1, CAST(57.34 AS Decimal(18, 2)), CAST(N'2018-02-11T01:17:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (843, 2, CAST(61.81 AS Decimal(18, 2)), CAST(N'2018-05-09T23:11:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (844, 1, CAST(88.34 AS Decimal(18, 2)), CAST(N'2018-04-26T19:11:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (845, 3, CAST(9.82 AS Decimal(18, 2)), CAST(N'2018-05-30T15:33:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (846, 1, CAST(48.01 AS Decimal(18, 2)), CAST(N'2018-05-27T08:05:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (847, 1, CAST(41.35 AS Decimal(18, 2)), CAST(N'2018-03-22T09:57:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (848, 4, CAST(53.61 AS Decimal(18, 2)), CAST(N'2018-04-28T05:32:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (849, 3, CAST(44.78 AS Decimal(18, 2)), CAST(N'2018-05-01T16:22:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (850, 1, CAST(48.47 AS Decimal(18, 2)), CAST(N'2018-04-08T21:50:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (851, 2, CAST(56.04 AS Decimal(18, 2)), CAST(N'2018-04-15T05:52:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (852, 4, CAST(73.09 AS Decimal(18, 2)), CAST(N'2018-04-14T20:02:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (853, 2, CAST(78.65 AS Decimal(18, 2)), CAST(N'2018-04-17T16:39:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (854, 1, CAST(33.14 AS Decimal(18, 2)), CAST(N'2018-03-17T21:47:30.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (855, 4, CAST(30.13 AS Decimal(18, 2)), CAST(N'2018-03-12T01:18:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (856, 4, CAST(30.79 AS Decimal(18, 2)), CAST(N'2018-03-26T04:00:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (857, 1, CAST(23.24 AS Decimal(18, 2)), CAST(N'2018-03-18T23:52:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (858, 1, CAST(22.32 AS Decimal(18, 2)), CAST(N'2018-04-21T15:08:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (859, 1, CAST(7.94 AS Decimal(18, 2)), CAST(N'2018-04-24T03:11:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (860, 2, CAST(2.12 AS Decimal(18, 2)), CAST(N'2018-05-06T00:58:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (861, 1, CAST(6.11 AS Decimal(18, 2)), CAST(N'2018-05-05T14:16:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (862, 4, CAST(99.68 AS Decimal(18, 2)), CAST(N'2018-04-10T23:00:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (863, 4, CAST(97.31 AS Decimal(18, 2)), CAST(N'2018-02-22T19:09:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (864, 2, CAST(49.91 AS Decimal(18, 2)), CAST(N'2018-03-28T12:49:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (865, 2, CAST(47.44 AS Decimal(18, 2)), CAST(N'2018-05-25T19:51:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (866, 3, CAST(96.73 AS Decimal(18, 2)), CAST(N'2018-03-06T02:18:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (867, 4, CAST(98.36 AS Decimal(18, 2)), CAST(N'2018-05-23T21:35:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (868, 1, CAST(75.86 AS Decimal(18, 2)), CAST(N'2018-05-03T18:06:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (869, 4, CAST(63.33 AS Decimal(18, 2)), CAST(N'2018-04-28T22:26:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (870, 1, CAST(6.93 AS Decimal(18, 2)), CAST(N'2018-05-20T15:52:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (871, 2, CAST(1.91 AS Decimal(18, 2)), CAST(N'2018-03-01T19:24:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (872, 4, CAST(13.41 AS Decimal(18, 2)), CAST(N'2018-03-01T06:46:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (873, 3, CAST(38.76 AS Decimal(18, 2)), CAST(N'2018-05-02T12:58:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (874, 4, CAST(8.79 AS Decimal(18, 2)), CAST(N'2018-04-28T13:10:19.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (875, 3, CAST(28.14 AS Decimal(18, 2)), CAST(N'2018-02-22T21:19:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (876, 1, CAST(40.87 AS Decimal(18, 2)), CAST(N'2018-02-11T19:43:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (877, 2, CAST(90.29 AS Decimal(18, 2)), CAST(N'2018-02-26T13:19:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (878, 3, CAST(99.21 AS Decimal(18, 2)), CAST(N'2018-03-26T12:10:09.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (879, 3, CAST(92.14 AS Decimal(18, 2)), CAST(N'2018-04-20T07:31:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (880, 2, CAST(98.19 AS Decimal(18, 2)), CAST(N'2018-03-15T11:28:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (881, 3, CAST(69.70 AS Decimal(18, 2)), CAST(N'2018-02-17T05:14:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (882, 1, CAST(22.40 AS Decimal(18, 2)), CAST(N'2018-02-24T21:42:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (883, 4, CAST(71.72 AS Decimal(18, 2)), CAST(N'2018-05-02T07:39:30.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (884, 4, CAST(78.74 AS Decimal(18, 2)), CAST(N'2018-03-12T17:22:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (885, 3, CAST(38.64 AS Decimal(18, 2)), CAST(N'2018-04-01T13:30:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (886, 1, CAST(83.55 AS Decimal(18, 2)), CAST(N'2018-02-23T07:14:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (887, 4, CAST(89.44 AS Decimal(18, 2)), CAST(N'2018-04-20T15:25:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (888, 1, CAST(63.47 AS Decimal(18, 2)), CAST(N'2018-03-18T13:16:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (889, 4, CAST(43.18 AS Decimal(18, 2)), CAST(N'2018-05-22T09:51:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (890, 1, CAST(42.83 AS Decimal(18, 2)), CAST(N'2018-03-10T23:31:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (891, 1, CAST(35.85 AS Decimal(18, 2)), CAST(N'2018-04-15T07:03:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (892, 1, CAST(67.16 AS Decimal(18, 2)), CAST(N'2018-05-19T18:12:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (893, 3, CAST(32.66 AS Decimal(18, 2)), CAST(N'2018-04-17T05:43:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (894, 3, CAST(43.26 AS Decimal(18, 2)), CAST(N'2018-03-22T00:43:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (895, 3, CAST(26.07 AS Decimal(18, 2)), CAST(N'2018-03-05T22:05:22.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (896, 3, CAST(76.81 AS Decimal(18, 2)), CAST(N'2018-05-20T18:52:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (897, 1, CAST(70.76 AS Decimal(18, 2)), CAST(N'2018-03-25T18:49:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (898, 4, CAST(83.07 AS Decimal(18, 2)), CAST(N'2018-02-14T14:52:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (899, 4, CAST(93.23 AS Decimal(18, 2)), CAST(N'2018-05-07T17:00:31.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (900, 1, CAST(88.17 AS Decimal(18, 2)), CAST(N'2018-04-29T11:01:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (901, 1, CAST(23.61 AS Decimal(18, 2)), CAST(N'2018-02-08T17:29:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (902, 3, CAST(52.57 AS Decimal(18, 2)), CAST(N'2018-05-17T20:27:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (903, 4, CAST(84.20 AS Decimal(18, 2)), CAST(N'2018-02-16T23:29:19.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (904, 3, CAST(24.98 AS Decimal(18, 2)), CAST(N'2018-02-08T02:15:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (905, 3, CAST(21.59 AS Decimal(18, 2)), CAST(N'2018-04-21T09:45:11.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (906, 2, CAST(35.70 AS Decimal(18, 2)), CAST(N'2018-02-20T00:05:54.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (907, 4, CAST(56.55 AS Decimal(18, 2)), CAST(N'2018-04-26T03:31:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (908, 4, CAST(2.50 AS Decimal(18, 2)), CAST(N'2018-04-10T05:57:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (909, 4, CAST(72.32 AS Decimal(18, 2)), CAST(N'2018-02-28T15:54:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (910, 4, CAST(59.02 AS Decimal(18, 2)), CAST(N'2018-05-21T03:05:30.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (911, 2, CAST(23.77 AS Decimal(18, 2)), CAST(N'2018-05-24T22:59:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (912, 1, CAST(93.62 AS Decimal(18, 2)), CAST(N'2018-02-08T07:02:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (913, 1, CAST(13.56 AS Decimal(18, 2)), CAST(N'2018-04-01T05:00:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (914, 4, CAST(24.23 AS Decimal(18, 2)), CAST(N'2018-03-01T22:25:02.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (915, 3, CAST(90.92 AS Decimal(18, 2)), CAST(N'2018-05-30T17:16:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (916, 4, CAST(83.52 AS Decimal(18, 2)), CAST(N'2018-04-13T22:16:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (917, 4, CAST(26.52 AS Decimal(18, 2)), CAST(N'2018-05-06T16:32:39.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (918, 4, CAST(2.66 AS Decimal(18, 2)), CAST(N'2018-03-13T19:12:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (919, 3, CAST(70.37 AS Decimal(18, 2)), CAST(N'2018-02-26T05:09:41.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (920, 4, CAST(66.91 AS Decimal(18, 2)), CAST(N'2018-04-23T18:15:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (921, 1, CAST(39.50 AS Decimal(18, 2)), CAST(N'2018-05-17T06:33:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (922, 3, CAST(80.51 AS Decimal(18, 2)), CAST(N'2018-03-21T12:38:04.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (923, 1, CAST(87.36 AS Decimal(18, 2)), CAST(N'2018-02-20T23:16:52.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (924, 1, CAST(86.28 AS Decimal(18, 2)), CAST(N'2018-03-17T00:00:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (925, 3, CAST(95.50 AS Decimal(18, 2)), CAST(N'2018-03-05T21:49:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (926, 1, CAST(24.27 AS Decimal(18, 2)), CAST(N'2018-04-19T05:58:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (927, 3, CAST(6.47 AS Decimal(18, 2)), CAST(N'2018-04-25T13:45:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (928, 1, CAST(79.38 AS Decimal(18, 2)), CAST(N'2018-05-22T02:42:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (929, 2, CAST(70.44 AS Decimal(18, 2)), CAST(N'2018-02-25T14:47:23.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (930, 4, CAST(5.29 AS Decimal(18, 2)), CAST(N'2018-04-12T12:31:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (931, 3, CAST(25.18 AS Decimal(18, 2)), CAST(N'2018-05-21T05:54:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (932, 1, CAST(76.66 AS Decimal(18, 2)), CAST(N'2018-05-03T16:11:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (933, 3, CAST(14.91 AS Decimal(18, 2)), CAST(N'2018-03-01T10:02:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (934, 2, CAST(66.75 AS Decimal(18, 2)), CAST(N'2018-04-24T23:58:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (935, 4, CAST(13.58 AS Decimal(18, 2)), CAST(N'2018-04-03T22:21:44.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (936, 2, CAST(18.14 AS Decimal(18, 2)), CAST(N'2018-05-21T10:31:40.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (937, 2, CAST(42.86 AS Decimal(18, 2)), CAST(N'2018-04-04T13:22:10.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (938, 3, CAST(91.34 AS Decimal(18, 2)), CAST(N'2018-03-22T21:32:01.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (939, 1, CAST(11.53 AS Decimal(18, 2)), CAST(N'2018-02-19T23:30:58.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (940, 3, CAST(99.31 AS Decimal(18, 2)), CAST(N'2018-05-10T09:19:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (941, 3, CAST(17.03 AS Decimal(18, 2)), CAST(N'2018-03-31T18:29:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (942, 3, CAST(14.40 AS Decimal(18, 2)), CAST(N'2018-05-13T22:54:25.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (943, 3, CAST(78.27 AS Decimal(18, 2)), CAST(N'2018-04-05T12:44:24.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (944, 2, CAST(9.81 AS Decimal(18, 2)), CAST(N'2018-03-26T02:49:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (945, 1, CAST(2.90 AS Decimal(18, 2)), CAST(N'2018-05-16T17:02:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (946, 1, CAST(58.04 AS Decimal(18, 2)), CAST(N'2018-02-19T03:06:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (947, 4, CAST(94.43 AS Decimal(18, 2)), CAST(N'2018-05-03T14:22:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (948, 2, CAST(53.15 AS Decimal(18, 2)), CAST(N'2018-05-24T23:37:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (949, 2, CAST(55.10 AS Decimal(18, 2)), CAST(N'2018-05-22T07:20:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (950, 3, CAST(12.18 AS Decimal(18, 2)), CAST(N'2018-05-21T10:03:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (951, 3, CAST(27.56 AS Decimal(18, 2)), CAST(N'2018-05-26T21:15:46.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (952, 1, CAST(40.59 AS Decimal(18, 2)), CAST(N'2018-04-28T14:26:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (953, 1, CAST(81.77 AS Decimal(18, 2)), CAST(N'2018-04-23T12:42:32.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (954, 3, CAST(31.81 AS Decimal(18, 2)), CAST(N'2018-04-30T10:09:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (955, 3, CAST(83.64 AS Decimal(18, 2)), CAST(N'2018-04-20T12:43:53.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (956, 1, CAST(12.17 AS Decimal(18, 2)), CAST(N'2018-05-25T17:53:45.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (957, 3, CAST(78.98 AS Decimal(18, 2)), CAST(N'2018-03-20T14:04:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (958, 2, CAST(24.91 AS Decimal(18, 2)), CAST(N'2018-02-12T11:29:56.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (959, 4, CAST(7.51 AS Decimal(18, 2)), CAST(N'2018-05-31T07:16:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (960, 1, CAST(65.41 AS Decimal(18, 2)), CAST(N'2018-03-13T17:28:49.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (961, 4, CAST(54.87 AS Decimal(18, 2)), CAST(N'2018-05-14T18:34:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (962, 2, CAST(8.96 AS Decimal(18, 2)), CAST(N'2018-03-09T07:18:03.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (963, 3, CAST(42.42 AS Decimal(18, 2)), CAST(N'2018-02-18T15:40:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (964, 3, CAST(10.14 AS Decimal(18, 2)), CAST(N'2018-04-27T00:19:05.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (965, 2, CAST(58.59 AS Decimal(18, 2)), CAST(N'2018-05-23T13:37:35.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (966, 2, CAST(67.49 AS Decimal(18, 2)), CAST(N'2018-03-09T05:55:07.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (967, 2, CAST(13.34 AS Decimal(18, 2)), CAST(N'2018-05-06T16:43:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (968, 4, CAST(17.53 AS Decimal(18, 2)), CAST(N'2018-03-03T07:11:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (969, 2, CAST(28.83 AS Decimal(18, 2)), CAST(N'2018-04-23T13:19:48.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (970, 1, CAST(82.72 AS Decimal(18, 2)), CAST(N'2018-05-15T00:30:27.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (971, 1, CAST(69.40 AS Decimal(18, 2)), CAST(N'2018-05-02T23:51:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (972, 1, CAST(74.00 AS Decimal(18, 2)), CAST(N'2018-04-18T05:19:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (973, 4, CAST(55.87 AS Decimal(18, 2)), CAST(N'2018-05-09T09:36:18.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (974, 2, CAST(3.31 AS Decimal(18, 2)), CAST(N'2018-05-21T01:31:57.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (975, 2, CAST(79.89 AS Decimal(18, 2)), CAST(N'2018-05-31T15:25:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (976, 1, CAST(19.21 AS Decimal(18, 2)), CAST(N'2018-02-14T23:43:26.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (977, 3, CAST(52.62 AS Decimal(18, 2)), CAST(N'2018-06-01T10:10:59.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (978, 4, CAST(5.08 AS Decimal(18, 2)), CAST(N'2018-02-16T07:53:42.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (979, 1, CAST(12.79 AS Decimal(18, 2)), CAST(N'2018-04-28T15:52:31.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (980, 2, CAST(61.34 AS Decimal(18, 2)), CAST(N'2018-02-22T05:05:47.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (981, 2, CAST(84.32 AS Decimal(18, 2)), CAST(N'2018-04-04T20:25:14.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (982, 4, CAST(8.25 AS Decimal(18, 2)), CAST(N'2018-05-19T18:02:28.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (983, 3, CAST(16.32 AS Decimal(18, 2)), CAST(N'2018-05-25T00:00:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (984, 2, CAST(29.90 AS Decimal(18, 2)), CAST(N'2018-02-28T19:03:37.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (985, 1, CAST(96.42 AS Decimal(18, 2)), CAST(N'2018-05-07T01:29:08.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (986, 4, CAST(32.15 AS Decimal(18, 2)), CAST(N'2018-05-11T02:14:13.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (987, 2, CAST(80.30 AS Decimal(18, 2)), CAST(N'2018-04-15T12:53:20.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (988, 3, CAST(67.95 AS Decimal(18, 2)), CAST(N'2018-05-05T14:36:17.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (989, 3, CAST(96.52 AS Decimal(18, 2)), CAST(N'2018-02-12T04:08:33.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (990, 2, CAST(21.15 AS Decimal(18, 2)), CAST(N'2018-04-29T15:29:21.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (991, 2, CAST(75.84 AS Decimal(18, 2)), CAST(N'2018-02-09T02:02:16.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (992, 2, CAST(12.83 AS Decimal(18, 2)), CAST(N'2018-05-12T16:59:43.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (993, 2, CAST(51.00 AS Decimal(18, 2)), CAST(N'2018-05-20T06:01:51.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (994, 1, CAST(89.76 AS Decimal(18, 2)), CAST(N'2018-03-09T13:36:50.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (995, 3, CAST(82.44 AS Decimal(18, 2)), CAST(N'2018-05-26T16:11:00.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (996, 3, CAST(35.08 AS Decimal(18, 2)), CAST(N'2018-02-15T10:10:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (997, 1, CAST(94.78 AS Decimal(18, 2)), CAST(N'2018-04-30T09:43:36.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (998, 4, CAST(87.86 AS Decimal(18, 2)), CAST(N'2018-05-28T23:57:06.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (999, 3, CAST(58.33 AS Decimal(18, 2)), CAST(N'2018-04-09T21:53:34.0000000' AS DateTime2))
GO
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1000, 4, CAST(5.19 AS Decimal(18, 2)), CAST(N'2018-03-11T08:31:15.0000000' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1001, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:31:04.1434844' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1002, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:31:04.1632793' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1003, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:31:04.1636927' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1004, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:33:25.5920881' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1005, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:33:25.5922528' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1006, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:33:25.5922795' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1007, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:34:10.5511134' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1008, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:34:10.5512891' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1009, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:34:10.5513281' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1010, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:37:30.0812796' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1011, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:37:30.0814633' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1012, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:37:30.0815084' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1013, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:38:17.2001860' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1014, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:38:17.2004186' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1015, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:38:17.2004405' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1016, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:38:19.2733062' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1017, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:38:19.2734525' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1018, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:38:19.2734935' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1019, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:40:25.4680914' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1020, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:40:25.4683914' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1021, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:40:25.4684616' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1022, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:43:22.1086907' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1023, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:43:22.1088925' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1024, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:43:22.1089356' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1025, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:46:39.2537762' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1026, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:46:39.2539796' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1027, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:46:39.2540125' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1028, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:47:18.9384009' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1029, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:47:18.9385449' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1030, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:47:18.9385764' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1031, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:47:59.1691544' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1032, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:47:59.1694632' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1033, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T15:47:59.1695013' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1034, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:01:47.5963065' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1035, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:01:47.5965079' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1036, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:01:47.5965311' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1037, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:02:19.3587409' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1038, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:02:19.3589569' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1039, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:02:19.3589965' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1040, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:09:22.2169034' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1041, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:09:22.2171175' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1042, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:09:22.2172358' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1043, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:11:59.5427353' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1044, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:11:59.5431569' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1045, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:11:59.5432162' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1046, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:12:04.7843707' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1047, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:12:04.7845774' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1048, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:12:04.7846010' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1049, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:12:22.5203016' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1050, 2, CAST(16.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:12:22.5205087' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1051, 4, CAST(18.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:12:22.5205542' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1052, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:14:47.9731412' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1053, 2, CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:14:47.9733288' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1054, 4, CAST(3.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:14:47.9733786' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1055, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:19:25.3806077' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1056, 2, CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:19:25.3808206' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1057, 4, CAST(3.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:19:25.3808626' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1058, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:22:18.3528155' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1059, 2, CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:22:18.3529793' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1060, 4, CAST(3.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:22:18.3530029' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1061, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:25:06.0682712' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1062, 2, CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:25:06.0684779' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1063, 4, CAST(3.00 AS Decimal(18, 2)), CAST(N'2020-08-23T16:25:06.0685142' AS DateTime2))
INSERT [dbo].[FarmSensorMeasurements] ([Id], [FarmSensorId], [Value], [DateCreated]) VALUES (1064, 1, CAST(7.25 AS Decimal(18, 2)), CAST(N'2020-08-23T17:43:13.4530781' AS DateTime2))
SET IDENTITY_INSERT [dbo].[FarmSensorMeasurements] OFF
GO
SET IDENTITY_INSERT [dbo].[FarmSensors] ON 

INSERT [dbo].[FarmSensors] ([Id], [Name], [Code], [FarmId], [SensorId], [DateCreated], [DateModified]) VALUES (1, N'Temp 1', N'TMP1', 1, 1, CAST(N'2019-02-07T21:15:39.1800000' AS DateTime2), CAST(N'2019-02-07T21:15:39.1800000' AS DateTime2))
INSERT [dbo].[FarmSensors] ([Id], [Name], [Code], [FarmId], [SensorId], [DateCreated], [DateModified]) VALUES (2, N'Air Hum 1', N'AHUM1', 1, 2, CAST(N'2019-02-07T21:15:43.5600000' AS DateTime2), CAST(N'2019-02-07T21:15:43.5600000' AS DateTime2))
INSERT [dbo].[FarmSensors] ([Id], [Name], [Code], [FarmId], [SensorId], [DateCreated], [DateModified]) VALUES (3, N'Light 1', N'LGT1', 1, 3, CAST(N'2019-02-07T21:15:48.7800000' AS DateTime2), CAST(N'2019-02-07T21:15:48.7800000' AS DateTime2))
INSERT [dbo].[FarmSensors] ([Id], [Name], [Code], [FarmId], [SensorId], [DateCreated], [DateModified]) VALUES (4, N'Soil Hum 1', N'SHUM1', 1, 4, CAST(N'2019-02-07T21:15:51.9966667' AS DateTime2), CAST(N'2019-02-07T21:15:51.9966667' AS DateTime2))
SET IDENTITY_INSERT [dbo].[FarmSensors] OFF
GO
SET IDENTITY_INSERT [dbo].[MeasuringUnits] ON 

INSERT [dbo].[MeasuringUnits] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (1, N'Celsius', N'°C', CAST(N'2019-02-07T20:35:41.7033333' AS DateTime2), CAST(N'2019-02-07T20:35:41.7033333' AS DateTime2), 1)
INSERT [dbo].[MeasuringUnits] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (2, N'Percentage', N'%', CAST(N'2019-02-07T20:35:47.1100000' AS DateTime2), CAST(N'2019-02-07T20:35:47.1100000' AS DateTime2), 1)
INSERT [dbo].[MeasuringUnits] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (3, N'Fahrenheit', N'°F', CAST(N'2020-08-29T16:01:58.4683811' AS DateTime2), CAST(N'2020-08-29T16:01:58.4686743' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[MeasuringUnits] OFF
GO
SET IDENTITY_INSERT [dbo].[Plants] ON 

INSERT [dbo].[Plants] ([Id], [Name], [Code], [Description], [DateCreated], [DateModified], [Version]) VALUES (1, N'Tomatoes', N'TOM', N'Tomato, (Solanum lycopersicum), flowering plant of the nightshade family (Solanaceae), cultivated extensively for its edible fruits. Labelled as a vegetable for nutritional purposes, tomatoes are a good source of vitamin C and the phytochemical lycopene. The fruits are commonly eaten raw in salads, served as a cooked vegetable, used as an ingredient of various prepared dishes, and pickled. Additionally, a large percentage of the world’s tomato crop is used for processing; products include canned tomatoes, tomato juice, ketchup, puree, paste, and “sun-dried” tomatoes or dehydrated pulp.', CAST(N'2019-02-07T20:56:58.4466667' AS DateTime2), CAST(N'2019-02-07T20:56:58.4466667' AS DateTime2), 1)
INSERT [dbo].[Plants] ([Id], [Name], [Code], [Description], [DateCreated], [DateModified], [Version]) VALUES (3, N'Paprika', N'PAP', N'Paprika, spice made from the pods of Capsicum annuum, an annual shrub belonging to the nightshade family, Solanaceae, and native to tropical areas of the Western Hemisphere, including Mexico, Central America, South America, and the West Indies.', CAST(N'2019-02-07T20:58:00.6600000' AS DateTime2), CAST(N'2019-02-07T20:58:00.6600000' AS DateTime2), 1)
INSERT [dbo].[Plants] ([Id], [Name], [Code], [Description], [DateCreated], [DateModified], [Version]) VALUES (4, N'Pickle', N'PICK', N'A pickled cucumber (commonly known as a pickle in the United States and Canada and a gherkin in Britain, Ireland, Australia, South Africa and New Zealand) is a cucumber that has been pickled in a brine, vinegar, or other solution and left to ferment for a period of time, by either immersing the cucumbers in an acidic solution or through souring by lacto-fermentation. Pickled cucumbers are often part of mixed pickles.', CAST(N'2019-02-07T20:59:55.1066667' AS DateTime2), CAST(N'2019-02-07T20:59:55.1066667' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Plants] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (1, N'Administrator', N'A', CAST(N'2019-01-24T18:15:36.5133333' AS DateTime2), CAST(N'2019-01-24T18:15:36.5133333' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (2, N'User', N'U', CAST(N'2019-01-24T18:15:50.1633333' AS DateTime2), CAST(N'2019-01-24T18:15:50.1633333' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Rules] ON 

INSERT [dbo].[Rules] ([Id], [Name], [Code], [Conditions], [Active], [RuleSetId], [DateCreated], [DateModified]) VALUES (1, N'Light', N'LGT', N'{"and":[{">":[{"var":"currentTime"},{"+":[800,{"*":[{"/":[{"var":"currentDay"},3]},10]}]}]},{"<":[{"var":"currentTime"},{"-":[2400,{"*":[{"/":[{"var":"currentDay"},3]},10]}]}]}]}', 1, 1, CAST(N'2019-02-07T21:08:59.5733333' AS DateTime2), CAST(N'2019-02-07T21:08:59.5733333' AS DateTime2))
INSERT [dbo].[Rules] ([Id], [Name], [Code], [Conditions], [Active], [RuleSetId], [DateCreated], [DateModified]) VALUES (2, N'ALL', N'ALL', N'{"MinimumTemperature":15,"MaximumTemperature":25,"MinimumSoilHumidity":0,"MaximumSoilHumidity":0,"LightTimeSwitchOn":"2020-08-23T09:00:00","LightTimeSwitchOff":"2020-08-23T16:00:00"}', 1, 1, CAST(N'2020-08-22T14:33:40.7469223' AS DateTime2), CAST(N'2020-08-23T18:29:34.9604404' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Rules] OFF
GO
SET IDENTITY_INSERT [dbo].[RuleSets] ON 

INSERT [dbo].[RuleSets] ([Id], [Name], [Code], [Active], [DateCreated], [DateModified]) VALUES (1, N'Tomatoes Ruleset', N'TR ', 1, CAST(N'2019-02-07T21:08:12.6666667' AS DateTime2), CAST(N'2019-02-07T21:08:12.6666667' AS DateTime2))
INSERT [dbo].[RuleSets] ([Id], [Name], [Code], [Active], [DateCreated], [DateModified]) VALUES (3, N'Tomatoes Ruleset', N'TR ', 1, CAST(N'2019-02-07T21:07:15.7800000' AS DateTime2), CAST(N'2019-02-07T21:07:15.7800000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[RuleSets] OFF
GO
SET IDENTITY_INSERT [dbo].[Sensors] ON 

INSERT [dbo].[Sensors] ([Id], [Code], [SensorTypeId], [MeasuringUnitId], [DateCreated], [DateModified], [Version]) VALUES (1, N'DHT22', 1, 1, CAST(N'2019-02-07T20:34:46.5133333' AS DateTime2), CAST(N'2019-02-07T20:34:46.5133333' AS DateTime2), 1)
INSERT [dbo].[Sensors] ([Id], [Code], [SensorTypeId], [MeasuringUnitId], [DateCreated], [DateModified], [Version]) VALUES (2, N'DHT22', 2, 2, CAST(N'2019-02-07T20:36:39.6500000' AS DateTime2), CAST(N'2019-02-07T20:36:39.6500000' AS DateTime2), 1)
INSERT [dbo].[Sensors] ([Id], [Code], [SensorTypeId], [MeasuringUnitId], [DateCreated], [DateModified], [Version]) VALUES (3, N'LDR', 3, 2, CAST(N'2019-02-07T20:36:44.7400000' AS DateTime2), CAST(N'2019-02-07T20:36:44.7400000' AS DateTime2), 1)
INSERT [dbo].[Sensors] ([Id], [Code], [SensorTypeId], [MeasuringUnitId], [DateCreated], [DateModified], [Version]) VALUES (4, N'SEN-1332', 4, 2, CAST(N'2019-02-07T20:36:54.0533333' AS DateTime2), CAST(N'2019-02-07T20:36:54.0533333' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Sensors] OFF
GO
SET IDENTITY_INSERT [dbo].[SensorTypes] ON 

INSERT [dbo].[SensorTypes] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (1, N'Temperature', N'TMP', CAST(N'2019-02-07T20:30:58.0100000' AS DateTime2), CAST(N'2019-02-07T20:30:58.0100000' AS DateTime2), 1)
INSERT [dbo].[SensorTypes] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (2, N'Air Humidity', N'AHY', CAST(N'2019-02-07T20:31:43.6466667' AS DateTime2), CAST(N'2019-02-07T20:31:43.6466667' AS DateTime2), 1)
INSERT [dbo].[SensorTypes] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (3, N'Light', N'LGT', CAST(N'2019-02-07T20:31:50.6600000' AS DateTime2), CAST(N'2019-02-07T20:31:50.6600000' AS DateTime2), 1)
INSERT [dbo].[SensorTypes] ([Id], [Name], [Code], [DateCreated], [DateModified], [Version]) VALUES (4, N'Soil Humidity', N'SHY', CAST(N'2019-02-07T20:31:57.7400000' AS DateTime2), CAST(N'2019-02-07T20:31:57.7400000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[SensorTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [RoleId], [Active], [DateCreated], [DateModified], [FirstName], [LastName], [Email]) VALUES (1, N'admin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 1, 1, CAST(N'2019-01-24T18:16:07.8066667' AS DateTime2), CAST(N'2019-01-24T18:16:07.8066667' AS DateTime2), N'Ivan', N'Čiček', NULL)
INSERT [dbo].[Users] ([Id], [Username], [Password], [RoleId], [Active], [DateCreated], [DateModified], [FirstName], [LastName], [Email]) VALUES (2, N'jdoe', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 2, 1, CAST(N'2019-01-31T20:06:40.5900000' AS DateTime2), CAST(N'2019-01-31T20:06:40.5900000' AS DateTime2), N'John', N'Doe', N'john.doe@gmai.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Actuators] ADD  CONSTRAINT [DF__Actuators__DateC__3D5E1FD2]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Actuators] ADD  CONSTRAINT [DF__Actuators__DateM__3E52440B]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[ActuatorTypes] ADD  CONSTRAINT [DF__ActuatorT__DateC__5812160E]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ActuatorTypes] ADD  CONSTRAINT [DF__ActuatorT__DateM__59063A47]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[ActuatorTypes] ADD  CONSTRAINT [DF__ActuatorT__Versi__59FA5E80]  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Cities] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Cities] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Cities] ADD  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[FarmActutators] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[FarmActutators] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[FarmPlants] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[FarmPlants] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Farms] ADD  CONSTRAINT [DF__Farms__DateCreat__6383C8BA]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Farms] ADD  CONSTRAINT [DF__Farms__DateModif__6477ECF3]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[FarmSensorMeasurements] ADD  CONSTRAINT [DF__FarmSenso__DateC__14270015]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[FarmSensors] ADD  CONSTRAINT [DF__FarmSenso__DateC__0F624AF8]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[FarmSensors] ADD  CONSTRAINT [DF__FarmSenso__DateM__10566F31]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[MeasuringUnits] ADD  CONSTRAINT [DF__Measuring__DateC__6C190EBB]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[MeasuringUnits] ADD  CONSTRAINT [DF__Measuring__DateM__6D0D32F4]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[MeasuringUnits] ADD  CONSTRAINT [DF__Measuring__Versi__6E01572D]  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Plants] ADD  CONSTRAINT [DF__Plants__DateCrea__02FC7413]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Plants] ADD  CONSTRAINT [DF__Plants__DateModi__03F0984C]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Plants] ADD  CONSTRAINT [DF__Plants__Version__04E4BC85]  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Rules] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Rules] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Rules] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[RuleSets] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[RuleSets] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[RuleSets] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Sensors] ADD  CONSTRAINT [DF__Sensors__DateCre__72C60C4A]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Sensors] ADD  CONSTRAINT [DF__Sensors__DateMod__73BA3083]  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Sensors] ADD  CONSTRAINT [DF__Sensors__Version__74AE54BC]  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[SensorTypes] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[SensorTypes] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[SensorTypes] ADD  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Actuators]  WITH CHECK ADD  CONSTRAINT [FK__Actuators__Actut__3C69FB99] FOREIGN KEY([ActutatorTypeId])
REFERENCES [dbo].[ActuatorTypes] ([Id])
GO
ALTER TABLE [dbo].[Actuators] CHECK CONSTRAINT [FK__Actuators__Actut__3C69FB99]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[FarmActutators]  WITH CHECK ADD  CONSTRAINT [FK__FarmActut__Actua__787EE5A0] FOREIGN KEY([ActuatorId])
REFERENCES [dbo].[Actuators] ([Id])
GO
ALTER TABLE [dbo].[FarmActutators] CHECK CONSTRAINT [FK__FarmActut__Actua__787EE5A0]
GO
ALTER TABLE [dbo].[FarmActutators]  WITH CHECK ADD  CONSTRAINT [FK__FarmActut__FarmI__778AC167] FOREIGN KEY([FarmId])
REFERENCES [dbo].[Farms] ([Id])
GO
ALTER TABLE [dbo].[FarmActutators] CHECK CONSTRAINT [FK__FarmActut__FarmI__778AC167]
GO
ALTER TABLE [dbo].[FarmPlants]  WITH CHECK ADD  CONSTRAINT [FK__FarmPlant__FarmI__07C12930] FOREIGN KEY([FarmId])
REFERENCES [dbo].[Farms] ([Id])
GO
ALTER TABLE [dbo].[FarmPlants] CHECK CONSTRAINT [FK__FarmPlant__FarmI__07C12930]
GO
ALTER TABLE [dbo].[FarmPlants]  WITH CHECK ADD  CONSTRAINT [FK__FarmPlant__Plant__08B54D69] FOREIGN KEY([PlantId])
REFERENCES [dbo].[Plants] ([Id])
GO
ALTER TABLE [dbo].[FarmPlants] CHECK CONSTRAINT [FK__FarmPlant__Plant__08B54D69]
GO
ALTER TABLE [dbo].[Farms]  WITH CHECK ADD  CONSTRAINT [FK__Farms__CityId__619B8048] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Farms] CHECK CONSTRAINT [FK__Farms__CityId__619B8048]
GO
ALTER TABLE [dbo].[Farms]  WITH CHECK ADD  CONSTRAINT [FK__Farms__RuleSetId__628FA481] FOREIGN KEY([RuleSetId])
REFERENCES [dbo].[RuleSets] ([Id])
GO
ALTER TABLE [dbo].[Farms] CHECK CONSTRAINT [FK__Farms__RuleSetId__628FA481]
GO
ALTER TABLE [dbo].[Farms]  WITH CHECK ADD  CONSTRAINT [FK__Farms__UserId__60A75C0F] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Farms] CHECK CONSTRAINT [FK__Farms__UserId__60A75C0F]
GO
ALTER TABLE [dbo].[FarmSensorMeasurements]  WITH CHECK ADD  CONSTRAINT [FK__FarmSenso__FarmS__1332DBDC] FOREIGN KEY([FarmSensorId])
REFERENCES [dbo].[FarmSensors] ([Id])
GO
ALTER TABLE [dbo].[FarmSensorMeasurements] CHECK CONSTRAINT [FK__FarmSenso__FarmS__1332DBDC]
GO
ALTER TABLE [dbo].[FarmSensors]  WITH CHECK ADD  CONSTRAINT [FK__FarmSenso__FarmI__0D7A0286] FOREIGN KEY([FarmId])
REFERENCES [dbo].[Farms] ([Id])
GO
ALTER TABLE [dbo].[FarmSensors] CHECK CONSTRAINT [FK__FarmSenso__FarmI__0D7A0286]
GO
ALTER TABLE [dbo].[FarmSensors]  WITH CHECK ADD  CONSTRAINT [FK__FarmSenso__Senso__0E6E26BF] FOREIGN KEY([SensorId])
REFERENCES [dbo].[Sensors] ([Id])
GO
ALTER TABLE [dbo].[FarmSensors] CHECK CONSTRAINT [FK__FarmSenso__Senso__0E6E26BF]
GO
ALTER TABLE [dbo].[Rules]  WITH CHECK ADD FOREIGN KEY([RuleSetId])
REFERENCES [dbo].[RuleSets] ([Id])
GO
ALTER TABLE [dbo].[Sensors]  WITH CHECK ADD  CONSTRAINT [FK__Sensors__Measuri__71D1E811] FOREIGN KEY([MeasuringUnitId])
REFERENCES [dbo].[MeasuringUnits] ([Id])
GO
ALTER TABLE [dbo].[Sensors] CHECK CONSTRAINT [FK__Sensors__Measuri__71D1E811]
GO
ALTER TABLE [dbo].[Sensors]  WITH CHECK ADD  CONSTRAINT [FK__Sensors__SensorT__70DDC3D8] FOREIGN KEY([SensorTypeId])
REFERENCES [dbo].[SensorTypes] ([Id])
GO
ALTER TABLE [dbo].[Sensors] CHECK CONSTRAINT [FK__Sensors__SensorT__70DDC3D8]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
USE [master]
GO
ALTER DATABASE [iotomatoes] SET  READ_WRITE 
GO
