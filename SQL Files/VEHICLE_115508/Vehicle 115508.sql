/*********************************************************************************/
--							Creating Tables
/*********************************************************************************/

--1.Tbl_City_Group12
-----------------------------------------------------------------------------------

drop table Tbl_City_Group12

CREATE TABLE Tbl_City_Group12(
	CityCode varchar(3) CONSTRAINT CityCode_PK PRIMARY KEY,
	CityName varchar(50) NOT NULL UNIQUE
)
GO

SELECT *  from [Tbl_City_Group12]
/*********************************************************************************/
--2.Tbl_Customer_Group12
-----------------------------------------------------------------------------------

drop table Tbl_Customer_Group12

CREATE TABLE Tbl_Customer_Group12(
	CustomerId int IDENTITY(101,1) CONSTRAINT Customer_Id_PK PRIMARY KEY ,
	FirstName varchar(50) NOT NULL,
	LastName varchar (50) NOT NULL,
	Address varchar (50) NOT NULL,
	Email varchar(50) NOT NULL UNIQUE,
	Phone varchar(10) 
)
GO

SELECT * FROM Tbl_Customer_Group12

/*********************************************************************************/
--3.Tbl_Vehicle_Details_Group12
-----------------------------------------------------------------------------------

drop table Tbl_Vehicle_Details_Group12

CREATE TABLE Tbl_Vehicle_Details_Group12(
VehicleType varchar(10) NOT NULL,
Location varchar(3) NOT NULL CONSTRAINT Location_FK REFERENCES Tbl_City_Group12(CityCode),
NoOfVehicles int NOT NULL CONSTRAINT vehicles_CHK CHECK(NoOfVehicles>0),
RatePerDay int NOT NULL CONSTRAINT RatePerDay_CHK CHECK(RatePerDay>0),
Tax decimal(4,2) NOT NULL,
CONSTRAINT Vehicles_Location_PK primary key(VehicleType,Location)
)
GO

SELECT * FROM Tbl_Vehicle_Details_Group12 
/*********************************************************************************/
--4.Tbl_Vehicle_Booking_Group12
-----------------------------------------------------------------------------------


CREATE TABLE Tbl_Vehicle_Booking_Group12(
BookingID int identity(200,1) CONSTRAINT BookingID_PK primary key,
CustomerID int NOT NULL CONSTRAINT CustomerID_FK REFERENCES Tbl_Customer_Group12(CustomerID),
VehicleType varchar(10) NOT NULL,
TravelType varchar(10) NOT NULL CONSTRAINT TravelType_CHK CHECK(TravelType IN('Travel','Day','Drop')),
Address varchar(30),
Location varchar(3) ,
DateOfBooking DateTime NOT NULL,
JourneyStartDate DateTime NOT NULL ,
JourneyStartTime decimal(4,2) NOT NULL,
JourneyEndDate DateTime NOT NULL,
JourneyEndTime decimal(4,2) NOT NULL,
CONSTRAINT Composite_Veh_Booking_FK foreign key(VehicleType,Location) REFERENCES Tbl_Vehicle_Details_Group12(VehicleType,Location),
CONSTRAINT JourneyStartDate_CHK CHECK(JourneyStartDate>=DateOfBooking),
CONSTRAINT JourneyEndDate_CHK CHECK(JourneyEndDate>=JourneyStartDate)
)
GO

SELECT * FROM Tbl_Vehicle_Booking_Group12
/*********************************************************************************/
--5.Tbl_Customer_Discounts_Group12
-----------------------------------------------------------------------------------

CREATE TABLE Tbl_Customer_Discounts_Group12(
BookingId int NOT NULL  CONSTRAINT BookingID_Disc_FK  REFERENCES Tbl_Vehicle_Booking_Group12(BookingId ),
CustomerId int NOT NULL CONSTRAINT CustomerID_Disc_FK  REFERENCES Tbl_Customer_Group12(CustomerID),
DateOfAvailing DateTime NOT NULL
)
GO
SELECT * FROM Tbl_Customer_Discounts_Group12
/*********************************************************************************/
--6.Tbl_Vehicle_Discounts_Group12
-----------------------------------------------------------------------------------
drop table Tbl_Vehicle_Discounts_Group12

