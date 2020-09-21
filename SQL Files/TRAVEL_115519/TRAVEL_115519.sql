
-----------------------------------------
--Creation of Table Tbl_City_Group12
-----------------------------------------

CREATE TABLE [Tbl_City_Group12](
	[CityCode] [VARCHAR](3) NOT NULL CONSTRAINT [CityCode_PK] PRIMARY KEY,
	[CityName] [VARCHAR](50) NOT NULL CONSTRAINT [CityName_UNQ] UNIQUE
)

GO

---------------------------------------------------------------------
--Inserting data into Tbl_City_Group12
---------------------------------------------------------------------

INSERT INTO Tbl_City_Group12 VALUES ('BLR','Bangalore')
INSERT INTO Tbl_City_Group12 VALUES ('MUM','Mumbai')
INSERT INTO Tbl_City_Group12 VALUES ('DEL','Delhi')
INSERT INTO Tbl_City_Group12 VALUES ('HYD','Hyderbad')
INSERT INTO Tbl_City_Group12 VALUES ('CHN','Chennai')
INSERT INTO Tbl_City_Group12 VALUES ('PUN','Pune')
INSERT INTO Tbl_City_Group12 VALUES ('MYS','Mysore')
INSERT INTO Tbl_City_Group12 VALUES ('KLK','Kolkatta')
INSERT INTO Tbl_City_Group12 VALUES ('TVM','Trivandrum')
INSERT INTO Tbl_City_Group12 VALUES ('MLR','Mangalore')


SELECT * FROM  Tbl_City_Group12
Sp_help Tbl_City_Group12

-----------------------------------------
--Creation of Table Tbl_Customer_Group12
-----------------------------------------

CREATE TABLE [Tbl_Customer_Group12](
	[CustomerId] [INT] IDENTITY(100,1) 
				CONSTRAINT [CustomerId_PK] PRIMARY KEY NOT NULL,
	[FirstName] [VARCHAR](50) NOT NULL,
	[LAStName] [VARCHAR](50) NOT NULL,
	[Address] [VARCHAR](50) NOT NULL,
	[Email] [VARCHAR](50) NOT NULL CONSTRAINT [Email_UNQ] UNIQUE,
	[Phone] [VARCHAR](10) NOT NULL
)

GO

---------------------------------------------------------------------
--Insrting data into Tbl_Customer_Group12
---------------------------------------------------------------------

INSERT INTO Tbl_Customer_Group12 VALUES ('Larry','Page','Mumbai,India','Larry@gmail.com','9988554410')
INSERT INTO Tbl_Customer_Group12 VALUES ('Sergey','Brin','Kolkatta,India','Sergey@gmail.com','9988554412')
INSERT INTO Tbl_Customer_Group12 VALUES ('Alfred R.','Berkeley','Mysore, Karnataka','AlfredR@gmail.com','9988554414')
INSERT INTO Tbl_Customer_Group12 VALUES ('R K','Laxman','Jharkand,India','RKLaxman@gmail.com','9988554416')
INSERT INTO Tbl_Customer_Group12 VALUES ('Amitabh','Bachan','New Delhi,India','Amitabh@msn.co.in','9988554418')
INSERT INTO Tbl_Customer_Group12 VALUES ('APJ','Kalam','Chennai,India','APJ@gmail.com','9988554420')
INSERT INTO Tbl_Customer_Group12 VALUES ('Salman','Rushdie','Mumbai,India','Rushdie@gmail.com','9988554422')
INSERT INTO Tbl_Customer_Group12 VALUES ('Sanjeev','Kapoor','New Delhi,India','Sanjeev@gmail.com','9988554424')
INSERT INTO Tbl_Customer_Group12 VALUES ('Barkha','Dutta','New Delhi,India','Barkha@msn.co.in','9988554426')
INSERT INTO Tbl_Customer_Group12 VALUES ('Rajdeep','Sardesai','Mangalore, Karnataka','Rajdeep@gmail.com','9988554428')
INSERT INTO Tbl_Customer_Group12 VALUES ('Alan','Turing','New Delhi,India','Alan@msn.co.in','9988554430')
INSERT INTO Tbl_Customer_Group12 VALUES ('Seymour','Cray','New Delhi,India','Seymour@msn.co.in','9988554432')
INSERT INTO Tbl_Customer_Group12 VALUES ('Bill','Gates','New Delhi,India','Bill@msn.co.in','9988554434')
INSERT INTO Tbl_Customer_Group12 VALUES ('Derek O','Brien','Bangalore, Karnataka','Derek@gmail.com','9988554436')
INSERT INTO Tbl_Customer_Group12 VALUES ('Brett','Lee','Delhi,India','Brett@gmail.com','9988554438')

