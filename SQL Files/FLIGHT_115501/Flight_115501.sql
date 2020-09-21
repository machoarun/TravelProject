             ------------------------------------------------------------------------------   
             --***************************************************************************
                                   --  FLIGHT MANAGEMENT MODULE--
             --***************************************************************************
			 ------------------------------------------------------------------------------


/*Create Table Tbl_City_G12*/
CREATE TABLE [Tbl_City_G12](
	[CityCode] [varchar](3) NOT NULL CONSTRAINT [CityCode_PK] PRIMARY KEY,
	[CityName] [varchar](50) CONSTRAINT CityName_Unq UNIQUE
)

/*Inserting Values To Table Tbl_City_G12*/
INSERT INTO Tbl_City_G12 VALUES ('BLR','Bangalore')
INSERT INTO Tbl_City_G12 VALUES ('MUM','Mumbai')
INSERT INTO Tbl_City_G12 VALUES ('DEL','Delhi')
INSERT INTO Tbl_City_G12 VALUES ('HYD','Hyderbad')
INSERT INTO Tbl_City_G12 VALUES ('CHN','Chennai')
INSERT INTO Tbl_City_G12 VALUES ('PUN','Pune')
INSERT INTO Tbl_City_G12 VALUES ('MYS','Mysore')
INSERT INTO Tbl_City_G12 VALUES ('KLK','Kolkatta')
INSERT INTO Tbl_City_G12 VALUES ('TVM','Trivandrum')
INSERT INTO Tbl_City_G12 VALUES ('MLR','Mangalore')


/*Create Table Tbl_Customer_G12*/
CREATE TABLE [Tbl_Customer_G12](
	[CustomerId] [int] IDENTITY(100,1)
     CONSTRAINT [CustomerId_PK] PRIMARY KEY NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL 
     CONSTRAINT Email_Unq UNIQUE,
	[Phone] [varchar](10) NOT NULL
)

/* Inserting Values To Table Tbl_Customer_G12*/
INSERT INTO Tbl_Customer_G12 VALUES ('Larry','Page','Mumbai,India','Larry@gmail.com','9988554410')
INSERT INTO Tbl_Customer_G12 VALUES ('Sergey','Brin','Kolkatta,India','Sergey@gmail.com','9988554412')
INSERT INTO Tbl_Customer_G12 VALUES ('Alfred R.','Berkeley','Mysore, Karnataka','AlfredR@gmail.com','9988554414')
INSERT INTO Tbl_Customer_G12 VALUES ('R K','Laxman','Jharkand,India','RKLaxman@gmail.com','9988554416')
INSERT INTO Tbl_Customer_G12 VALUES ('Amitabh','Bachan','New Delhi,India','Amitabh@msn.co.in','9988554418')
INSERT INTO Tbl_Customer_G12 VALUES ('APJ','Kalam','Chennai,India','APJ@gmail.com','9988554420')
INSERT INTO Tbl_Customer_G12 VALUES ('Salman','Rushdie','Mumbai,India','Rushdie@gmail.com','9988554422')
INSERT INTO Tbl_Customer_G12 VALUES ('Sanjeev','Kapoor','New Delhi,India','Sanjeev@gmail.com','9988554424')
INSERT INTO Tbl_Customer_G12 VALUES ('Barkha','Dutta','New Delhi,India','Barkha@msn.co.in','9988554426')
INSERT INTO Tbl_Customer_G12 VALUES ('Rajdeep','Sardesai','Mangalore, Karnataka','Rajdeep@gmail.com','9988554428')
INSERT INTO Tbl_Customer_G12 VALUES ('Alan','Turing','New Delhi,India','Alan@msn.co.in','9988554430')
INSERT INTO Tbl_Customer_G12 VALUES ('Seymour','Cray','New Delhi,India','Seymour@msn.co.in','9988554432')
INSERT INTO Tbl_Customer_G12 VALUES ('Bill','Gates','New Delhi,India','Bill@msn.co.in','9988554434')
INSERT INTO Tbl_Customer_G12 VALUES ('Derek O','Brien','Bangalore, Karnataka','Derek@gmail.com','9988554436')
INSERT INTO Tbl_Customer_G12 VALUES ('Brett','Lee','Delhi,India','Brett@gmail.com','9988554438')


