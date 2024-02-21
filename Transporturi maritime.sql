--PENTRU A PUTEA STERGE AUTOMAT INCERCARI ESUATE ALE SCRIPTULUI

DROP TABLE Furnizori_proiect CASCADE CONSTRAINTS;
DROP TABLE Produse_proiect CASCADE CONSTRAINTS;
DROP TABLE Containere_proiect CASCADE CONSTRAINTS;
DROP TABLE Vapoare_proiect CASCADE CONSTRAINTS;
DROP TABLE Transporturi_maritime_proiect CASCADE CONSTRAINTS;
DROP TABLE Porturi_proiect CASCADE CONSTRAINTS;

--CREARE TABELE, RELATII, CONSTRANGERI

CREATE TABLE Porturi_proiect (
  id_port_proiect NUMBER(7) PRIMARY KEY,
  nume_port VARCHAR2(40),
  tara VARCHAR2(30),
  capacitate_nr_vapoare NUMBER(10)
);

CREATE TABLE Vapoare_proiect (
  id_vapor_proiect NUMBER(7) PRIMARY KEY,
  nume_vapor VARCHAR2(40),
  tara_proprietar VARCHAR2(30),
  nr_admis_containere NUMBER(4)
);

CREATE TABLE Containere_proiect (
  id_container_proiect NUMBER(7) PRIMARY KEY,
  id_vapor_proiect NUMBER(7),
  capacitate NUMBER(10),
  CONSTRAINT fk_containere_vapoare FOREIGN KEY (id_vapor_proiect) REFERENCES Vapoare_proiect(id_vapor_proiect)
);

CREATE TABLE Transporturi_maritime_proiect (
  id_transport_proiect NUMBER(7) PRIMARY KEY,
  id_vapor_proiect NUMBER(7),
  id_port_plecare_proiect NUMBER(7),
  id_port_destinatie_proiect NUMBER(7),
  data_plecare DATE,
  data_sosire DATE
);

CREATE TABLE Furnizori_proiect (
  id_furnizor_proiect NUMBER(7) PRIMARY KEY,
  nume_furnizor VARCHAR2(40),
  tara VARCHAR2(30),
  nume_student VARCHAR2(30) DEFAULT 'Neacsu David-Andrei'
);

CREATE TABLE Produse_proiect (
  id_produs_proiect NUMBER(7) PRIMARY KEY,
  id_container_proiect NUMBER(7),
  id_furnizor_proiect NUMBER(7),
  nume_produs VARCHAR2(40),
  cantitate NUMBER(10),
  greutate_unitara NUMBER(4),
  pret_unitar NUMBER(7,2),
  tara_origine VARCHAR2(30)
);

ALTER TABLE Transporturi_maritime_proiect
  ADD CONSTRAINT fk_transporturi_vapoare FOREIGN KEY (id_vapor_proiect) REFERENCES Vapoare_proiect(id_vapor_proiect);

ALTER TABLE Transporturi_maritime_proiect
  ADD CONSTRAINT fk_port_plecare FOREIGN KEY (id_port_plecare_proiect) REFERENCES Porturi_proiect(id_port_proiect);
  
ALTER TABLE Transporturi_maritime_proiect
  ADD CONSTRAINT fk_port_destinatie FOREIGN KEY (id_port_destinatie_proiect) REFERENCES Porturi_proiect(id_port_proiect);

ALTER TABLE Produse_proiect
  ADD CONSTRAINT fk_produse_containere FOREIGN KEY (id_container_proiect) REFERENCES Containere_proiect(id_container_proiect);

ALTER TABLE Produse_proiect
  ADD CONSTRAINT fk_produse_furnizori FOREIGN KEY (id_furnizor_proiect) REFERENCES Furnizori_proiect(id_furnizor_proiect);

--INSERARE DATE

