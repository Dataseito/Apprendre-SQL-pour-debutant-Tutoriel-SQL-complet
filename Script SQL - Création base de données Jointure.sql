-- Création d'une base de données [Jointure]
CREATE DATABASE [Jointure]
GO

-- Sélection de la base de données [Jointure]
USE [Jointure]
GO

-- Création d'une table nommée [TableA]
CREATE TABLE [dbo].[TableA](
	[TableA_ID] [tinyint] NULL
) ON [PRIMARY]
GO

-- Insertion de données dans la table [TableA]
INSERT INTO [dbo].[TableA]
VALUES
('1'),('2'),('3'),('50'),('70'), (NULL)
GO

-- Création d'une table nommée [TableB]
CREATE TABLE [dbo].[TableB](
	[TableB_ID] [tinyint] NULL
) ON [PRIMARY]
GO

-- Insertion de données dans la table [TableB]
INSERT INTO [dbo].[TableB]
VALUES
('1'),('2'),('3'),('40'),('60')
GO

-- Création d'une table nommée [TableC]
CREATE TABLE [dbo].[TableC](
	[ID] [tinyint] NULL,
	[Prenom] varchar(50) NULL
) ON [PRIMARY]
GO

-- Insertion de données dans la table [TableC]
INSERT INTO [dbo].[TableC]
VALUES
('1','Victor'),('2','Marie'),('3','Pierre'),('4','Esther')
GO

-- Création d'une table nommée [TableD]
CREATE TABLE [dbo].[TableD](
	[ID] [tinyint] NULL,
	[Prenom] varchar(50) NULL
) ON [PRIMARY]
GO

-- Insertion de données dans la table [TableD]
INSERT INTO [dbo].[TableD]
VALUES
('4','Esther'),('5','Jonathan'),('6','Lucie')
GO

-- Sélection des enregistrements de la table [TableA]
SELECT [TableA_ID]
  FROM [dbo].[TableA]
GO

-- Sélection des enregistrements de la table [TableB]
SELECT [TableB_ID]
  FROM [dbo].[TableB]
GO

-- Sélection des enregistrements de la table [TableC]
SELECT [ID], [Prenom]
  FROM [dbo].[TableC]
GO

-- Sélection des enregistrements de la table [TableD]
SELECT [ID], [Prenom]
  FROM [dbo].[TableD]
GO