/*Create Table Tbl_Flight_G12*/
CREATE TABLE Tbl_Flight_G13_New(
[FlightNo] [int] CONSTRAINT FlightNo_PK
             PRIMARY KEY IDENTITY (500,1),
[AirlinesName] [varchar](50) NOT NULL
                CONSTRAINT AirlinesName_Chk CHECK(AirlinesName IN('Kingfisher','Deccan','Indigo','JetAirways',
                                                                   'JetLite','GoAir','Indian')),
[Source] [varchar](3) NOT NULL
             CONSTRAINT Source_FK1
             REFERENCES Tbl_City_Group13(CityCode),
[Destination] [varchar](3) NOT NULL
			 CONSTRAINT Destination_FK2
             REFERENCES Tbl_City_Group13(CityCode),
[DepartureTime] [Decimal](4,2) NOT NULL,
[ArrivalTime] [Decimal](4,2) NOT NULL,
[TotalSeats] [int] NOT NULL CONSTRAINT
           Chk_TotalSeats CHECK(TotalSeats>0),
[AdultFare] [int] NOT NULL CONSTRAINT
           Chk_AdultFare CHECK(AdultFare>0),
[ChildFare] [int] NOT NULL CONSTRAINT
           Chk_ChildFare CHECK(ChildFare>0),
[AirportTax] [Decimal](4,2) NOT NULL,
CONSTRAINT Tbl_Flight_G12_Unq UNIQUE(AirlinesName,DepartureTime)
)

select * from Tbl_Flight_G13_New

INSERT INTO Tbl_Flight_G13_New VALUES('Kingfisher','BLR','DEL',10.00,11.30,220,1590,590,0.32)
INSERT INTO Tbl_Flight_G13_New VALUES('Deccan','BLR','DEL',11.00,0.00,180,4900,3900,0.35)
INSERT INTO Tbl_Flight_G13_New VALUES('Indian','BLR','MUM',12.00,13.45,240,2690,1690,0.38)
INSERT INTO Tbl_Flight_G13_New VALUES('Kingfisher','DEL','BLR',13.00,15.00,100,2470,1470,0.41)
INSERT INTO Tbl_Flight_G13_New VALUES('JetAirways','DEL','BLR',14.00,16.30,140,1780,780,0.44)
INSERT INTO Tbl_Flight_G13_New VALUES('Indigo','DEL','MUM',15.00,17.00,220,1580,580,0.47)
INSERT INTO Tbl_Flight_G13_New VALUES('Kingfisher','DEL','BLR',16.00,18.00,180,4500,3500,0.5)
INSERT INTO Tbl_Flight_G13_New VALUES('Indigo','MUM','BLR',09.00,10.30,240,1830,830,0.53)
INSERT INTO Tbl_Flight_G13_New VALUES('Deccan','MUM','BLR',09.30,11.00,100,3600,2600,0.56)
INSERT INTO Tbl_Flight_G13_New VALUES('Indian','MUM','BLR',11.00,000.00,140,1599,599,0.59)
INSERT INTO Tbl_Flight_G13_New VALUES('Kingfisher','MUM','DEL',21.00,23.00,220,1299,299,0.32)
INSERT INTO Tbl_Flight_G13_New VALUES('JetAirways','BLR','MUM',23.00,02.00,180,1369,369,0.35)
INSERT INTO Tbl_Flight_G13_New VALUES('Indigo','BLR','MUM',19.00,01.00,240,1900,900,0.38)
INSERT INTO Tbl_Flight_G13_New VALUES('Kingfisher','BLR','MUM',15.00,18.00,100,1900,900,0.41)
INSERT INTO Tbl_Flight_G13_New VALUES('Kingfisher','BLR','MUM',15.30,18.00,140,3200,2200,0.44)
INSERT INTO Tbl_Flight_G13_New VALUES('Deccan','DEL','MUM',07.30,08.30,220,4500,3500,0.47)
INSERT INTO Tbl_Flight_G13_New VALUES('Indian','DEL','MUM',08.30,09.30,180,1500,500,0.5)
INSERT INTO Tbl_Flight_G13_New VALUES('Kingfisher','DEL','MUM',09.00,10.30,240,6600,5600,0.32)
INSERT INTO Tbl_Flight_G13_New VALUES('JetAirways','MUM','DEL',10.30,000.00,100,4590,3590,0.35)
INSERT INTO Tbl_Flight_G13_New VALUES('Indigo','MUM','DEL',12.00,15.00,140,4759,3759,0.38)
INSERT INTO Tbl_Flight_G13_New VALUES('Deccan','MUM','DEL',12.30,12.30,220,5999,4999,0.41)
INSERT INTO Tbl_Flight_G13_New VALUES('Indian','BLR','MLR',14.00,14.00,180,2899,1899,0.44)
INSERT INTO Tbl_Flight_G13_New VALUES('Kingfisher','BLR','TVM',15.30,15.30,240,2599,1599,0.47)
INSERT INTO Tbl_Flight_G13_New VALUES('JetAirways','BLR','MYS',16.00,16.00,100,7999,6999,0.5)
INSERT INTO Tbl_Flight_G13_New VALUES('Indigo','BLR','KLK',17.00,17.00,140,1999,999,0.53)
INSERT INTO Tbl_Flight_G13_New VALUES('Indian','MUM','PUN',18.00,18.00,100,5999,4999,0.56)


