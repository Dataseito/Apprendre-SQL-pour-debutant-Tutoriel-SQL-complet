/*
Dataseito - Les bases de SQL pour débutant - Exercice  
*/



---------------------------------------------------------------------------- LES COMMANDES DE BASE ------------------------------------------------------------------------



-- Sélectionner toutes les données présentes dans la table Vente
SELECT * 
FROM [dbo].[Vente]


-- Sélectionner la colonne VenteID de la table Vente
SELECT [VenteID]
FROM [dbo].[Vente]


-- Sélectionner les colonnes VenteID et ClientID de la table Vente
SELECT [VenteID], [ClientID], [QuantitesVendues]
FROM [dbo].[Vente]


-- Limiter le nombre de résultats retournés par la requête précédente à 3 
SELECT TOP(3) [VenteID], [ClientID], [QuantitesVendues]
FROM [dbo].[Vente] 


-- Sélectionner toutes les ventes relatives au CLIENT_1
SELECT [VenteID], [ClientID], [VentesEuro]
FROM [dbo].[Vente]
WHERE [ClientID] = 'CLIENT_1'


-- Sélectionner toutes les ventes non relatives au CLIENT_1
SELECT [VenteID], [ClientID], [VentesEuro]
FROM [dbo].[Vente]
WHERE [ClientID] <> 'CLIENT_1'


-- Sélectionner toutes les ventes du produit PROD_1 relatives au CLIENT_1 
SELECT [VenteID], [ClientID], [ProduitID], [VentesEuro]
FROM [dbo].[Vente] 
WHERE [ProduitID] = 'PROD_1' AND [ClientID] = 'CLIENT_1' 


-- Sélectionner toutes les ventes relatives au CLIENT_1 ou au CLIENT_2
SELECT [VenteID], [ClientID], [VentesEuro]
FROM [dbo].[Vente]
WHERE [ClientID] = 'CLIENT_1' OR [ClientID] = 'CLIENT_2'


-- Sélectionner toutes les ventes relatives au CLIENT_1, au CLIENT_2 ou au CLIENT_3
SELECT [VenteID], [ClientID], [VentesEuro]
FROM [dbo].[Vente]
WHERE [ClientID] IN ('CLIENT_1','CLIENT_2','CLIENT_3')


-- Sélectionner toutes les ventes qui ne sont pas relatives au CLIENT_1, au CLIENT_2 ou au CLIENT_3
SELECT [VenteID], [ClientID], [VentesEuro]
FROM [dbo].[Vente]
WHERE [ClientID] NOT IN ('CLIENT_1','CLIENT_2','CLIENT_3')


-- Sélectionner toutes les ventes ID qui commencent par 10
SELECT [VenteID], [ClientID], [VentesEuro]
FROM [dbo].[Vente]
WHERE [VenteID] LIKE '10%'


-- Sélectionner toutes les ventes qui finissent par 10
SELECT [VenteID], [ClientID], [VentesEuro]
FROM [dbo].[Vente]
WHERE [VenteID] LIKE '%10'


-- Sélectionner toutes les ventes qui contiennent 10
SELECT [VenteID], [ClientID], [VentesEuro]
FROM [dbo].[Vente]
WHERE [VenteID] LIKE '%10%'


-- Sélectionner toutes les ventes du produit PROD_1 relatives au CLIENT_1 triées par le montant des ventes de manière décroissante
SELECT [VenteID], [ClientID], [VentesEuro]
FROM [dbo].[Vente]
ORDER BY [VentesEuro] DESC


-- Sélectionner la liste des clients uniques
SELECT DISTINCT [ClientID]
FROM [dbo].[Vente] 



---------------------------------------------------------------------------- LES AGRÉGATIONS ------------------------------------------------------------------------



-- Compter le nombre d'enregistrement de la table Vente
SELECT COUNT(*)
FROM [dbo].[Vente] 


-- Calculer le total des ventes pour chaque client dans une colonne TotalCA
SELECT [ClientID], SUM([VentesEuro]) AS [TotalCA]
FROM [dbo].[Vente]
GROUP BY [ClientID]
ORDER BY [TotalCA] DESC

