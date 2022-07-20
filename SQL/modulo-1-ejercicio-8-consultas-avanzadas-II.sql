-- Relación entre número de pedidos y máxima carga:
-- Desde logística nos piden el número de pedidos y la máxima cantidad de carga de entre los mismos
-- (freight) que han sido enviados por cada empleado (mostrando el ID de empleado en cada caso).

USE northwind

SELECT MAX(freight), employee_id AS Numero_Empleado, COUNT(order_id) AS Numero_Pedidos
FROM orders
GROUP BY Numero_Empleado;
 

-- Descartar pedidos sin fecha y ordénalos: 
-- En el resultado anterior se han incluido muchos pedidos cuya fecha de envío estaba vacía,
 -- por lo que tenemos que mejorar la consulta en este aspecto. También nos piden que ordenemos los resultados
 -- según el ID de empleado para que la visualización sea más sencilla.
 
SELECT MAX(freight), employee_id AS Numero_Empleado, COUNT(order_id) AS Numero_Pedidos
FROM orders
WHERE NOT shipped_date = 0000-00-00
GROUP BY Numero_Empleado
;
 

-- Números de pedidos por día:
El siguiente paso en el análisis de los pedidos va a consistir en conocer mejor la distribución 
de los mismos según las fechas. Por lo tanto, tendremos que generar una consulta que nos saque el número 
de pedidos para cada día, mostrando de manera separada el día (DAY()), el mes (MONTH()) y el año (YEAR()).

SELECT DAY (shipped_date), MONTH (shipped_date), YEAR (shipped_date)
FROM orders;





-- Número de pedidos por mes y año:
La consulta anterior nos muestra el número de pedidos para cada día concreto, 
pero esto es demasiado detalle. Genera una modificación de la consulta anterior para que agrupe 
los pedidos por cada mes concreto de cada año.


-- Seleccionad las ciudades con 4 o más empleadas:
Desde recursos humanos nos piden seleccionar los nombres de 
las ciudades con 4 o más empleadas de cara a estudiar la apertura de nuevas oficinas.

-- Cread una nueva columna basándonos en la cantidad monetaria:
Necesitamos una consulta que clasifique los pedidos en dos categorías ("Alto" y "Bajo")
 en función de la cantidad monetaria total que han supuesto: por encima o por debajo de 2000 euros.