/* Inserting Values To Table Tbl_Flight_G12 */




/*Create Table Tbl_Flight_Booking_G12*/

CREATE TABLE Tbl_Flight_Booking_G12(
[BookingId] [varchar](4) CONSTRAINT BookingId_PK
                     PRIMARY KEY,
[FlightNo] [int] CONSTRAINT FlightNo_FK1
             REFERENCES Tbl_Flight_G12(FlightNo),
[CustomerId] [int] NOT NULL CONSTRAINT CustomerId_FK2
             REFERENCES Tbl_Customer_G12(CustomerId),
[DateOfBooking] [DateTime] NOT NULL,
[DateOfJourney] [Datetime] NOT NULL,
[NoOfAdults] [int] NOT NULL CONSTRAINT 
                   Chk_NoOfAdults CHECK(NoOfAdults > 0),
[NoOfChildren] [int] NOT NULL CONSTRAINT 
                   chk_NoOfChildren CHECK(NoOfChildren >= 0),
CONSTRAINT Chk_DateOfJourney CHECK(DateOfJourney>DateOfBooking))


/*Create  Table Tbl_Flight_Travellers_G12*/
CREATE TABLE Tbl_Flight_Travellers_G12(
[BookingId] [varchar](4) NOT NULL
          CONSTRAINT BookingId_FK
          REFERENCES Tbl_Flight_Booking_G12(BookingId),
[FirstName] [varchar](50) NOT NULL,
[LastName] [varchar](50) NOT NULL,
[TravellerType] [Char](1) NOT NULL CONSTRAINT Chk_TravellerType
							   CHECK(TravellerType IN('A','C','a','c')))



/*Create  Table Tbl_FlightSeat_Status_G12*/

CREATE TABLE Tbl_FlightSeat_Status_G12(
[FlightNo] [int] NOT NULL CONSTRAINT FNO_Fkey
           REFERENCES Tbl_Flight_G12(FlightNo) ,
[DateOfJourney] [DateTime] NOT NULL, 
[RemainingSeats] [int] NOT NULL,
CONSTRAINT FlightSeatStatus_PK PRIMARY KEY(FlightNo,DateOfJourney))

drop TABLE Tbl_FlightSeat_Status_G12

/* Create  Table Tbl_Flight_Payment_G12*/
CREATE TABLE Tbl_Flight_Payment_G12(
[PaymentId] [int] CONSTRAINT PaymentId_PK PRIMARY KEY IDENTITY(5000,1),
[BookingId] [varchar](4) NOT NULL
            CONSTRAINT BookingId_PFK  REFERENCES Tbl_Flight_Booking_G12(BookingId),
[AdultCharges] [int] NOT NULL,
[ChildCharges] [int] NOT NULL,
[TotalTaxAmount] [Decimal](7,2) NOT NULL)



------------------------------------------------------------------------------
            -- FUNCTION-- Flight_fn_SeatAvailability_G12()
------------------------------------------------------------------------------
/*Input Parameters: Flight No., Date Of Journey, No. Of Adults, No. Of Children
 *Return Values   : It will return 1 if the seats are available, else return 0.
 *Description     : The function will check for the availability of seats in a
                    particular flight on a given day.                   */
------------------------------------------------------------------------------
/* Creating Function With The Input Parameters */
 CREATE FUNCTION Flight_fn_SeatAvailability_G12(@in_i_FlightNo int,@in_dt_DateOfJourney datetime,
                                               @in_i_NoOfAdults int,@in_i_NoOfChildren int)
 RETURNS int
 AS
 BEGIN
	DECLARE @i_RemainingSeats int
