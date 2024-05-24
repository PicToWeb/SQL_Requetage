
--TP2

CREATE TABLE ARTICLES(
    ID int PRIMARY KEY,
    REF varchar(60),
    DESIGNATION text,
    PRIX decimal(8,2),
    ID_FOU varchar(60)
);

CREATE TABLE BON(
    ID int PRIMARY KEY,
    NUMERO varchar(100),
    DATE_CMD date,
    DELAI int,
    ID_FOU varchar(60)
);

CREATE TABLE FOURNISSEUR(
    ID int PRIMARY KEY,
    NOM varchar(100)
);

ALTER TABLE BON ADD CONSTRAINT FOREIGN KEY(ID_FOU) REFERENCES FOURNISSEUR(ID);

ALTER TABLE ARTICLES ADD CONSTRAINT FOREIGN KEY(ID_FOU) REFERENCES FOURNISSEUR(ID);

CREATE TABLE COMPO(
    ID int AUTO_INCREMENT PRIMARY KEY,
    QTE int,
    ID_ART int,
    ID_BON int
);

ALTER TABLE COMPO ADD CONSTRAINT FOREIGN KEY(ID_ART) REFERENCES ARTICLES(ID);
ALTER TABLE COMPO ADD CONSTRAINT FOREIGN KEY(ID_BON) REFERENCES BON(ID);


--TP3

INSERT INTO FOURNISSEUR(ID,NOM) values(1,"Française d'Imports");
INSERT INTO FOURNISSEUR(ID,NOM) values(2,"FDM SA");
INSERT INTO FOURNISSEUR(ID,NOM) values(3,"Dubois et Fils");


INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(1,"A01","Perceuse P1",74.99,1);
INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(2,"F01","Boulon laiton 4 x 40 mm (sachet de 10)",2.25,2);
INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(3,"F02","Boulon laiton 5 x 40 mm (sachet de 10)",4.45,2);
INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(4,"D01","Boulon laiton 5 x 40 mm (sachet de 10)",4.40,3);
INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(5,"A02","Meuleuse 125mm",37.85,1);
INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(6,"D03","Boulon acier zingué 4 x 40mm (sachet de 10)",1.8,3);
INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(7,"A03","Perceuse à colonne",185.25,1);
INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(8,"D04","Coffret mêches à bois",12.25,3);
INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(9,"F03","Coffret mêches plates",6.25,2);
INSERT INTO ARTICLES(ID,REF,DESIGNATION,PRIX,ID_FOU) values(10,"F041","Fraises d’encastrement",8.14,2);


INSERT INTO BON(ID,NUMERO,DATE_CMD,DELAI,ID_FOU) values(1,"CMD1","2024-05-24",3,1);

INSERT INTO COMPO(QTE,ID_ART,ID_BON) values(3,1,1);
INSERT INTO COMPO(QTE,ID_ART,ID_BON) values(4,5,1);
INSERT INTO COMPO(QTE,ID_ART,ID_BON) values(1,7,1);

-- TP4


--a 
SELECT * FROM ARTICLES

--b
SELECT A.REF,A.DESIGNATION FROM ARTICLES A WHERE A.PRIX > 2

--c
SELECT * FROM ARTICLES WHERE PRIX >= 2 AND PRIX <=6.25

--d
SELECT * FROM ARTICLES WHERE PRIX BETWEEN 2 AND 6.25

--e
SELECT * FROM ARTICLES WHERE PRIX NOT BETWEEN 2 AND 6.25 AND ID_FOU="1"

--f
SELECT * FROM ARTICLES WHERE ID_FOU="1" ||ID_FOU="3"

--g
SELECT * FROM ARTICLES WHERE ID_FOU IN (1,3)

--h
SELECT * FROM ARTICLES WHERE ID_FOU NOT IN (1,3)

--i
SELECT * FROM BON WHERE DATE_CMD BETWEEN "2019-02-01" AND "2019-04-30"