SELECT * FROM Tbl_Customer_Group12


------------------------------------------------
--Creation of Table Tbl_Package_Details_Group12
------------------------------------------------

CREATE TABLE [Tbl_Package_Details_Group12](
  PackageId VARCHAR(4) CONSTRAINT [PackageId_PK]PRIMARY KEY,
  PackageName VARCHAR(50) NOT NULL,
  Location VARCHAR(3) NOT NULL 
				CONSTRAINT[Tbl_Package_Details_Group12_Location_FKEY] 
				REFERENCES Tbl_City_Group12(CityCode),
  StartDate DATETIME NOT NULL,
  EndDate DATETIME NOT NULL ,
  TotalSeats INT NOT NULL,
  FarePerPerson INT NOT NULL,
  Description VARCHAR(100) NOT NULL,
  Tax DECIMAL(10, 2) NOT NULL,	
			CONSTRAINT Tbl_Package_Details_Group12_EndDate_chk 
			CHECK (EndDate>=StartDate)                 
)

SELECT * FROM Tbl_Package_Details_Group12

GO


-----------------------------------------------
--Creation of Table Tbl_Package_Status_Group12
-----------------------------------------------

CREATE TABLE [Tbl_Package_Status_Group12](
	PackageId VARCHAR(4) NOT NULL 
			CONSTRAINT[Tbl_Package_Status_Group12_PackageId_FKEY] 
			REFERENCES Tbl_Package_Details_Group12(PackageId),		
	RemainingSeats INT NOT NULL
)

SELECT * FROM Tbl_Package_Status_Group12

--INSERT INTO Tbl_Package_Status_Group12 VALUES ('P100',290)
--Delete FROM Tbl_Package_Status_Group12

GO


-----------------------------------------------
--Creation of Table Tbl_Travel_Booking_Group12
-----------------------------------------------

CREATE TABLE [Tbl_Travel_Booking_Group12](
	[BookingId] [INT] IDENTITY(700,1) 
			CONSTRAINT [BookingId_PK] PRIMARY KEY NOT NULL,
	[PackageId] [VARCHAR](4) NOT NULL 
			CONSTRAINT [Tbl_Travel_PackageId_Group12_PackageId_FKEY] 
			REFERENCES Tbl_Package_Details_Group12(PackageId),
	[CustomerId] [INT] NOT NULL 
			CONSTRAINT [Tbl_Travel_Booking_Group12_CustomerId_FKEY] 
			REFERENCES Tbl_Customer_Group12(CustomerId),
	[DateOfBooking] DATETIME NOT NULL,
	[NoOfSeats] [INT]
		CONSTRAINT Tbl_Travel_Booking_Group12_NoOfSeats_chk CHECK (NoOfSeats>0)
)

SELECT * FROM Tbl_Travel_Booking_Group12

/*INSERT INTO Tbl_Travel_Booking_Group12 VALUES 
('P101', 100, '1998-05-01 00:00:00', 250)*/


------------------------------------------------
--Creation of Table Tbl_Package_Payment_Group12
------------------------------------------------

CREATE TABLE [Tbl_Package_Payment_Group12](
	[PaymentId] [INT] IDENTITY(7000,1) 
					CONSTRAINT [PaymentId_PK] PRIMARY KEY NOT NULL,
	[BookingId] [INT] NOT NULL 
					CONSTRAINT[Tbl_Package_Payment_Group12_BookingId_FKEY] 
					REFERENCES Tbl_Travel_Booking_Group12(BookingId),
	[TotalAmount] [INT]NOT NULL,
	[TaxAmount] DECIMAL(10,2) NOT NULL
)

SELECT * FROM Tbl_Package_Payment_Group12

