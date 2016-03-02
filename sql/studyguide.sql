SQL SERVER:

--DROP FOREIGN KEY CONSTRAINT 
ALTER TABLE table 
DROP CONSTRAINT FK_otherTable; 

--IDENTITY INSERT
SET IDENTITY_INSERT table ON;

--SELECT
SELECT * FROM table;

--DELETE
DELETE FROM table WHERE id = 1;

--UPDATE 
UPDATE table
SET x=y
WHERE z=1;

--UPDATE TRIGGER
CREATE TRIGGER EmployeeUpdate ON HumanResources.Employee 
AFTER UPDATE 
AS
IF (UPDATE(VacationHours) or UPDATE(SickLeaveHours))
	BEGIN 
	DECLARE 
	@sickleavehours int, @vacationhours as int, @businessEntityID int
	SELECT @sickleavehours = (select SickLeaveHours from inserted) 
	SELECT @vacationhours = (select VacationHours from inserted) 
	SELECT @businessEntityID = (select BusinessEntityID from inserted)

	UPDATE HumanResources.Employee
	SET totalHours = isNull(@sickleavehours, 0) + isNull(@vacationhours,0)
	WHERE BusinessEntityID = @businessEntityID;
END 

--INSERT TRIGGER
CREATE TRIGGER EmployeeTotalHours ON HumanResources.Employee 
AFTER INSERT 
AS
BEGIN 
	DECLARE 
	@sickleavehours int, @vacationhours as int, @businessEntityID int
	SELECT @sickleavehours = (select SickLeaveHours from inserted) 
	SELECT @vacationhours = (select VacationHours from inserted) 
	SELECT @businessEntityID = (select BusinessEntityID from inserted)
	UPDATE HumanResources.Employee
	SET totalHours = isNull(@sickleavehours, 0) + isNull(@vacationhours,0)
	WHERE BusinessEntityID = @businessEntityID;
END 

--DELETE TRIGGER
CREATE TRIGGER deleteRecord
ON HumanResources.Shift
FOR DELETE
AS
	DECLARE 
	@shiftID int, @name NVARCHAR(50), @startTime TIME, @endTime TIME, @modifiedDate DATETIME

	SELECT @shiftID = (SELECT ShiftID FROM deleted)
	SELECT @name = (SELECT Name FROM deleted)
	SELECT @startTime = (SELECT StartTime FROM deleted)
	SELECT @endTime = (SELECT EndTime FROM deleted)
	SELECT @modifiedDate = (SELECT ModifiedDate FROM deleted)

	INSERT INTO ShiftArchive (ShiftID, Name, StartTime, EndTime, ModifiedDate) VALUES(@shiftID, @name, @startTime, @endTime, @modifiedDate);
GO

--ALTER COLUMN 
ALTER TABLE table 
ALTER COLUMN x VARCHAR(50) NULL; 

--ADD COLUMN
ALTER TABLE table
ADD COLUMN z int NOT NULL;

--ADDING COLUMNS VALUES
UPDATE table
SET totalHours = isNull(x,0)+isNull(y,0);

--SELECT NULL & CONCAT
SELECT (isNull(y,'') + ' ' + isNull(x,'empty'))name FROM table;

--UNION
SELECT * FROM table
UNION SELECT * FROM table2; 

--SUBSTRING
SELECT SUBSTRING(name,1,2) FROM table;

--SELECT INTO 
SELECT * INTO newTable FROM table;

--COUNT 
SELECT count(*) FROM table;

--LIKE 
SELECT * FROM table WHERE name LIKE '%a%';

--UPPER 
SELECT UPPER(name) FROM table;

--AUTO_INCREMENT
column VARCHAR(30) IDENTITY(1,1) NOT NULL,

--SELECT TOP 100
SELECT TOP 100 table;

--EXECUTE PROCEDURE
EXEC procedure x, y, z;

--CREATE PROCEDURE
CREATE PROCEDURE procedure (@DateOfAccident DATE, @AccidentDescription VARCHAR(140), @AccidentLocation VARCHAR(20), @EmployeeID INT)
AS 
BEGIN 
	INSERT INTO Accident (DateOfAccident, AccidentDescription, AccidentLocation, EmployeeID) VALUES(@DateOfAccident, @AccidentDescription, @AccidentLocation, @EmployeeID);