CREATE TABLE Tbl_Vehicle_Discounts_Group12(
VehicleType VARCHAR(10) NOT NULL ,
Location VARCHAR(3) NOT NULL,
NoOfTimes INT NOT NULL ,
Discount DECIMAL(4,2) NOT NULL,
CONSTRAINT VEHICLE_DISCOUNT_FK FOREIGN KEY(VehicleType,Location) REFERENCES Tbl_Vehicle_Details_Group12(VehicleType,Location)
)
GO


SELECT * FROM Tbl_Vehicle_Discounts_Group12
/*********************************************************************************/
--7.Tbl_Vehicle_Payment_Group12
-----------------------------------------------------------------------------------
drop table Tbl_Vehicle_Payment_G12

CREATE TABLE Tbl_Vehicle_Payment_Group12(
PaymentId VARCHAR(4) CONSTRAINT Payment_Id_PK PRIMARY KEY,
BookingId INT NOT NULL CONSTRAINT BookingId_FK REFERENCES Tbl_Vehicle_Booking_Group12(BookingId) ,
TotalCharges INT NOT NULL ,
TotalTaxAmount DECIMAL(7,2) NOT NULL ,
DiscountAvailable TINYINT NOT NULL CONSTRAINT DiscountAvailable_CHK CHECK (DiscountAvailable IN('1','0'))
)
GO

SELECT * FROM Tbl_Vehicle_Payment_Group12
/*********************************************************************************/
--						CREATING TABLE ENDS HERE
/*********************************************************************************/

sp_help Tbl_City_Group12
sp_help Tbl_Customer_Group12
sp_help Tbl_Vehicle_Details_Group12
sp_help Tbl_Vehicle_Booking_Group12
sp_help Tbl_Customer_Discounts_Group12
sp_help Tbl_Vehicle_Discounts_Group12
sp_help Tbl_Vehicle_Payment_G12

SELECT * FROM Tbl_City_Group12
SELECT * FROM Tbl_Customer_Group12
SELECT * FROM Tbl_Vehicle_Details_Group12
SELECT * FROM Tbl_Vehicle_Booking_Group12
SELECT * FROM Tbl_Customer_Discounts_Group12
SELECT * FROM Tbl_Vehicle_Discounts_Group12
SELECT * FROM Tbl_Vehicle_Payment_Group12

/*drop table Tbl_City_Group12
drop table Tbl_Customer_Group12
drop table Tbl_Vehicle_Details_Group12
drop table Tbl_Vehicle_Booking_Group12
drop table Tbl_Customer_Discounts_Group12
drop table Tbl_Vehicle_Discounts_Group12
drop table  Tbl_Vehicle_Payment_Group12*/
-----------------------------------------------------------------------------------

/*********************************************************************************/

/*********************************************************************************/
--								FUNCTIONS
/*********************************************************************************/
--						FUNCTION fn_GenratePaymentId
/*********************************************************************************/


drop function fn_GenratePaymentId

CREATE FUNCTION fn_GenratePaymentId()
RETURNS varchar(5) 
AS
BEGIN
	DECLARE @B INT
	DECLARE @S VARCHAR(7) 
	IF exists (SELECT * FROM Tbl_Vehicle_Payment_Group12)
		BEGIN
			SELECT @B = CAST(MAX(SUBSTRING(PaymentId, 2,4)) AS INT) FROM Tbl_Vehicle_Payment_Group12
			SET  @B=@B+1	
 			SET @S='P'+CAST(@B AS VARCHAR(5))
			
		END
	ELSE
		BEGIN
			SET @S= 'P100'
		END
	RETURN @S 	
END 
----------------------------------------------------------------------------------
--Test Case
----------------------------------------------------------------------------------
DECLARE @a varchar(5)
EXEC @a = fn_GenratePaymentId
SELECT @a