INSERT INTO Porturi_proiect VALUES(1,'Constanta','Romania',1); 
INSERT INTO Porturi_proiect VALUES(2,'Genoa','Italia',2); 
INSERT INTO Porturi_proiect VALUES(3,'Shanghai','China',3); 
INSERT INTO Porturi_proiect VALUES(4,'Izmit','Turcia',2); 
INSERT INTO Porturi_proiect VALUES(5,'Beijing','China',3); 
INSERT INTO Porturi_proiect VALUES(6, 'Tokyo', 'Japonia', 2);
INSERT INTO Porturi_proiect VALUES(7, 'Los Angeles', 'SUA', 2);
INSERT INTO Porturi_proiect VALUES(8, 'New York', 'SUA', 3);
INSERT INTO Porturi_proiect VALUES(9, 'Mumbai', 'India', 3);
INSERT INTO Porturi_proiect VALUES(10, 'Sydney', 'Australia', 1);

INSERT INTO Vapoare_proiect VALUES(1,'RoNavy','Romania',1);
INSERT INTO Vapoare_proiect VALUES(2,'ItNavy','Italia',2);
INSERT INTO Vapoare_proiect VALUES(3,'ChinaSea','China',3);
INSERT INTO Vapoare_proiect VALUES(4,'BgBoat','Bulgaria',1);
INSERT INTO Vapoare_proiect VALUES(5,'OtoSea','Turcia',2);
INSERT INTO Vapoare_proiect VALUES(6, 'NihonSea', 'Japonia', 3);
INSERT INTO Vapoare_proiect VALUES(7, 'NetFleet', 'Olanda', 1);
INSERT INTO Vapoare_proiect VALUES(8, 'USNaval', 'SUA', 3);
INSERT INTO Vapoare_proiect VALUES(9, 'IndOcean', 'India', 3);
INSERT INTO Vapoare_proiect VALUES(10, 'AusShip', 'Australia', 1);


INSERT INTO Transporturi_maritime_proiect VALUES(1,1,1,2,TO_DATE('01-06-2024','dd-mm-yyyy'),TO_DATE('10-06-2024','dd-mm-yyyy'));
INSERT INTO Transporturi_maritime_proiect VALUES(2,2,2,1,TO_DATE('02-06-2024','dd-mm-yyyy'),TO_DATE('11-06-2024','dd-mm-yyyy'));
INSERT INTO Transporturi_maritime_proiect VALUES(3,2,1,3,TO_DATE('12-06-2024','dd-mm-yyyy'),TO_DATE('12-07-2024','dd-mm-yyyy'));
INSERT INTO Transporturi_maritime_proiect VALUES(4,3,3,1,TO_DATE('01-06-2024','dd-mm-yyyy'),TO_DATE('01-07-2024','dd-mm-yyyy'));
INSERT INTO Transporturi_maritime_proiect VALUES(5,3,3,2,TO_DATE('01-06-2024','dd-mm-yyyy'),TO_DATE('10-07-2025','dd-mm-yyyy'));
INSERT INTO Transporturi_maritime_proiect VALUES(6,5,4,3,TO_DATE('25-05-2023','dd-mm-yyyy'),TO_DATE('24-06-2025','dd-mm-yyyy'));
INSERT INTO Transporturi_maritime_proiect VALUES(7,4,4,3,TO_DATE('26-06-2026','dd-mm-yyyy'),TO_DATE('25-07-2023','dd-mm-yyyy'));
INSERT INTO Transporturi_maritime_proiect VALUES(8,8,7,10,TO_DATE('15-07-2024','dd-mm-yyyy'),TO_DATE('25-07-2024','dd-mm-yyyy'));
INSERT INTO Transporturi_maritime_proiect VALUES(9,9,6,8,TO_DATE('10-08-2024','dd-mm-yyyy'),TO_DATE('20-08-2024','dd-mm-yyyy'));
INSERT INTO Transporturi_maritime_proiect VALUES(10,10,8,9,TO_DATE('05-09-2024','dd-mm-yyyy'),TO_DATE('15-09-2024','dd-mm-yyyy'));

