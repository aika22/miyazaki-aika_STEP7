-- 問1
SELECT * FROM users;

-- 問2
SELECT * FROM users
WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31';

-- 問3
SELECT *
FROM users
WHERE age < 30
AND gender = 'female';

-- 問4
SELECT
product_name,
price
FROM products;

-- 問5
SELECT
    users.name AS ユーザー名,
    orders.order_date AS 注文日
FROM users
INNER JOIN orders
    ON users.id = orders.user_id;

-- 問6
SELECT
    products.products_name AS 商品名,
    order_items.quantity AS 数量,
    products.price AS 単価,
    (order_items.quantity * products.price) AS 金額
FROM order_items
INNER JOIN products
    ON order_items.product_id = products.id;

-- 問7
SELECT
    users.name,
    COUNT(orders.id) AS 注文件数
FROM users
JOIN orders
    ON users.id = orders.user_id
GROUP BY users.name;

-- 問8
SELECT
    users.name,
    SUM(products.price * order_items.quantity) AS 総購入金額
FROM users
JOIN orders
ON users.id = orders.user_id
JOIN order_items
ON orders.id = order_items.order_id
JOIN products
ON order_items.product_id = products.id
GROUP BY users.name;

-- 問9
SELECT
    users.name,
    SUM(products.price * order_items.quantity) AS 総購入金額
FROM users
JOIN orders
ON users.id = orders.user_id
JOIN order_items
ON orders.id = order_items.order_id
JOIN products
ON order_items.product_id = products.id
GROUP BY users.name
ORDER BY 総購入金額 DESC
LIMIT 1;

-- 問10
SELECT
    products.name,
    COUNT(order_items.product_id) AS 注文回数
FROM products
JOIN order_items
ON products.id = order_items.product_id
GROUP BY products.name;

-- 問11
SELECT
    users.name
FROM users
LEFT JOIN orders
ON users.id = orders.user_id
WHERE orders.id IS NULL;

-- 問12
SELECT
    order_id
FROM order_items
GROUP BY order_id
HAVING COUNT(DISTINCT product_id) >= 2;

-- 問13
SELECT DISTINCT
    users.name
FROM users
JOIN orders
ON users.id = orders.user_id
JOIN order_items
ON orders.id = order_items.order_id
JOIN products
ON order_items.product_id = products.id
WHERE products.name = 'テレビ';

-- 問14
SELECT
    orders.order_date,
    users.name,
    products.product_name,
    order_items.quantity,
    products.price * order_items.quantity AS 合計金額
FROM users
JOIN orders
ON users.id = orders.user_id
JOIN order_items
ON orders.id = order_items.order_id
JOIN products
ON order_items.product_id = products.id;

-- 問15
SELECT
    products.product_name,
    SUM(order_items.quantity) AS 合計数量
FROM products
JOIN order_items
ON products.id = order_items.product_id
GROUP BY products.product_name
ORDER BY 合計数量 DESC
LIMIT 1;

-- 問16
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS 月,
    COUNT(id) AS 注文件数
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m');

-- 問17
SELECT
    products.product_name
FROM products
LEFT JOIN order_items
ON products.id = order_items.product_id
WHERE order_items.id IS NULL;

-- 問18
CREATE INDEX idx_product_id
ON order_items(product_id);

-- 問19
SELECT
    users.name,
    AVG(products.price * order_items.quantity) AS 平均注文金額
FROM users
JOIN orders
ON users.id = orders.user_id
JOIN order_items
ON orders.id = order_items.order_id
JOIN products
ON order_items.product_id = products.id
GROUP BY users.name;

-- 問20
SELECT
    users.name,
    MAX(orders.order_date) AS 最新注文日
FROM users
JOIN orders
ON users.id = orders.user_id
GROUP BY users.name;

-- 問21
INSERT INTO users (id, name, age, gender, created_at)
VALUES (6, '中村愛', 25, 'female', '2025-06-01');

-- 問22
INSERT INTO products (id, product_name, price)
VALUES (6, 'エアコン', 60000);

-- 問23
INSERT INTO orders (id, user_id, order_date)
VALUES (10, 1, '2025-06-10');

-- 問24
INSERT INTO order_items (id, order_id, product_id, quantity)
VALUES (10, 10, 6, 1);

-- 問25
UPDATE users
SET age = 24
WHERE name = '田中美咲';

-- 問26
UPDATE products
SET price = price * 1.1;

-- 問27
UPDATE orders
SET order_date = '2024-05-01'
WHERE order_date < '2024-05-01';

-- 問28
DELETE FROM users
WHERE name = '高橋健一';

-- 問29
DELETE FROM order_items
WHERE order_id = 5;

-- 問30
DELETE FROM products
WHERE id NOT IN (
    SELECT product_id
    FROM order_items
);