SELECT * FROM Tbl_Vehicle_Payment_Group12
/*********************************************************************************/
--End of function fn_GenratePaymentId
/*********************************************************************************/



/*********************************************************************************/
--									TRIGGERS
/*********************************************************************************/

--Trigger table:	Vehicle Payment Table
--Trigger events:	Insert
--Description:		When a record is inserted into the Payment table, if the
--					Discount Available field is 1, insert a record into Customer
--					Discounts table.
/*********************************************************************************/

drop trigger trg_Discount_Available

ALTER TRIGGER trg_Discount_Available ON [Tbl_Vehicle_Payment_Group12]
FOR INSERT
AS
BEGIN
	DECLARE @CheckDiscAvail int
	DECLARE @s varchar(4)

	DECLARE @TempCustId int
	DECLARE @tempBookingId int
	DECLARE @tempDate DateTime

	SELECT @tempDate = GetDate()

	--Retrieving FROM the Inserted Magic table
	SELECT @tempBookingId = bookingid FROM Inserted
	SELECT @CheckDiscAvail = DiscountAvailable FROM Inserted

	--Fetching the CustomerId 
	SELECT @TempCustId = customerid 
		FROM [Tbl_Vehicle_Booking_Group12] 	AS V where V.bookingId =@tempBookingId
	IF (@CheckDiscAvail =  0)
		BEGIN
			PRINT 'No Discount Is Available. Value Not Inserted.'
			Rollback Tran
		END
	ELSE
		BEGIN
			--INSERT Tbl_Customer_Discounts_G12 values (@customerid, @bookingId, @dateofavailaing)
			PRINT 'Record Inserted in Customer Discount Table'
			INSERT INTO Tbl_Customer_Discounts_Group12 values (@tempBookingId,  @TempCustid ,@tempDate )
			COMMIT TRAN
		END
END        


----------------------------------------------------------------------------------------------------
--Test Cases for Triggers
----------------------------------------------------------------------------------------------------
select * from Tbl_Vehicle_Payment_Group12
select * from Tbl_Customer_Discounts_Group12
select * from Tbl_Customer_Discounts_Group12
--1.Discount Available is 0
insert into Tbl_Vehicle_Payment_Group12 values('P112',204,201,350,0)

--2.Discount Available is 1
insert into Tbl_Vehicle_Payment_Group12 values('P116',201,200,350,1)
/*********************************************************************************/--
--					Trigger trg_Discount_Available	ENDS Here		
/*********************************************************************************/


/*********************************************************************************/
--									PROCEDURES
/*********************************************************************************
PROCEDURE :			prCheckAvaVehicle	
Input Parameters:	Vehicle Type, Location, Start Date, End Date, Start Time,
					End Time, Travel Type.
Output Parameters:	Status, value will be 1 if the vehicle is available or else the
					value will be 0.								
*********************************************************************************/

drop proc prCheckAvaVehicle

CREATE PROCEDURE prCheckAvaVehicle( @VehicleType varchar(10), @Location varchar(3), 
									@StartDate DateTime,	  @EndDate DateTime, 
									@StartTime Decimal(4,2),  @EndTime Decimal(4,2),
								    @TravelType Varchar(10),  @out_Status tinyint OUTPUT)
AS 
BEGIN

	DECLARE @TotalVehiclesAvailable int
	DECLARE @NoOfVehiclesBooked int
	SELECT @NoOfVehiclesBooked = COUNT(BookingId) FROM Tbl_Vehicle_Booking_Group12 
								 WHERE @VehicleType = VehicleType 
								 AND @Location = Location 
								 AND JourneyEndDate  <  @StartDate

	SELECT @TotalVehiclesAvailable = NoOfVehicles FROM Tbl_Vehicle_Details_Group12
					 WHERE VehicleType = @VehicleType AND Location = @Location

	IF @TotalVehiclesAvailable != 0

	-- 1. Check If the particular vehicle to the Location Exists
	BEGIN
		 --2. If the vehicle Exists and is available for booking
		 IF ( @NoOfVehiclesBooked < @TotalVehiclesAvailable)
		   BEGIN
				SET @out_Status = 1
				PRINT 'Vehicle Is Available.'
		   END

		 --3. If the vehicle Exists and is NOT available for booking
		 IF (@NoOfVehiclesBooked = @TotalVehiclesAvailable)
			   BEGIN
					SET @out_Status = 0
					PRINT 'Vehicle Is NOT Available.'
					
			   END				-- CONDITION 3 ENDS HERE

	END					-- CONDITION 2 ENDS HERE
	   ELSE
			   BEGIN
				  SET @out_Status = 0
				  PRINT 'Vehicle -> Location Does Not Exist'
			   END	-- CONDITION 1 ENDS HERE

