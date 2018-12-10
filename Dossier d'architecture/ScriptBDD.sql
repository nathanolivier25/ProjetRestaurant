USE [master]
GO
/****** Object:  Database [ProgSystem]    Script Date: 10/12/2018 16:30:58 ******/
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
/****** Object:  Table [dbo].[commande]    Script Date: 10/12/2018 16:30:58 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Commande_TableRestaurant0_AK] UNIQUE NONCLUSTERED 
(
	[IDTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groupclient]    Script Date: 10/12/2018 16:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groupclient](
	[IDGroupe] [int] IDENTITY(1,1) NOT NULL,
	[NombreClient] [int] NOT NULL,
	[EtatClient] [int] NOT NULL,
 CONSTRAINT [PK__groupcli__6561693D1C08198A] PRIMARY KEY CLUSTERED 
(
	[IDGroupe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 10/12/2018 16:30:58 ******/
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
/****** Object:  Table [dbo].[lignecommande]    Script Date: 10/12/2018 16:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lignecommande](
	[IDPrepation] [int] NOT NULL,
	[NumeroCommande] [int] NOT NULL,
	[QuantiteRecette] [int] NOT NULL,
	[NomRecette] [varchar](50) NOT NULL,
	[CategorieRecette] [int] NOT NULL,
 CONSTRAINT [LigneCommande_PK] PRIMARY KEY CLUSTERED 
(
	[IDPrepation] ASC,
	[NumeroCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materiel]    Script Date: 10/12/2018 16:30:58 ******/
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
/****** Object:  Table [dbo].[necessite]    Script Date: 10/12/2018 16:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[necessite](
	[IDPrepation] [int] NOT NULL,
	[IDTache] [int] NOT NULL,
	[OrdreTache] [int] NOT NULL,
 CONSTRAINT [Necessite_PK] PRIMARY KEY CLUSTERED 
(
	[IDPrepation] ASC,
	[IDTache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[necessite2]    Script Date: 10/12/2018 16:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[necessite2](
	[IDTache] [int] NOT NULL,
	[IDIngredient] [int] NOT NULL,
	[QuantiteIngredient] [int] NOT NULL,
 CONSTRAINT [Necessite2_PK] PRIMARY KEY CLUSTERED 
(
	[IDTache] ASC,
	[IDIngredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personnels]    Script Date: 10/12/2018 16:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnels](
	[IDPersonnel] [int] IDENTITY(1,1) NOT NULL,
	[Poste] [varchar](50) NOT NULL,
 CONSTRAINT [Personnels_PK] PRIMARY KEY CLUSTERED 
(
	[IDPersonnel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preparation]    Script Date: 10/12/2018 16:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preparation](
	[IDPrepation] [int] IDENTITY(1,1) NOT NULL,
	[DateCreation] [int] NOT NULL,
	[IDStock] [int] NOT NULL,
 CONSTRAINT [Preparation_PK] PRIMARY KEY CLUSTERED 
(
	[IDPrepation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockCuisine]    Script Date: 10/12/2018 16:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockCuisine](
	[IDStock] [int] IDENTITY(1,1) NOT NULL,
	[QuantiteStock] [int] NOT NULL,
	[DateReception] [datetime2](0) NOT NULL,
	[IDIngredient] [int] NOT NULL,
 CONSTRAINT [StockCuisine_PK] PRIMARY KEY CLUSTERED 
(
	[IDStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockMateriel]    Script Date: 10/12/2018 16:30:58 ******/
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
/****** Object:  Table [dbo].[tablerestaurant]    Script Date: 10/12/2018 16:30:58 ******/
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
	[NumeroCommande] [int] NOT NULL,
	[IdGroupe] [int] NOT NULL,
 CONSTRAINT [TableRestaurant_PK] PRIMARY KEY CLUSTERED 
