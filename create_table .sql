CREATE TABLE client (
    numClient INT(11)  AUTO_INCREMENT ,
    raisonSocial VARCHAR(10) NOT NULL,
    adresseClient VARCHAR(50) NOT NULL,
    villeClient VARCHAR(20) NOT NULL,
    telephone VARCHAR(15) UNIQUE NOT NULL,
    PRIMARY KEY(numClient)
);

CREATE TABLE commande(
    numCommande INT(11) AUTO_INCREMENT, 
    numClient INT(11) NOT NULL,
    dateCommande DATE NOT NULL,
    CONSTRAINT fk_num_client FOREIGN KEY(numClient) REFERENCES client(numClient),
    PRIMARY KEY(numCommande)
);

CREATE TABLE produit(
    refProduit VARCHAR(20) PRIMARY KEY,
    nomProduit VARCHAR(20) NOT NULL,
    prixUnitaire FLOAT(4) NOT NULL,
    qteStockee INT(11) NOT NULL,
    disponible BOOLEAN NOT NULL,
    CONSTRAINT ck_qte CHECK (qteStockee >= 0)
);

CREATE TABLE details_commande(
    numCommande INT(11),
    refProduit VARCHAR(20),
    qteCommandee INT(11) NOT NULL,
    CONSTRAINT fk_num_commande FOREIGN KEY(numCommande) REFERENCES commande(numCommande),
    CONSTRAINT fk_ref_produit FOREIGN KEY(refProduit) REFERENCES produit(refProduit),
    CONSTRAINT ck_qte_cmd CHECK (qteCommandee >= 1),
    PRIMARY KEY(numCommande,refProduit)

);