END 

SELECT * FROM Tbl_Vehicle_Details_Group12
SELECT * FROM Tbl_Vehicle_Booking_Group12
SELECT * FROM Tbl_Customer_Discounts_Group12
SELECT * FROM Tbl_Vehicle_Discounts_Group12
SELECT * FROM Tbl_Vehicle_Payment_Group12

------------------------------------------------------------------------------------
--			Test Cases
------------------------------------------------------------------------------------
/*1.) Negative Test Case
	As ALL VEHICLE TYPES go to each location 
		Negative test case can only be Generated on either of two conditions
	1:) when all vehicles to a particular location are booked 
	2:) when a vehicle type Doesnt make a trip to a LOCATION
*/

--2.) Positive Test Cases
DECLARE @Status tinyInt
 EXEC prCheckAvaVehicle 'LUXURY','MYS','2008-06-05 00:00:00.000','2008-06-06 00:00:00.000',
     '10.00','12.00','Travel',@Status OUTPUT
SELECT @Status AS 'AVAILABLE'

DECLARE @Status tinyInt
 EXEC prCheckAvaVehicle 'CAB','DEL','2008-06-05 00:00:00.000','2008-06-06 00:00:00.000',
     '10.00','12.00','DAY',@Status OUTPUT
SELECT @Status AS 'AVAILABLE'


/*********************************************************************************/
--prCheckAvaVehicle	ENDS HERE		
/*********************************************************************************/

/*********************************************************************************/
--						PROCEDURE prVehicleBooking
-----------------------------------------------------------------------------------


CREATE PROCEDURE prVehicleBooking (  @Vehicle    varchar(10), @Address varchar(30),
								    @CustomerId int ,        @DateBooking DateTime,
									@StartDate  DateTime,	 @EndDate DateTime, 
									@StartTime  Decimal(4,2),@EndTime Decimal(4,2),
								    @TravelType Varchar(10), @Location varchar(3),
									@out_Status_VehBook tinyint OUTPUT,
								    @out_BookingId int OUTPUT 
								  )
AS 
BEGIN
-- check for availablity of vehicle
EXEC prCheckAvaVehicle @Vehicle , @Location , @StartDate ,@EndDate, @StartTime , @EndTime ,@TravelType ,@out_Status_VehBook OUTPUT  

-- If vehicle is available  @out_Status_VehBook = 1
IF @out_Status_VehBook = 1 
	BEGIN

		-- Check IF the customer has already booked one vehicle
		IF NOT EXISTS( SELECT CustomerId from Tbl_Vehicle_Booking_Group12	
					where @CustomerId =CustomerId 
						AND @DateBooking >= DateOfBooking 
						AND @DateBooking <= JourneyEndDate 
						AND @Vehicle != VehicleType )
			BEGIN
				-- 'Day' and 'Drop' types Finish on the smae day
				IF @TravelType = 'Day' OR @TravelType = 'Drop'
					BEGIN						
						SELECT @EndDate = @StartDate
					END 

				--Default Time For 'Day' and 'Travel' "Travel Types"
				IF @TravelType = 'Day' OR @TravelType = 'Travel'
					BEGIN
						SET @StartTime = 06.00
						SET @EndTime = 23.00
					END 
	
				-- Insert Valid Entries Into Table
				INSERT INTO Tbl_Vehicle_Booking_Group12 
				VALUES(@CustomerId,@Vehicle,@TravelType,@Address,@Location,
					   @DateBooking,@StartDate,@StartTime,@EndDate,@EndTime)
				--IF error prevents sql from running rest of the success commands
				IF(@@ERROR = 0)
					BEGIN
						PRINT 'Record Booked successfully'
						SELECT @out_BookingId = BookingId FROM Tbl_Vehicle_Booking_Group12 
												   WHERE @Vehicle = VehicleType 
												   AND @CustomerId = CustomerId
						
						/*Status and Valid Booking ID are returned thru Arguments*/
					END
				ELSE
					BEGIN
						SET @out_BookingId = 0
						SET @out_Status_VehBook = 0
					END
			END
		ELSE
			BEGIN
				-- Error Customer Has already booked one vehicle
				PRINT 'Customer CANNOT BOOK more than one Vehicle at a Time.'
				SET @out_BookingId = 0
				SET @out_Status_VehBook = 0
			END
	END
