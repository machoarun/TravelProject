
                 ------------------------------------------------------------------------------   
                  /***************************************************************************
                                        HOTEL MANAGEMENT MODULE
                  ***************************************************************************/
			     ------------------------------------------------------------------------------


USE SEP08LC1BDB

/*****************************************************************************   
					TABLE NAME    :Tbl_City_GROUP12
*******************************************************************************/

CREATE TABLE  Tbl_City_Group12
(
	CityCode varchar(3) 
				constraint CityCode_pkey primary key,
	CityName varchar(50) 
				constraint CityName_nnull not null
		        constraint CityName_unique unique
)


SELECT * FROM  Tbl_City_Group12

/*********************************************************************
		inserting values into table Tbl_City_GROUP12
**********************************************************************/
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



/*****************************************************************************   
					TABLE NAME  :  Tbl_Customer_Group12
*******************************************************************************/

CREATE TABLE Tbl_Customer_Group12
(
	CustomerId  int IDENTITY(100,1) 
				CONSTRAINT CustomerId_PKey PRIMARY KEY,
	FirstName   varchar(50) NOT NULL,
	LastName	varchar(50) NOT NULL,
	Address	    varchar(50) NOT NULL,
	Email		varchar(50) NOT NULL
				constraint Email_Unique unique,
	Phone		varchar(10) NOT NULL
)


SELECT * FROM tbl_Customer_Group12


/*********************************************************************
		 inserting values into table Tbl_Customer_Group12
**********************************************************************/
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



/*****************************************************************************   
					TABLE NAME    : Tbl_Hotel_Details_Group12
*******************************************************************************/

CREATE TABLE Tbl_Hotel_Details_Group12
(
	HotelID varchar(4) NOT NULL 
				CONSTRAINT HotelId123_PK PRIMARY KEY,
	HotelName varchar(50) NOT NULL,
	Location varchar(3) 
				CONSTRAINT Location123_FKey FOREIGN KEY REFERENCES Tbl_City_Group12(CityCode),
	NoOfDeluxRooms int 
				CONSTRAINT NoOfDeluxRooms123_Check Check(NoOfDeluxRooms>0),
	NoOfEXERooms int 
				CONSTRAINT NoOfEXERooms123_Check Check(NoOfEXERooms>=0),
	DeluxRoomFare_PerDay int 
				CONSTRAINT DeluxRoomFare123_PerDay_Check Check(DeluxRoomFare_PerDay>0),
	EXERoomFare_PerDay int 
				CONSTRAINT EXERoomFare123_PerDay_Check Check(EXERoomFare_PerDay>0),
	HotelTax Decimal(4,2)
				CONSTRAINT HotelTax123_Check Check(HotelTax>0)
)
SELECT * FROM tbl_hotel_details_group12
sp_helpconstraint tbl_hotel_details_Group12
drop table tbl_hotel_details_group12



/*****************************************************************************   
					TABLE NAME   :  Tbl_Hotel_Booking_Group12
*******************************************************************************/
CREATE TABLE Tbl_Hotel_Booking_Group12
(
	BookingId int NOT NULL Identity(600,1) 
				CONSTRAINT BookingId_PKey PRIMARY KEY, 
	HotelId varchar(4) 
				CONSTRAINT HotelId_FK FOREIGN KEY REFERENCES Tbl_Hotel_Details_Group12(HotelID),
	CustomerId int 
				CONSTRAINT CustomerId_FK FOREIGN KEY REFERENCES Tbl_Customer_Group12(CustomerId),
	DateOfBooking DateTime,
	CheckInDate DateTime,
	CheckOutDate DateTime ,
	NoOfDeluxRooms int ,
	NoOfEXERooms int,
				CONSTRAINT CheckOutDate_Check CHECK(CheckOutDate>=CheckInDate)
)

