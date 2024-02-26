# Online store database

## Features: 

Order Management:

Ability to place new orders, update existing orders, and track order status.
Integration with payment systems for various payment methods (e.g., credit card, bank transfer, cash on delivery).
Notification system to inform customers about order updates (e.g., order confirmed, shipped, delivered).

Inventory Management:

Tracking product quantities in stock and triggering alerts for low stock levels.
Integration with suppliers to automatically replenish inventory based on predefined thresholds.
Forecasting demand based on historical sales data to optimize inventory levels.

Customer Relationship Management (CRM):

Maintaining a database of customer information for personalized marketing campaigns and customer support.
Analyzing customer purchase history to identify trends and recommend products.
Loyalty program management to reward repeat customers and encourage customer retention.

Employee Management:

Managing employee information, including contact details, departments, and salaries.
Monitoring employee performance and productivity through sales metrics and customer satisfaction ratings.
Scheduling and shift management to ensure adequate staffing levels during peak hours.

Supplier Management:

Maintaining a database of supplier information, including contact details and product catalogs.
Streamlining communication with suppliers for order placement, invoicing, and payment processing.
Evaluating supplier performance based on factors such as product quality, delivery times, and pricing.

Reporting and Analytics:

Generating reports on sales performance, revenue trends, and product profitability.
Analyzing customer demographics and purchasing behavior to identify target markets and product preferences.
Visualizing data through dashboards and interactive charts for easy interpretation and decision-making.

Logistics and Delivery Management:

Routing and scheduling deliveries to optimize efficiency and minimize transportation costs.
Tracking shipment status in real-time and providing customers with delivery updates.
Managing returns and exchanges efficiently to maintain customer satisfaction.

Security and Compliance:

Implementing role-based access control to restrict access to sensitive data and functionalities.
Ensuring compliance with data protection regulations (e.g., GDPR) and maintaining data integrity.
Regularly backing up data and implementing disaster recovery measures to prevent data loss.

## Database Schema:

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