--------------------------------------------------
--Creation of Table Tbl_Package_Travelers_Group12
--------------------------------------------------

CREATE TABLE [Tbl_Package_Travelers_Group12](
	[BookingId] [INT] NOT NULL 
				CONSTRAINT[Tbl_Package_Travelers_Group12_BookingId_FKEY] 
				REFERENCES Tbl_Travel_Booking_Group12(BookingId),
	[CustomerId] [INT] NOT NULL 
				CONSTRAINT[Tbl_Package_Travelers_Group12_CustomerId_FKEY] 
				REFERENCES Tbl_Customer_Group12(CustomerId),
	[FirstName] [VARCHAR](50) NOT NULL,
	[LastName] [VARCHAR](50) NOT NULL,
	[TravelerType] char NOT NULL
		CONSTRAINT Tbl_Package_Travelers_Group12_TravelerType_chk 
				CHECK(TravelerType IN ('A', 'C'))
)


SELECT * FROM Tbl_Package_Travelers_Group12


-----------------------------------------------------------------------------------


------------
--FUNCTIONS
------------ 
-----------------------------------------------------------------------------------
--FUNCTION NAME: Travel_fn_GenPackId_Group12
--Input Parameters: None
--Return Values: Next Package ID, the first Package id will be P100; the next
--will be P101.
--Description: The function will generate the next Package Id for the Package
-- module.
-----------------------------------------------------------------------------------


CREATE FUNCTION Travel_fn_GenPackId_Group12()
RETURNS VARCHAR(4)
AS
BEGIN
  /*Declaration of Variables*/
  DECLARE @PackId VARCHAR(4),@TempPackId INT
	  /*Extracting the integer part from the PackageId*/ 	
      SELECT @TempPackId = CONVERT(INT, MAX(SUBSTRING(PackageId, 2, 3))) 
								 FROM Tbl_Package_Details_Group12
	/*If the table does not have any existing records, 
	 it generates the first Package Id as 'P101'*/
 IF (@TempPackId = 0)
   BEGIN
       SET @PackId = 'P101'
       return @PackId
   END
	/* Takes the last Package Id and generates next Package Id*/
 ELSE
  BEGIN
       SET  @TempPackId = @TempPackId + 1
       SET @PackId = 'P' +CONVERT(CHAR(3), @TempPackId) 
   END
	 return @PackId
END


--To Execute the Function
--------------------------

DECLARE @RetPackId VARCHAR(4)
EXEC @RetPackId = Travel_fn_GenPackId_Group12
SELECT @RetPackId AS NextPackageID

DROP FUNCTION Travel_fn_GenPackId_Group12
SELECT * FROM Tbl_Package_Details_Group12



---------------------------END of FUNCTION-------------------------------------


------------------
--TRIGGERS
------------------
-- INSERT TRIGGER: Travel_trg_Insert_Group12
--------------------------------------------------------------------------------
/*Trigger table: Travel Booking Table
  Trigger events: Insert.
  DESCRIPTION: When a record is inserted into the Travel Booking table, reduce
			 the no. of seats in the Package Status table and also take care if
			 seats are deleted from booking table, increment the No. of seats
	         in the Package Status table.*/
----------------------------------------------------------------------------------
CREATE TRIGGER Travel_trg_Insert_Group12 ON Tbl_Travel_Booking_Group12
FOR INSERT AS
BEGIN
	/*Declaration of variables*/
   	DECLARE @i_NoOfSeats_Inserted INT,  @v_PackageId VARCHAR(4), 
										@i_NoOfSeats_Available INT
	/*Retriving Data From the Special table inserted*/
	SELECT @i_NoOfSeats_Inserted = (SELECT NoOfSeats FROM inserted)
	SELECT @v_PackageId = (SELECT PackageId FROM inserted)
	SELECT @i_NoOfSeats_Available = (SELECT RemainingSeats 
	FROM Tbl_Package_Status_Group12 
	WHERE PackageId = @v_PackageId)
		/*Reduces the no. of seats in the Package Status table by the no. 
		of seats booked for that particular package if the no. of seats 
		booked is less than or equal to Available seats*/
		IF(@i_NoOfSeats_Inserted <= @i_NoOfSeats_Available)
			BEGIN
				UPDATE Tbl_Package_Status_Group12 
				SET RemainingSeats = RemainingSeats - @i_NoOfSeats_Inserted
				WHERE PackageId = @v_PackageId	
				COMMIT TRAN		
			END
		/* If the no. of seats booked is more than to Available seats*/
		ELSE
			BEGIN
				PRINT 'ERROR during Insertion of data'
				PRINT 'Number of Seats Entered are not Available'
				ROLLBACK TRAN
			END