(
	[IDTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [TableRestaurant_Commande0_AK] UNIQUE NONCLUSTERED 
(
	[NumeroCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tache]    Script Date: 10/12/2018 16:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tache](
	[IDTache] [int] IDENTITY(1,1) NOT NULL,
	[NomTache] [varchar](50) NOT NULL,
	[DureeTache] [int] NOT NULL,
	[IDPersonnel] [int] NULL,
 CONSTRAINT [Tache_PK] PRIMARY KEY CLUSTERED 
(
	[IDTache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Tache_Personnels_AK] UNIQUE NONCLUSTERED 
(
	[IDPersonnel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[utilise]    Script Date: 10/12/2018 16:30:58 ******/
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
ALTER TABLE [dbo].[commande]  WITH CHECK ADD  CONSTRAINT [Commande_TableRestaurant0_FK] FOREIGN KEY([IDTable])
REFERENCES [dbo].[tablerestaurant] ([IDTable])
GO
ALTER TABLE [dbo].[commande] CHECK CONSTRAINT [Commande_TableRestaurant0_FK]
GO
ALTER TABLE [dbo].[lignecommande]  WITH CHECK ADD  CONSTRAINT [LigneCommande_Commande1_FK] FOREIGN KEY([NumeroCommande])
REFERENCES [dbo].[commande] ([NumeroCommande])
GO
ALTER TABLE [dbo].[lignecommande] CHECK CONSTRAINT [LigneCommande_Commande1_FK]
GO
ALTER TABLE [dbo].[lignecommande]  WITH CHECK ADD  CONSTRAINT [LigneCommande_Preparation0_FK] FOREIGN KEY([IDPrepation])
REFERENCES [dbo].[preparation] ([IDPrepation])
GO
ALTER TABLE [dbo].[lignecommande] CHECK CONSTRAINT [LigneCommande_Preparation0_FK]
GO
ALTER TABLE [dbo].[necessite]  WITH CHECK ADD  CONSTRAINT [Necessite_Preparation0_FK] FOREIGN KEY([IDPrepation])
REFERENCES [dbo].[preparation] ([IDPrepation])
GO
ALTER TABLE [dbo].[necessite] CHECK CONSTRAINT [Necessite_Preparation0_FK]
GO
ALTER TABLE [dbo].[necessite]  WITH CHECK ADD  CONSTRAINT [Necessite_Tache1_FK] FOREIGN KEY([IDTache])
REFERENCES [dbo].[Tache] ([IDTache])
GO
ALTER TABLE [dbo].[necessite] CHECK CONSTRAINT [Necessite_Tache1_FK]
GO
ALTER TABLE [dbo].[necessite2]  WITH CHECK ADD  CONSTRAINT [Necessite2_Ingredient0_FK] FOREIGN KEY([IDIngredient])
REFERENCES [dbo].[Ingredient] ([IDIngredient])
GO
ALTER TABLE [dbo].[necessite2] CHECK CONSTRAINT [Necessite2_Ingredient0_FK]
GO
ALTER TABLE [dbo].[necessite2]  WITH CHECK ADD  CONSTRAINT [Necessite2_Tache_FK] FOREIGN KEY([IDTache])
REFERENCES [dbo].[Tache] ([IDTache])
GO
ALTER TABLE [dbo].[necessite2] CHECK CONSTRAINT [Necessite2_Tache_FK]
GO
ALTER TABLE [dbo].[preparation]  WITH CHECK ADD  CONSTRAINT [Preparation_StockCuisine0_FK] FOREIGN KEY([IDStock])
REFERENCES [dbo].[StockCuisine] ([IDStock])
GO
ALTER TABLE [dbo].[preparation] CHECK CONSTRAINT [Preparation_StockCuisine0_FK]
GO
ALTER TABLE [dbo].[StockCuisine]  WITH CHECK ADD  CONSTRAINT [StockCuisine_Ingredient_FK] FOREIGN KEY([IDIngredient])
REFERENCES [dbo].[Ingredient] ([IDIngredient])
GO
ALTER TABLE [dbo].[StockCuisine] CHECK CONSTRAINT [StockCuisine_Ingredient_FK]
GO
ALTER TABLE [dbo].[StockMateriel]  WITH CHECK ADD  CONSTRAINT [StockMateriel_Materiel_FK] FOREIGN KEY([IDMateriel])
REFERENCES [dbo].[Materiel] ([IDMateriel])
GO
ALTER TABLE [dbo].[StockMateriel] CHECK CONSTRAINT [StockMateriel_Materiel_FK]
GO
ALTER TABLE [dbo].[tablerestaurant]  WITH CHECK ADD  CONSTRAINT [TableRestaurant_Commande0_FK] FOREIGN KEY([NumeroCommande])
REFERENCES [dbo].[commande] ([NumeroCommande])
GO
ALTER TABLE [dbo].[tablerestaurant] CHECK CONSTRAINT [TableRestaurant_Commande0_FK]
GO
ALTER TABLE [dbo].[tablerestaurant]  WITH CHECK ADD  CONSTRAINT [TableRestaurant_GroupClient1_FK] FOREIGN KEY([IdGroupe])
REFERENCES [dbo].[groupclient] ([IDGroupe])
GO
ALTER TABLE [dbo].[tablerestaurant] CHECK CONSTRAINT [TableRestaurant_GroupClient1_FK]
GO
ALTER TABLE [dbo].[Tache]  WITH CHECK ADD  CONSTRAINT [Tache_Personnels_FK] FOREIGN KEY([IDPersonnel])
REFERENCES [dbo].[personnels] ([IDPersonnel])
GO
ALTER TABLE [dbo].[Tache] CHECK CONSTRAINT [Tache_Personnels_FK]
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
