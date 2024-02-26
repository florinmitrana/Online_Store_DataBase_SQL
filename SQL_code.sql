

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



CREATE OR REPLACE PROCEDURE afisare_info_furnizor (
  id_furnizor_param IN NUMBER
)
AS
  v_produs_nume VARCHAR2(255);
  v_produs_pret DECIMAL(10, 2);
  v_produs_cantitate NUMBER;
  v_furnizor_nume VARCHAR2(255);


  TYPE PreturiList IS TABLE OF DECIMAL(10, 2) INDEX BY BINARY_INTEGER;
  TYPE CantitatiTable IS TABLE OF NUMBER;
  TYPE Disponibilitati IS VARRAY(5) OF NUMBER;
  
  v_preturi PreturiList;
  v_cantitati CantitatiTable := CantitatiTable();
  v_disponibilitati Disponibilitati := Disponibilitati();


BEGIN
  SELECT p.id_produs, fp.pret_furnizor, fp.cantitate_max, f.denumire_furnizor
  INTO v_produs_nume, v_produs_pret, v_produs_cantitate, v_furnizor_nume
  FROM furnizor_produs fp
  JOIN produs p ON fp.ID_produs = p.ID_produs
  JOIN furnizor f ON fp.ID_furnizor = f.ID_furnizor
  WHERE fp.ID_furnizor = id_furnizor_param
  AND ROWNUM = 1;


  v_produs_nume := NVL(v_produs_nume, 'N/A');
  v_produs_pret := NVL(v_produs_pret, 0);
  v_produs_cantitate := NVL(v_produs_cantitate, 0);
  v_furnizor_nume := NVL(v_furnizor_nume, 'N/A');


  SELECT fp.pret_furnizor BULK COLLECT INTO v_preturi
  FROM furnizor_produs fp
  JOIN produs p ON fp.ID_produs = p.ID_produs
  WHERE fp.ID_furnizor = id_furnizor_param;


  SELECT fp.cantitate_max BULK COLLECT INTO v_cantitati
  FROM furnizor_produs fp
  WHERE fp.ID_furnizor = id_furnizor_param;


  v_disponibilitati := Disponibilitati(10, 20);


  DBMS_OUTPUT.PUT_LINE('Produs: ' || v_produs_nume);
  DBMS_OUTPUT.PUT_LINE('Pret: ' || v_produs_pret);
  DBMS_OUTPUT.PUT_LINE('Cantitate disponibila: ' || v_produs_cantitate);
  DBMS_OUTPUT.PUT_LINE('Furnizor: ' || v_furnizor_nume);


  FOR i IN v_preturi.FIRST..v_preturi.LAST LOOP
    DBMS_OUTPUT.PUT_LINE('Preturi disponibile ' || i || ': ' || v_preturi(i));
  END LOOP;


  FOR i IN v_cantitati.FIRST..v_cantitati.LAST LOOP
    DBMS_OUTPUT.PUT_LINE('Cantitati disponibile ' || i || ': ' || v_cantitati(i));
  END LOOP;


  FOR i IN v_disponibilitati.FIRST..v_disponibilitati.LAST LOOP
    DBMS_OUTPUT.PUT_LINE('Disponibilitate ' || i || ': ' || v_disponibilitati(i));
  END LOOP;


EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Furnizorul cu ID ' || id_furnizor_param || ' nu exista.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('O eroare necunoscuta a aparut: ' || SQLERRM);
END;
/


BEGIN
  afisare_info_furnizor(2); 
END;
/



CREATE OR REPLACE PROCEDURE client_comenzi (
  id_client_param IN NUMBER
)
AS
  CURSOR cur_client IS
    SELECT nume_c, prenume_c
    FROM CLIENT
    WHERE ID_client = id_client_param;


  CURSOR cur_comenzi (id_client_param NUMBER) IS
    SELECT c.ID_comanda, c.stare_comanda
    FROM COMANDA c
    WHERE c.ID_client = id_client_param;


  v_nume_client CLIENT.nume_c%TYPE;
  v_prenume_client CLIENT.prenume_c%TYPE;
  v_id_comanda COMANDA.ID_comanda%TYPE;
  v_stare_comanda COMANDA.stare_comanda%TYPE;