/*When Records Exists In The FlightSeatStatus Table Corressponding To 
 * The FlightNo Entered */
	IF(Exists(SELECT * 
              FROM Tbl_FlightSeat_Status_G12
              WHERE FlightNo = @in_i_FlightNo))
	 BEGIN 
			  SELECT @i_RemainingSeats=RemainingSeats 
              FROM Tbl_FlightSeat_Status_G12 
              WHERE FlightNo = @in_i_FlightNo AND DateOfJourney=@in_dt_DateOfJourney 
/*Condition When the number of seats in the Flight Seat status table are
* greater than or equal to the required number of seats Return value is 1*/
			   IF(@i_RemainingSeats >=(@in_i_NoOfAdults+@in_i_NoOfChildren))
				   BEGIN
					  RETURN 1
				   END
/*Condition When The number of seats in the Flight Seat status table is less
 *than the required number of seats Return value is 0*/
            ELSE
			    BEGIN
			      IF(@i_RemainingSeats <(@in_i_NoOfAdults+@in_i_NoOfChildren))
				     BEGIN
					    RETURN 0
				      END
			   END
      END
/*Condition When When there is no entry in the Flight Seat status table for
 *the corresponding search Return value is 1*/
      RETURN 1
 END 
-----------------------------------------------------------------------------
                      --Test Cases
-----------------------------------------------------------------------------

/* When The number of seats in the Flight Seat status table are
   greater than or equal to the required number of seats*/
  DECLARE @i_ReturnValue int
  EXEC  @i_ReturnValue=Flight_fn_SeatAvailability_G12 500,'10-JAN-2008',4,212
  SELECT @i_ReturnValue As ReturnValue
/*When there is no entry in the Flight Seat status table 
 *forthe corresponding search.*/
 DECLARE @i_ReturnValue int
 EXEC  @i_ReturnValue=Flight_fn_SeatAvailability_G12 501,'10-JAN-2008',4,210
 SELECT @i_ReturnValue As ReturnValue
/*When The number of seats in the Flight Seat status table is less
* than the required number of seats*/
 DECLARE @i_ReturnValue int
 EXEC  @i_ReturnValue=Flight_fn_SeatAvailability_G12 500,'10-JAN-2008',5,212
 SELECT @i_ReturnValue As ReturnValue

-----------------------------------------------------------------------------
      -- End of function Flight_fn_SeatAvailability_G12()--
-----------------------------------------------------------------------------


-----------------------------------------------------------------------------
                      --TRIGGER--
-----------------------------------------------------------------------------
/*Trigger table : Flight Booking
 *Trigger events: Insert, Update.
 *Description   : If a record is inserted / updated in the flight booking table,
 *                the Remaining Seats field in the Flight Seat Status must be
 *                suitably updated. In case there is no record in the Flight 
 *                Seat Status, a record must be inserted and then updated.*/
-----------------------------------------------------------------------------

CREATE TRIGGER Flight_Trg_UpdateFlightStatus on Tbl_Flight_Booking_G12
FOR INSERT,UPDATE
AS
BEGIN
DECLARE @i_FlightNo int,@dt_DateOfJourney datetime,@i_NoOfAdults int
DECLARE @i_NoOfChildren int,@i_TotalSeats int,@i_Seats int
   
    SELECT @i_FlightNo=FlightNo,@dt_DateOfJourney=DateOfJourney,@i_NoOfAdults=NoOfAdults,
           @i_NoOfChildren=NoOfChildren FROM INSERTED
    SELECT @i_Seats=TotalSeats from Tbl_Flight_G12 where FlightNo=@i_FlightNo
/* When A Record Exists in The Flight Seat Status Table for flight
 * On A Particular Day Then Updating The Remaining Seats*/   
    IF EXISTS(Select * from Tbl_FlightSeat_Status_G12 where FlightNo=@i_FlightNo
              AND DateOfJourney=@dt_DateOfJourney)
            BEGIN
               SELECT @i_TotalSeats=RemainingSeats from Tbl_FlightSeat_Status_G12
               where FlightNo=@i_FlightNo AND DateOfJourney=@dt_DateOfJourney
               Select @i_TotalSeats=@i_TotalSeats-(@i_NoOfAdults+@i_NoOfChildren)
