-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 05 déc. 2018 à 16:16
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetprog`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `NumeroCommande` Int  Auto_increment  NOT NULL ,
        `StatutCommande` Bool NOT NULL ,
        `IDTable`        Int NOT NULL
	,CONSTRAINT `Commande_PK` PRIMARY KEY (`NumeroCommande`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `groupclient`
--

CREATE TABLE IF NOT EXISTS `groupclient` (
  `IDGroupe` int(11) NOT NULL AUTO_INCREMENT,
  `NombreClient` int(11) NOT NULL,
  PRIMARY KEY (`IDGroupe`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE IF NOT EXISTS `ingredient` (
  `IDIngredient`  Int  Auto_increment  NOT NULL ,
        `Type`          Varchar (15) NOT NULL ,
        `NomIngredient` Varchar (50) NOT NULL ,
        `QuantiteStock` Int NOT NULL ,
        `DateReception` Datetime NOT NULL ,
        `IDStock`       Int NOT NULL
	,CONSTRAINT `Ingredient_PK` PRIMARY KEY (`IDIngredient`)
)ENGINE=InnoDB;
-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE IF NOT EXISTS `lignecommande` (
  `IDPrepation`      Int NOT NULL ,
        `NumeroCommande`   Int NOT NULL ,
        `QuantiteRecette`  Int NOT NULL ,
        `NomRecette`       Varchar (50) NOT NULL ,
        `CategorieRecette` Int NOT NULL
	,CONSTRAINT `LigneCommande_PK` PRIMARY KEY (`IDPrepation`,`NumeroCommande`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE IF NOT EXISTS `materiel` (
  `IDMateriel`            Int  Auto_increment  NOT NULL ,
        `NomMateriel`           Varchar (50) NOT NULL ,
        `Type`                  Int NOT NULL ,
        `EtatMateriel`          Bool NOT NULL ,
        QuantiteMaterielStock Int NOT NULL ,
        IDStockMateriel       Int NOT NULL
	,CONSTRAINT Materiel_PK PRIMARY KEY (IDMateriel)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `necessite`
--

CREATE TABLE IF NOT EXISTS `necessite` (
  `IDPrepation` Int NOT NULL ,
        `IDTache`     Int NOT NULL ,
        `OrdreTache`  Int NOT NULL
	,CONSTRAINT `Necessite_PK` PRIMARY KEY (`IDPrepation`,`IDTache`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `necessite2`
--

CREATE TABLE IF NOT EXISTS `necessite2` (
  `IDTache`            Int NOT NULL ,
        `IDIngredient`       Int NOT NULL ,
        `QuantiteIngredient` Int NOT NULL
	,CONSTRAINT `Necessite2_PK` PRIMARY KEY (`IDTache`,`IDIngredient`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `personnels`
--

CREATE TABLE IF NOT EXISTS `personnels` (
  `IDPersonnel` Int  Auto_increment  NOT NULL ,
        `Poste`       Varchar (50) NOT NULL
	,CONSTRAINT `Personnels_PK` PRIMARY KEY (`IDPersonnel`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `preparation`
--

CREATE TABLE IF NOT EXISTS `preparation` (
  `IDPrepation`  Int  Auto_increment  NOT NULL ,
        `DateCreation` Int NOT NULL ,
        `IDStock`     Int NOT NULL
	,CONSTRAINT `Preparation_PK` PRIMARY KEY (`IDPrepation`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `stockcuisine`
--

CREATE TABLE IF NOT EXISTS `stockcuisine` (
  `IDStock` Int  Auto_increment  NOT NULL
	,CONSTRAINT `StockCuisine_PK` PRIMARY KEY (`IDStock`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `stockmateriel`
--

CREATE TABLE IF NOT EXISTS `stockmateriel` (
  `IDStockMateriel` Int  Auto_increment  NOT NULL
	,CONSTRAINT `StockMateriel_PK` PRIMARY KEY (`IDStockMateriel`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `tablerestaurant`
--

CREATE TABLE IF NOT EXISTS `tablerestaurant` (
  IDTable        Int  Auto_increment  NOT NULL ,
        IDCarre        Int NOT NULL ,
        IDRang         Int NOT NULL ,
        NbrPlacesTable Int NOT NULL ,
        EtatTable      Int NOT NULL ,
        NumeroCommande Int NOT NULL ,
        IdGroupe       Int NOT NULL
	,CONSTRAINT TableRestaurant_PK PRIMARY KEY (IDTable)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE IF NOT EXISTS `tache` (
  `IDTache`     Int  Auto_increment  NOT NULL ,
        `NomTache`    Varchar (50) NOT NULL ,
        `DureeTache`  Int NOT NULL ,
        `IDPersonnel` Int NOT NULL
	,CONSTRAINT `Tache_PK` PRIMARY KEY (`IDTache`)
)ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Structure de la table `utilise`
--

CREATE TABLE IF NOT EXISTS `utilise` (
		`IDTache`	Int NOT NULL ,
        `IDMateriel`       Int NOT NULL ,
        `QuantiteMateriel` Int NOT NULL
	,CONSTRAINT `Utilise_PK` PRIMARY KEY (`IDTache`,`IDMateriel`)
)ENGINE=InnoDB;



-- --------------------------------------------------------

ALTER TABLE Materiel
	ADD CONSTRAINT Materiel_StockMateriel_FK
	FOREIGN KEY (IDStockMateriel)
	REFERENCES StockMateriel(IDStockMateriel);
	
ALTER TABLE Necessite2
	ADD CONSTRAINT Necessite2_Tache_FK
	FOREIGN KEY (IDTache)
	REFERENCES Tache(IDTache);
	
ALTER TABLE Necessite2
	ADD CONSTRAINT Necessite2_Ingredient0_FK
	FOREIGN KEY (IDIngredient)
	REFERENCES Ingredient(IDIngredient);
	
	
ALTER TABLE tache
	ADD CONSTRAINT Tache_Personnels_FK
	FOREIGN KEY (IDPersonnel)
	REFERENCES Personnels(IDPersonnel);

ALTER TABLE tache
	ADD CONSTRAINT Tache_Personnels_AK
	UNIQUE (IDPersonnel)
	
ALTER TABLE Preparation
	ADD CONSTRAINT Preparation_StockCuisine0_FK
	FOREIGN KEY (IDStock)
	REFERENCES StockCuisine(IDStock);
	
ALTER TABLE utilise
	ADD CONSTRAINT Utilise_Tache_FK
	FOREIGN KEY (IDTache)
	REFERENCES Tache(IDTache);

ALTER TABLE utilise
	ADD CONSTRAINT Utilise_Materiel0_FK
	FOREIGN KEY (IDMateriel)
	REFERENCES Materiel(IDMateriel);
	
ALTER TABLE Necessite
	ADD CONSTRAINT Necessite_Preparation0_FK
	FOREIGN KEY (IDPrepation)
	REFERENCES Preparation(IDPrepation);

ALTER TABLE Necessite
	ADD CONSTRAINT Necessite_Tache1_FK
	FOREIGN KEY (IDTache)
	REFERENCES Tache(IDTache);

ALTER TABLE Ingredient
	ADD CONSTRAINT Ingredient_StockCuisine_FK
	FOREIGN KEY (IDStock)
	REFERENCES StockCuisine(IDStock);
	
ALTER TABLE Commande
	ADD CONSTRAINT Commande_TableRestaurant0_FK
	FOREIGN KEY (IDTable)
	REFERENCES TableRestaurant(IDTable);

ALTER TABLE Commande 
	ADD CONSTRAINT Commande_TableRestaurant0_AK 
	UNIQUE (IDTable);

ALTER TABLE TableRestaurant
	ADD CONSTRAINT TableRestaurant_Commande0_FK
	FOREIGN KEY (NumeroCommande)
	REFERENCES Commande(NumeroCommande);

ALTER TABLE TableRestaurant
	ADD CONSTRAINT TableRestaurant_GroupeClient1_FK
	FOREIGN KEY (IdGroupe)
	REFERENCES GroupeClient(IdGroupe);

ALTER TABLE TableRestaurant 
	ADD CONSTRAINT TableRestaurant_Commande0_AK 
	UNIQUE (NumeroCommande);

ALTER TABLE LigneCommande
	ADD CONSTRAINT LigneCommande_Preparation0_FK
	FOREIGN KEY (IDPrepation)
	REFERENCES Preparation(IDPrepation);

ALTER TABLE LigneCommande
	ADD CONSTRAINT LigneCommande_Commande1_FK
	FOREIGN KEY (NumeroCommande)
	REFERENCES Commande(NumeroCommande);
	
	
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
