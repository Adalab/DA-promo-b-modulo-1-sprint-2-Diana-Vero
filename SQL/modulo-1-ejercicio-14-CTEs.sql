USE northwind;

/*1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers.*/

WITH clientes (codigo_cliente, nombre_compañia) AS
(SELECT customer_id, company_name
FROM customers)
SELECT codigo_cliente, nombre_compañia
FROM clientes;

/*2. Selecciona solo los de que vengan de "Germany"
Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior, 
pero solo queremos los que pertezcan a "Germany".*/

WITH pais (codigo_cliente, nombre_compañia, pais) AS
(SELECT customer_id, company_name, country
FROM customers
WHERE country = 'Germany')
SELECT codigo_cliente, nombre_compañia, pais
FROM pais;


/*3. Extraed el id de las facturas y su fecha de cada cliente.
En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.
📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).*/

WITH facturas (numero_factura, fecha_factura, codigo_cliente, compañia) AS
(SELECT orders.order_id, orders.order_date, customers.customer_id, customers.company_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id)
SELECT numero_factura, fecha_factura, codigo_cliente, compañia
FROM facturas;


/*4. Contad el número de facturas por cliente
Mejoremos la query anterior. En este caso queremos saber el número de facturas emitidas por cada cliente.*/

WITH facturas (numero_factura, fecha_factura, codigo_cliente, compañia) AS
(SELECT DISTINCT orders.order_id, orders.order_date, customers.customer_id, customers.company_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY orders.order_id, orders.order_date, customers.customer_id, customers.company_name)
SELECT numero_factura, fecha_factura, codigo_cliente, compañia
FROM facturas;

/*5. Cuál la cantidad media pedida de todos los productos ProductID.
Necesitaréis extraet la suma de las cantidades por cada producto y calcular la media de todo */

CREATE TABLE pais_clientes
WITH RECURSIVE pais_clientes (customer_id,company_name,pais) AS
(
SELECT customer_id, company_name, country 
FROM customers
WHERE country = 'Germany'
UNION ALL
SELECT c.customer_id, c.company_name, p.pais
FROM pais_clientes AS p
INNER JOIN customers AS c
ON p.pais= c.country)
SELECT * 
FROM pais_clientes
ORDER BY customer_id;