BEGIN


  OPEN cur_client;
  FETCH cur_client INTO v_nume_client, v_prenume_client;
  CLOSE cur_client;


  DBMS_OUTPUT.PUT_LINE('Raport pentru clientul ' || v_nume_client || ' ' || v_prenume_client);
  DBMS_OUTPUT.PUT_LINE('----------------------------------------');


  OPEN cur_comenzi(id_client_param);
  LOOP
    FETCH cur_comenzi INTO v_id_comanda, v_stare_comanda;
    EXIT WHEN cur_comenzi%NOTFOUND;


    DBMS_OUTPUT.PUT_LINE('Comanda ' || v_id_comanda || ':');
    DBMS_OUTPUT.PUT_LINE('  - Stare: ' || v_stare_comanda);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
  END LOOP;


  CLOSE cur_comenzi;


EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Clientul cu ID ' || id_client_param || ' nu exista.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Eroare Necunoscuta:  ' || SQLERRM);
END;
/




BEGIN
  client_comenzi(1);
END;
/



CREATE OR REPLACE FUNCTION detalii_comanda_produse (
  id_comanda_param IN NUMBER
) RETURN VARCHAR2
IS
  v_cursor SYS_REFCURSOR;
  v_id_comanda COMANDA.ID_comanda%TYPE;
  v_data_comanda COMANDA.data_comanda%TYPE;
  v_mod_plata COMANDA.mod_plata%TYPE;
  v_stare_comanda COMANDA.stare_comanda%TYPE;
  v_id_produs PRODUS.ID_produs%TYPE;
  v_cantitate_comanda COMANDA_PRODUS.cantitate_comanda%TYPE;
  v_categorie_produs PRODUS.categorie_produs%TYPE;
  v_pret PRODUS.pret%TYPE;
  WRONG_PAYMENT EXCEPTION;
  END_ORDER EXCEPTION;
BEGIN
  SELECT ID_comanda, data_comanda, mod_plata, stare_comanda 
  INTO v_id_comanda, v_data_comanda, v_mod_plata, v_stare_comanda
  FROM COMANDA
  WHERE ID_comanda = id_comanda_param;


  OPEN v_cursor FOR
    SELECT CP.ID_produs, P.categorie_produs, P.pret, CP.cantitate_comanda, C.mod_plata
    FROM COMANDA_PRODUS CP
    JOIN PRODUS P ON CP.ID_produs = P.ID_produs
    JOIN COMANDA C ON CP.ID_comanda=C.ID_comanda
    WHERE CP.ID_comanda = id_comanda_param;
    
    FETCH v_cursor INTO v_id_produs, v_categorie_produs, v_pret, v_cantitate_comanda,v_stare_comanda;
    
    IF v_mod_plata = 'Ramburs' THEN
    CLOSE v_cursor;
    RAISE WRONG_PAYMENT;
    END IF;
    
    IF v_stare_comanda = 'Finalizata' THEN 
    CLOSE v_cursor;
    RAISE END_ORDER;
    END IF;
    
    CLOSE v_cursor;
    
    RETURN 'Produs ID ' || v_id_produs || ': ' || v_categorie_produs || ' - Pret: ' || v_pret ||
                         '; Cantitate comandata: ' || v_cantitate_comanda || 'Stare comanda: ' || v_stare_comanda;
    
    EXCEPTION
  WHEN WRONG_PAYMENT THEN
  RETURN 'Eroare la plata ramburs';
  WHEN END_ORDER THEN
  RETURN 'Eroare comanda deja finalizata';
  WHEN OTHERS THEN
  RETURN 'Eroare necunoscuta:  ';
    
