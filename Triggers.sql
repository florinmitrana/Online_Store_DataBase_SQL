


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


DELETE FROM CLIENT WHERE prenume_c = 'Ion';




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

