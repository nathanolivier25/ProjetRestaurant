USE [master]
GO
/****** Object:  Database [ProgSystem]    Script Date: 11/12/2018 17:09:02 ******/
CREATE DATABASE [ProgSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProgSystem', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProgSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProgSystem_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProgSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProgSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProgSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProgSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProgSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProgSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProgSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProgSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProgSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProgSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProgSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProgSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProgSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProgSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProgSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProgSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProgSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProgSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProgSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProgSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProgSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProgSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProgSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProgSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProgSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProgSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ProgSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ProgSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProgSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProgSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProgSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProgSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProgSystem', N'ON'
GO
ALTER DATABASE [ProgSystem] SET QUERY_STORE = OFF
GO
USE [ProgSystem]
GO
/****** Object:  Table [dbo].[commande]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commande](
	[NumeroCommande] [int] IDENTITY(1,1) NOT NULL,
	[StatutCommande] [bit] NOT NULL,
	[IDTable] [int] NOT NULL,
 CONSTRAINT [Commande_PK] PRIMARY KEY CLUSTERED 
(
	[NumeroCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groupclient]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groupclient](
	[IDGroupe] [int] IDENTITY(1,1) NOT NULL,
	[NombreClient] [int] NOT NULL,
	[IDTable] [int],
 CONSTRAINT [PK__groupcli__6561693D1C08198A] PRIMARY KEY CLUSTERED 
(
	[IDGroupe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[IDIngredient] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](15) NOT NULL,
	[NomIngredient] [varchar](50) NOT NULL,
 CONSTRAINT [Ingredient_PK] PRIMARY KEY CLUSTERED 
(
	[IDIngredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lignecommande]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lignecommande](
	[IDPreparation] [int] NOT NULL,
	[NumeroCommande] [int] NOT NULL,
	[QuantiteRecette] [int] NOT NULL,
	[CategorieRecette] [int] NOT NULL,
 CONSTRAINT [LigneCommande_PK] PRIMARY KEY CLUSTERED 
(
	[IDPreparation] ASC,
	[NumeroCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materiel]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materiel](
	[IDMateriel] [int] IDENTITY(1,1) NOT NULL,
	[NomMateriel] [varchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[EtatMateriel] [bit] NOT NULL,
 CONSTRAINT [Materiel_PK] PRIMARY KEY CLUSTERED 
(
	[IDMateriel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[necessite]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[necessite](
	[IDPreparation] [int] NOT NULL,
	[IDTache] [int] NOT NULL,
	[IDIngredients] [varchar](50) NOT NULL,
	[OrdreTache] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preparation]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preparation](
	[IDPreparation] [int] IDENTITY(1,1) NOT NULL,
	[NomPreparation] [varchar](50) NOT NULL,
 CONSTRAINT [Preparation_PK] PRIMARY KEY CLUSTERED 
(
	[IDPreparation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockCuisine]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockCuisine](
	[IDStock] [int] IDENTITY(1,1) NOT NULL,
	[QuantiteStock] [int] NOT NULL,
	[DateReception] [datetime2](0) NULL,
	[DateCreation] [datetime2](0) NULL,
	[IDIngredient] [int] NULL,
	[IDPreparation] [int] NULL,
 CONSTRAINT [StockCuisine_PK] PRIMARY KEY CLUSTERED 
(
	[IDStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockMateriel]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockMateriel](
	[IDStockMateriel] [int] IDENTITY(1,1) NOT NULL,
	[QuantiteMaterielStock] [int] NOT NULL,
	[IDMateriel] [int] NOT NULL,
 CONSTRAINT [StockMateriel_PK] PRIMARY KEY CLUSTERED 
(
	[IDStockMateriel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tablerestaurant]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablerestaurant](
	[IDTable] [int] IDENTITY(1,1) NOT NULL,
	[IDCarre] [int] NOT NULL,
	[IDRang] [int] NOT NULL,
	[NbrPlacesTable] [int] NOT NULL,
	[EtatTable] [int] NOT NULL,
 CONSTRAINT [TableRestaurant_PK] PRIMARY KEY CLUSTERED 
(
	[IDTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tache]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tache](
	[IDTache] [int] IDENTITY(1,1) NOT NULL,
	[NomTache] [varchar](50) NOT NULL,
	[DureeTache] [int] NOT NULL,
 CONSTRAINT [Tache_PK] PRIMARY KEY CLUSTERED 
(
	[IDTache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[utilise]    Script Date: 11/12/2018 17:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[utilise](
	[IDTache] [int] NOT NULL,
	[IDMateriel] [int] NOT NULL,
	[QuantiteMateriel] [int] NOT NULL,
 CONSTRAINT [Utilise_PK] PRIMARY KEY CLUSTERED 
(
	[IDTache] ASC,
	[IDMateriel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ingredient] ON 

INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (1, N'C', N'Ravioli')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (2, N'F', N'Carotes')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (4, N'C', N'Haricots vert')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (5, N'S', N'Steak')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (8, N'F', N'Sauce bolognaise')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (9, N'F', N'Lardons')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (10, N'C', N'Pates')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (11, N'F', N'Veau')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (14, N'F', N'Creme fraiche')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (15, N'F', N'Jaune d oeufs')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (16, N'F', N'Jus de citron')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (17, N'F', N'Entrecote')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (19, N'F', N'Beurre')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (20, N'F', N'Dorade')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (21, N'C', N'Champignons')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (23, N'F', N'Foie gras')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (24, N'F', N'Concombre')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (25, N'F', N'Choux blanc')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (26, N'F', N'Oeufs')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (27, N'F', N'Tomate')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (28, N'F', N'Raisins')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (29, N'F', N'Mayonnaise')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (30, N'F', N'Oignons')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (31, N'F', N'Fromage blanc')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (32, N'F', N'Poivrons')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (33, N'F', N'Salade')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (34, N'F', N'Jambon')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (35, N'F', N'Huitres')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (36, N'F', N'Saumon')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (37, N'F', N'Betteraves')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (38, N'F', N'Ciboulette')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (39, N'F', N'Ail')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (40, N'F', N'Basilic')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (41, N'C', N'Farine')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (42, N'C', N'Levure de boulanger')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (43, N'F', N'Lait')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (44, N'C', N'Sel')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (45, N'S', N'Frites')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (46, N'F', N'Riz')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (47, N'S', N'Glace')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (48, N'F', N'Pommes')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (49, N'F', N'Poires')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (50, N'F', N'Banane')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (51, N'F', N'Orange')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (52, N'F', N'Kiwi')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (53, N'C', N'Madeleines')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (54, N'C', N'Chocolat')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (55, N'C', N'Sucre')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (56, N'C', N'Cassonade')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (57, N'C', N'Cannelle')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (58, N'C', N'Pâte brisée')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (59, N'C', N'Sucre roux')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (60, N'F', N'Mascarpone')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (61, N'C', N'Boudoir')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (62, N'C', N'Café')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (63, N'C', N'Cacao amer')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (64, N'F', N'Poulet')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (65, N'S', N'Poelee de legumes')
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
SET IDENTITY_INSERT [dbo].[Materiel] ON 

INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (1, N'Feu de cuisson', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (2, N'Casseroles', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (3, N'Poeles', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (4, N'Four', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (5, N'Cuillères en bois', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (6, N'Mixeur', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (7, N'Bols à salade', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (8, N'Autocuiseur', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (9, N'Presse-agrumes', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (10, N'Tamis', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (11, N'Entonnoirs', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (12, N'Couteaux de cuisine', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (13, N'Frigo de travail', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (14, N'Friteuse', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (15, N'Egoutoirs', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (16, N'Fourchette', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (17, N'Moule', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (18, N'Fouet', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (19, N'Plancha', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (20, N'Lave-vaisselle', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (21, N'Machine a laver', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (22, N'Evier', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (23, N'Assiettes plates', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (24, N'Assiettes entrees', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (25, N'Assiettes desserts', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (26, N'Assiettes creuses', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (27, N'Fourchettes', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (28, N'Couteaux', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (29, N'Cuilleres a soupes', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (30, N'Cuilleres a cafe', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (31, N'Verres', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (32, N'Flutes à champagne', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (33, N'Verres a vin', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (34, N'Jeux de tasses et assiettes a cafe', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (35, N'Serviettes en tissu', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (36, N'Nappes', 0, 0)
SET IDENTITY_INSERT [dbo].[Materiel] OFF
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (1, 8, N'23', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (1, 1, N'23', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (2, 8, N'26,29', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (2, 2, N'26', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (2, 15, N'29', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (3, 8, N'33,36,24,27,30', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (3, 1, N'33,36,24,27,30', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (3, 3, N'33,36,24,27,30', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (4, 8, N'33,34,24,27,30', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (4, 1, N'33,34,24,27,30', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (4, 3, N'33,34,24,27,30', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (5, 8, N'37', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (5, 1, N'37', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (6, 8, N'25,2,31,16,38,29', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (6, 23, N'25,2', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (6, 2, N'25,2', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (6, 15, N'31,16,38,29', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (6, 3, N'25,2,31,16,38,29', 5)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (7, 8, N'66,28,24,32', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (7, 23, N'24', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (7, 1, N'24,32', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (7, 3, N'66,28,24,32', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (8, 8, N'35', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (8, 4, N'35', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 8, N'27,32,24,30,39,67,26,40', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 23, N'27,24,30', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 1, N'27,32,24,30,39', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 5, N'27,32,24,30,39', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 15, N'67', 5)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 5, N'27,32,24,30,39,67', 6)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 6, N'26', 7)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 3, N'27,32,24,30,39,67,26,40', 8)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (10, 8, N'41,26,42,43,44', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (10, 3, N'41,42,43,44', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (10, 7, N'67', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (10, 3, N'41,26,42,43,44', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (10, 10, N'68', 5)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (11, 8, N'45,5', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (11, 9, N'45', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (11, 10, N'5', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (12, 8, N'10,9,14', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (12, 11, N'69', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (12, 10, N'10,9', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (12, 15, N'14', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (12, 3, N'68', 5)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (13, 8, N'10,8', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (13, 11, N'69', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (13, 10, N'10', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (13, 15, N'10,8', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (14, 8, N'17,4', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (14, 10, N'17,4', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (15, 8, N'1', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (15, 10, N'1', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 8, N'11,2,21,14,15,16,46', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 11, N'69', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 23, N'2,21', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 1, N'2,21', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 10, N'46,2,21,11', 5)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 3, N'68,14,15,16', 6)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (17, 8, N'20,46', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (17, 11, N'69', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (17, 10, N'20,46', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (18, 8, N'64,65', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (18, 10, N'64,65', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (19, 8, N'33,27,26,24', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (19, 23, N'27,24', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (19, 1, N'27,26,24', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (19, 3, N'33,27,26,24', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (20, 8, N'70,2,71,72', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (20, 23, N'70,2,71,72', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (20, 1, N'70,2,71,72', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (20, 5, N'70,2,71,72', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (20, 10, N'70,2,71,72', 5)
SET IDENTITY_INSERT [dbo].[preparation] ON 

INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (1, N'Foie gras')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (2, N'Oeuf mayonnaise')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (3, N'Salade saumon')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (4, N'Salade jambon')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (5, N'Betteraves')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (6, N'Coleslaw')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (7, N'Taboule')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (8, N'Huitres')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (9, N'Gaspacho')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (10, N'Blinis')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (11, N'Steak frites')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (12, N'Pates carbonara')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (13, N'Pates bolognaise')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (14, N'Entrecote')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (15, N'Raviolis')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (16, N'Blanquette de veau')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (17, N'Dorade grillee')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (18, N'Poulet et legumes')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (19, N'Salade composee')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (20, N'Soupe de legumes')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (21, N'Boules de glace')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (22, N'Compote de pommes')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (23, N'Salade de fruits')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (24, N'Madeleines')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (25, N'Gateau au chocolat')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (26, N'Crumble aux pommes')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (27, N'Mousse au chocolat')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (28, N'Quatre quarts')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (29, N'Tarte aux pommes')
INSERT [dbo].[preparation] ([IDPreparation], [NomPreparation]) VALUES (30, N'Tiramisu')
SET IDENTITY_INSERT [dbo].[preparation] OFF
SET IDENTITY_INSERT [dbo].[StockMateriel] ON 

INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (1, 5, 1)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (2, 10, 2)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (3, 10, 3)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (4, 1, 4)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (5, 10, 5)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (6, 1, 6)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (7, 5, 7)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (8, 2, 8)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (9, 1, 9)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (10, 1, 10)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (11, 1, 11)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (12, 5, 12)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (13, 1, 13)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (14, 1, 14)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (15, 1, 15)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (16, 5, 16)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (17, 2, 17)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (18, 2, 18)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (19, 1, 19)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (20, 1, 20)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (21, 1, 21)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (22, 1, 22)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (23, 150, 23)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (24, 150, 24)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (25, 150, 25)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (26, 30, 26)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (27, 150, 27)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (28, 150, 28)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (29, 150, 29)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (30, 150, 30)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (31, 150, 31)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (32, 150, 32)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (33, 150, 33)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (34, 50, 34)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (35, 150, 35)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (36, 40, 36)
SET IDENTITY_INSERT [dbo].[StockMateriel] OFF
SET IDENTITY_INSERT [dbo].[Tache] ON 

INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (1, N'Couper', 2)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (2, N'Raper', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (3, N'Melanger', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (4, N'Ouvrir', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (5, N'Mixer', 2)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (6, N'Ecraser', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (7, N'Monter', 2)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (8, N'Prendre', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (9, N'Frire', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (10, N'Cuire', 5)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (11, N'Bouillir', 5)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (12, N'Faire', 2)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (13, N'Fondre', 2)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (14, N'Separer', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (15, N'Mettre', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (16, N'Nettoyer', 2)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (17, N'Laver', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (18, N'Apporter', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (19, N'Débarasser', 2)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (20, N'Placer', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (21, N'Accueillir', 2)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (22, N'Répartir', 1)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (23, N'Eplucher', 1)
SET IDENTITY_INSERT [dbo].[Tache] OFF
/****** Object:  Index [Commande_TableRestaurant0_AK]    Script Date: 11/12/2018 17:09:03 ******/
ALTER TABLE [dbo].[commande] ADD  CONSTRAINT [Commande_TableRestaurant0_AK] UNIQUE NONCLUSTERED 
(
	[IDTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[commande]  WITH CHECK ADD  CONSTRAINT [Commande_TableRestaurant0_FK] FOREIGN KEY([IDTable])
REFERENCES [dbo].[tablerestaurant] ([IDTable])
GO
ALTER TABLE [dbo].[commande] CHECK CONSTRAINT [Commande_TableRestaurant0_FK]
GO
ALTER TABLE [dbo].[groupclient]  WITH CHECK ADD  CONSTRAINT [GroupeClient_TableRestaurant_FK] FOREIGN KEY([IDTable])
REFERENCES [dbo].[tablerestaurant] ([IDTable])
GO
ALTER TABLE [dbo].[groupclient] CHECK CONSTRAINT [GroupeClient_TableRestaurant_FK]
GO
ALTER TABLE [dbo].[lignecommande]  WITH CHECK ADD  CONSTRAINT [LigneCommande_Commande1_FK] FOREIGN KEY([NumeroCommande])
REFERENCES [dbo].[commande] ([NumeroCommande])
GO
ALTER TABLE [dbo].[lignecommande] CHECK CONSTRAINT [LigneCommande_Commande1_FK]
GO
ALTER TABLE [dbo].[lignecommande]  WITH CHECK ADD  CONSTRAINT [LigneCommande_Preparation0_FK] FOREIGN KEY([IDPreparation])
REFERENCES [dbo].[preparation] ([IDPreparation])
GO
ALTER TABLE [dbo].[lignecommande] CHECK CONSTRAINT [LigneCommande_Preparation0_FK]
GO
ALTER TABLE [dbo].[necessite]  WITH CHECK ADD  CONSTRAINT [Necessite_Preparation0_FK] FOREIGN KEY([IDPreparation])
REFERENCES [dbo].[preparation] ([IDPreparation])
GO
ALTER TABLE [dbo].[necessite] CHECK CONSTRAINT [Necessite_Preparation0_FK]
GO
ALTER TABLE [dbo].[necessite]  WITH CHECK ADD  CONSTRAINT [Necessite_Tache1_FK] FOREIGN KEY([IDTache])
REFERENCES [dbo].[Tache] ([IDTache])
GO
ALTER TABLE [dbo].[necessite] CHECK CONSTRAINT [Necessite_Tache1_FK]
GO
ALTER TABLE [dbo].[StockCuisine]  WITH CHECK ADD  CONSTRAINT [StockCuisine_Ingredient_FK] FOREIGN KEY([IDIngredient])
REFERENCES [dbo].[Ingredient] ([IDIngredient])
GO
ALTER TABLE [dbo].[StockCuisine] CHECK CONSTRAINT [StockCuisine_Ingredient_FK]
GO
ALTER TABLE [dbo].[StockCuisine]  WITH CHECK ADD  CONSTRAINT [StockCuisine_Preparation0_FK] FOREIGN KEY([IDPreparation])
REFERENCES [dbo].[preparation] ([IDPreparation])
GO
ALTER TABLE [dbo].[StockCuisine] CHECK CONSTRAINT [StockCuisine_Preparation0_FK]
GO
ALTER TABLE [dbo].[StockMateriel]  WITH CHECK ADD  CONSTRAINT [StockMateriel_Materiel_FK] FOREIGN KEY([IDMateriel])
REFERENCES [dbo].[Materiel] ([IDMateriel])
GO
ALTER TABLE [dbo].[StockMateriel] CHECK CONSTRAINT [StockMateriel_Materiel_FK]
GO
ALTER TABLE [dbo].[utilise]  WITH CHECK ADD  CONSTRAINT [Utilise_Materiel0_FK] FOREIGN KEY([IDMateriel])
REFERENCES [dbo].[Materiel] ([IDMateriel])
GO
ALTER TABLE [dbo].[utilise] CHECK CONSTRAINT [Utilise_Materiel0_FK]
GO
ALTER TABLE [dbo].[utilise]  WITH CHECK ADD  CONSTRAINT [Utilise_Tache_FK] FOREIGN KEY([IDTache])
REFERENCES [dbo].[Tache] ([IDTache])
GO
ALTER TABLE [dbo].[utilise] CHECK CONSTRAINT [Utilise_Tache_FK]
GO
USE [master]
GO
ALTER DATABASE [ProgSystem] SET  READ_WRITE 
GO
