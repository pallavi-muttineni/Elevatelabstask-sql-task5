#SQL Joins Tutorial
This repository provides a comprehensive guide and SQL code to understand and practice various SQL join types: INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN.

Objective
The primary objective of this tutorial is to help users master the skill of combining data from multiple related tables using different SQL join clauses.

Tools Required
To execute the provided SQL queries and follow along with the tutorial, you will need a SQL client or database management tool. Recommended tools include:

DB Browser for SQLite: A lightweight, open-source tool for creating, designing, and editing SQLite database files.

MySQL Workbench: A visual tool for database architects, developers, and DBAs.

Any other SQL client compatible with standard SQL syntax (e.g., PostgreSQL, SQL Server Management Studio).

Setup and Execution
Follow these steps to set up your environment and run the queries:

Open your SQL Tool: Launch DB Browser for SQLite, MySQL Workbench, or your preferred SQL client.

Create a New Database (if applicable): For tools like MySQL Workbench, you might need to create a new schema or database. For DB Browser for SQLite, you can simply create a new database file.

Execute Table Creation and Data Insertion:
Copy the entire "Step 1: Create Sample Tables and Insert Data" section from the provided SQL code (e.g., sql-joins-complete-code.sql if it were a file in a repository).
Paste it into your SQL client's query editor and execute it. This will create the Customers and Orders tables and populate them with sample data.

Execute Join Queries:
One by one, copy and paste the SQL queries for each join type (INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN) into your query editor.
Execute each query and observe the results. Pay close attention to how each join type handles matching and non-matching rows.

Note for SQLite Users: Remember that SQLite does not directly support RIGHT JOIN or FULL JOIN. Equivalent LEFT JOIN and UNION ALL queries are provided in the code comments for these cases. Make sure to use the SQLite-specific versions if you are using DB Browser for SQLite.

Table Structure and Sample Data
The tutorial uses two simple tables to demonstrate joins:

Customers Table
Stores information about customers.

Column Name

Data Type

Description

CustomerID

INT

Primary Key, unique ID for each customer

Name

VARCHAR(100)

Name of the customer

Email

VARCHAR(100)

Email address of the customer

Sample Data:

CustomerID

Name

Email

1

Alice

alice@example.com

2

Bob

bob@example.com

3

Charlie

charlie@example.com

4

David

david@example.com

Orders Table
Stores information about customer orders.

Column Name

Data Type

Description

OrderID

INT

Primary Key, unique ID for each order

CustomerID

INT

Foreign Key, links to Customers.CustomerID

OrderDate

DATE

Date the order was placed

Amount

DECIMAL(10, 2)

Total amount of the order

Sample Data:

OrderID

CustomerID

OrderDate

Amount

101

1

2023-01-15

150.00

102

2

2023-01-20

200.00

103

1

2023-02-01

75.00

104

3

2023-02-10

300.00

105

5

2023-03-05

120.00

Join Types Covered
The tutorial provides examples and explanations for the following SQL join types:

INNER JOIN: Returns rows when there is a match in both tables.

LEFT JOIN (LEFT OUTER JOIN): Returns all rows from the left table, and the matching rows from the right table. If no match, NULL values appear for the right table's columns.

RIGHT JOIN (RIGHT OUTER JOIN): Returns all rows from the right table, and the matching rows from the left table. If no match, NULL values appear for the left table's columns.

FULL JOIN (FULL OUTER JOIN): Returns all rows when there is a match in one of the tables, combining results from both left and right joins. If no match, NULL values appear for the non-matching side.

Outcome
Upon completing this tutorial, you will have a solid understanding of:

How to create related tables in SQL.

The fundamental differences between INNER, LEFT, RIGHT, and FULL joins.

When to use each join type based on your data retrieval needs.

How to write effective SQL queries to merge data from multiple tables.

Feel free to modify the sample data or create additional tables to further experiment with joins.