SELECT * FROM Tbl_Hotel_Booking_Group12
DROP TABLE Tbl_Hotel_Booking_Group12
TRUNCATE TABLE Tbl_Hotel_Booking_Group12
sp_helpconstraint Tbl_Hotel_Booking_Group12


/*********************************************************************
		 inserting values into table Tbl_Hotel_Booking_Group12
**********************************************************************/
INSERT into Tbl_Hotel_Booking_GROUP12 values ('h115',102,'2008-09-12','2008-09-14','2008-09-16',1,0)
INSERT into Tbl_Hotel_Booking_GROUP12 values ('h111',107,'2008-06-12','2008-07-15','2008-07-16',2,0)
INSERT into Tbl_Hotel_Booking_GROUP12 values ('h106',105,'2008-09-02','2008-09-13','2008-09-15',1,1)
INSERT into Tbl_Hotel_Booking_Group12 values ('h100',100,'2008-08-20','2008-08-22','2008-08-25',50,60)
INSERT into Tbl_Hotel_Booking_Group12 values ('h101',100,'2008-07-07','2008-07-07','2008-07-27',50,60)
INSERT into Tbl_Hotel_Booking_Group12 values ('h102',100,'2008-08-20','2008-08-20','2008-08-27',25,25)
INSERT into Tbl_Hotel_Booking_Group12 values ('h103',100,'2008-07-13','2008-07-14','2008-07-20',30,30)
INSERT into Tbl_Hotel_Booking_Group12 values ('h104',104,'2008-12-12','2008-12-12','2008-12-24',40,80)


/*****************************************************************************   
				TABLE NAME   :  Tbl_Customer_Hotel_Discounts_Group12
*******************************************************************************/
CREATE TABLE Tbl_Customer_Hotel_Discounts_Group12
(
	HotelId varchar(4) NOT NULL 
				CONSTRAINT BookingId11_FKey FOREIGN KEY REFERENCES Tbl_Hotel_Details_Group12(HotelId), 
	CustomerId [int] not null 
				CONSTRAINT CustomerId11_FKey FOREIGN KEY REFERENCES Tbl_Customer_Group12(CustomerId),
	DateOfBooking DateTime not null
)

DROP TABLE Tbl_Customer_Hotel_Discounts_Group12

SELECT * FROM Tbl_Customer_Hotel_Discounts_Group12



/*****************************************************************************   
					TABLE NAME   :  Tbl_Hotel_Discounts_Group12
*******************************************************************************/

CREATE TABLE Tbl_Hotel_Discounts_Group12
(
HotelId varchar(4) NOT NULL 
			CONSTRAINT HotelId_FK1 FOREIGN KEY REFERENCES Tbl_Hotel_Details_Group12(HotelId), 
RoomsBooked int NOT NULL ,
Discount Decimal(4,2) NOT NULL
)


SELECT * FROM TBL_HOTEL_DISCOUNTS_Group12



/*****************************************************************************   
					TABLE NAME   :   Tbl_Hotel_Payment_Group12
*******************************************************************************/

CREATE TABLE Tbl_Hotel_Payment_Group12
(
PaymentId int  Identity(6000,1) 
			CONSTRAINT PaymentId_PK12 PRIMARY KEY, 
BookingId int NOT NULL 
			CONSTRAINT BookingId_FK30 FOREIGN KEY REFERENCES Tbl_Hotel_Booking_Group12(BookingId),
TotalCharges int NOT NULL,
TotalTaxAmount Decimal(7,2)NOT NULL,
DiscountAvailed Tinyint NOT NULL 
			CONSTRAINT DiscountAvailed_Check CHECK(DiscountAvailed IN(0,1))
)

SELECT * FROM TBL_HOTEL_PAYMENT_Group12

DROP TABLE TBL_HOTEL_PAYMENT_Group12



/*****************************************************************************
*******************************    Function   ********************************
   
Function Name     :fn_Ret_HotelID()
Input Parameters  :None
Output Parameters :
DESCRIPTION       :The procedure will check the availability of given no of rooms 
				   in a hotel at a specific location

*******************************************************************************/
DROP FUNCTION fn_Ret_HotelID

