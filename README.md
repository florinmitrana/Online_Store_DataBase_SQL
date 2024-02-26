# Online store database
Database Schema:
Tables:

CLIENT:

Stores information about clients.
Columns: (ID_client), nume_c, prenume_c, telefon, adresa, localitate.
COMANDA:

Stores information about orders placed by clients.
Columns: (ID_comanda), ID_client, ID_angajat, data_comanda, mod_plata, stare_comanda.
COMANDA_PRODUS:

Represents the many-to-many relationship between orders and products.
Columns: (ID_comanda_produs), ID_comanda, ID_produs, cantitate_comanda.
ANGAJAT:

Stores information about employees.
Columns: (ID_angajat), ID_departament, nume_angajat, prenume_angajat, telefon_angajat, salariu_angajat.
PRODUS:

Stores information about products.
Columns: (ID_produs), categorie_produs, pret.
FURNIZOR:

Stores information about suppliers.
Columns: (ID_furnizor), denumire_furnizor, localitate_furnizor.
DEPARTAMENT:

Stores information about departments.
Columns: (ID_departament), nume_departament.
LIVRARE:

Stores information about deliveries associated with orders.
Columns: (ID_livrare), ID_comanda, data_livare, cost_livrare, adresa_livrare.
FURNIZOR_PRODUS:

Stores information about products supplied by suppliers.
Columns: (ID_furnizor_produs), ID_produs, ID_furnizor, pret_furnizor, cantitate_min, cantitate_max.
Inserts:
Inserts data into the above tables to populate them with sample records.