ELSE
	BEGIN
		--PRINT 'Vehicle Is NOT Available'
		SET @out_BookingId = 0
	END
END


SELECT * FROM Tbl_Vehicle_Booking_Group12
SELECT * FROM Tbl_Customer_Group12
SELECT * FROM Tbl_Vehicle_Details_Group12
SELECT * FROM Tbl_Vehicle_Discounts_Group12
-----------------------------------------------------------------------------------
-- Test Case 
-----------------------------------------------------------------------------------
--1:) Successfull entry of DATA
--	  a:)
		declare @Status tinyint
		declare @bookingid int
		exec prVehicleBooking 'PLUS','Mumbai,India',101,'2008-05-15 00:00:00.000',
							  '2008-08-07 00:00:00.000','2008-08-10 00:00:00.000',
							  '10.00','23.30','Travel','BLR',
							  @Status OUTPUT, @bookingid OUTPUT
		SELECT @Status AS 'Succesful Entry', @bookingid AS 'Booking ID'
--	  b:)
		declare @Status tinyint
		declare @bookingid int
		exec prVehicleBooking 'PLUS','Mangalore, Karnataka',105,'2008-08-02 00:00:00.000',
							  '2008-08-02 00:00:00.000','2008-08-02 00:00:00.000',
							  '16.00','16.30','Day','MUM',
							  @Status OUTPUT, @bookingid OUTPUT
		SELECT @Status AS 'Succesful Entry', @bookingid AS 'Booking ID'

--2:) UNSUCCESFUL entry of data ***************/
--	Customer can book only one Vehicle at a time.
		declare @Status tinyint
		declare @bookingid int
		exec prVehicleBooking 'LUXURY','Kolkatta,India',102,'2008-05-015 00:00:00.000',
							  '2008-05-16 00:00:00.000','2008-05-22 00:00:00.000',
							  '10.00','23.30','Travel','BLR',
							  @Status OUTPUT, @bookingid OUTPUT
		SELECT @Status AS 'Succesful Entry', @bookingid AS 'Booking ID'


/*=============================================================================
*  End of prVehicleBooking
*============================================================================*/

/*********************************************************************************
Input Parameters:	Customer Id, Vehicle Type, Location
Output Parameters:	Discount, it should be discount percentage, if the discount is
					available, else 0.
Description:		This procedure will check if discount is available for the
					customer. If the customer has booked a particular vehicle
					type with the same location for N no. of times he can avail
					the discount specified in the Vehicle Discounts table.
*********************************************************************************/

SELECT * FROM Tbl_Vehicle_Discounts_Group12

CREATE PROCEDURE prCheckDiscAvaialbility ( @CustomerId int, 
										   @VehicleType varchar(10),
										   @Location varchar(3),
										   @out_Discount DECIMAL(4,2) OUTPUT	
										 )
