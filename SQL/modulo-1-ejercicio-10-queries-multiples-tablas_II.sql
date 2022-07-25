/* Qué empresas tenemos en la BBDD Northwind:
Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre
 de todas las empresas cliente, los ID de sus pedidos y las fechas.
Los resultados deberán similares a la siguiente tabla:*/

USE northwind;


SELECT orders.order_id, customers.company_name, orders.order_date
FROM customers
LEFT JOIN orders
ON orders.customer_id = customers.customer_id;

/* Pedidos por cliente de UK:
Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de
 pedidos que ha realizado cada cliente del propio Reino Unido de cara a conocerlos mejor y 
 poder adaptarse al mercado actual. Especificamente nos piden el nombre de cada compañía
 cliente junto con el número de pedidos.
La tabla resultante será: */


SELECT customers.company_name AS NombreEmpresa, COUNT(orders.order_id) AS NumeroPedido
FROM customers
RIGHT JOIN orders
ON orders.customer_id = customers.customer_id
WHERE customers.country= "UK"
GROUP BY customers.company_name;

