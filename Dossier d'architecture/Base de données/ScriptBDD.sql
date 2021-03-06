USE [master]
GO
/****** Object:  Database [ProgSystem]    Script Date: 14/12/2018 15:35:14 ******/
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
/****** Object:  Table [dbo].[commande]    Script Date: 14/12/2018 15:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commande](
	[NumeroCommande] [int] IDENTITY(1,1) NOT NULL,
	[StatutCommande] [int] NOT NULL,
	[IDTable] [int] NOT NULL,
 CONSTRAINT [Commande_PK] PRIMARY KEY CLUSTERED 
(
	[NumeroCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groupclient]    Script Date: 14/12/2018 15:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groupclient](
	[IDGroupe] [int] IDENTITY(1,1) NOT NULL,
	[NombreClient] [int] NOT NULL,
	[IDTable] [int] NULL,
	[Etat] [int] NOT NULL,
 CONSTRAINT [PK__groupcli__6561693D1C08198A] PRIMARY KEY CLUSTERED 
(
	[IDGroupe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 14/12/2018 15:35:15 ******/
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
/****** Object:  Table [dbo].[lignecommande]    Script Date: 14/12/2018 15:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lignecommande](
	[IDPreparation] [int] NOT NULL,
	[NumeroCommande] [int] NOT NULL,
	[CategorieRecette] [int] NOT NULL,
 CONSTRAINT [LigneCommande_PK] PRIMARY KEY CLUSTERED 
(
	[IDPreparation] ASC,
	[NumeroCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materiel]    Script Date: 14/12/2018 15:35:15 ******/
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
/****** Object:  Table [dbo].[necessite]    Script Date: 14/12/2018 15:35:15 ******/
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
/****** Object:  Table [dbo].[preparation]    Script Date: 14/12/2018 15:35:15 ******/
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
/****** Object:  Table [dbo].[SpeedTime]    Script Date: 14/12/2018 15:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpeedTime](
	[ID] [int] NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[Speed] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockCuisine]    Script Date: 14/12/2018 15:35:15 ******/
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
/****** Object:  Table [dbo].[StockMateriel]    Script Date: 14/12/2018 15:35:15 ******/
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
/****** Object:  Table [dbo].[tablerestaurant]    Script Date: 14/12/2018 15:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablerestaurant](
	[IDTable] [int] IDENTITY(1,1) NOT NULL,
	[IDCarre] [int] NOT NULL,
	[IDRang] [int] NOT NULL,
	[NbrPlacesTable] [int] NOT NULL,
	[IDGroup] [int] NULL,
	[EtatTable] [int] NOT NULL,
 CONSTRAINT [TableRestaurant_PK] PRIMARY KEY CLUSTERED 
(
	[IDTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tache]    Script Date: 14/12/2018 15:35:15 ******/
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
/****** Object:  Table [dbo].[utilise]    Script Date: 14/12/2018 15:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[utilise](
	[IDTache] [int] NOT NULL,
	[IDMateriel] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[commande] ON 

INSERT [dbo].[commande] ([NumeroCommande], [StatutCommande], [IDTable]) VALUES (616, 0, 11)
INSERT [dbo].[commande] ([NumeroCommande], [StatutCommande], [IDTable]) VALUES (617, 0, 12)
INSERT [dbo].[commande] ([NumeroCommande], [StatutCommande], [IDTable]) VALUES (618, 0, 13)
SET IDENTITY_INSERT [dbo].[commande] OFF
SET IDENTITY_INSERT [dbo].[groupclient] ON 

INSERT [dbo].[groupclient] ([IDGroupe], [NombreClient], [IDTable], [Etat]) VALUES (19, 4, 11, 5)
INSERT [dbo].[groupclient] ([IDGroupe], [NombreClient], [IDTable], [Etat]) VALUES (20, 4, 12, 5)
INSERT [dbo].[groupclient] ([IDGroupe], [NombreClient], [IDTable], [Etat]) VALUES (21, 4, 13, 5)
SET IDENTITY_INSERT [dbo].[groupclient] OFF
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
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (66, N'C', N'Semoule')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (67, N'F', N'Pain de mie')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (68, N'F', N'Recette')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (69, N'C', N'Eau')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (70, N'C', N'Patates')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (71, N'F', N'Navet')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (72, N'F', N'Poireau')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (73, N'F', N'Blanc d oeuf')
INSERT [dbo].[Ingredient] ([IDIngredient], [Type], [NomIngredient]) VALUES (74, N'F', N'Compote')
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
INSERT [dbo].[lignecommande] ([IDPreparation], [NumeroCommande], [CategorieRecette]) VALUES (10, 616, 2)
INSERT [dbo].[lignecommande] ([IDPreparation], [NumeroCommande], [CategorieRecette]) VALUES (14, 616, 1)
INSERT [dbo].[lignecommande] ([IDPreparation], [NumeroCommande], [CategorieRecette]) VALUES (22, 616, 2)
INSERT [dbo].[lignecommande] ([IDPreparation], [NumeroCommande], [CategorieRecette]) VALUES (23, 616, 1)
INSERT [dbo].[lignecommande] ([IDPreparation], [NumeroCommande], [CategorieRecette]) VALUES (29, 616, 3)
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
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (37, N'Table 2', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (38, N'Table 4', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (39, N'Table 6', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (40, N'Table 8', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (41, N'Table 10', 0, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (42, N'Econome', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (44, N'Micro ondes', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (45, N'Bol', 1, 0)
INSERT [dbo].[Materiel] ([IDMateriel], [NomMateriel], [Type], [EtatMateriel]) VALUES (46, N'Rapiere', 1, 0)
SET IDENTITY_INSERT [dbo].[Materiel] OFF
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (10, 24, N'68', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (1, 1, N'23', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (11, 24, N'5', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (2, 2, N'26', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (25, 13, N'54,19', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (12, 24, N'9', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (3, 1, N'33,36,24,27,30', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (3, 3, N'33,36,24,27,30', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (12, 27, N'10', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (4, 1, N'33,34,24,27,30', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (4, 3, N'33,34,24,27,30', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (13, 27, N'10', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (5, 1, N'37', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (14, 24, N'17,4', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (6, 23, N'25,2', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (6, 2, N'25,2', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (27, 13, N'54', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (6, 3, N'25,2,31,16,38,29', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (15, 27, N'1', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (7, 23, N'24', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (7, 1, N'24,32', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (7, 3, N'66,28,24,32', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 24, N'46,2,21,11', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (8, 4, N'35', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (17, 24, N'20,46', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 23, N'27,24,30', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 1, N'27,32,24,30,39', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 5, N'27,32,24,30,39,67', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 6, N'26', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (9, 3, N'27,32,24,30,39,67,26,40', 5)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (18, 24, N'64,65', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (10, 3, N'41,42,43,44', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (10, 7, N'67', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (10, 3, N'41,26,42,43,44', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (20, 24, N'70,2,71,72', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (25, 10, N'68', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (11, 9, N'45', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (26, 10, N'68', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (28, 10, N'68', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (12, 11, N'69', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (29, 10, N'68', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (12, 3, N'68', 4)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (13, 11, N'69', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 11, N'69', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 23, N'2,21', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 1, N'2,21', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (16, 3, N'68,14,15,16', 5)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (17, 11, N'69', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (19, 23, N'27,24', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (19, 1, N'27,26,24', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (19, 3, N'33,27,26,24', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (20, 23, N'70,2,71,72', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (20, 1, N'70,2,71,72', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (20, 5, N'70,2,71,72', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (22, 23, N'48', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (22, 1, N'48', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (22, 5, N'48', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (23, 23, N'48,49,50,51,52', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (23, 1, N'48,49,50,51,52', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (23, 3, N'48,49,50,51,52', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (25, 3, N'54,19,26,41,55', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (26, 23, N'48', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (26, 1, N'48', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (26, 3, N'56,41,19,48', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (27, 7, N'73', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (27, 3, N'73,15,55', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (28, 7, N'73', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (28, 3, N'15,55,19,41,73', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (29, 23, N'48', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (29, 1, N'48', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (29, 5, N'48', 3)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (30, 7, N'73', 1)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (30, 3, N'15,55,60,73', 2)
INSERT [dbo].[necessite] ([IDPreparation], [IDTache], [IDIngredients], [OrdreTache]) VALUES (30, 3, N'62,61', 3)
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
INSERT [dbo].[SpeedTime] ([ID], [Nom], [Speed]) VALUES (1, N'Reduite', 0.016666)
SET IDENTITY_INSERT [dbo].[StockCuisine] ON 

INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (4, 50, NULL, NULL, 1, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (5, 50, NULL, NULL, 2, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (6, 50, NULL, NULL, 4, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (7, 50, NULL, NULL, 5, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (8, 50, NULL, NULL, 8, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (9, 50, NULL, NULL, 9, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (10, 50, NULL, NULL, 10, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (11, 50, NULL, NULL, 11, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (12, 50, NULL, NULL, 14, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (13, 50, NULL, NULL, 15, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (14, 50, NULL, NULL, 16, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (15, 50, NULL, NULL, 17, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (16, 50, NULL, NULL, 19, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (17, 50, NULL, NULL, 20, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (18, 50, NULL, NULL, 21, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (19, 50, NULL, NULL, 23, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (20, 50, NULL, NULL, 24, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (21, 50, NULL, NULL, 25, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (22, 50, NULL, NULL, 26, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (23, 50, NULL, NULL, 27, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (24, 50, NULL, NULL, 28, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (25, 50, NULL, NULL, 29, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (26, 50, NULL, NULL, 30, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (27, 50, NULL, NULL, 31, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (28, 50, NULL, NULL, 32, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (29, 50, NULL, NULL, 33, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (30, 50, NULL, NULL, 34, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (31, 50, NULL, NULL, 35, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (32, 50, NULL, NULL, 36, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (33, 50, NULL, NULL, 37, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (34, 50, NULL, NULL, 38, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (35, 50, NULL, NULL, 39, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (36, 50, NULL, NULL, 40, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (37, 50, NULL, NULL, 41, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (38, 50, NULL, NULL, 42, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (39, 50, NULL, NULL, 43, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (40, 50, NULL, NULL, 44, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (41, 50, NULL, NULL, 45, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (42, 50, NULL, NULL, 46, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (43, 50, NULL, NULL, 47, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (44, 50, NULL, NULL, 48, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (45, 50, NULL, NULL, 49, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (46, 50, NULL, NULL, 50, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (47, 50, NULL, NULL, 51, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (48, 50, NULL, NULL, 52, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (49, 50, NULL, NULL, 53, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (50, 50, NULL, NULL, 54, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (51, 50, NULL, NULL, 55, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (52, 50, NULL, NULL, 56, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (53, 50, NULL, NULL, 57, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (54, 50, NULL, NULL, 58, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (55, 50, NULL, NULL, 59, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (56, 50, NULL, NULL, 60, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (57, 50, NULL, NULL, 61, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (58, 50, NULL, NULL, 62, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (59, 50, NULL, NULL, 63, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (60, 50, NULL, NULL, 64, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (61, 50, NULL, NULL, 65, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (62, 50, NULL, NULL, 66, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (63, 50, NULL, NULL, 67, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (65, 50, NULL, NULL, 69, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (66, 50, NULL, NULL, 70, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (67, 50, NULL, NULL, 71, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (68, 50, NULL, NULL, 72, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (69, 50, NULL, NULL, 73, NULL)
INSERT [dbo].[StockCuisine] ([IDStock], [QuantiteStock], [DateReception], [DateCreation], [IDIngredient], [IDPreparation]) VALUES (70, 50, NULL, NULL, 74, NULL)
SET IDENTITY_INSERT [dbo].[StockCuisine] OFF
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
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (37, 10, 37)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (38, 10, 38)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (39, 5, 39)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (40, 5, 40)
INSERT [dbo].[StockMateriel] ([IDStockMateriel], [QuantiteMaterielStock], [IDMateriel]) VALUES (41, 2, 41)
SET IDENTITY_INSERT [dbo].[StockMateriel] OFF
SET IDENTITY_INSERT [dbo].[tablerestaurant] ON 

INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (1, 1, 1, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (2, 1, 1, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (3, 1, 1, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (4, 1, 1, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (5, 1, 1, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (6, 1, 1, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (7, 1, 1, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (8, 1, 1, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (9, 1, 2, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (10, 1, 2, 2, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (11, 1, 2, 4, 19, 1)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (12, 1, 2, 4, 20, 1)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (13, 1, 2, 4, 21, 1)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (14, 1, 2, 4, 15, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (15, 1, 2, 4, 16, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (16, 1, 2, 4, 17, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (17, 2, 1, 4, 18, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (18, 2, 1, 4, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (19, 2, 1, 4, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (20, 2, 1, 4, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (21, 2, 1, 6, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (22, 2, 1, 6, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (23, 2, 1, 6, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (24, 2, 1, 6, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (25, 2, 2, 6, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (26, 2, 2, 8, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (27, 2, 2, 8, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (28, 2, 2, 8, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (29, 2, 2, 8, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (30, 2, 2, 8, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (31, 2, 2, 10, NULL, 0)
INSERT [dbo].[tablerestaurant] ([IDTable], [IDCarre], [IDRang], [NbrPlacesTable], [IDGroup], [EtatTable]) VALUES (32, 2, 2, 10, NULL, 0)
SET IDENTITY_INSERT [dbo].[tablerestaurant] OFF
SET IDENTITY_INSERT [dbo].[Tache] ON 

INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (1, N'Couper', 120)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (2, N'Raper', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (3, N'Melanger', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (4, N'Ouvrir', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (5, N'Mixer', 120)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (6, N'Ecraser', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (7, N'Monter', 120)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (9, N'Frire', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (10, N'Cuire four', 600)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (11, N'Bouillir', 300)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (13, N'Fondre', 120)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (14, N'Separer', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (16, N'Nettoyer', 120)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (17, N'Laver', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (23, N'Eplucher', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (24, N'Cuire poele', 300)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (27, N'Cuire casserole', 300)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (28, N'Place group', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (29, N'Bring card', 60)
INSERT [dbo].[Tache] ([IDTache], [NomTache], [DureeTache]) VALUES (30, N'Choose menu', 300)
SET IDENTITY_INSERT [dbo].[Tache] OFF
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (1, 12)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (2, 46)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (3, 5)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (4, 12)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (5, 6)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (6, 16)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (7, 18)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (9, 14)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (10, 14)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (11, 2)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (11, 1)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (13, 44)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (14, 45)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (16, 22)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (17, 21)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (17, 20)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (23, 42)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (24, 1)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (24, 3)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (27, 1)
INSERT [dbo].[utilise] ([IDTache], [IDMateriel]) VALUES (27, 2)
/****** Object:  Index [Commande_TableRestaurant0_AK]    Script Date: 14/12/2018 15:35:15 ******/
CREATE NONCLUSTERED INDEX [Commande_TableRestaurant0_AK] ON [dbo].[commande]
(
	[IDTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[commande] ADD  CONSTRAINT [DF_commande_StatutCommande]  DEFAULT ((0)) FOR [StatutCommande]
GO
ALTER TABLE [dbo].[groupclient] ADD  CONSTRAINT [DF_groupclient_Etat]  DEFAULT ((0)) FOR [Etat]
GO
ALTER TABLE [dbo].[tablerestaurant] ADD  CONSTRAINT [DF_tablerestaurant_EtatTable]  DEFAULT ((0)) FOR [EtatTable]
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