END

--------------------------------
--To Execute the Insert Trigger
--------------------------------

INSERT INTO Tbl_Travel_Booking_Group12 VALUES('P100',101,'1996-05-01 00:00:00', 90)
INSERT INTO Tbl_Travel_Booking_Group12 VALUES('P101',100,'1996-03-01 00:00:00', 400)

SELECT * FROM Tbl_Travel_Booking_Group12
SELECT * FROM  Tbl_Package_Status_Group12 

DROP TRIGGER Travel_trg_Insert_Group12



---------------------------------------------
-- DELETE TRIGGER: Travel_trg_Delete_Group12
---------------------------------------------
--------------------------------------------------------------------------------
/*Trigger table: Travel Booking Table
  Trigger events: Delete.
  DESCRIPTION: When a record is inserted into the Travel Booking table, reduce
			 the no. of seats in the Package Status table and also take care if
			 seats are deleted from booking table, increment the No. of seats
	         in the Package Status table.*/
--------------------------------------------------------------------------------
CREATE TRIGGER Travel_trg_Delete_Group12 on Tbl_Travel_Booking_Group12
for delete
AS
BEGIN 
	/*Declaration of variables*/
	DECLARE @i_NoOfSeats_Deleted INT, @v_PackageId VARCHAR(4)
	/*Retriving Data From the Special table deleted*/
	SELECT @i_NoOfSeats_Deleted = (SELECT NoOfSeats FROM deleted)
	SELECT @v_PackageId = (SELECT PackageId FROM deleted)
	/*Increases the no. of seats in the Package Status table by the
	 no. of seats that are deleted*/
	UPDATE Tbl_Package_Status_Group12 
	SET RemainingSeats = RemainingSeats + @i_NoOfSeats_Deleted
	WHERE PackageId = @v_PackageId
END

--------------------------------
--To Execute the Delete Trigger
--------------------------------

DELETE FROM Tbl_Travel_Booking_Group12 WHERE BookingId = 702

SELECT * FROM Tbl_Travel_Booking_Group12
SELECT * FROM  Tbl_Package_Status_Group12 
DROP TRIGGER Travel_trg_Delete_Group12


--------------------------------------------
--UPDATE TRIGGER: Travel_trg_Update_Group12
--------------------------------------------
-------------------------------------------------------------------------------
/*Trigger table: Travel Booking Table
  Trigger events: Update.
  DESCRIPTION: When a record is inserted into the Travel Booking table, reduce
			 the no. of seats in the Package Status table and also take care if
			 seats are deleted from booking table, increment the No. of seats
	         in the Package Status table.*/
---------------------------------------------------------------------------------
CREATE TRIGGER Travel_trg_Update_Group12 on Tbl_Travel_Booking_Group12
for UPDATE
AS
BEGIN 
	IF UPDATE(NoOfSeats)
	BEGIN
		/*Declaration of variables*/
		DECLARE @i_NoOfSeats_Updated INT, @v_PackageId VARCHAR(4), 
		@i_noofseats_deleted INT, @i_noofseats_available INT
		/*Retriving Data From the Special table deleted and inserted*/		
		SELECT @i_NoOfSeats_Updated  = (SELECT NoOfSeats FROM inserted)
		SELECT @v_PackageId = (SELECT PackageId FROM inserted)
		SELECT @i_NoOfSeats_Deleted = (SELECT NoOfSeats FROM deleted)
		SELECT @i_NoOfSeats_Available = (SELECT RemainingSeats 
		FROM Tbl_Package_Status_Group12
		WHERE PackageId=@v_PackageId)

		/*Number of seats Updated should be <= Available seats + Deleted*/
		IF(@i_NoOfSeats_Updated  <= (@i_NoOfSeats_Available + @i_NoOfSeats_Deleted))
		
		BEGIN 
			UPDATE Tbl_Package_Status_Group12 
			SET RemainingSeats = (RemainingSeats + @i_NoOfSeats_Deleted)
													- @i_NoOfSeats_Updated 
			WHERE PackageId = @v_PackageId
			COMMIT TRAN
		END
		/*If Number of seats Updated is more than Available seats + 
			Deleted seats*/
		ELSE
		BEGIN
				PRINT 'ERROR during Insertion of data'
				PRINT 'Number of Seats Entered are not Available'
			ROLLBACK TRAN
		END
	END
