

CREATE TABLE CLIENT (
  ID_client INT PRIMARY KEY,
  nume_c VARCHAR(255),
  prenume_c VARCHAR(255),
  telefon VARCHAR(20),
  adresa VARCHAR(255),
  localitate VARCHAR(255)
);


CREATE TABLE COMANDA (
  ID_comanda INT PRIMARY KEY,
  ID_client INT,
  ID_angajat INT,
  data_comanda DATE,
  mod_plata VARCHAR(255),
  stare_comanda VARCHAR(255),
  FOREIGN KEY (ID_client) REFERENCES CLIENT(ID_client),
  FOREIGN KEY (ID_angajat) REFERENCES ANGAJAT(ID_angajat)
);


CREATE TABLE COMANDA_PRODUS (
  ID_comanda_produs INT PRIMARY KEY,
  ID_comanda INT,
  ID_produs INT,
  cantitate_comanda INT,
  FOREIGN KEY (ID_comanda) REFERENCES COMANDA(ID_comanda),
  FOREIGN KEY (ID_produs) REFERENCES PRODUS(ID_produs)
);


CREATE TABLE ANGAJAT (
  ID_angajat INT PRIMARY KEY,
  ID_departament INT,
  nume_angajat VARCHAR(255),
  prenume_angajat VARCHAR(255),
  telefon_angajat VARCHAR(20),
  salariu_angajat DECIMAL(10, 2),
  FOREIGN KEY (ID_departament) REFERENCES DEPARTAMENT(ID_departament)
);


CREATE TABLE PRODUS (
  ID_produs INT PRIMARY KEY,
  categorie_produs VARCHAR(255),
  pret DECIMAL(10, 2)
);


CREATE TABLE FURNIZOR_PRODUS (
  ID_furnizor_produs INT PRIMARY KEY,
  ID_produs INT,
  ID_furnizor INT,
  pret_furnizor DECIMAL(10, 2),
  cantitate_min INT,
  cantitate_max INT,
  FOREIGN KEY (ID_produs) REFERENCES PRODUS(ID_produs),
  FOREIGN KEY (ID_furnizor) REFERENCES FURNIZOR(ID_furnizor)
);


CREATE TABLE FURNIZOR (
  ID_furnizor INT PRIMARY KEY,
  denumire_furnizor VARCHAR(255),
  localitate_furnizor VARCHAR(255)
);


CREATE TABLE DEPARTAMENT (
  ID_departament INT PRIMARY KEY,
  nume_departament VARCHAR(255)
);


CREATE TABLE LIVRARE (
  ID_livrare INT PRIMARY KEY,
  ID_comanda INT,
  data_livare DATE,
  cost_livrare DECIMAL(10, 2),
  adresa_livrare VARCHAR(255),
  FOREIGN KEY (ID_comanda) REFERENCES COMANDA(ID_comanda)
);
INSERT INTO CLIENT (ID_client, nume_c, prenume_c, telefon, adresa, localitate)
VALUES
(1, 'Popescu', 'Ion', 1234567890, 'Str. Principala 10', 'Bucuresti');


INSERT INTO CLIENT (ID_client, nume_c, prenume_c, telefon, adresa, localitate)
VALUES
(2, 'Ionescu', 'Maria', 9876543210, 'Str. Libertatii 5', 'Cluj-Napoca');


INSERT INTO CLIENT (ID_client, nume_c, prenume_c, telefon, adresa, localitate)
VALUES
(3, 'Dragomir', 'Ana', 5678901234, 'Str. Florilor 3', 'Timisoara');


INSERT INTO CLIENT (ID_client, nume_c, prenume_c, telefon, adresa, localitate)
VALUES
(4, 'Stanescu', 'Mihai', 3456789012, 'Str. Viilor 7', 'Iasi');


INSERT INTO CLIENT (ID_client, nume_c, prenume_c, telefon, adresa, localitate)
VALUES
(5, 'Georgescu', 'Elena', 9012345678, 'Str. Bucovinei 15', 'Constanta');






INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(1, 1, 1, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Card', 'In asteptare');


INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(2, 2, 3, TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'Ramburs', 'Prelucrata');


INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(3, 1, 2, TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'Transfer bancar', 'Finalizata');


INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(4, 3, 1, TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'Card', 'Prelucrata');


INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(5, 4, 2, TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'Ramburs', 'In asteptare');
INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(6, 3, 2, TO_DATE('2023-06-06', 'YYYY-MM-DD'), 'Card', 'In asteptare');
INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(7, 1, 4, TO_DATE('2023-06-07', 'YYYY-MM-DD'), 'Ramburs', 'Prelucrata');
INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(8, 2, 5, TO_DATE('2023-06-08', 'YYYY-MM-DD'), 'Transfer bancar', 'Finalizata');
INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(9, 4, 3, TO_DATE('2023-06-09', 'YYYY-MM-DD'), 'Card', 'Prelucrata');
INSERT INTO COMANDA (ID_comanda, ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda)
VALUES
(10, 5, 1, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'Ramburs', 'In asteptare');






INSERT INTO FURNIZOR (ID_furnizor, denumire_furnizor, localitate_furnizor)
VALUES
(1, 'Supplier A', 'New York');
INSERT INTO FURNIZOR (ID_furnizor, denumire_furnizor, localitate_furnizor)
VALUES
(2, 'Supplier B', 'Los Angeles');
INSERT INTO FURNIZOR (ID_furnizor, denumire_furnizor, localitate_furnizor)
VALUES
(3, 'Supplier C', 'Chicago');
INSERT INTO FURNIZOR (ID_furnizor, denumire_furnizor, localitate_furnizor)
VALUES
(4, 'Supplier D', 'Houston');
INSERT INTO FURNIZOR (ID_furnizor, denumire_furnizor, localitate_furnizor)
VALUES
(5, 'Supplier E', 'Miami');


INSERT INTO DEPARTAMENT (ID_departament, nume_departament)
VALUES
(1, 'Vanzari');
INSERT INTO DEPARTAMENT (ID_departament, nume_departament)
VALUES
(2, 'Marketing');
INSERT INTO DEPARTAMENT (ID_departament, nume_departament)
VALUES
(3, 'Operatiuni');
INSERT INTO DEPARTAMENT (ID_departament, nume_departament)
VALUES
(4, 'Finante');
INSERT INTO DEPARTAMENT (ID_departament, nume_departament)
VALUES
(5, 'Resurse Umane');




INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(1, 1, 'Dani', 'Ionascu', '1111111111', 2500);
INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(2, 2, 'Adrian', 'Dragos', '2222222222', 3000);
INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(3, 1, 'Florin', 'Mitrana', '3333333333', 2800);
INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(4, 3, 'Gabroveanu', 'Razvan', '4444444444', 3200);
INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(5, 2, 'Tavi', 'Troaca', '5555555555', 2700);
INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(6, 3, 'Nume1', 'Nume1', '6666666666', 2800);
INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(7, 1, 'Nume2', 'Nume2', '7777777777', 3200);
INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(8, 2, 'Numen3', 'Numeny', '8888888888', 2700);
INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(9, 4, 'Nume4', 'Nume4', '9999999999', 3000);
INSERT INTO ANGAJAT (ID_angajat, ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat)
VALUES
(10, 5, 'Nume5', 'Nume5', '1010101010', 2600);




INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(1, 1, 1, 5);
INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(2, 2, 2, 3);
INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(3, 3, 1, 2);
INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(4, 4, 3, 1);
INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(5, 5, 2, 4);
INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(6, 6, 1, 5);
INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(7, 7, 2, 3);
INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(8, 8, 1, 2);
INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(9, 9, 3, 1);
INSERT INTO COMANDA_PRODUS (ID_comanda_produs, ID_comanda, ID_produs, cantitate_comanda)
VALUES
(10, 10, 2, 4);




INSERT INTO PRODUS (ID_produs, categorie_produs, pret)
VALUES
(1, 'Electronice', 99.99);
INSERT INTO PRODUS (ID_produs, categorie_produs, pret)
VALUES
(2, 'Haine', 49.99);
INSERT INTO PRODUS (ID_produs, categorie_produs, pret)
VALUES
(3, 'Decoratiuni', 9.99);
INSERT INTO PRODUS (ID_produs, categorie_produs, pret)
VALUES
(4, 'Carti', 19.99);
INSERT INTO PRODUS (ID_produs, categorie_produs, pret)
VALUES
(5, 'Jucarii', 14.99);


INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(1, 1, TO_DATE('2023-06-02', 'YYYY-MM-DD'), 10.00, ' Strada 1');
INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(2, 2, TO_DATE('2023-06-03', 'YYYY-MM-DD'), 8.00, 'Strada 2');
INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(3, 3, TO_DATE('2023-06-04', 'YYYY-MM-DD'), 12.00, 'Strada 3');
INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(4, 4, TO_DATE('2023-06-05', 'YYYY-MM-DD'), 15.00, 'Strada 4');
INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(5, 5, TO_DATE('2023-06-06', 'YYYY-MM-DD'), 10.00, 'Strada 5');
INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(6, 1, TO_DATE('2023-06-03', 'YYYY-MM-DD'), 9.00, 'Strada 6');
INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(7, 2, TO_DATE('2023-06-04', 'YYYY-MM-DD'), 7.00, 'Strada 7');
INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(8, 3, TO_DATE('2023-06-05', 'YYYY-MM-DD'), 11.00, 'Strada 8');
INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(9, 4, TO_DATE('2023-06-06', 'YYYY-MM-DD'), 14.00, 'Strada 9');
INSERT INTO LIVRARE (ID_livrare, ID_comanda, data_livare, cost_livrare, adresa_livrare)
VALUES
(10, 5, TO_DATE('2023-06-07', 'YYYY-MM-DD'), 9.00, 'Strada 10');




INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(1, 1, 1, 80.00, 10, 50);
INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(2, 2, 2, 40.00, 5, 20);
INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(3, 3, 3, 25.00, 8, 30);
INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(4, 4, 4, 15.00, 3, 15);
INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(5, 5, 5, 12.00, 2, 10);
INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(6, 1, 2, 85.00, 15, 60);
INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(7, 2, 3, 45.00, 7, 25);
INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(8, 3, 4, 30.00, 10, 35);
INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(9, 4, 5, 20.00, 5, 20);
INSERT INTO FURNIZOR_PRODUS (ID_furnizor_produs, ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max)
VALUES
(10, 5, 1, 10.00, 1, 5);



