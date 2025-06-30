mysql> use task4;
Database changed
mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     Email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.339 sec)

mysql>
mysql> -- Insert data into Customers Table
Query OK, 0 rows affected (0.003 sec)

mysql> INSERT INTO Customers (CustomerID, Name, Email) VALUES
    -> (1, 'Alice', 'alice@example.com'),
    -> (2, 'Bob', 'bob@example.com'),
    -> (3, 'Charlie', 'charlie@example.com'),
    -> (4, 'David', 'david@example.com');
Query OK, 4 rows affected (0.054 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Create Orders Table
Query OK, 0 rows affected (0.004 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     Amount DECIMAL(10, 2)
    -> );
Query OK, 0 rows affected (0.228 sec)

mysql>
mysql> -- Insert data into Orders Table
Query OK, 0 rows affected (0.004 sec)

mysql> INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
    -> (101, 1, '2023-01-15', 150.00),
    -> (102, 2, '2023-01-20', 200.00),
    -> (103, 1, '2023-02-01', 75.00),
    -> (104, 3, '2023-02-10', 300.00),
    -> (105, 5, '2023-03-05', 120.00);
Query OK, 5 rows affected (0.051 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Step 2: Explore Join Types
Query OK, 0 rows affected (0.005 sec)

mysql>
mysql> -- 1. INNER JOIN
Query OK, 0 rows affected (0.003 sec)

mysql> -- Returns only the rows that have matching values in both tables.
Query OK, 0 rows affected (0.003 sec)

mysql> SELECT
    ->     C.CustomerID,
    ->     C.Name,
    ->     C.Email,
    ->     O.OrderID,
    ->     O.OrderDate,
    ->     O.Amount
    -> FROM
    ->     Customers AS C
    -> INNER JOIN
    ->     Orders AS O ON C.CustomerID = O.CustomerID;
+------------+---------+---------------------+---------+------------+--------+
| CustomerID | Name    | Email               | OrderID | OrderDate  | Amount |
+------------+---------+---------------------+---------+------------+--------+
|          1 | Alice   | alice@example.com   |     101 | 2023-01-15 | 150.00 |
|          2 | Bob     | bob@example.com     |     102 | 2023-01-20 | 200.00 |
|          1 | Alice   | alice@example.com   |     103 | 2023-02-01 |  75.00 |
|          3 | Charlie | charlie@example.com |     104 | 2023-02-10 | 300.00 |
+------------+---------+---------------------+---------+------------+--------+
4 rows in set (0.010 sec)

mysql>
mysql> -- 2. LEFT JOIN (or LEFT OUTER JOIN)
Query OK, 0 rows affected (0.004 sec)

mysql> -- Returns all rows from the left table, and the matching rows from the right table.
Query OK, 0 rows affected (0.002 sec)

mysql> -- If no match in the right table, NULL values are returned for the right table's columns.
Query OK, 0 rows affected (0.002 sec)

mysql> SELECT
    ->     C.CustomerID,
    ->     C.Name,
    ->     C.Email,
    ->     O.OrderID,
    ->     O.OrderDate,
    ->     O.Amount
    -> FROM
    ->     Customers AS C
    -> LEFT JOIN
    ->     Orders AS O ON C.CustomerID = O.CustomerID;
+------------+---------+---------------------+---------+------------+--------+
| CustomerID | Name    | Email               | OrderID | OrderDate  | Amount |
+------------+---------+---------------------+---------+------------+--------+
|          1 | Alice   | alice@example.com   |     103 | 2023-02-01 |  75.00 |
|          1 | Alice   | alice@example.com   |     101 | 2023-01-15 | 150.00 |
|          2 | Bob     | bob@example.com     |     102 | 2023-01-20 | 200.00 |
|          3 | Charlie | charlie@example.com |     104 | 2023-02-10 | 300.00 |
|          4 | David   | david@example.com   |    NULL | NULL       |   NULL |
+------------+---------+---------------------+---------+------------+--------+
5 rows in set (0.008 sec)

mysql>
mysql> -- 3. RIGHT JOIN (or RIGHT OUTER JOIN)
Query OK, 0 rows affected (0.004 sec)

mysql> -- Returns all rows from the right table, and the matching rows from the left table.
Query OK, 0 rows affected (0.002 sec)

mysql> -- If no match in the left table, NULL values are returned for the left table's columns.
Query OK, 0 rows affected (0.001 sec)

mysql>
mysql> -- For MySQL/PostgreSQL/SQL Server:
Query OK, 0 rows affected (0.001 sec)

mysql> SELECT
    ->     C.CustomerID,
    ->     C.Name,
    ->     C.Email,
    ->     O.OrderID,
    ->     O.OrderDate,
    ->     O.Amount
    -> FROM
    ->     Customers AS C
    -> RIGHT JOIN
    ->     Orders AS O ON C.CustomerID = O.CustomerID;
+------------+---------+---------------------+---------+------------+--------+
| CustomerID | Name    | Email               | OrderID | OrderDate  | Amount |
+------------+---------+---------------------+---------+------------+--------+
|          1 | Alice   | alice@example.com   |     101 | 2023-01-15 | 150.00 |
|          2 | Bob     | bob@example.com     |     102 | 2023-01-20 | 200.00 |
|          1 | Alice   | alice@example.com   |     103 | 2023-02-01 |  75.00 |
|          3 | Charlie | charlie@example.com |     104 | 2023-02-10 | 300.00 |
|       NULL | NULL    | NULL                |     105 | 2023-03-05 | 120.00 |
+------------+---------+---------------------+---------+------------+--------+
5 rows in set (0.009 sec)

mysql>
mysql> -- Equivalent for SQLite (swap tables and use LEFT JOIN):
Query OK, 0 rows affected (0.004 sec)

mysql> -- SELECT
Query OK, 0 rows affected (0.002 sec)

mysql> --     C.CustomerID,
Query OK, 0 rows affected (0.002 sec)

mysql> -- --     C.Name,
Query OK, 0 rows affected (0.002 sec)

mysql> -- --     C.Email,
Query OK, 0 rows affected (0.002 sec)

mysql> --     O.OrderID,
Query OK, 0 rows affected (0.002 sec)

mysql> --     O.OrderDate,
Query OK, 0 rows affected (0.002 sec)

mysql> --     O.Amount
Query OK, 0 rows affected (0.002 sec)

mysql> -- FROM
Query OK, 0 rows affected (0.002 sec)

mysql> --     Orders AS O
Query OK, 0 rows affected (0.002 sec)

mysql> -- LEFT JOIN
Query OK, 0 rows affected (0.001 sec)

mysql> --     Customers AS C ON C.CustomerID = O.CustomerID;
Query OK, 0 rows affected (0.002 sec)

mysql>
mysql> -- 4. FULL JOIN (or FULL OUTER JOIN)
Query OK, 0 rows affected (0.001 sec)

mysql> -- Returns all rows when there is a match in one of the tables.
Query OK, 0 rows affected (0.001 sec)

mysql> -- Combines the results of both LEFT JOIN and RIGHT JOIN.
Query OK, 0 rows affected (0.001 sec)

mysql> -- If no match, NULL values are returned for the columns of the table that doesn't have a match.
Query OK, 0 rows affected (0.001 sec)

mysql>
mysql> -- For MySQL/PostgreSQL/SQL Server:
Query OK, 0 rows affected (0.003 sec)

mysql> SELECT
    ->     C.CustomerID,
    ->     C.Name,
    ->     C.Email,
    ->     O.OrderID,
    ->     O.OrderDate,
    ->     O.Amount
    -> FROM
    ->     Customers AS C
    -> FULL OUTER JOIN
    ->     Orders AS O ON C.CustomerID = O.CustomerID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FULL OUTER JOIN
    Orders AS O ON C.CustomerID = O.CustomerID' at line 10
mysql>
mysql> -- Equivalent for SQLite (using UNION ALL to simulate FULL JOIN):
Query OK, 0 rows affected (0.002 sec)

mysql> SELECT
    ->     C.CustomerID,
    ->     C.Name,
    ->     C.Email,
    ->     O.OrderID,
    ->     O.OrderDate,
    ->     O.Amount
    -> FROM
    ->     Customers AS C
    -> LEFT JOIN
    ->     Orders AS O ON C.CustomerID = O.CustomerID
    ->
    -> UNION ALL
    ->
    -> SELECT
    ->     C.CustomerID, -- This will be NULL for unmatched orders
    ->     C.Name,       -- This will be NULL for unmatched orders
    ->     C.Email,      -- This will be NULL for unmatched orders
    ->     O.OrderID,
    ->     O.OrderDate,
    ->     O.Amount
    -> FROM
    ->     Orders AS O
    -> LEFT JOIN
    ->     Customers AS C ON C.CustomerID = O.CustomerID
    -> WHERE
    ->     C.CustomerID IS NULL; -- Only include rows from Orders that had no match in Customers
+------------+---------+---------------------+---------+------------+--------+
| CustomerID | Name    | Email               | OrderID | OrderDate  | Amount |
+------------+---------+---------------------+---------+------------+--------+
|          1 | Alice   | alice@example.com   |     103 | 2023-02-01 |  75.00 |
|          1 | Alice   | alice@example.com   |     101 | 2023-01-15 | 150.00 |
|          2 | Bob     | bob@example.com     |     102 | 2023-01-20 | 200.00 |
|          3 | Charlie | charlie@example.com |     104 | 2023-02-10 | 300.00 |
|          4 | David   | david@example.com   |    NULL | NULL       |   NULL |
|       NULL | NULL    | NULL                |     105 | 2023-03-05 | 120.00 |
+------------+---------+---------------------+---------+------------+--------+
6 rows in set (0.015 sec)

