--Normal Insert Statement
INSERT INTO table_name (Column1, Column 2....)
VALUES (value1, value2, ...);


-- If we have specified all column values as per table column order.

INSERT INTO table_name 
VALUES (value1, value2, ...);

-- Insert into select statement syntax 

INSERT INTO table1 (col1, col2, col3, …)
SELECT col1, col2, col3, …
FROM table2

-- If we want to add all record from one table to another table then we can use below query
-- Note the number of supplied column in select statement should be in table definition
INSERT INTO Customers
       SELECT *
       FROM Employees;

-- If we need to specify column in insert to statement.
INSERT INTO Customers (Emp_ID ,Name)
       SELECT *
       FROM Employees;

-- If we need to use the top 1 data in a table.
INSERT TOP(1) INTO Customers (Emp_ID,  Name, City)
       SELECT ID, Name,'Delhi' FROM Employees;

-- If need to insert with some join clause
Insert into tableName 
select a.columnx, b.columny
from tableNameA a INNER JOIN tableB b ON a.cloumnx =  b.columny 


-- We can use CTE 

;WITH EmployeeData_Temp([FirstName], 
                       [MiddleName], 
                       [JobTitle]
     AS (
 
     SELECT p.[FirstName], 
            p.[MiddleName], 
            e.[JobTitle] 
     FROM [HumanResources].[Employee] e
          INNER JOIN [Person].[Person] p ON p.[id] = e.[id])
INSERT INTO HumanResources.EmployeeData
            SELECT *
            FROM EmployeeData_Temp;
GO

-- Using table variable 

DECLARE @TableVar table(  
    [FirstName], 
    [MiddleName]
  )
  
-- Insert values into the table variable.  
INSERT INTO @TableVar 
    SELECT  
   [FirstName], 
    [MiddleName]
    FROM [XYZ]
  
-- View the table variable result set.  
SELECT * FROM @TableVar;  
GO 