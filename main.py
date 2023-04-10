import psycopg2
from tabulate import tabulate

# Подключение к базе данных
conn = psycopg2.connect(
    host="127.0.0.1",
    database="store",
    user="postgres",
    password="123456"
)

# Создание курсора для выполнения запроса о сумме товаров
order_amount = conn.cursor()

# Выполнение запроса на получение данных о сумме товаров
order_amount.execute("""
SELECT "name" AS "Наименование клиента", COALESCE(SUM(amount), 0) AS Сумма 
FROM
	client
	INNER JOIN "order" ON client.client_id = "order".client_id
	LEFT JOIN order_details ON "order".order_id = order_details.order_id
GROUP BY 1
ORDER BY 2 DESC
""")

# Получение всех строк результата в виде списка
rows_order_amount = order_amount.fetchall()

# Получение заголовков столбцов из описания таблицы
headers_order_amount = [desc[0] for desc in order_amount.description]

# Формирование табличного представления данных с помощью библиотеки tabulate
query_order_amount = tabulate(rows_order_amount, headers=headers_order_amount, tablefmt="grid")

# Вывод табличного представления данных на экран
print(query_order_amount)


# Создание курсора для выполнения запроса о количестве дочерних элементов первого уровня вложенности
first_nesting_level = conn.cursor()

# Выполнение запроса на получение данных о количестве дочерних элементов первого уровня вложенности
first_nesting_level.execute("""
WITH cte AS (
SELECT parent_category, COUNT(parent_category) AS amount
FROM product_categories
GROUP BY 1
)

SELECT category AS Категория, COALESCE(amount, 0) AS Количество
FROM
	cte
	RIGHT JOIN product_categories ON cte.parent_category = product_categories.product_categories_id
""")

# Получение всех строк результата в виде списка
rows_first_nesting_level = first_nesting_level.fetchall()

# Получение заголовков столбцов из описания таблицы
headers_first_nesting_level = [desc[0] for desc in first_nesting_level.description]

# Формирование табличного представления данных с помощью библиотеки tabulate
query_first_nesting_level = tabulate(rows_first_nesting_level, headers=headers_first_nesting_level, tablefmt="grid")

# Вывод табличного представления данных на экран
print(query_first_nesting_level)