/* Updating The FlightSeatStatus Table With Remaining Seats*/
              UPDATE Tbl_FlightSeat_Status_G12
              SET RemainingSeats=@i_TotalSeats
              WHERE FlightNo=@i_FlightNo AND DateOfJourney=@dt_DateOfJourney
              
    
           END
/* When A Record Does Not Exists in The Flight Seat Status Table for flight
 * On A Particular Day Then Inserting Then Insert The Record And Update Seats*/   
    ELSE
        BEGIN
           INSERT INTO Tbl_FlightSeat_Status_G12 VALUES(@i_FlightNo,@dt_DateOfJourney,@i_Seats)
           Select @i_Seats=@i_Seats-(@i_NoOfAdults+@i_NoOfChildren)
           UPDATE Tbl_FlightSeat_Status_G12
           SET RemainingSeats=@i_Seats
           WHERE FlightNo=@i_FlightNo AND DateOfJourney=@dt_DateOfJourney
           
       END
END


-----------------------------------------------------------------------------
                      --Test Cases--
-----------------------------------------------------------------------------
/* Record for that particular flight, that is being booked, 
   on that particular date of journey exists in Table Flight Seat
   Status.  500 is Existing Flight Number with Date 10-Jan-2008*/

INSERT INTO Tbl_Flight_Booking_G12 VALUES('F100',500,100,'05-Jan-2008','10-Jan-2008',2,2)

/* Record for that particular flight, that is being booked, 
on that particular date ofjourney does not exist in Table Flight
Seat Status.*/
INSERT INTO Tbl_Flight_Booking_G12 VALUES('F101',501,100,'05-Jan-2008','10-Jan-2008',2,2)


-----------------------------------------------------------------------------
                      --End Of Trigger--
-----------------------------------------------------------------------------



-----------------------------------------------------------------------------
          -- Procedure To Generate New Flight Number--
-----------------------------------------------------------------------------
/*Input Parameters : None
 *Output Parameters: Next booking id
 *Description      : This procedure is used to generate the next booking 
 *                  id forflights. The first flight booking id will be of 
 *                  the format F100. The next booking id will be F101 
 *				    and so on.                                        */
-----------------------------------------------------------------------------

/*Creating Procedure With An OutPut Parameter*/
CREATE PROC Flight_P_GenerateBoookingId_G12(@out_v_NextBId varchar(4) output)
As
BEGIN
DECLARE @i_Temp int
SELECT @out_v_NextBId=max(BookingId) FROM Tbl_Flight_Booking_G12
/*When No Id Is Present In The FlightBooking Table*/
IF(0=(SELECT COUNT(*) FROM Tbl_Flight_Booking_G12))
begin

SET @out_v_NextBId = 'F100'
RETURN
END
/*When BookingId Is Present In The Booking Table Then Incrementing It*/
IF(@@ERROR=0)
BEGIN
SET @i_Temp=CONVERT(int,substring(@out_v_NextBId,2,3))
SET @i_Temp=@i_Temp+1
SET @out_v_NextBid='F'+convert(varchar(4),@i_Temp)
RETURN
END
END
-----------------------------------------------------------------------------
                      --Test Cases--
-----------------------------------------------------------------------------

/*First Booking Id*/

DECLARE @v_FirstBookingId varchar(4)
EXEC Flight_P_GenerateBoookingId_G12 @v_FirstBookingId output
SELECT @v_FirstBookingId As FirstBookingId
/* New Booking id*/
INSERT INTO Tbl_Flight_Booking_G12 VALUES('F102',501,100,'05-Jan-2008','10-Jan-2008',2,2)

DECLARE @v_NewBookingId varchar(4)
EXEC Flight_P_GenerateBoookingId_G12 @v_NewBookingId output
SELECT @v_NewBookingId As NextBookingId

select * from Tbl_Flight_Booking_G12


------------------------------------------------------------------------------
                      --End Of Procedure--
------------------------------------------------------------------------------



-----------------------------------------------------------------------------
-- Procedure To Insert Record to the flight Booking table--
-----------------------------------------------------------------------------
/*Input Parameters: Booking Id, Flight No, Customer Id, Date Of Booking, Date
                    Of Journey, No. Of Adults, No. Of Children.
*Output Parameters: Status, value will be 1 in case of successful insertion,
                    0 in case of any other errors.
* Description     : This procedure will make use of the function (mentioned
*                   above) to check whether the seats are available. If the
*                   seats are available, then the records are inserted into the
*                   Flight Booking table, else suitable message is returned.*/
------------------------------------------------------------------------------