END
GO

CREATE PROCEDURE procedure2 (@AccidentID INT, @DateOfAccident DATE, @AccidentDescription VARCHAR(140), @AccidentLocation VARCHAR(20), @EmployeeID INT)
AS 
BEGIN 
	UPDATE Accident 
	SET DateOfAccident = @DateOfAccident, AccidentDescription=@AccidentDescription, AccidentLocation=@AccidentLocation, EmployeeID=@EmployeeID
	WHERE AccidentID=@AccidentID
END 
GO 

--ALTER PROCEDURE
ALTER PROCEDURE procedure2 (@AccidentID INT)
AS 
BEGIN
	DELETE FROM Accident WHERE AccidentID = @AccidentID
END
GO

--DROP PROCEDURE
DROP PROCEDURE procedure;

-- ------------------------------------------
-- C#

-- +ViewState vs Session Variables (Only on page vs All pages)
-- +OWASP = Open Source Security Organization
-- +Result Set Processing?
-- DataTable subjects = new DataTable();
--             using (SqlConnection con = new SqlConnection(CS))
--             {
--                 SqlDataAdapter adapter = new SqlDataAdapter("SELECT EmployeeID, (LastName + ', ' + FirstName) fullName FROM Employee ORDER BY fullName DESC", CS);
--                 adapter.Fill(subjects);

--                 drpEmployeeID.DataSource = subjects;
--                 drpEmployeeID.DataTextField = "fullName";
--                 drpEmployeeID.DataValueField = "EmployeeID";
--                 drpEmployeeID.DataBind();
--             }

-- +SQL INJECTION


-- +RUNNING A STORED PROCEDURE IN LAB3
-- protected void btnAddAccident_Click(object sender, EventArgs e)
--     { 
--         System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
--         sc.ConnectionString = CS;
--         sc.Open();
--         using(SqlConnection con = new SqlConnection(CS))
--         {
--             con.Open();

--             SqlCommand cmd = new SqlCommand("insertAccidentAQ",con);

--             System.Diagnostics.Debug.Write(drpEmployeeID.SelectedValue);
--             Accident a = new Accident(Convert.ToInt16(drpEmployeeID.SelectedValue.ToString()), Convert.ToDateTime(txtDateOfAccident.Text), txtAccidentDescription.Text, txtAccidentLocation.Text);

--             cmd.CommandType = System.Data.CommandType.StoredProcedure;
--             cmd.Parameters.AddWithValue("@DateOfAccident", a.getDate());
--             cmd.Parameters.AddWithValue("@AccidentDescription", a.getDescription());
--             cmd.Parameters.AddWithValue("@AccidentLocation", a.getLocation());
--             cmd.Parameters.AddWithValue("@EmployeeID", a.getEmployeeID());

--             cmd.ExecuteNonQuery();
--         }
        
--         clearAccident(); 
--     }

-- +RUNNING PARAMETERIZED IN LAB3
-- protected void btnDeleteEmployee_Click(object sender, EventArgs e)
--     {
--         System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
--         sc.ConnectionString = CS;
--         sc.Open();
--         System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
--         insert.Connection = sc;

--         insert.CommandText = "DELETE FROM Employee WHERE EmployeeID = @EmployeeID";

--         int selection = Convert.ToInt16(drpEmployeeList.SelectedValue);
--         SqlParameter employeeID = new SqlParameter("@EmployeeID", SqlDbType.Int);
--         employeeID.Value = selection;
--         insert.Parameters.Add(employeeID);

--         insert.ExecuteNonQuery();

--         clearEmployee();
--     }

QUIZ 3