CREATE FUNCTION fn_Ret_HotelID()

RETURNS varchar(4)
AS
BEGIN 
DECLARE @NewHotelID varchar(4)
DECLARE @PresentHotelID int

SELECT @PresentHotelID = CONVERT(int,MAX(SUBSTRING(HotelID,2,3)))FROM Tbl_Hotel_Details_Group12


	IF(@PresentHotelID=0)
	BEGIN
	SET @NewHotelID='H100'
	END


	ELSE 
    BEGIN
    SET @PresentHotelID=@PresentHotelID + 1
	SET @NewHotelID=CONVERT(varchar(4),@PresentHotelID)
	SET @NewHotelID='H' + @NewHotelID
    END
	
RETURN @NewHotelID

END

/*calling function*/
DECLARE @NewHotelID varchar(4)
EXEC @NewHotelID=fn_Ret_HotelID
SELECT @NewHotelID

SELECT * FROM Tbl_Hotel_Details_Group12


/*************************************************************************
*******************************  Trigger   *************************
Trigger  Name     :Trg_Ins_Payment
Description       :The trigger is for insertion of data in table 
				   Tbl_Hotel_Payment_Group12.When this data is inserted,if 
				   value of Discount Availed=1,then data is inserted into 
				   Tbl_Customer_Hotel_Discounts_Group12 and success msg is 
				   returned to user.
*******************************************************************************/					 
						 


CREATE TRIGGER Trg_Ins_Payment ON Tbl_Hotel_Payment_Group12
FOR INSERT
AS
BEGIN
/*Declaration of variables*/
DECLARE @Discount INT
DECLARE @BookingID INT
DECLARE @NewBookingID INT
DECLARE @CustomerID INT
DECLARE @HotelID VARCHAR(4)
DECLARE @DateOfBooking DATETIME

SELECT @Discount=DiscountAvailed,@NewBookingID=BookingID FROM INSERTED

IF(@Discount=1)
BEGIN
SELECT @BookingID=BookingID,@CustomerID=CustomerID,@HotelID=HotelID,@DateOfBooking=DateOfBooking
FROM Tbl_Hotel_Booking_Group12 WHERE BookingID=@NewBookingID
INSERT INTO Tbl_Customer_Hotel_Discounts_Group12 VALUES(@HotelID,@CustomerID,@DateOfBooking)
PRINT 'SUCCESSFULLY INSERTED'
END

ELSE
BEGIN
PRINT 'CANNOT B INSERTED AS NO DISCOUNT'
END

END

SELECT * FROM Tbl_Customer_Hotel_Discounts_Group12
SELECT * FROM Tbl_Hotel_Payment_Group12
SELECT * FROM Tbl_Hotel_Booking_Group12
INSERT INTO Tbl_Hotel_Payment_Group12 VALUES(620,153000.00,21250.00,1)
DROP TRIGGER Trg_Ins_Payment
INSERT INTO Tbl_Hotel_Payment_Group12 VALUES(606,0,0,0)
/*****************************************************************************
						END OF TRIGGER
******************************************************************************/




/*****************************************************************************
******************************* Stored   Procedure 1  *************************
   
PROCEDURE NAME    :Hotel_P_ChkRoomAvail_Group12
Input Parameters  :No of Deluxe rooms,no of EXE rooms,
				   checkin date,checkout date and hotel id
Output Parameters :Status
DESCRIPTION       :The procedure will check the availability of given no of rooms in a hotel at a
                   specific location

*******************************************************************************/

