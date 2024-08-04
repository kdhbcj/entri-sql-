CREATE DATABASE Library;
Use Library;
-- Create the branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(250),
    Contact_no VARCHAR(20)
);

-- Insert 10 rows into the branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
    (1, 101, 'main_St', '5551234'),
    (2, 102, 'elm St', '5555678'),
    (3, 103, ' city center_ St', '5559012'),
    (4, 104, ' Pine St', '5553456'),
    (5, 105, ' Maple St', '5557890'),
    (6, 106, ' suburban St', '5552345'),
    (7, 107, ' Birch St', '5556789'),
    (8, 108, ' east end St', '5551234'),
    (9, 109, ' Cherry St', '5555678'),
    (10, 110, ' Spruce St', '5559012');
    SELECT * FROM Branch;
    
    -- Create the Employee table
CREATE TABLE library.Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(250),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES library.branch(Branch_no)
);

-- Insert 10 rows into Employee table.
INSERT INTO library.Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
    (1, 'John_Davis', 'technical services_librarian', 10000.00, 1),
    (2, 'Willow_Smith', 'outreach_Librarian', 80000.00, 2),
    (3, 'Alice_Johnson', 'Cataloging', 5000.00, 3),
    (4, 'Bob_Williams', 'Reference_Librarian', 4000.00, 4),
    (5, 'Emily_Brown', 'Library_Assistant', 30000.0, 6),
    (6, 'Michael_Davis', 'Archivist', 450000.00, 3),
    (7, 'Jessica_Wilson', 'Library_Director', 60000.0, 1),
    (8, 'David_Martinez', 'Children\'s_Librarian', 46000.00, 2),
    (9, 'Sarah_Anderson', 'Acquisitions_Librarian', 25000.00, 9),
    (10, 'Christopher_Taylor', 'circulation supervisor_Librarian', 90000.00, 2);
    SELECT * FROM Employee;

-- Create a table Customer
CREATE TABLE library.Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(250),
    Customer_address VARCHAR(250),
    Reg_date DATE
);

-- Insert rows into the Customer table 
INSERT INTO library.Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
    (1, 'john smith','123 everygreen terrrace,springfield', '2000-01-10')
    (2, 'phonebe buffay','apartment 20, '495 grove street','new york' '2023-08-3'),
    (3, 'Barney Stinson', 'Apartment 4C, 79th Street, New York', '2022-07-1'),
    (4, 'Chandler Bing', 'Apartment 19, 15 Yemen Road, Yemen', '2024-04-04'),
    (5, 'Michael Sjohson', '789 oak drive,austin,  tx 73301', '2023-07-25'),
    (6, 'olivia lee', '505 walnut street,boston, ma 02101', '2023-06-12'),
    (7, 'Sheldon Cooper', 'Apartment 4A, 2311 Los Robles Avenue, Pasadena', '2022-09-23'),
    (8, 'Phyllis Vance', 'Dunder Mifflin Paper Company, Scranton', '2023-06-02'),
    (9, 'emily davis', '101 maple road, denver, co 80201', '2021_7-09'),
    (10, 'james brown', '404 birch court,boston,ma 02101', '2021-1-3');
    
    
    -- Create the Books table
CREATE TABLE library.Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(250),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(250),
    Publisher VARCHAR(250)
);
-- Insert 10 rows into the Books table
INSERT INTO library.Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    ('9780679601085', 'to kill a mockingbird', 'Fiction', 2.99, 'available', 'harper lee', 'j.b.lippincott & co.'),
    ('9780141439662', 'Sense and Sensibility', 'Classic', 8.99, 'yes', 'Jane Austen', 'Penguin Classics'),
    ('9780062316110', 'the greate gatsby', 'classic', 2.75, 'available', 'f. scott fitzgerald', 'charles scribne's sons'),
    ('9788172235652', 'the hunger games','science Fiction', 3.10, 'checked out', 'suzanne collins', 'scholastic press'),
    ('9788170289186', 'Gitanjali', 'Poetry', 9.86, 'yes', 'Rabindranath Tagore', 'Rupa & Co.'),
    ('9780307947055', '1984', 'Classic', 9.90, 'yes', 'George Orwell', 'Vintage'),
    ('9780061120084', 'the alchemist', 'adventure', 2.55, 'available', 'paulo coelho', 'Harper collins'),
    ('9780307277671', 'The Catcher in the Rye', 'Fiction', 8.99, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
    ('9780307477729', 'The Girl with the Dragon Tattoo', 'Mystery', 11.99, 'yes', 'Stieg Larsson', 'Vintage Crime/Black Lizard'),
    ('9781400031702', 'The Da Vinci Code', 'Mystery', 10.99, 'yes', 'Dan Brown', 'Anchor');

-- Create the IssueStatus table
CREATE TABLE library.IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES library.Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES library.BOOKS(isbn)
);
-- Insert 10 rows into the IssueStatus table
INSERT INTO library.IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (1, 1, 'to kill a ,mockingbird', '2024-02-01', '9780679601085'),
    (2, 2, 'Sense and Sensibility', '2024-02-02', '9780141439662'),
    (3, 3, 'the greate gatsby', '2024-02-03', '9780062316110'),
    (4, 4, 'the hunger games', '2024-02-04', '9788172235652'),
    (5, 5, 'Gitanjali', '2024-02-05', '9788170289186'),
    (6, 6, '1984', '2024-02-06', '9780307947055'),
    (7, 7, 'The alchemist', '2024-02-07', '9780061120084'),
    (8, 8, 'The Catcher in the Rye', '2024-02-08', '9780307277671'),
    (9, 9, 'The Girl with the Dragon Tattoo', '2024-02-09', '9780307477729'),
    (10, 10, 'The Da Vinci Code', '2024-02-10', '9781400031702');
    
    ---- Create the ReturnStatus table
CREATE TABLE library.ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES library.BOOKS(isbn)
);
-- Insert 6 rows into the ReturnStatus table
INSERT INTO library.ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (1, 1, 'The Prophet', '2024-02-11', '9780679601085'),
    (2, 2, 'Sense and Sensibility', '2024-02-12', '9780141439662'),
    (3, 3, 'the greate gatsby', '2024-02-13', '9780062316110'),
    (4, 4, 'the hunger games', '2024-02-14', '9788172235652'),
    (5, 5, 'Gitanjali', '2024-02-15', '9788170289186'),
    (6, 6, '1984', '2024-02-16', '9780307947055');
    
    --  1.Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM library.Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM library.Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Books.Book_title, Customer.Customer_name 
FROM library.BOOKS
JOIN library.Issuestatus ON Books.ISBN = Issuestatus.Isbn_book 
JOIN library.Customer ON Customer.Customer_id = Issuestatus.Issued_cust;

-- 4.Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Count FROM library.Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM library.Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM library.Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN 
(SELECT Issued_cust FROM library.IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM library.Employee GROUP BY Branch_no;

-- 8.Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT Customer_name
FROM library.Customer WHERE Customer_Id IN (
    SELECT Issued_cust
    FROM library.IssueStatus
    WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023
);

-- 9. Retrieve book_title from book table containing history. 
SELECT Book_title
FROM library.Books
WHERE Category LIKE '%history%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(Emp_ID) AS Employee_Count
FROM library.Employee
GROUP BY Branch_no
HAVING COUNT(Emp_ID) > 5;

