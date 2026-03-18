import mysql.connector
import json

# массив четвёрок
with open('to_test.json', 'r', encoding='utf-8') as file:
    data = json.load(file)

# подключение к MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="dby_user",
    password="LhePBA4v6Lc8k6",
    database="dby_bd"
)
cursor = conn.cursor()

correct = []

# цикл по массиву
for elem in data:
    elem_1, elem_2, elem_3, elem_4 = elem

    query = """
    SELECT COUNT(p.product_id)
    FROM oc_product p
    JOIN oc_filter_description f ON f.filter_id = %s
    JOIN oc_product_to_category pc ON pc.product_id=p.product_id 
        AND pc.category_id IN (%s, %s)
    JOIN oc_product_description pd ON pd.product_id=p.product_id AND pd.language_id=1
    WHERE p.manufacturer_id=%s
      AND (p.length BETWEEN
           CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(f.name, '(', -1), '-', 1) AS UNSIGNED)
           AND CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(f.name, '(', -1), '-', -1), ')', '') AS UNSIGNED))
    """
    cursor.execute(query, (elem_3, elem_1, elem_2, elem_4))
    count = cursor.fetchone()[0]

    if count > 0:
        correct.append(elem)

cursor.close()
conn.close()

# выводим корректные четвёрки в JSON
print(len(data))
print(len(correct))
# print(json.dumps(correct, ensure_ascii=False))