-- Calculer le total des ventes pour chaque client et produit
SELECT [ClientID], [ProduitID], SUM([VentesEuro]) AS [TotalCA]
FROM [dbo].[Vente]
GROUP BY [ClientID], [ProduitID]
ORDER BY [ClientID], [ProduitID] ASC


-- Calculer le montant moyen des ventes pour chaque client
SELECT [ClientID], AVG([VentesEuro]) AS [PanierMoyen]
FROM [dbo].[Vente]
GROUP BY [ClientID]
ORDER BY [PanierMoyen] DESC


-- Calculer le nombre de ventes pour chaque client
SELECT [ClientID], COUNT([VenteID]) AS [NbVentes]
FROM [dbo].[Vente]
GROUP BY [ClientID]
ORDER BY [NbVentes] DESC


-- Sélectionner la vente la plus élevée pour chaque client 
SELECT [ClientID], MAX([VentesEuro]) AS [VenteMax]
FROM [dbo].[Vente]
GROUP BY [ClientID]
ORDER BY [VenteMax] DESC

-- Sélectionner la vente la plus faible pour chaque client 
SELECT [ClientID], MIN([VentesEuro]) AS [VenteMin]
FROM [dbo].[Vente]
GROUP BY [ClientID]
ORDER BY [VenteMin] ASC


-- Calculer le total des ventes par client pour les clients ayant un chiffre d'affaire supérieur à 1 000 000 €
SELECT [ClientID], SUM([VentesEuro]) AS [TotalCA]
FROM [dbo].[Vente]
GROUP BY [ClientID]
HAVING SUM([VentesEuro]) > 1000000 



---------------------------------------------------------------------------- LES JOINTURES ------------------------------------------------------------------------



-- Se positionner sur la base de données [Jointure]
USE [Jointure]


-- Faire une jointure de type LEFT JOIN
SELECT [TableA_ID], [TableB_ID]
FROM [dbo].[TableA]
LEFT JOIN [dbo].[TableB] ON [dbo].[TableA].[TableA_ID] = [dbo].[TableB].[TableB_ID]


-- Faire une jointure de type RIGHT JOIN
SELECT [TableA_ID], [TableB_ID]
FROM [dbo].[TableA]
RIGHT JOIN [dbo].[TableB] ON [dbo].[TableA].[TableA_ID] = [dbo].[TableB].[TableB_ID]


-- Faire une jointure de type INNER JOIN
SELECT [TableA_ID], [TableB_ID]
FROM [dbo].[TableA]
INNER JOIN [dbo].[TableB] ON [dbo].[TableA].[TableA_ID] = [dbo].[TableB].[TableB_ID]


-- Faire une jointure de type OUTER JOIN
SELECT [TableA_ID], [TableB_ID]
FROM [dbo].[TableA]
FULL OUTER JOIN [dbo].[TableB] ON [dbo].[TableA].[TableA_ID] = [dbo].[TableB].[TableB_ID]


-- Faire une jointure de type CROSS JOIN
SELECT [TableA_ID], [TableB_ID]
FROM [dbo].[TableA]
CROSS JOIN [dbo].[TableB]


-- Se positionner sur la base de données [MonEntreprise]
USE [MonEntreprise]


-- Récupérer les noms des clients dans la table Client avec le montant des ventes liées
SELECT [dbo].[Vente].[ClientID], [dbo].[Client].[ClientID], [dbo].[Client].[ClientNom], [dbo].[Vente].[VentesEuro]
FROM [dbo].[Client]
LEFT JOIN [dbo].[Vente] ON [dbo].[Vente].[ClientID] = [dbo].[Client].[ClientID]


-- Se positionner sur la base de données [Jointure] à l'aide du langage SQL
USE [Jointure]


-- Concaténer les enregistrements des tables "TableC" et "TableD" et suppression des doublons avec UNION 
SELECT [ID], [Prenom]
FROM [dbo].[TableC]
UNION 
SELECT [ID], [Prenom]
FROM [dbo].[TableD]


-- Concaténer les enregistrements des tables "TableC" et "TableD" avec UNION ALL
SELECT [ID], [Prenom]
FROM [dbo].[TableC]
UNION ALL
SELECT [ID], [Prenom]
FROM [dbo].[TableD]


/*
 Bravo, vous êtes arrivé au bout :)
*/


