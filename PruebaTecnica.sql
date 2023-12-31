USE [master]
GO
/****** Object:  Database [PruebaTecnica]    Script Date: 10/03/2023 7:54:18 p. m. ******/
CREATE DATABASE [PruebaTecnica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaTecnica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PruebaTecnica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaTecnica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PruebaTecnica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PruebaTecnica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaTecnica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaTecnica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaTecnica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaTecnica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaTecnica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaTecnica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaTecnica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaTecnica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaTecnica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaTecnica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaTecnica] SET RECOVERY FULL 
GO
ALTER DATABASE [PruebaTecnica] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaTecnica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaTecnica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaTecnica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaTecnica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebaTecnica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PruebaTecnica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PruebaTecnica', N'ON'
GO
ALTER DATABASE [PruebaTecnica] SET QUERY_STORE = OFF
GO
USE [PruebaTecnica]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/03/2023 7:54:19 p. m. ******/
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
/****** Object:  Table [dbo].[CitaMotivoCita]    Script Date: 10/03/2023 7:54:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CitaMotivoCita](
	[CitasIdCita] [int] NOT NULL,
	[MotivosCitaIdMotivoCita] [int] NOT NULL,
 CONSTRAINT [PK_CitaMotivoCita] PRIMARY KEY CLUSTERED 
(
	[CitasIdCita] ASC,
	[MotivosCitaIdMotivoCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CitaMotivosCita]    Script Date: 10/03/2023 7:54:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CitaMotivosCita](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CitaId] [int] NOT NULL,
	[MotivocitaId] [int] NOT NULL,
 CONSTRAINT [PK_CitaMotivosCita] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 10/03/2023 7:54:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[IdCita] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[FechaCita] [datetime2](7) NOT NULL,
	[PersonaId] [int] NOT NULL,
 CONSTRAINT [PK_Citas] PRIMARY KEY CLUSTERED 
(
	[IdCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 10/03/2023 7:54:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [nvarchar](max) NOT NULL,
	[Usuario] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Clave] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotivosCita]    Script Date: 10/03/2023 7:54:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotivosCita](
	[IdMotivoCita] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MotivosCita] PRIMARY KEY CLUSTERED 
(
	[IdMotivoCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 10/03/2023 7:54:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Apellidos] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Celular] [nvarchar](max) NOT NULL,
	[Edad] [int] NOT NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_CitaMotivoCita_MotivosCitaIdMotivoCita]    Script Date: 10/03/2023 7:54:19 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CitaMotivoCita_MotivosCitaIdMotivoCita] ON [dbo].[CitaMotivoCita]
(
	[MotivosCitaIdMotivoCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CitaMotivosCita_CitaId]    Script Date: 10/03/2023 7:54:19 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CitaMotivosCita_CitaId] ON [dbo].[CitaMotivosCita]
(
	[CitaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CitaMotivosCita_MotivocitaId]    Script Date: 10/03/2023 7:54:19 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_CitaMotivosCita_MotivocitaId] ON [dbo].[CitaMotivosCita]
(
	[MotivocitaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Citas_PersonaId]    Script Date: 10/03/2023 7:54:19 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Citas_PersonaId] ON [dbo].[Citas]
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CitaMotivoCita]  WITH CHECK ADD  CONSTRAINT [FK_CitaMotivoCita_Citas_CitasIdCita] FOREIGN KEY([CitasIdCita])
REFERENCES [dbo].[Citas] ([IdCita])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CitaMotivoCita] CHECK CONSTRAINT [FK_CitaMotivoCita_Citas_CitasIdCita]
GO
ALTER TABLE [dbo].[CitaMotivoCita]  WITH CHECK ADD  CONSTRAINT [FK_CitaMotivoCita_MotivosCita_MotivosCitaIdMotivoCita] FOREIGN KEY([MotivosCitaIdMotivoCita])
REFERENCES [dbo].[MotivosCita] ([IdMotivoCita])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CitaMotivoCita] CHECK CONSTRAINT [FK_CitaMotivoCita_MotivosCita_MotivosCitaIdMotivoCita]
GO
ALTER TABLE [dbo].[CitaMotivosCita]  WITH CHECK ADD  CONSTRAINT [FK_CitaMotivosCita_Citas_CitaId] FOREIGN KEY([CitaId])
REFERENCES [dbo].[Citas] ([IdCita])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CitaMotivosCita] CHECK CONSTRAINT [FK_CitaMotivosCita_Citas_CitaId]
GO
ALTER TABLE [dbo].[CitaMotivosCita]  WITH CHECK ADD  CONSTRAINT [FK_CitaMotivosCita_MotivosCita_MotivocitaId] FOREIGN KEY([MotivocitaId])
REFERENCES [dbo].[MotivosCita] ([IdMotivoCita])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CitaMotivosCita] CHECK CONSTRAINT [FK_CitaMotivosCita_MotivosCita_MotivocitaId]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_persona_PersonaId] FOREIGN KEY([PersonaId])
REFERENCES [dbo].[persona] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_persona_PersonaId]
GO
USE [master]
GO
ALTER DATABASE [PruebaTecnica] SET  READ_WRITE 
GO