AS 
BEGIN
	DECLARE @DiscAvailTemp tinyint
	DECLARE @NoOfTimes int
	DECLARE @i_CountofCustId int



	SELECT @NoOfTimes = NoOfTimes FROM Tbl_Vehicle_Discounts_Group12 
		where @VehicleType = VehicleType AND @Location=Location
	
	--Count The Number of times the customer has booked a particular vehicle type with the same location
	SELECT @i_CountofCustId = COUNT(CustomerId) FROM Tbl_Vehicle_Booking_Group12 
		where @CustomerId=CustomerId 
			AND @VehicleType = VehicleType 
			AND @Location=Location

	-- Validate condition for providing discount
	IF @i_CountofCustId >= @NoOfTimes
		BEGIN
			SELECT @out_Discount = Discount FROM Tbl_Vehicle_Discounts_Group12 where @VehicleType = VehicleType and @Location=Location
		
		END		
	ELSE
		BEGIN
			SELECT @out_Discount = 0
		END
	 
END

select * from Tbl_Vehicle_Payment_Group12
select * from Tbl_Vehicle_Discounts_Group12
select * from tbl_Customer_Discounts_Group12
select * from Tbl_Vehicle_Booking_Group12
	

-----------------------------------------------------------------------------------
-- Test Cases
-----------------------------------------------------------------------------------
--1:) Positive Test case
DECLARE @out_dec_Discount decimal(4,2)
EXEC prCheckDiscAvaialbility 102,'CAB','BLR',@out_dec_Discount output
SELECT @out_dec_Discount as Discount

--2:) Negative Test Case
DECLARE @out_dec_Discount decimal(4,2)
EXEC prCheckDiscAvaialbility 102,'CAB','MYS',@out_dec_Discount output
SELECT @out_dec_Discount as Discount


DECLARE @out_dec_Discount decimal(4,2)
EXEC prCheckDiscAvaialbility 105,'PLUS','MUM',@out_dec_Discount output
SELECT @out_dec_Discount as Discount
/********************************************************************************
*  End of prCheckDiscAvaialbility
********************************************************************************/

/*********************************************************************************/
--						PROCEDURE prCalcAmtTaxDisc
-----------------------------------------------------------------------------------

CREATE PROCEDURE prCalcAmtTaxDisc(  @BookingId int, 
								   @out_TotalAmount decimal (8,2) OUTPUT, 
								   @out_TaxAmount decimal (8,2) OUTPUT,
								   @out_DiscountAvailed decimal(8,2) OUTPUT
								 )
AS
BEGIN
IF EXISTS( SELECT BookingId FROM Tbl_Vehicle_Booking_Group12  WHERE BookingId = @BookingId )
	BEGIN
		-- Declaring Variables
		DECLARE @ChargesPerDay int
		DECLARE @Amount int
		DECLARE @CudtomerId int
		DECLARE @VehicleType varchar(10)
		DECLARE @Location varchar(3)
		DECLARE @TravelType varchar(10)
		DECLARE @StartDate DateTime
		DECLARE @EndDate DateTime
		DECLARE @DiscountPERCENT decimal(4,2)
		DECLARE @TaxPERCENT Decimal(7,2)
		DECLARE @CustomerId int
		DECLARE @DURATION int
		
		-- Defining Values to Variables
		SELECT @CustomerId = CustomerId			FROM Tbl_Vehicle_Booking_Group12 WHERE BookingId = @BookingId 
		SELECT @VehicleType = VehicleType		FROM Tbl_Vehicle_Booking_Group12 WHERE BookingId = @BookingId 
		SELECT @Location = Location				FROM Tbl_Vehicle_Booking_Group12 WHERE BookingId = @BookingId 
		SELECT @TravelType = TravelType			FROM Tbl_Vehicle_Booking_Group12 WHERE BookingId = @BookingId  		
		SELECT @StartDate = JourneyStartDate	FROM Tbl_Vehicle_Booking_Group12 WHERE BookingId = @BookingId 
		SELECT @EndDate = JourneyEndDate		FROM Tbl_Vehicle_Booking_Group12 WHERE BookingId = @BookingId 
		SELECT @TaxPERCENT = Tax FROM Tbl_Vehicle_Details_Group12 WHERE VehicleType = @VehicleType AND @Location = Location
		SELECT @ChargesPerDay = RatePerDay FROM Tbl_Vehicle_Details_Group12 
		
		EXEC prCheckDiscAvaialbility @CustomerId,@VehicleType,@Location,@DiscountPERCENT OUTPUT
		select @CustomerId AS 'Customer Id', @VehicleType AS 'Vehicle Type',@Location AS 'Location', @DiscountPERCENT AS 'Discount%'
		
		
		IF @TravelType = 'Drop'
			BEGIN				
				SET @Amount = 0.5 *  @ChargesPerDay	
				SET @out_DiscountAvailed = @DiscountPERCENT * @Amount
				SET @out_TaxAmount = @TaxPERCENT * @Amount
				SET @out_TotalAmount = @Amount - @out_DiscountAvailed + @out_TaxAmount
			END		
		
		ELSE IF @TravelType = 'Day'
			BEGIN
				SET @Amount = @ChargesPerDay 
				SET @out_DiscountAvailed = @DiscountPERCENT * @Amount				
				SET @out_TaxAmount = @Amount * @TaxPERCENT
				SET @out_TotalAmount = @Amount - @out_DiscountAvailed + @out_TaxAmount
			END		
		ELSE IF @TravelType = 'Travel'
			BEGIN
				SET @DURATION = DATEDIFF(DAY,@StartDate,@EndDate)
				SET @Amount = @ChargesPerDay * @DURATION         
				SET @out_DiscountAvailed = @DiscountPERCENT * @Amount				
				SET @out_TaxAmount = @Amount * @TaxPERCENT				
				SET @out_TotalAmount = @Amount - @out_DiscountAvailed + @out_TaxAmount 
			END				
	END