CREATE PROC Hotel_P_ChkRoomAvail_Group12
(
@DeluxeRooms int,
@EXERooms int,
@ChkInDate DateTime,
@ChkOutDate Datetime,
@HotelId varchar(4),
@Out_Status int output
)
AS
BEGIN
/*Declaring Local Variables for the Stored Procedure */
DECLARE @TotalDeluxRooms int
DECLARE @TotalEXERooms int
DECLARE @BookedDelux int
DECLARE @BookedEXE int
DECLARE @AvailDeluxRooms int
DECLARE @AvailEXERooms int
DECLARE @TotalAvailRooms int
DECLARE @TotalRooms int


SELECT @TotalDeluxRooms=NoOfDeluxRooms,@TotalEXERooms=NoOfEXERooms FROM Tbl_Hotel_Details_Group12 WHERE HotelId=@HotelId 
/*Check if the given hotel id is valid*/
IF exists (SELECT * FROM Tbl_Hotel_booking_Group12 WHERE (Hotelid=@Hotelid AND ((CheckInDate=@ChkInDate and CheckOutDate=@ChkOutDate) or (CheckOutDate> @ChkInDate AND CheckIndate < @ChkOutdate)))
)
BEGIN
/* fetching total no of rooms present in the given hotel */
SELECT @BookedDelux=NoOfDeluxRooms,@BookedEXE=NoOfEXERooms FROM Tbl_Hotel_booking_Group12 WHERE (Hotelid=@Hotelid AND ((CheckInDate=@ChkInDate and CheckOutDate=@ChkOutDate) or (CheckOutDate> @ChkInDate AND CheckIndate < @ChkOutdate)))
END

ELSE
BEGIN
       SET @BookedDelux=0
	   SET @BookedEXE=0
END

SET @AvailDeluxRooms=@TotalDeluxRooms-@BookedDelux
SET @AvailEXERooms=@TotalEXERooms-@BookedEXE


/*Total available rooms in hotel */
SET @TotalAvailRooms = @AvailDeluxRooms+@AvailEXERooms
	
/*Total rooms which customer wants*/	
SET @TotalRooms	= @DeluxeRooms + @EXERooms	
				

	/*Checking Condition of Rooms Availability based on various Conditions*/
IF(@ChkInDate>=@ChkOutDate)

	BEGIN

		SET @Out_Status= 0

	END

ELSE IF(@TotalRooms=0)

		BEGIN

		SET @Out_Status= 0

		END

	 ELSE IF((@AvailDeluxRooms>@DeluxeRooms) and (@AvailEXERooms<@EXERooms))

			BEGIN
			 /*if only delux rooms are available return 2*/
			SET @Out_Status= 2

			END

		  ELSE IF((@AvailDeluxRooms>@DeluxeRooms) and (@AvailEXERooms>@EXERooms))

				BEGIN
				 /*if both rooms are available return 1*/
				SET @Out_Status = 1

				END

			   ELSE IF((@AvailDeluxRooms<@DeluxeRooms) and (@AvailEXERooms>@EXERooms))

					BEGIN
					/*if only exe rooms are available return 3*/
					SET @Out_Status= 3

					END

END
/*****************************************************************************
						end of stored procedure 1
******************************************************************************/

DROP PROC Hotel_P_ChkRoomAvail_Group12

/*1-test case for check in and check out date.IF checkout date less than 
checkin date,it should return 0 as @ret*/
DECLARE @Ret int
EXEC Hotel_P_ChkRoomAvail_Group12 5,7,'2008-05-07','2008-05-05','H101',@ret output
SELECT @ret as status

/*2-test case for checking totalrooms are 0.IF yes,it should return 0 as @ret*/
DECLARE @Ret int
EXEC Hotel_P_ChkRoomAvail_Group12 0,0,'2008-10-07','2008-10-11','H101',@ret output
SELECT @ret as status

/*3-test case for checking only Deluxe rooms are available.IF yes,it should return 2 as @ret*/
DECLARE @Ret int
EXEC Hotel_P_ChkRoomAvail_Group12 10,100,'2008-11-07','2008-11-11','H101',@ret output
SELECT @ret as status