END

--------------------------------
--To Execute the Update trigger
--------------------------------

UPDATE Tbl_Travel_Booking_Group12 SET NoOfSeats = 100 WHERE BookingId = 704

SELECT * FROM Tbl_Travel_Booking_Group12
SELECT * FROM  Tbl_Package_Status_Group12 
DROP TRIGGER Travel_trg_Update_Group12



------------------------------END of TRIGGERS---------------------------------



--------------------
-- STORED PROCEDURES
--------------------
--PROCEDURE #1
--------------------
--PROCEDURE TO CHECK THE AVAILABILITY STATUS
---------------------------------------------
--------------------------------------------------------------------------------
--PROCEDURE NAME: Travel_P_AvailStatus_Group12
--Input Parameters: Package Id, No Of Seats.
--Output Parameters: Availability Status, value will be 1 if the seats are 
--available else 0.
--Description: The procedure will check the no. of seats available for a
--particular package. The remaining seats are checked in the Package 
--Status table.
---------------------------------------------------------------------------------

				
CREATE PROC Travel_P_AvailStatus_Group12
(@in_v_PackageId VARCHAR(4), @in_i_NoOfSeats INT, @out_i_AvailStatus INT OUTPUT)
AS
BEGIN
		/*Declaration of variables*/
		DECLARE @i_Avail INT
		SELECT @i_Avail = (SELECT RemainingSeats 
		FROM Tbl_Package_Status_Group12
		WHERE PackageId = @in_v_PackageId)
		/*If the Package Id exists and the value of No Of Seats is greater
		 than the value of Remaining Seats field of Package Status table*/
		IF (@i_Avail < @in_i_NoOfSeats)
		SET @out_i_AvailStatus = 0
		/*If the Package Id exists and the value of No Of Seats is less 
		 than the value of Remaining Seats field of Package Status table*/
		ELSE
		SET @out_i_AvailStatus = 1
		/*If the Package Id does not exist in the Package Details Table*/
		IF not exists (SELECT PackageId FROM Tbl_Package_Status_Group12 WHERE PackageId = @in_v_PackageId)
		SET @out_i_AvailStatus = 0
END


DROP PROC Travel_P_AvailStatus_Group12
SELECT * FROM Tbl_Package_Status_Group12


------------
--Execution
------------
--Test Case 1: When the PackageId does not exist
-------------------------------------------------

SELECT * FROM Tbl_Package_Status_Group12

DECLARE @out_i_AvailStatus INT
EXEC Travel_P_AvailStatus_Group12 'P109', 10, @out_i_AvailStatus OUTPUT
SELECT @out_i_AvailStatus AS AvailableStatus

--Expected Output
------------------
		--AvailableStatus: 0
		---------------------

--Test Case 2: If PackageID exists and No. Of Seats less than 
--                available Seats in the Package Status table
----------------------------------------------------------------


SELECT * FROM Tbl_Package_Status_Group12

DECLARE @out_i_AvailStatus INT
EXEC Travel_P_AvailStatus_Group12 'P100', 100, @out_i_AvailStatus OUTPUT
SELECT @out_i_AvailStatus AS AvailableStatus

--Expected OUTPUT
------------------
		--AvailableStatus: 1
		---------------------


--Test Case 3: If PackageID exists and No. Of Seats greater than
--                    available Seats in the Package Status table
------------------------------------------------------------------


SELECT * FROM Tbl_Package_Status_Group12

DECLARE @out_i_AvailStatus INT
EXEC Travel_P_AvailStatus_Group12 'P100', 2791, @out_i_AvailStatus OUTPUT
SELECT @out_i_AvailStatus AS AvailableStatus