ELSE
	BEGIN
		PRINT 'INCORRECT Booking Id Enetered'
	END
END

drop procedure prCalcAmtTaxDisc
select * from Tbl_Vehicle_Booking_Group12

-----------------------------------------------------------------------------------
--Test cases 
-----------------------------------------------------------------------------------
--A) BookingID does not exist
Declare @TaxAmount decimal(8,2)
Declare @TotalAmount decimal(8,2)
declare @DiscountAvailed decimal(8,2)
Exec prCalcAmtTaxDisc 250 , @TotalAmount output,@TaxAmount output,@DiscountAvailed output
SELECT @TaxAmount AS 'TAX AMOUNT' ,@DiscountAvailed AS 'DISCOUNT AVAILABLE', @TotalAmount AS 'TOTAL AMOUNT'

 
--2.For Drop travel type 
Declare @TaxAmount decimal(8,2)
Declare @TotalAmount decimal(8,2)
declare @DiscountAvailed decimal(8,2)
exec prCalcAmtTaxDisc 217, @TotalAmount output,@TaxAmount output,@DiscountAvailed output
SELECT @TaxAmount AS 'TAX AMOUNT' ,@DiscountAvailed AS 'DISCOUNT AVAILABLE', @TotalAmount AS 'TOTAL AMOUNT'

--3.For 'Travel' travel type
Declare @TaxAmount decimal(8,2)
Declare @TotalAmount decimal(8,2)
declare @DiscountAvailed decimal(8,2)
exec prCalcAmtTaxDisc 201, @TotalAmount output,@TaxAmount output,@DiscountAvailed output
SELECT @TaxAmount AS 'TAX AMOUNT' ,@DiscountAvailed AS 'DISCOUNT AVAILABLE', @TotalAmount AS 'TOTAL AMOUNT'

select * from Tbl_Vehicle_Booking_Group12

--4.For Day travel type 
Declare @TaxAmount decimal(8,2)
Declare @TotalAmount decimal(8,2)
declare @DiscountAvailed decimal(8,2)
exec prCalcAmtTaxDisc 205, @TotalAmount output,@TaxAmount output,@DiscountAvailed output
SELECT @TaxAmount AS 'TAX AMOUNT' ,@DiscountAvailed AS 'DISCOUNT AVAILABLE', @TotalAmount AS 'TOTAL AMOUNT'


/********************************************************************************
*  End of prCalcAmtTaxDisc
********************************************************************************/