ALTER PROC Flight_P_InsertingRecords_G12(@in_i_BookingId varchar(4),@in_i_FlightNo int,
                                        @in_i_CustomerId int,@in_dt_DateOfBooking datetime,
						                @in_dt_DateOfJourney datetime,@in_i_NoOfAdults int,
                                       @in_i_NoOfChildren int,@out_i_Status int output)
AS
BEGIN
set @out_i_Status =0
DECLARE @i_Res int
 /* When Date Of Journey < Date of Booking */
	IF(@in_dt_DateOfJourney<@in_dt_DateOfBooking) 
        BEGIN
			SET @out_i_Status=0
			PRINT 'Date Of Journey Is Less Than Date Of Booking'
			RETURN
        END
/*When NoOfAdults is null */
	else IF(@in_i_NoOfAdults IS NULL) 
       BEGIN
		    SET @out_i_Status=0
			PRINT ' Number Of Adults Cannot Be NULL'
			RETURN
        END
/*When NoOfChildren is null */
	else IF(@in_i_NoOfChildren IS NULL) 
       BEGIN    
            SET @out_i_Status=0
			PRINT ' Number Of children Cannot Be NULL'
			RETURN
       END
/*When FlightId is null */
	else IF(  @in_i_FlightNo IS NULL) 
       BEGIN
            SET @out_i_Status=0
			PRINT 'Flight number Cannot Be NULL'
			RETURN
        END
 /*Calling The Function To Check For The Seat Availabiltiy */
exec @i_Res = Flight_fn_SeatAvailability_G12 @in_i_FlightNo,@in_dt_DateOfJourney,@in_i_NoOfAdults,@in_i_NoOfChildren
/* If The Status Returned Is 1 Then Inserting The Records In The Flight Booking Table
 * Here Trigger Is Also Invoked Implicitily and Flight Seat Status Is Also Updated */
	IF(@i_Res=1)
		BEGIN
              INSERT INTO Tbl_Flight_Booking_G12 VALUES(@in_i_BookingId,@in_i_FlightNo,
                                                        @in_i_CustomerId,@in_dt_DateOfBooking,
				        						        @in_dt_DateOfJourney,@in_i_NoOfAdults,@in_i_NoOfChildren)
             PRINT 'SUCCESSFUL INSERTION'
			 SET  @out_i_Status = 1
			 RETURN
		END
/* When The Seats are not available In The Flight Seats Status Table*/
	else IF(@i_Res=0)
		BEGIN           
			PRINT 'Seats Are Not Available!!'
             Set @out_i_Status=0
			 RETURN
		END
	
END
   
-----------------------------------------------------------------------------
                      --Test Cases
-----------------------------------------------------------------------------

/*Seats are not available.*/
/*Value of output parameter‘Status’ is 0*/
declare @result int
exec  Flight_P_InsertingRecords_G12 'F100',500,103,'28-Sep-2007','10-Jan-2008',198,15,@result output
select @result
/* Seats Are Available and Successful Insertion*/
/*Value of output parameter‘Status’ is 1*/
declare @result int
exec Flight_P_InsertingRecords_G12 'F101',519,103,'01-Jan-2008','10-Jan-2008',19,3,@result output
select @result

/* Date Of Journey < Date of Booking*/
/*Value of output parameter‘Status’ is 0*/

declare @result int
exec Flight_P_InsertingRecords_G12 'F102',500,103,'28-Sep-2008','26-Sep-2008',198,3,@result output
select @result
/* NoOfAdults is null */
/*Value of output parameter‘Status’ is 0*/
declare @result int
exec  Flight_P_InsertingRecords_G12 'F102',502,103,'26-Aug-2008','30-Aug-2008',Null,4,@result output
select @result
/* NoOfChildren is null */
/*Value of output parameter‘Status’ is 0*/
declare @result int
exec  Flight_P_InsertingRecords_G12 'F102',502,103,'26-Aug-2008','30-Aug-2008',4,NULL,@result output
select @result
/* FlightId  is null */
/*Value of output parameter‘Status’ is 0*/
declare @result int
exec  Flight_P_InsertingRecords_G12 'F102',NULL,103,'26-Aug-2008','30-Aug-2008',5,4,@result output
select @result

------------------------------------------------------------------------------
                      --End Of Procedure--