-- Parameterized queries:  know how to turn non parameterized query into parameterized
--   //Inserting Employee Info
--                 for (int i = 0; i < Employee.emplCount; i++)
--                 {
--                    insert.CommandText = "insert into [dbo].[Employee] values('" +emplArray[i].getFirst()+ "','" 
--                 +emplArray[i].getLast()+ "','"+emplArray[i].getMI()+ "','" +emplArray[i].getAdd()+ "','" +emplArray[i].getZip()+ "','"
--                 +emplArray[i].getDOB()+ "','" +emplArray[i].getHire()+ "','" +emplArray[i].getTerm()+ "'," +emplArray[i].getSalary()+ ",'" 
--                 +emplArray[i].getLicense()+ "','"+emplArray[i].getStates()+ "','"+emplArray[i].getCountry()+"') ";
--                     insert.ExecuteNonQuery();
-- //Parameterized Insert Query
--             string query = "insert into [dbo].[Employee] values (@fName, @lName, @middle, @address, @zip, @DOB, @hire, @term, @salary, @license, @state, @country)";
--             System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand(query, sc);
            
--             insert.Parameters.AddWithValue("@fname", emplObject.getFirst());
--             insert.Parameters.AddWithValue("@lname", emplObject.getLast());
--             insert.Parameters.AddWithValue("@middle", emplObject.getMI());
--             insert.Parameters.AddWithValue("@address", emplObject.getAdd());
--             insert.Parameters.AddWithValue("@zip", emplObject.getZip());
--             insert.Parameters.AddWithValue("@DOB", emplObject.getDOB());
--             insert.Parameters.AddWithValue("@hire", emplObject.getHire());
--             insert.Parameters.AddWithValue("@term", emplObject.getTerm());
--             insert.Parameters.AddWithValue("@salary", emplObject.getSalary());
--             insert.Parameters.AddWithValue("@license", emplObject.getLicense());
--             insert.Parameters.AddWithValue("@state", emplObject.getStates());
--             insert.Parameters.AddWithValue("@country", emplObject.getCountry());
--             insert.ExecuteNonQuery();

--inner join is the insersection of cirlces. left outer is teh same as left. 
-- Left Join : returns all rows from the left table (table1), with the matching rows in the right table (table2). The result is NULL in the right side when there is no match
SELECT * FROM dbo.Employee LEFT JOIN dbo.Accident ON dbo.Employee.EmployeeID = dbo.Accident.EmployeeID;

-- Inner Join: selects all rows from both tables as long as there is a match between the columns in both tables
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

-- Find how many records are in the database with Left Join and Inner Join:
SELECT COUNT(*) FROM dbo.Employee LEFT JOIN dbo.Accident ON dbo.Employee.EmployeeID = dbo.Accident.EmployeeID;
SELECT COUNT(*) FROM Employee INNER JOIN Accident ON dbo.Employee.EmployeeID = dbo.Accident.EmployeeID;

-- Grid View: look at .Net Pane

--NOTES
-- IS NULL: selects only the records with NULL values
-- ex. Select LastName, FirstName, Address FROM Persons WHERE Address IS NULL
-- ISNULL: explains how we want to treat NULL values
-- 	Ex. Select LastName, FirstName, Address, isNull(FirstName,’’)+’’+ isNull( LastName,’’) FROM Persons

BASIC SQL
CREATE TABLE Employee
(FirstName varchar(20) Primary Key NOT NULL,
LastName varchar(30) NOT NULL,
MiddleName char(1) NOT NULL); 

DROP TABLE dbo.Employee;

ALTER TABLE dbo.Employee
ADD EmplID int NOT NULL;

ALTER TABLE dbo.Employee
ALTER COLUMN MiddleName char(1);

ALTER TABLE dbo.Employee
DROP COLUMN MiddleName 

INSERT INTO dbo.Employee VALUES ('Ethan', 'Lohr', 'R');

DELETE FROM dbo.Employee where (MiddleName) = 'R'

UPDATE [dbo].[Employee]
   SET [FirstName] = 'May'
      ,[LastName] = 'Has'
      ,[MiddleName] = '2'
 WHERE FirstName = 'Cubs'

-- Hashing: cryptic format password to make things more secure
-- AWSetPasswordHash: shows first, last of first record in the database, updates location in table to store hash version, MD5 = levels of security
-- AWLogin: LOOK AT CODE. Stacks 3 layers. Compute being the lastHash being the last. 

-- DatePart:  Have to calculate month and year, always pretend like it is the first of the month

	-- ATTEMPT 1
	This one will get the days of any month that you enter in the date and set to the @actualDate parameter: 

	---First run this first part to create the function---

	CREATE FUNCTION dbo.daysOfMonth (@Date datetime)
	RETURNS int
	with execute AS caller
	AS
	BEGIN
	DECLARE @DaysInMonth int
	SET @DaysInMonth = day(dateadd(mm,datediff(mm,-1,@Date),-1))
	RETURN @DaysInMonth
	END
	----------------------------------------------------------------------------------------------------------

	---Then run this part to print the days in the desired month as the query result---

	DECLARE @actualDate datetime
	DECLARE @daysInMonth int
	SET @actualDate='2015-04-21'
	SET @daysInMonth = (SELECT dbo.daysOfMonth(@actualDate))
	Print @daysInMonth;
	----------------------------------------------------------------------------------------------------------

	--ATTEMPT 2
	CREATE FUNCTION [dbo].[DaysInYear] (@Date datetime)
	Returns int
	with execute as caller
	AS
	BEGIN
	 
	DEclare
	@currentYear Datetime,
	@nextYear Datetime,
	@DaysInYear int;
	 
	If DATEPART(m,@Date)>=7
	Begin
	Set @currentYear = CAST ((DATEPART(yyyy,@Date)+1) as Char (4)) + '-01-01'
	Set @nextYear = CAST ((DATEPART(yyyy,@Date)+2) as Char (4)) + '-01-01'
	end
	Else
	Begin
	Set @currentYear= CAST (DATEPART(yyyy,@Date) as Char (4)) + '-01-01'
	set @nextYear = CAST ((DATEPART(yyyy,@Date)+1) as Char (4)) + '-01-01'
	end
	 
	set @DaysInYear = DATEDIFF(d,@currentYear,@nextYear)
	return @DaysInYear
	END
	 
	--drop function
	DROP Function [dbo].[DaysInYear]

	--test function
	Declare @DaysInYear as int
	Declare @ActualDate as datetime
	 
	Set @ActualDate='2015-07-01'
	Select @DaysInYear = (Select [dbo].[DaysInYear] (@ActualDate))
	Print @DaysInYear

	--ATTEMPT 3
	Create FUNCTION [dbo].[DaysInMonth] (@Date datetime)
	RETURNS int
	with execute as caller
	AS
	BEGIN
	 
	Declare
	@currentYear Datetime,
	@nextYear Datetime,
	@DaysInMonth int
	 
	If DATEPART(m,@Date) >=7
	Begin
	      Set @currentYear = Cast((DATEPART(yyyy,@Date) + 1) as CHAR(4)) + '-01-01'
	      Set @nextYear = Cast((DATEPART(yyyy,@Date) + 2) as CHAR(4)) + '-01-01'
	end
	Else
	Begin
	      Set @currentYear = Cast(DATEPART(yyyy,@Date)as CHAR(4)) + '-01-01'
	      Set @nextYear = Cast((DATEPART(yyyy,@Date) + 1) as CHAR(4)) + '-01-01'
	End
	 
	Set @DaysInMonth = datediff(day, dateadd(day, 1-day(@date), @date),
	              dateadd(month, 1, dateadd(day, 1-day(@date), @date)))
	 
	RETURN @DaysInMonth 
	 
	END

	//testing 

	Declare @DaysInMonth as int
	Declare @ActualDate as datetime
	--Set @ActualDate = '2017-02-13'
	Set @ActualDate = '2017-02-13'
	Select @DaysInMonth  = (Select dbo.DaysInMonth (@ActualDate))
	Print @DaysInMonth

	///shorter way

	CREATE FUNCTION [dbo].[get_days](@date datetime)
	RETURNS int
	AS
	BEGIN
	    SET @date = DATEADD(MONTH, 1, @date)
	    DECLARE @result int = (select DAY(DATEADD(DAY, -DAY(@date), @date)))
	    RETURN @result
	END

	//both work 