/*4-test case for checking only EXE rooms are available.IF yes,it should return 3 as @ret*/
DECLARE @Ret int
EXEC Hotel_P_ChkRoomAvail_Group12 110,1,'2008-08-22','2008-08-25','H100',@ret output
SELECT @ret as status

/*5-test case for checking both rooms are available or not.IF yes,it should return 1 as @ret*/
DECLARE @Ret int
EXEC Hotel_P_ChkRoomAvail_Group12 10,17,'2008-07-07','2008-07-11','H114',@ret output
SELECT @ret as status




SELECT * FROM Tbl_Hotel_Details_Group12
SELECT * FROM Tbl_Hotel_booking_Group12 
DELETE FROM Tbl_Hotel_booking_Group12  WHERE bookingid=607



/*****************************************************************************
******************************* Stored  Procedure 2   ************************
   
PROCEDURE NAME    :Hotel_P_InsertBooking_Group12
Input Parameters  :Customer id,Date of booking,No of Deluxe rooms,no of EXE rooms,
				   checkin date,checkout date and hotel id
Output Parameters :Status and Booking ID
DESCRIPTION       :The procedure will check if discount is available for the customer.if the customer has a
                   booked room in a particular hotel and discounts for the hotel existes in the hotel
                   discount table, then the customer is eligible for discounts.if the customer has booked room
                   in the hotel(a specified no of rooms),then they are elgible for discounts
 
*******************************************************************************/
CREATE PROC Hotel_P_InsertBooking_Group12
(
@CustID int,
@DateOfBooking datetime,
@DeluxeRooms int,
@EXERooms int,
@ChkInDate datetime,
@ChkOutDate datetime,
@HotelID varchar(4),
@Out_Status int output,
@Out_BookingID int output
)
AS
BEGIN
/*declare variables for procedure*/
DECLARE @TotalDeluxeRooms int
DECLARE @TotalEXERooms int
DECLARE @TotalRooms int
DECLARE @Ret int
DECLARE @BookingID int
DECLARE @TotalWantedRooms int
DECLARE @NewBookingID int

/*To retrive total rooms in hotel*/
SELECT @TotalDeluxeRooms=NoOfDeluxRooms,@TotalEXERooms=NoOfEXERooms FROM Tbl_Hotel_Details_Group12 WHERE HotelId=@HotelId
SET @TotalRooms=@TotalDeluxeRooms + @TotalEXERooms

/*Rooms wanted by customer*/
SET @TotalWantedRooms= @DeluxeRooms + @EXERooms

/*calling above stored procedure:Hotel_P_ChkRoomAvail_Group12 
to check availability of rooms in hotel*/
EXEC Hotel_P_ChkRoomAvail_Group12  @DeluxeRooms,@EXERooms,@ChkInDate,@ChkOutDate,@HotelId ,@Ret output
SELECT @NewBookingID=max(BookingID) FROM Tbl_Hotel_Booking_Group12  

/*check if date of booking is greater than check in date.
if yes,it returns Status=0 ans BookingID=0*/
IF(@DateOfBooking>@ChkInDate)
BEGIN
SET @Out_Status=0
SET @Out_BookingID=0
END

/*check if chech in date is greater than check out date.
if yes,it returns Status=0 ans BookingID=0*/
ELSE IF(@ChkInDate>=@ChkOutDate)
		BEGIN
			SET @Out_Status=0
			SET @Out_BookingID=0
		END

/*check if rooms entered by customer is zero or negative.
if yes,it returns Status=0 ans BookingID=0*/
ELSE IF(@TotalWantedRooms<=0)
		BEGIN
			SET @Out_Status=0
			SET @Out_BookingID=0
		END

