# Online store database

## Features: 

• Order Management:

Ability to place new orders, update existing orders, and track order status.
Integration with payment systems for various payment methods.
Notification system to inform customers about order updates.

• Inventory Management:

Tracking product quantities in stock and triggering alerts for low stock levels.
Integration with suppliers to automatically replenish inventory based on predefined thresholds.
Forecasting demand based on historical sales data to optimize inventory levels.

• Customer Relationship Management :

Maintaining a database of customer information for personalized marketing campaigns and customer support.
Analyzing customer purchase history to identify trends and recommend products.
Loyalty program management to reward repeat customers and encourage customer retention.

• Employee Management:

Managing employee information, including contact details, departments, and salaries.
Monitoring employee performance and productivity through sales metrics and customer satisfaction ratings.
Scheduling and shift management to ensure adequate staffing levels during peak hours.

• Supplier Management:

Maintaining a database of supplier information, including contact details and product catalogs.
Streamlining communication with suppliers for order placement, invoicing, and payment processing.
Evaluating supplier performance based on factors such as product quality, delivery times, and pricing.

• Reporting and Analytics:

Generating reports on sales performance, revenue trends, and product profitability.
Analyzing customer demographics and purchasing behavior to identify target markets and product preferences.
Visualizing data through dashboards and interactive charts for easy interpretation and decision-making.

• Logistics and Delivery Management:

Routing and scheduling deliveries to optimize efficiency and minimize transportation costs.
Tracking shipment status in real-time and providing customers with delivery updates.
Managing returns and exchanges efficiently to maintain customer satisfaction.

• Security and Compliance:

Implementing role-based access control to restrict access to sensitive data and functionalities.
Ensuring compliance with data protection regulations (e.g., GDPR) and maintaining data integrity.
Regularly backing up data and implementing disaster recovery measures to prevent data loss.

## Database Schema:

Tables:

**CLIENT**

      ID_Client(Primary key) 
      nume_c
      prenume_c
      telefon
      adresa
      localitate

**COMANDA**

      ID_comanda (Primary key)
      ID_client (Foreign key to CLIENT)
      ID_angajat (Foreign key to ANGAJAT)
      data_comanda
      mod_plata
      stare_comanda
  
**COMANDA_PRODUS**

      ID_comanda_produs (Primary key)
      ID_comanda (Foreign key to COMANDA)
      ID_produs (Foreign key to PRODUS)
      cantitate_comanda
      
**ANGAJAT**

      ID_angajat (Primary key)
      ID_departament (Foreign key to DEPARTAMENT)
      nume_angajat
      prenume_angajat
      telefon_angajat
      salariu_angajat
      
**PRODUS**

      ID_produs (Primary key)
      categorie_produs
      pret
      
**FURNIZOR**
      
      ID_furnizor (Primary key)
      denumire_furnizor
      localitate_furnizor
      
**DEPARTAMENT**

      ID_departament (Primary key)
      nume_departament
      
**LIVRARE**

      ID_livrare (Primary key)
      ID_comanda (Foreign key to COMANDA)
      data_livrare
      cost_livrare
      adresa_livrare
      
**FURNIZOR_PRODUS**

      ID_furnizor_produs (Primary key)
      ID_produs (Foreign key to PRODUS)
      ID_furnizor (Foreign key to FURNIZOR)
      pret_furnizor
      cantitate_min
      cantitate_max

## FUNCTIONS AND PROCEDURES : ##

**Procedure: afisare_info_furnizor**

Purpose: This procedure retrieves information about a specific supplier and the products they supply.
Functionality: It takes a supplier ID as input and fetches details such as product name, price, quantity, and supplier name. It then displays this information along with available prices and quantities for the products supplied by the specified supplier.

**Procedure: client_comenzi**

Purpose: This procedure generates a report of all orders placed by a specific client.
Functionality: It retrieves the name of the client and then fetches details of all orders associated with that client, including order IDs and order statuses. It then prints out the order details for each order.

**Function: detalii_comanda_produse**

Purpose: This function provides details of products included in a specific order.
Functionality: It takes an order ID as input and fetches details such as product ID, category, price, and quantity for each product included in the order. It also checks if the payment method is valid and if the order status is finalized before providing the details.

**Procedure: AfisareComenziClient**

Purpose: This procedure displays all orders placed by a specific client.
Functionality: It takes the client's name as input and retrieves details of all orders associated with that client, including order ID, order date, payment method, order status, product details, and the name of the employee handling the order. It then prints out this information for each order.

## TRIGGERS: ##

**Trigger: t_strg_ion** 

Event: This trigger fires before a deletion operation on the CLIENT table.
Purpose: It prevents the deletion of clients with the first name 'Ion'.
Functionality: The trigger checks if there are any clients with the first name 'Ion' in the CLIENT table before allowing the DELETE operation. If such clients are found, it raises an error to prevent the deletion.

**Trigger: pret_produs**

Event: This trigger fires before an update operation on the PRODUS table, for each row being updated.
Purpose: It ensures that the price of a product is not set below a certain threshold.
Functionality: The trigger checks if the new price (:NEW.pret) of the product being updated is lower than a predefined threshold (PRAG_PRET). If the price is below the threshold, it raises an error to prevent the update operation.

**Trigger: admin.ddl_trigger_procedura**

Event: This trigger fires after a CREATE, ALTER, or DROP operation on any schema object.
Purpose: It monitors the creation of procedures within the schema.
Functionality: When a procedure is created in the schema, this trigger detects the event and outputs a message indicating the successful creation of the procedure.