--Expected Output
------------------
		--AvailableStatus: 0
		---------------------
			
----------------------------------------------------------------------------
			
---------------
--PROCEDURE #2
---------------
--PROCEDURE TO INSERT RECORDS INTO THE TRAVEL BOOKING TABLE
------------------------------------------------------------
-----------------------------------------------------------------------------
--PROCEDURE NAME: Travel_P_InsertRec_Group12
--Input Parameters: Package Id, Customer Id, Date Of Booking, No Of Seats.
--Output Parameters: Status, value will be 1 in case of successful insertion,
-- 0 in case of any other errors.Booking Id, return booking id after successful
-- insertion, else return 0.
--Description: This procedure will make use of the procedure (mentioned above)
-- to check whether the seats are available. If the seats are available, then
-- the records are inserted into the Travel Booking table, else suitable
-- message is returned.
------------------------------------------------------------------------------


CREATE PROC Travel_P_InsertRec_Group12
/*Declaration of variables*/
(@in_v_PackageId VARCHAR(4),
@in_i_CustomerId INT,
@in_dt_DateOfBooking DATETIME,
@in_i_NoOfSeats INT,
@out_i_Status INT OUTPUT,
@out_i_Bookingid INT OUTPUT)
AS
BEGIN
	SET @out_i_Status = 0
	SET @out_i_BookingId = 0
	/*No of seats inserted is between 0 and 4*/
	IF (@in_i_NoOfSeats <=4 and @in_i_NoOfSeats>0)
	BEGIN
	/*Execution of Procedure Travel_P_AvailStatus_Group12
	 to get the Available status*/
	EXEC Travel_P_AvailStatus_Group12 @in_v_PackageId, @in_i_NoOfSeats, 
													@out_i_Status OUTPUT
	DECLARE @dt_StartDate DATETIME
	SELECT @dt_StartDate=(SELECT StartDate FROM Tbl_Package_details_Group12 
		WHERE PackageId=@in_v_PackageId)
	/* Date of booking should be less than Startdate*/
	IF(@dt_StartDate > @in_dt_DateOfBooking)
	SET @out_i_Status = 0
	/*  If PackageID exists and No. Of Seats less than available 
		Seats in the Package Status table*/
	IF (@out_i_Status=1)
	BEGIN
		DECLARE @tab_BookingId TABLE(BookingId INT)
		INSERT INTO Tbl_Travel_Booking_Group12
		OUTPUT Inserted.BookingId INTO @tab_BookingId
		VALUES(@in_v_PackageId, @in_i_CustomerId, @in_dt_DateOfBooking,
													 @in_i_NoOfSeats)
		IF(@@error<>0)
		BEGIN
		SET @out_i_Status=1
		SELECT @out_i_BookingId = (SELECT MAX(BookingId) FROM @tab_BookingId)
		PRINT 'Data Inserted Successfully'
		END
		ELSE
		BEGIN
			PRINT 'ERROR during Insertion of data'
		END
	END
END
END


DROP PROC Travel_P_InsertRec_Group12

--EXECUTION
------------

--Test Case 1: IF date of booking less than startdate or number of seats <= 0
------------------------------------------------------------------------------

--A. 

SELECT * FROM Tbl_Travel_Booking_Group12
SELECT * FROM Tbl_Package_Details_Group12


DECLARE @out_i_Status INT, @out_i_BookingId INT
EXEC Travel_P_InsertRec_Group12 'P101', 100, '2005-10-06 00:00:00.000', 1,
						    @out_i_STATUS OUTPUT,@out_i_BookingId OUTPUT
SELECT @out_i_Status AS STATUS, @out_i_BookingId AS BookingId 


--B.

DECLARE @out_i_Status INT, @out_i_BookingId INT
EXEC Travel_P_InsertRec_Group12 'P100', 100, '2007-12-09 00:00:00', 10,
						    @out_i_STATUS OUTPUT, @out_i_BookingId OUTPUT
SELECT @out_i_Status AS STATUS, @out_i_BookingId AS BookingId 


--Expected OUTPUT
------------------
		--Status: 0, BookingID: 0
		--------------------------



--Test Case 2: If number of seats are not available as per Status table
------------------------------------------------------------------------

