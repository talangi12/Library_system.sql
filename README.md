# Library Management System Database

## Description

This project provides a comprehensive relational database schema designed for managing a library. Built entirely with MySQL, it includes tables to track books, authors, members, loans, publishers, categories, fines, and reservations. The schema establishes clear relationships and utilizes constraints to ensure data integrity and facilitate efficient library operations.

## How to Setup/Import the SQL Database

To set up this database in your MySQL environment, follow these steps:

1.  **Ensure MySQL is Installed:** Make sure you have MySQL server installed and running on your system.

2.  **Access MySQL:** You can use the MySQL command-line client or a graphical tool like MySQL Workbench to interact with your MySQL server.

3.  **Create a Database (Optional):** If you don't already have a database for this project, you can create one using the following SQL command:
    ```sql
    CREATE DATABASE library_management;
    USE library_management;
    ```

4.  **Import the SQL File:** Execute the `library_system.sql` file to create the tables and their constraints.

    **Using MySQL Command Line:**
    Open your terminal or command prompt and run:
    ```bash
    mysql -u your_username -p library_management < library_system.sql
    ```
    (Replace `your_username` with your MySQL username. You will be prompted for your password if you have one. If you skipped step 3 or used a different database name, adjust the command accordingly.)

    **Using MySQL Workbench:**
    * Connect to your MySQL server.
    * Go to `File` -> `Open SQL Script...` and select the `library_system.sql` file.
    * Click the "Execute" button (the lightning bolt icon) to run the script.

## Entity-Relationship Diagram (ERD)
https://github.com/talangi12/Library_system.sql/issues/1#issue-3076433249

This diagram visually illustrates the structure of the database, including the tables, their attributes (columns), primary keys, foreign keys, and the relationships between them. It provides a clear overview of how the different entities in the library system are connected.
# Library_system.sql
