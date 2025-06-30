
# SQL Developer Internship: Task 5 - SQL Joins

This repository contains the solution and all related files for Task 5 of the SQL Developer Internship. The task focuses on understanding and implementing various types of SQL joins to combine data from multiple tables.

## 📝 Task Objective

The primary goal of this task is to learn how to combine data from multiple tables using different SQL JOIN clauses. The key deliverables include creating related tables and writing queries to demonstrate INNER, LEFT, RIGHT, and FULL OUTER joins.

## 🛠️ Tools Used

  * **Database:** MySQL Workbench (or DB Browser for SQLite)
  * **Version Control:** Git & GitHub

## 📂 Repository Structure

```
├── sql_scripts/
│   ├── 1_create_tables.sql       # Script to create the Customers and Orders tables
│   ├── 2_insert_data.sql         # Script to populate the tables with sample data
│   └── 3_join_queries.sql        # All join queries (INNER, LEFT, RIGHT, FULL)
└── README.md                     # This documentation file
```

## 🚀 SQL Scripts & Queries

The following scripts were created to fulfill the task requirements.

### 1\. Table Creation

The `Customers` and `Orders` tables were created to establish a relational model for demonstrating joins.

**File:** `sql_scripts/1_create_tables.sql`

```sql
-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Country VARCHAR(255)
);

-- Create the Orders table with a foreign key relationship
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

### 2\. Data Insertion

Sample data was inserted into both tables to simulate a real-world scenario where some customers have orders and some do not.

**File:** `sql_scripts/2_insert_data.sql`

```sql
-- Insert data into the Customers table
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country) VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany'),
(2, 'Ana Trujillo Emparedados', 'Ana Trujillo', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Sweden');

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(10308, 2, '1996-09-18'),
(10309, 1, '1996-09-19'),
(10310, 2, '1996-09-20'),
(10311, 6, '1996-09-21'); -- Note: CustomerID 6 doesn't exist in Customers
```

### 3\. Join Queries

These queries demonstrate how to merge data using different join types.

**File:** `sql_scripts/3_join_queries.sql`

#### INNER JOIN

Returns records that have matching values in both tables.

```sql
SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;
```

#### LEFT JOIN

Returns all records from the left table (`Customers`), and the matched records from the right table (`Orders`).

```sql
SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
```

#### RIGHT JOIN

Returns all records from the right table (`Orders`), and the matched records from the left table (`Customers`).

```sql
SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
```

#### FULL OUTER JOIN

Returns all records when there is a match in either the left or the right table. (Simulated using `UNION` for MySQL/SQLite).

```sql
-- For MySQL/SQLite as FULL OUTER JOIN is not directly supported
SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM Orders o
LEFT JOIN Customers c ON c.CustomerID = o.CustomerID;
```

## ❓ Interview Questions & Answers

#### 1\. Difference between INNER and LEFT JOIN?

An **INNER JOIN** returns only the rows where the join condition is met in both tables. A **LEFT JOIN** returns *all* rows from the left table and the matched rows from the right table; if no match is found, it returns `NULL` for the columns of the right table.

#### 2\. What is a FULL OUTER JOIN?

A **FULL OUTER JOIN** combines the results of both `LEFT` and `RIGHT` joins. It returns all rows from both tables, with `NULL` values filling in for columns where there is no match in the corresponding table.

#### 3\. Can joins be nested?

Yes, joins can be nested. You can use a complete `SELECT ... JOIN ...` statement as a derived table within the `FROM` or `JOIN` clause of another query. However, chaining joins (`FROM a JOIN b JOIN c`) is often more readable.

#### 4\. How to join more than 2 tables?

You can join multiple tables by chaining `JOIN` clauses one after another. For example: `FROM TableA JOIN TableB ON ... JOIN TableC ON ...`.

#### 5\. What is a cross join?

A **CROSS JOIN** creates a Cartesian product of two tables, meaning it pairs every row from the first table with every row from the second table. It's written as `FROM TableA CROSS JOIN TableB`.

#### 6\. What is a natural join?

A **NATURAL JOIN** automatically joins tables based on all columns that have the same name and datatype. It's generally avoided in production code as it can lead to unexpected behavior if table schemas change.

#### 7\. Can you join tables without a foreign key?

Absolutely. A foreign key is a constraint for data integrity, not a requirement for a join operation. A join can be performed on any columns from two tables that have a logical relationship and comparable data, using the `ON` clause to specify the condition.

#### 8\. What is a self-join?

A **self-join** is a regular join where a table is joined with itself. This requires using table aliases to differentiate between the two instances of the table. It's useful for querying hierarchical data or comparing rows within the same table.

#### 9\. What causes a Cartesian product?

A Cartesian product is caused by a `CROSS JOIN` or, more commonly, by an `INNER JOIN` where the `ON` clause is missing or the join condition is invalid. This results in every row of the first table being combined with every row of the second.

#### 10\. How to optimize joins?

  * **Index columns** used in `ON`, `WHERE`, and `ORDER BY` clauses.
  * **Filter data early** using `WHERE` clauses to reduce the size of the dataset before the join occurs.
  * **Select only the required columns** instead of using `SELECT *`.
  * **Use `INNER JOIN`** over `OUTER JOIN` when possible, as it's typically more performant.
  * Ensure statistics are up-to-date for the query optimizer.
