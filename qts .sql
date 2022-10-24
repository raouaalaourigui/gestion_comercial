# 1
SELECT * 
FROM `client`;
# 2
SELECT * 
FROM `produit`;
# 3
SELECT `numClient` as `Numero client`,`villeClient` as `Ville client`
FROM `client`;
# 4
SELECT `numClient` as `Numero`,`raisonSocial` as `Raison Social`, `telephone`
FROM `client`;
# 5
SELECT *
FROM `client`
WHERE `numClient` = 15;
# 6
SELECT * 
FROM `client` 
ORDER BY `raisonSocial` DESC;
#7
SELECT * 
FROM `client`
ORDER BY `raisonSocial` DESC,`villeClient` ASC;
# 8
SELECT * 
FROM `client` 
WHERE `raisonSocial` LIKE 'S%';
# 9
SELECT * 
FROM `client` 
WHERE `raisonSocial` LIKE '%E';
# 10
SELECT * 
FROM `client` 
WHERE `raisonSocial` LIKE 'A%E';
# 11
SELECT * 
FROM `client` 
WHERE `raisonSocial` LIKE 'A%'
OR `raisonSocial` LIKE '%E';
# 12
SELECT *
FROM `client`
WHERE `villeClient` IN ('Casablanca','Ouarzazate','Rabat');
# 13
SELECT *
FROM `produit`
WHERE `prixUnitaire` = 300;
# 14
SELECT *
FROM `produit`
WHERE `prixUnitaire` < 300;
# 15
SELECT *
FROM `produit`
WHERE `prixUnitaire` BETWEEN 300 AND 5000;
#--16
SELECT * 
FROM `produit` 
WHERE `disponible` IS true
#-- 17
SELECT * 
FROM `produit` 
WHERE `disponible` IS NOT true
AND `prixUnitaire` > 300;
#-- 18
SELECT *
FROM `commande`
WHERE `dateCommande` = date('2016-01-11');
#-- 19
SELECT * 
FROM `commande` 
WHERE `dateCommande` > date('2016-01-11');
#-- 20
#01/02/2016 et 31/03/2016.
SELECT *
FROM `commande`
WHERE `dateCommande` BETWEEN date('2021-01-01') AND date('2021-12-31');
#--21
SELECT *
FROM `commande`
WHERE `dateCommande` = CURDATE();
#-- 22
SELECT *
FROM `commande`
WHERE year(`dateCommande`) = year(curdate());
#-- 23
SELECT *
FROM `commande`
WHERE month(`dateCommande`) = month('0000-07-00');
#-- 24
SELECT `nomProduit` as `Produit`, (`prixUnitaire`*`qteStockee`) as `prix totale`
FROM `produit`;
#--25
SELECT `nomProduit` as `Produit`, ((`prixUnitaire`*0.2) + `prixUnitaire`) as `Prix TTC`
FROM `produit`;
#-- 26
SELECT DISTINCT `villeClient` 
FROM `client`;
#-- 27
SELECT DISTINCT cl.*
FROM `client` cl
JOIN `commande` co
ON cl.numClient = co.numClient
#-- 28
SELECT DISTINCT p.* 
FROM `produit` p
JOIN `details_commande` d
ON p.refProduit = d.refProduit
JOIN `commande` c
ON c.numCommande = d.numCommande
#-- 29
SELECT co.*
FROM `commande` co
JOIN `client` cl
ON co.numClient = cl.numClient
WHERE cl.numClient = 15;
#-- 30
SELECT p.*
FROM `produit` p
JOIN `details_commande` d
ON p.refProduit = d.refProduit
JOIN `commande` co 
ON d.numCommande = co.numCommande
WHERE co.numCommande = 5;
#-- 31
SELECT p.*,co.dateCommande
FROM `produit` p 
JOIN `details_commande` d
ON p.refProduit = d.refProduit
JOIN `commande` co
ON co.numCommande = d.numCommande
WHERE co.dateCommande = date('2020-09-19');
#-- 32
SELECT p.nomProduit
FROM `produit` p
JOIN `details_commande` d
ON p.refProduit = d.refProduit
JOIN `commande` co
ON co.numCommande = d.numCommande
JOIN `client` cl
ON cl.numClient = co.numClient
WHERE cl.villeClient = 'Madrid' 
#-- 33
