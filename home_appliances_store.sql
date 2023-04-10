##### home_appliances_store SQL Project  

#Obtaining information about the amount of goods ordered for each client

SELECT "name" AS "Наименование клиента", COALESCE(SUM(amount), 0) AS Сумма 
FROM
	client
	INNER JOIN "order" ON client.client_id = "order".client_id
	LEFT JOIN order_details ON "order".order_id = order_details.order_id
GROUP BY 1
ORDER BY 2 DESC;

#The number of child elements of the first nesting level for product categories

WITH cte AS (
SELECT parent_category, COUNT(parent_category) AS amount
FROM product_categories
GROUP BY 1
)

SELECT category AS Категория, COALESCE(amount, 0) AS Количество
FROM
	cte
	RIGHT JOIN product_categories ON cte.parent_category = product_categories.product_categories_id;

#Updating the cost of each order

UPDATE "order" SET "cost" = query_in_1.new_cost
FROM (
WITH cte AS (
SELECT "order".order_id AS "order", COALESCE(SUM(price * order_details.amount), 0.00) AS new_cost
FROM 
	"order_details" 
	INNER JOIN nomenclature ON order_details.nomenclature_id = nomenclature.nomenclature_id 
	RIGHT JOIN "order" ON "order".order_id = "order_details".order_id
	INNER JOIN client ON client.client_id = "order".client_id
GROUP BY "order".order_id
)

SELECT new_cost, order_id
FROM
	cte
	INNER JOIN "order" ON cte."order" = "order".order_id
) query_in_1
WHERE "order".order_id = query_in_1.order_id;