------------------------------------------------------------------------------





-----------------------------------------------------------------------------
-- Procedure To Insert Record to the flight Booking table--
-----------------------------------------------------------------------------
/*Input Parameters  :Booking Id
 *Output Parameters :Adult Fare, Child Fare, Total Tax Amount
 *Description       :This procedure will calculate the total adult fare, total
 *                   child fare and the total tax amount to be paid by the
 *                   customer for the service used. Tax is calculated on (adult
 *                   fare + child fare).                                   */
-----------------------------------------------------------------------------

CREATE PROC Flight_P_CalculateTax_G12(@in_i_BookingId varchar(4),@out_i_TotalAdultFare int output,
								    @out_i_TotalChildFare int output,@out_i_TotalTaxAmount int output)
As
BEGIN
/* Declaration Of Variables*/
      DECLARE @i_TotalAmount int
      DECLARE @i_NoOfAdults int,@i_NoOfChildren int,@d_TotalTaxPercent decimal(4,2),@i_AdultFare int,
              @i_ChildFare int
/* When The Record Exists For The Corresponding Booking Id Which We Are Passing in
 * Flight Booking Table*/
     IF(Exists(SELECT * FROM Tbl_Flight_Booking_G12 WHERE BookingId=@in_i_BookingId))
          BEGIN
/* Retreiving The AdultFare,ChildFare,AirportTax From The FlightTable
 * And NumberOfAdults And NumberOfChildren From FlightBooking Table */
		  SELECT @i_AdultFare=f.AdultFare, @i_ChildFare=f.ChildFare,@d_TotalTaxPercent=f.AirportTax,
		  @i_NoOfAdults=b.NoOfAdults ,@i_NoOfChildren=b.NoOfChildren 
          FROM Tbl_Flight_G12 f,Tbl_Flight_Booking_G12 b
          WHERE b.FlightNo=f.FlightNo and b.BookingId=@in_i_BookingId
/* Calculating The Total Adultfare,Childfare and TotalTaxAmount */
          SET @out_i_TotalAdultFare=@i_AdultFare*@i_NoOfAdults
          SET @out_i_TotalChildFare= @i_ChildFare*@i_NoOfChildren
          SET @i_TotalAmount=@out_i_TotalAdultFare+@out_i_TotalChildFare
          SET @out_i_TotalTaxAmount=@i_TotalAmount*@d_TotalTaxPercent
     END
/*If The Corresponding Booking Id Does Not Exist In The Flight Booking Table
 * Setting The Output Parameters As 0 */
       ELSE
        BEGIN
            SELECT @out_i_TotalAdultFare =0,@out_i_TotalChildFare =0,@out_i_TotalTaxAmount=0
            PRINT 'INVALID BOOKING ID'
       END
END
  
-----------------------------------------------------------------------------
                      --Test Cases
-----------------------------------------------------------------------------

/* Booking id is not  present*/
DECLARE @i_AdultFare int,@i_ChildFare int,@i_TotalFare int
EXEC  Flight_P_CalculateTax_G12 'F100', @i_AdultFare output,@i_ChildFare output,@i_TotalFare output
SELECT  @i_AdultFare AS AdultFare ,@i_ChildFare AS ChildFare ,@i_TotalFare As TotalFare
/* Booking id is present*/
DECLARE @i_AdultFare int,@i_ChildFare int,@i_TotalFare int
EXEC  Flight_P_CalculateTax_G12 'F102', @i_AdultFare output,@i_ChildFare output,@i_TotalFare output
SELECT  @i_AdultFare AS AdultFare ,@i_ChildFare AS ChildFare ,@i_TotalFare As TotalFare


------------------------------------------------------------------------------
                      --End Of Procedure--
------------------------------------------------------------------------------


/* Selecting Values From Table*/
SELECT * FROM Tbl_City_G12

SELECT * FROM Tbl_Customer_G12

SELECT * FROM Tbl_Flight_G12

SELECT * FROM Tbl_Flight_Booking_G12

SELECT * FROM Tbl_Flight_Travellers_G12

SELECT * FROM Tbl_FlightSeat_Status_G12

SELECT * FROM Tbl_Flight_Payment_G12

             ------------------------------------------------------------------------------   
             --***************************************************************************
                                   --  END OF FLIGHT MANAGEMENT MODULE--
             --***************************************************************************
			 ------------------------------------------------------------------------------