/*check if rooms entered by customer is positive.
if yes,it returns Status=1 ans BookingID=Max ID + 1*/
ELSE IF(@Ret=1)
		BEGIN
			 INSERT INTO Tbl_Hotel_Booking_Group12 values(@HotelId,@CustId,@DateOfBooking,@ChkInDate,@ChkOutDate,@DeluxeRooms,@EXERooms)
			
			 IF(@@Error=0)
				BEGIN
					SET @Out_Status=1
					SET @Out_BookingID=@NewBookingID + 1
					PRINT @Out_BookingID
				    PRINT 'Successfully Inserted Into Table "Tbl_Hotel_Booking_Group12" '
				END
			 ELSE
				BEGIN
					SET @Out_Status=0
					SET @Out_BookingID=0
					PRINT 'Insertion Failed'
				END
				
		END
	ELSE
		BEGIN
			SET @Out_Status=0
			SET @Out_BookingID=0
			PRINT 'Rooms not available'
		END


END
/*****************************************************************************
						end of stored procedure 2
******************************************************************************/

DROP PROC Hotel_P_InsertBooking_Group12

/*1-test case:If the value of booking date is greater than or equal to the check
in date.if yes,it returns status=0 and bookingid=0 */
DECLARE @Ret1 int,@Ret2 int
exec  Hotel_P_InsertBooking_Group12 113,'2008-07-08',10,0,'2008-07-05','2008-07-09','H101',@Ret1 output,@Ret2 output
SELECT @Ret1 as Status,@Ret2 as BookingID


/*2-test case:If the value of check in date is greater than or equal to the check
out date.if yes,it returns status=0 and bookingid=0 */
DECLARE @Ret1 int,@Ret2 int
exec  Hotel_P_InsertBooking_Group12 113,'2008-07-02',10,0,'2008-07-05','2008-07-04','H101',@Ret1 output,@Ret2 output
SELECT @Ret1 as Status,@Ret2 as BookingID


/*3-test case:sum of EXE rooms and Deluxe rooms is less than or equal 
to the 0.If yes,it returns status=0 and bookingid=0 */
DECLARE @Ret1 int,@Ret2 int
exec  Hotel_P_InsertBooking_Group12 113,'2008-07-02',0,0,'2008-07-05','2008-07-09','H105',@Ret1 output,@Ret2 output
SELECT @Ret1 as Status,@Ret2 as BookingID


/*4-test case: If record inserted properly in the
Booking Table,return status=1 and bookingid=current+1*/
DECLARE @Ret1 int,@Ret2 int
exec  Hotel_P_InsertBooking_Group12 103,'2008-11-02',4,1,'2008-11-09','2008-11-11','H107',@Ret1 output,@Ret2 output
SELECT @Ret1 as Status,@Ret2 as BookingID



SELECT * FROM Tbl_Hotel_Booking_Group12 
DELETE FROM Tbl_Hotel_booking_Group12  WHERE bookingid=607
SELECT max(BookingID) FROM Tbl_Hotel_Booking_Group12 


/*****************************************************************************
*******************************  Stored  Procedure 3     ********************
   
PROCEDURE NAME    :Hotel_P_ChkDiscount_Group12(TO CHECK FOR DISCOUNT)
Input Parameters  :Hotel Id,No of Deluxe rooms,no of EXE rooms
Output Parameters :Discount
DESCRIPTION       :The procedure will check if discount is available for the customer.if the customer has a
                   booked room in a particular hotel and discounts for the hotel existes in the hotel
                   discount table, then the customer is eligible for discounts.if the customer has booked room
                   in the hotel(a specified no of rooms), then they are elgible for discounts
 
*******************************************************************************/

CREATE PROC Hotel_P_ChkDiscount_Group12
(
@HotelID varchar(4),
@DeluxeRooms int,
@EXERooms int,
@Out_Discount decimal(4,2) output
)
as
BEGIN
/*Declaring Local Variables for the Stored Procedure */
DECLARE @Deluxe int
DECLARE @EXE int
DECLARE @TotalRooms int
DECLARE @RoomsBooked int