INSERT INTO Containere_proiect VALUES(1,1,8000);
INSERT INTO Containere_proiect VALUES(2,2,10000);
INSERT INTO Containere_proiect VALUES(3,2,8000);
INSERT INTO Containere_proiect VALUES(4,3,10000);
INSERT INTO Containere_proiect VALUES(5,3,9000);
INSERT INTO Containere_proiect VALUES(6,4,8000);
INSERT INTO Containere_proiect VALUES(7,5,9000);
INSERT INTO Containere_proiect VALUES(8,8,9000);
INSERT INTO Containere_proiect VALUES(9,10,10000);
INSERT INTO Containere_proiect VALUES(10,9,9000);
INSERT INTO Containere_proiect VALUES(11,10,10000);


INSERT INTO Furnizori_proiect VALUES(1,'CHgoods','China','Neacsu David-Andrei');
INSERT INTO Furnizori_proiect VALUES(2,'RoProducs','Romania','Neacsu David-Andrei');
INSERT INTO Furnizori_proiect VALUES(3,'TKfurniz','Turcia','Neacsu David-Andrei');
INSERT INTO Furnizori_proiect VALUES(4,'BgProd','Bulgaria','Neacsu David-Andrei');
INSERT INTO Furnizori_proiect VALUES(5,'DistrInd','India','Neacsu David-Andrei');
INSERT INTO Furnizori_proiect VALUES(6,'ProductIt','Italia','Neacsu David-Andrei');
INSERT INTO Furnizori_proiect VALUES(7,'JapanDistrib','Japonia','Neacsu David-Andrei');
INSERT INTO Furnizori_proiect VALUES(8,'AustGoods','Australia','Neacsu David-Andrei');
INSERT INTO Furnizori_proiect VALUES(9,'TurkieProd','Turcia','Neacsu David-Andrei');
INSERT INTO Furnizori_proiect VALUES(10,'USAbest','SUA','Neacsu David-Andrei');

INSERT INTO Produse_proiect VALUES(1, 1, 2, 'imbracaminte',2500,2,25, 'Romania');
INSERT INTO Produse_proiect VALUES(2, 2, 6, 'masini',10,1000,45000, 'Italia');
INSERT INTO Produse_proiect VALUES(3, 3, 6, 'vinuri',7500,1,15,'Italia');
INSERT INTO Produse_proiect VALUES(4, 5, 6, 'masini',9,1000,25000, 'China');
INSERT INTO Produse_proiect VALUES(5, 4, 1, 'medicamente',10000,0.5,5,'Coreea de Sud');
INSERT INTO Produse_proiect VALUES(6, 4, 1, 'jucarii',5000,1,10,'China');
INSERT INTO Produse_proiect VALUES(7, 7, 3, 'imbracaminte',4500,2,20, 'Turcia');
INSERT INTO Produse_proiect VALUES(8, 6, 4, 'fructe',1000,0.7,1,'Serbia');
INSERT INTO Produse_proiect VALUES(9, 9, 10, 'mingi de fotbal',9500,1,15,'Mexic');
INSERT INTO Produse_proiect VALUES(10, 11, 10, 'incaltari sport',9000,1,300,'SUA');


--corectarea anilor 
UPDATE Transporturi_maritime_proiect 
SET data_plecare = ADD_MONTHS(data_plecare, 12 * ( 2024 - EXTRACT(YEAR FROM data_plecare) ) )
WHERE EXTRACT(YEAR FROM data_plecare)!=2024;

UPDATE Transporturi_maritime_proiect 
SET data_sosire = ADD_MONTHS(data_sosire, 12 * ( 2024 - EXTRACT(YEAR FROM data_sosire) ) )
WHERE EXTRACT(YEAR FROM data_sosire)!=2024;

--actualizare preturi
UPDATE Produse_proiect 
SET pret_unitar = CASE WHEN tara_origine = UPPER('ITALIA') THEN pret_unitar * 1.10 
                       WHEN pret_unitar < 1 THEN 1
                       ELSE pret_unitar END;

--eliminarea furnizorilor fără activitate
DELETE FROM Furnizori_proiect WHERE (SELECT COUNT(*) FROM Produse_proiect P WHERE P.id_furnizor_proiect = Furnizori_proiect.id_furnizor_proiect) = 0;
