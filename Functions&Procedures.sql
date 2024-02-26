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