SELECT @TotalRooms=RoomsBooked FROM Tbl_Hotel_Discounts_Group12 WHERE HotelID=@HotelID 
SET @RoomsBooked=@DeluxeRooms+@EXERooms

/*check condition if required hotel id exists in table.if no,return Discount=0*/
IF(not exists(SELECT HotelID FROM Tbl_Hotel_Discounts_Group12 WHERE HotelID=@HotelID))
		BEGIN
			SET @Out_Discount=0
		END

/*check condition if required hotel id exists and Rooms booking condition satisfied in table.If yes,return Discount*/
ELSE IF((exists(SELECT Discount FROM Tbl_Hotel_Discounts_Group12)) and (@RoomsBooked>=@TotalRooms))
		BEGIN
			SELECT @Out_Discount= Discount FROM Tbl_Hotel_Discounts_Group12 WHERE HotelID=@HotelID
	    END

/*check condition if required hotel id exists and Rooms booking condition satisfied in table.If no,return Discount=0*/
ELSE IF ((exists(SELECT Discount FROM Tbl_Hotel_Discounts_Group12)) and (@RoomsBooked<@TotalRooms))
	BEGIN 
		SET @Out_Discount=0	
	END
END
/*****************************************************************************
						end of stored procedure 3
******************************************************************************/

DROP PROC Hotel_P_ChkDiscount_Group12

/*1-test case for discount WHERE hotelid not exists,discount=0*/
DECLARE @Ret decimal(4,2)
exec Hotel_P_ChkDiscount_Group12 'H125',5,6,@Ret output
SELECT @Ret as Discount

/*2-test case for discount WHERE hotelid exists and 
EXE+DELUXE >= RoomsBooked(Hotel Discounts)*/
DECLARE @Ret decimal(4,2)
exec Hotel_P_ChkDiscount_Group12 'H105',2,3,@Ret output
SELECT @Ret as discount


/*3-test case for discount WHERE hotelid exists and 
EXE+DELUXE < RoomsBooked(Hotel Discounts),discount=0*/
DECLARE @Ret decimal(4,2)
exec Hotel_P_ChkDiscount_Group12 'H106',1,1,@Ret output
SELECT @Ret as discount



SELECT * FROM Tbl_hotel_discounts_group12
SELECT * FROM Tbl_Hotel_booking_Group12 
DELETE FROM  Tbl_Hotel_booking_Group12 WHERE hotelid='h101'



/*****************************************************************************
*******************************  Stored  Procedure 4 *************************
   
PROCEDURE NAME   : Hotel_P_Calculations(To Calculate Hotel Payment)
Input Parameters : Booking Id
Output Parameters: TotalAmount,TotalNoOfDays,TaxAmount,DiscountAvailed
DESCRIPTION      : To Calculate the total amount and the tax to be paid by the customer

*******************************************************************************/