SELECT * FROM Tbl_Travel_Booking_Group12

DECLARE @out_i_STATUS INT, @out_i_BookingId INT
EXEC Travel_P_InsertRec_Group12 'P101', 100, '1995-12-09 00:00:00', 300,
						    @out_i_Status OUTPUT, @out_i_BookingId OUTPUT
SELECT @out_i_Status AS STATUS, @out_i_BookingId AS BookingId 

--Expected OUTPUT
------------------
		--STATUS: 0, BookingID: 0
		-------------------------



--PROCEDURE #3
---------------
--PROCEDURE TO CALCULATE TOTAL AMOUNT AND TAX AMOUNT FOR PARTICULAR BOOKING
----------------------------------------------------------------------------
--PROCEDURE NAME: Travel_P_AmountCalc_Group12
--Input Parameters: Booking Id
--Output Parameters: Total Amount, Tax Amount.
--Description: Calculate the total amount and the tax to be paid by the 
--customer. Amount is calculated based on the package chosen.
-----------------------------------------------------------------------------


CREATE  PROC Travel_P_AmountCalc_Group12
(
	/*Declaration of variables*/
	@BookingId INT,
	@TotalAmount INT OUTPUT,
	@TaxAmount DECIMAL(10,2) OUTPUT
)
AS
BEGIN
	/*If Booking Id does not exist in the Package Booking Table*/
	IF not exists (SELECT BookingId 
		FROM Tbl_Travel_Booking_Group12 
		WHERE BookingId = @BookingId)
	BEGIN
		SET @TotalAmount = 0
		SET @TaxAmount = 0
	END
	/*If Booking Id exists in the Package Booking Table*/
	ELSE
	BEGIN
		/* Declaration of variables*/
		DECLARE @TravellerCount INT, @FarePerPerson INT, @PackageID VARCHAR(4)
		DECLARE @Tax DECIMAL(15, 2)
		SELECT @TravellerCount = NoOfSeats, @PackageID = PackageID
			 FROM Tbl_Travel_Booking_Group12
		SELECT @FarePerPerson = FarePerPerson
			 FROM Tbl_Package_Details_Group12 
		 WHERE PackageID = @PackageID
		SELECT @Tax = Tax FROM Tbl_Package_Details_Group12 
		 WHERE PackageID = @PackageID
		/* Calculation of the Total amount and Tax amount*/
		SET @TotalAmount = @TravellerCount * @FarePerPerson
		SET @TaxAmount = ((@TotalAmount * @Tax)/100)
		/*Inserting into the table Tbl_Package_Payment_Group12*/
		INSERT INTO Tbl_Package_Payment_Group12 VALUES (@BookingId, @TotalAmount, @TaxAmount)
	END	
END

					
--EXECUTION
------------
--Test Case 1: If Booking Id does not exists in the package booking table
--------------------------------------------------------------------------

Select * from Tbl_Package_Details_Group12
Select * from Tbl_Travel_Booking_Group12


DECLARE @TotalAmount INT, @TaxAmount DECIMAL(10,2)
EXEC Travel_P_AmountCalc_Group12 727, @TotalAmount  OUTPUT, @TaxAmount OUTPUT
SELECT @TotalAmount AS TotalAmount, @TaxAmount AS TaxAmount

--Expected OUTPUT:
-------------------
		--TotalAmount: 0, TaxAmount: 0.0
		---------------------------------


--Test Case 2: If Booking Id  exists in the package booking table
------------------------------------------------------------------

Select * from Tbl_Package_Payment_Group12
Select * from Tbl_Package_Details_Group12
Select * from Tbl_Travel_Booking_Group12

DECLARE @TotalAmount INT,@TaxAmount DECIMAL(10,2)
EXEC Travel_P_AmountCalc_Group12 700, @TotalAmount OUTPUT, @TaxAmount OUTPUT
SELECT @TotalAmount AS TotalAmount, @TaxAmount AS TaxAmount


DROP PROCEDURE Travel_P_AmountCalc_Group12

--Expected OUTPUT:
------------------
		--TotalAmount: 1450000, TaxAmount: 232000.00
		---------------------------------------------


		
-------------------------------------------------------------------------------