END detalii_comanda_produse;
/


DECLARE
  v_afisare VARCHAR2(200);
BEGIN
  v_afisare := detalii_comanda_produse(3);
  DBMS_OUTPUT.PUT_LINE(v_afisare);
END;
/



CREATE OR REPLACE PROCEDURE AfisareComenziClient (
  p_nume_client IN CLIENT.NUME_C%TYPE
) AS
  v_count NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_count FROM(SELECT CLIENT.NUME_C FROM CLIENT WHERE CLIENT.NUME_C = p_nume_client);
    
    IF v_count =0 THEN 
        RAISE NO_DATA_FOUND;
    END IF;
    
    IF v_count > 1 THEN 
        RAISE TOO_MANY_ROWS;
    END IF;
    
  FOR rec IN (
    SELECT C.ID_comanda, C.data_comanda, C.mod_plata, C.stare_comanda,
           P.ID_produs, P.categorie_produs, P.pret,
           AP.nume_angajat || ' ' || AP.prenume_angajat AS nume_angajat
    FROM CLIENT CL
    JOIN COMANDA C ON CL.ID_client = C.ID_client
    JOIN COMANDA_PRODUS CP ON C.ID_comanda = CP.ID_comanda
    JOIN PRODUS P ON CP.ID_produs = P.ID_produs
    JOIN ANGAJAT AP ON C.ID_angajat = AP.ID_angajat
    WHERE CL.NUME_C = p_nume_client
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Comanda ID: ' || rec.ID_comanda);
    DBMS_OUTPUT.PUT_LINE('Data comanda: ' || rec.data_comanda);
    DBMS_OUTPUT.PUT_LINE('Mod de plata: ' || rec.mod_plata);
    DBMS_OUTPUT.PUT_LINE('Stare comanda: ' || rec.stare_comanda);
    DBMS_OUTPUT.PUT_LINE('Produs ID: ' || rec.ID_produs);
    DBMS_OUTPUT.PUT_LINE('Categorie produs: ' || rec.categorie_produs);
    DBMS_OUTPUT.PUT_LINE('Pret produs: ' || rec.pret);
    DBMS_OUTPUT.PUT_LINE('Nume angajat: ' || rec.nume_angajat);
  END LOOP;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Eroare: Nu s-au gasit date pentru clientul specificat.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Eroare: S-au gasit prea multe inregistrari pentru clientul specificat.');
END AfisareComenziClient;
/


DECLARE
  v_nume_client CLIENT.NUME_C%TYPE := 'Ionescu';
  v_invalid_nume CLIENT.NUME_C%TYPE := 'Florin';
  v_prea_multe_nume CLIENT.NUME_C%TYPE := 'Popescu';
BEGIN
  AfisareComenziClient(v_nume_client);
  --AfisareComenziClient(v_invalid_nume);
  --AfisareComenziClient(v_prea_multe_nume);
END;
/


--INSERT INTO CLIENT (ID_client, nume_c, prenume_c, telefon, adresa, localitate)
--VALUES (6, 'Popescu', 'PrenumeNou', '1234567890', 'AdresaNoua', 'LocalitateNoua');


--DELETE FROM CLIENT WHERE ID_CLIENT = 6;




CREATE OR REPLACE TRIGGER t_strg_ion
BEFORE DELETE ON CLIENT
DECLARE
v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM CLIENT WHERE prenume_c='Ion';
    IF v_count> 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Nu putem sterge din baza de date clientii cu prenumele Ion');
    END IF;
END t_strg_ion;
/


DELETE FROM CLIENT WHERE prenume_c = 'Ion'




CREATE OR REPLACE TRIGGER pret_produs
BEFORE UPDATE
ON PRODUS
FOR EACH ROW
DECLARE
   PRAG_PRET DECIMAL(10, 2) := 50.00; 
BEGIN
   IF :NEW.pret < PRAG_PRET THEN
      RAISE_APPLICATION_ERROR(-20001, 'Pretul produsului nu poate fi mai mic de ' || PRAG_PRET);
   END IF;
END;
/


UPDATE PRODUS
SET pret = 45.00
WHERE ID_produs = 1;




CREATE OR REPLACE TRIGGER admin.ddl_trigger_procedura
AFTER CREATE OR ALTER OR DROP ON SCHEMA
DECLARE
  v_event_type     VARCHAR2(30);
  v_object_type    VARCHAR2(30);
BEGIN
  v_event_type := ora_sysevent;
  v_object_type := ora_dict_obj_type;
     IF v_event_type = 'CREATE' AND v_object_type = 'PROCEDURE' THEN
     DBMS_OUTPUT.PUT_LINE('Procedura a fost creeata cu succes');
  END IF;
END;
/


CREATE OR REPLACE PROCEDURE AfisareComenziClient (
  p_nume_client IN CLIENT.NUME_C%TYPE
) AS
  v_count NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_count FROM(SELECT CLIENT.NUME_C FROM CLIENT WHERE CLIENT.NUME_C = p_nume_client);
    
    IF v_count =0 THEN 
        RAISE NO_DATA_FOUND;
    END IF;
    
    IF v_count > 1 THEN 
        RAISE TOO_MANY_ROWS;
    END IF;
    
  FOR rec IN (
    SELECT C.ID_comanda, C.data_comanda, C.mod_plata, C.stare_comanda,
           P.ID_produs, P.categorie_produs, P.pret,
           AP.nume_angajat || ' ' || AP.prenume_angajat AS nume_angajat
    FROM CLIENT CL
    JOIN COMANDA C ON CL.ID_client = C.ID_client
    JOIN COMANDA_PRODUS CP ON C.ID_comanda = CP.ID_comanda
    JOIN PRODUS P ON CP.ID_produs = P.ID_produs
    JOIN ANGAJAT AP ON C.ID_angajat = AP.ID_angajat
    WHERE CL.NUME_C = p_nume_client
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Comanda ID: ' || rec.ID_comanda);
    DBMS_OUTPUT.PUT_LINE('Data comanda: ' || rec.data_comanda);
    DBMS_OUTPUT.PUT_LINE('Mod de plata: ' || rec.mod_plata);
    DBMS_OUTPUT.PUT_LINE('Stare comanda: ' || rec.stare_comanda);
    DBMS_OUTPUT.PUT_LINE('Produs ID: ' || rec.ID_produs);
    DBMS_OUTPUT.PUT_LINE('Categorie produs: ' || rec.categorie_produs);
    DBMS_OUTPUT.PUT_LINE('Pret produs: ' || rec.pret);
    DBMS_OUTPUT.PUT_LINE('Nume angajat: ' || rec.nume_angajat);
  END LOOP;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Eroare: Nu s-au gasit date pentru clientul specificat.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Eroare: S-au gasit prea multe inregistrari pentru clientul specificat.');
END AfisareComenziClient;
/


DECLARE
  v_nume_client CLIENT.NUME_C%TYPE := 'Ionescu';
  v_invalid_nume CLIENT.NUME_C%TYPE := 'Florin';
  v_prea_multe_nume CLIENT.NUME_C%TYPE := 'Popescu';
BEGIN
  AfisareComenziClient(v_nume_client);
  --AfisareComenziClient(v_invalid_nume);
  --AfisareComenziClient(v_prea_multe_nume);
END;
/


--INSERT INTO CLIENT (ID_client, nume_c, prenume_c, telefon, adresa, localitate)
--VALUES (6, 'Popescu', 'PrenumeNou', '1234567890', 'AdresaNoua', 'LocalitateNoua');


--DELETE FROM CLIENT WHERE ID_CLIENT = 6;