CREATE PROC Hotel_P_Calculations
(
@BookingId int,
@Out_TotalAmount decimal(10,2) output,
@Out_TaxAmount decimal(10,2) output,
@Out_TotalNoOfDays int output,
@Out_DiscountAvailed tinyint output
)
AS
BEGIN
	/*To chech if booking ID exists in Tbl_Hotel_Booking_Group12*/
	IF exists(SELECT * FROM Tbl_Hotel_Booking_Group12 WHERE BookingId=@BookingId)
	BEGIN
		DECLARE @HotelId varchar(4)
		DECLARE @Indate datetime
		DECLARE @OutDate datetime
		DECLARE @DeluxeRooms int
		DECLARE @EXERooms int
		DECLARE @DeluxeFare int
		DECLARE @EXEFare int
		DECLARE @Tax decimal(4,2)
		DECLARE @TotalCharges decimal(10,2)
		
		


		SELECT @HotelId=HotelId,@Indate=CheckInDate,@OutDate=CheckOutDate,@DeluxeRooms=NoOfDeluxRooms,@EXERooms=NoOfEXERooms 
				FROM Tbl_Hotel_Booking_Group12 WHERE BookingId=@BookingId
		SELECT @DeluxeFare=DeluxRoomFare_PerDay,@EXEFare =EXERoomFare_PerDay,@Tax=HotelTax 
				FROM Tbl_Hotel_Details_Group12 WHERE HotelId=@HotelId 

		/*call above procedure Hotel_P_ChkDiscount_Group12*/
		DECLARE @Out_Discount decimal(4,2)
		exec Hotel_P_ChkDiscount_Group12 @HotelId,@DeluxeRooms,@EXERooms,@Out_Discount output
		SELECT @Out_Discount as Discount_Percentage
		
		/*Check discount value returned*/
		IF @out_Discount<>0
		BEGIN
			SET @Out_DiscountAvailed=1
			SET @Out_TotalNoOfDays=datediff(d,@Indate,@outDate)
			SET @TotalCharges=convert(decimal(10,2),(@DeluxeFare*@Out_TotalNoOfDays * @DeluxeRooms)+(@EXEFare*@Out_TotalNoOfDays * @EXERooms))
			SET @Out_TaxAmount=(@Tax*.01)* @TotalCharges
			SET @Out_TotalAmount=(@TotalCharges + @Out_TaxAmount)*(1- (@Out_Discount*.01))
		END
		/*if Discount Returned=0*/
		ELSE
		BEGIN
			SET @Out_DiscountAvailed=0
			SET @Out_TotalNoOfDays=datediff(d,@Indate,@OutDate)
			SET @TotalCharges=convert(decimal(10,2),(@DeluxeFare*@Out_TotalNoOfDays * @DeluxeRooms)+(@EXEFare*@Out_TotalNoOfDays * @EXERooms))
			SET @Out_TaxAmount=(@Tax*.01)* @TotalCharges
			SET @Out_TotalAmount=(@TotalCharges + @Out_TaxAmount)
		END
	END

	ELSE
	BEGIN
		SET @Out_DiscountAvailed=0
		SET @Out_TaxAmount=0
		SET @Out_TotalAmount=0
		SET @Out_TotalNoOfDays=0
		
	END
END	
/*****************************************************************************
						end of stored procedure 4
******************************************************************************/

DROP PROC Hotel_P_Calculations

SELECT * FROM Tbl_Hotel_Discounts_Group12
SELECT * FROM Tbl_Hotel_Booking_Group12 
SELECT * FROM Tbl_Hotel_Details_Group12


/* Test Case 1:If Booking Id exists in the Hotel Booking Table*/
DECLARE @out_TotalAmount decimal(10,2),@out_TaxAmount decimal(10,2),@out_TotalNoOfDays int,@out_DiscountAvailed int
EXEC Hotel_P_Calculations 620,@out_TotalAmount output,@out_TaxAmount output,@out_TotalNoOfDays output,@out_DiscountAvailed output
SELECT @out_TotalAmount as TotalAmount,@out_TaxAmount as TaxAmount,@out_TotalNoOfDays as TotalDays,@out_DiscountAvailed as DiscountAvailed
	

/* Test Case 2 :If Booking Id does not exist in the Hotel Booking Table*/
DECLARE @out_TotalAmount decimal(10,2),@out_TaxAmount decimal(10,2),@out_TotalNoOfDays int,@out_DiscountAvailed int
EXEC Hotel_P_Calculations 606,@out_TotalAmount output,@out_TaxAmount output,@out_TotalNoOfDays output,@out_DiscountAvailed output
SELECT @out_TotalAmount as TotalAmount,@out_TaxAmount as TaxAmount,@out_TotalNoOfDays as TotalDays,@out_DiscountAvailed as DiscountAvailed


             ------------------------------------------------------------------------------   
             /**************************************************************************
                                    END OF HOTEL MANAGEMENT MODULE
             ***************************************************************************/
			 ------------------------------------------------------------------------------			