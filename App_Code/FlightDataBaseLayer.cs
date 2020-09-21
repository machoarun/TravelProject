using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Summary description for FlightDataBaseLayer
/// </summary>
/*DataBase Layer Class*/
public class FlightDataBaseLayer
{
    /*Declaring The Connection Reference*/
    SqlConnection con;
    public FlightDataBaseLayer()
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    }

/*********************************************************************************************
     *Method Name       : GetCustomerId()
     *Description       :It Gives The CustomerId By Executing A query And Returning the Dataset
     *                   Containing The CustomerId
     *Input parameters  :None
     *Returns           :DataSet Containing The CustomerId
**********************************************************************************************/
  public DataSet GetCustomerId()
    {
        /*Declaring The Dataset*/
        DataSet dsCustomerId = new DataSet();
        /*Executing Query Using The  SqlDataAdapter*/
        SqlDataAdapter daCustomerId = new SqlDataAdapter("select customerid from tbl_customer_g12 order by customerid", con);
        /*Filling The DataSet*/
        daCustomerId.Fill(dsCustomerId);
        /*Returning The DataSet*/
        return dsCustomerId;


    }
/**********************************************************************************************/
/*End Of The Function GetCustomerId()*/
/**********************************************************************************************/


/*********************************************************************************************
       *Method Name       : GetCity()
       *Description       :It Gives The cityname By Executing A query And Returning the Dataset
       *                   Containing The Citynames and CityCode
       *Input parameters  :None
       *Returns           :DataSet Containing The CityNames
**********************************************************************************************/
 public DataSet GetCity()
    {
        SqlDataAdapter daSourceCity = new SqlDataAdapter("Select * From tbl_city_g12", con);
        /*Declaring The Dataset*/
        DataSet dsSourceCity = new DataSet();
        /*Filling The DataSet*/
        daSourceCity.Fill(dsSourceCity);
        /*Returning The DataSet*/
        return dsSourceCity;

    }

  /**********************************************************************************************/
 /*End Of The Function  GetCity()*/
  /**********************************************************************************************/

 /*********************************************************************************************
        *Method Name       : GridDetails
        *Description       :It Gives The FlightDetails Corresponding to the source and destination
        *                   Which Is Passed As Parameter.
        *               
        *Input parameters  :Source And Destination
        *Returns           :DataSet Containing The FlightDetails
 **********************************************************************************************/
 public DataSet GridDetails(string source, string destination)
    {
        SqlDataAdapter daFlightDetails = new SqlDataAdapter("Select AirlinesName,c.cityname as source,b.cityname as destination,AdultFare,ChildFare,FlightNo,DepartureTime,ArrivalTime,AirportTax from tbl_flight_g12,tbl_city_g12 c,tbl_city_g12 b Where Source = '" + source + "' and Destination='" + destination + "' and c.citycode='" + source + "'and b.citycode='" + destination + "'", con);
        DataSet dsFlightDetails = new DataSet();
        daFlightDetails.Fill(dsFlightDetails);
        return dsFlightDetails;

    }
 /**********************************************************************************************/
 /*End Of The Function GridDetails() */
 /**********************************************************************************************/


 /*-------------------------------------------------------------------------------------
*Method Name :  CheckSeatStatus
*Description : This Method Takes FlightNo, DateOfJourney, NoOfAdults,NoOfChildren
*              Makes A Object Of SqlCommand Which Is Used To Call The Function
*              Flight_fn_SeatAvailability_G12 For Checking The SeatAvailability.
*              
*
*Input Parameters:Flight No, Date of Journey, No of Adults, No of Children
*Return Value: Return 1 if the seats are available, else returns 0.
/*-------------------------------------------------------------------------------------*/
 
    public int CheckSeatStatus(int FlightNo, DateTime DateOfJourney,
                                  int NoOfAdults, int NoOfChildren)
    {
        int iStatus;
        /*Creating SqlCommand Object To Execute The Query*/
        SqlCommand cmdSeatStatus = new SqlCommand();
        /*Assigning The Connection*/
        cmdSeatStatus.Connection = con;
        /*Name Of The Function To Be Called*/
        cmdSeatStatus.CommandText = "Flight_fn_SeatAvailability_G12";
        /*Declaring The Command Type To Be Stored Procedure*/
        cmdSeatStatus.CommandType = CommandType.StoredProcedure;

        /*Adding The Parameters Required By The Function*/
        cmdSeatStatus.Parameters.AddWithValue("@in_i_FlightNo", FlightNo);
        cmdSeatStatus.Parameters.AddWithValue("@in_dt_DateOfJourney", DateOfJourney);
        cmdSeatStatus.Parameters.AddWithValue("@in_i_NoOfAdults", NoOfAdults);
        cmdSeatStatus.Parameters.AddWithValue("@in_i_NoOfChildren", NoOfChildren);
        /*Declaring A New Parameter As Return Type*/
        SqlParameter prAvailable = new SqlParameter("@i_Available", SqlDbType.Int);
        prAvailable.Direction = ParameterDirection.ReturnValue;
        cmdSeatStatus.Parameters.Add(prAvailable);
        /*Opening The Connection*/
        con.Open();
        /*Executing The Query*/
        cmdSeatStatus.ExecuteNonQuery();
        /*Closing The Connection*/
        con.Close();

        iStatus = Convert.ToInt16(prAvailable.Value);
        return iStatus;

    }

    /**********************************************************************************************/
    /*End Of The Function  CheckSeatStatus() */
    /**********************************************************************************************/


    /*********************************************************************************************
       *Method Name       : GetPrimaryPassenger()
       *Description       :It Gives The Name OF the Primary passenger that is the name of 
       *                   Customer Corressponding To The CustomerId Entered By The User.
       *                   
       *Input parameters  :Customerid
       *Returns           :DataSet Containing The Customer FirstName And LastName
   **********************************************************************************************/

    public DataSet GetPrimaryPassenger(int Custid)
    {
        SqlDataAdapter daPrimaryPassenger = new SqlDataAdapter("Select FirstName,LastName From Tbl_customer_g12 where customerid =" + Custid, con);

        DataSet dsPrimaryPassenger = new DataSet();
        daPrimaryPassenger.Fill(dsPrimaryPassenger);
        return dsPrimaryPassenger;

    }
    /**********************************************************************************************/
    /*End Of The Function GetPrimaryPassenger() */
    /**********************************************************************************************/




    /*-------------------------------------------------------------------------------------
 /*Method Name : GetNextBookingID
  *Description : The method is used to call procedure Flight_P_GenerateBoookingId_G12
  *              from SQL database. Declare command object,procedure name, all the
  *              required datatype,output / return parameters and execute the 
  *              procedure and handle the return value send the return value to 
  *              calling method 
  *Input Parameters: None. 
  *Return Value: It returns next Flight booking id
 /*-------------------------------------------------------------------------------------*/

    public string GenerateNextBookingID()
    {
        int ret;
        string sNextBookingID;
        /*Creating SqlCommand Object To Execute The Query*/
        SqlCommand cmdNextBookingID = new SqlCommand();
        /*Assigning The Connection*/
        cmdNextBookingID.Connection = con;
        /*Adding The Name Of The Stored Procedure*/
        cmdNextBookingID.CommandText = "Flight_P_GenerateBoookingId_G12";
        /*Declaring The Command Type To Be Stored Procedure*/
        cmdNextBookingID.CommandType = CommandType.StoredProcedure;


        SqlParameter BookingID = new SqlParameter();
        BookingID.ParameterName = "@out_v_NextBId";
        /*Declaring The Type Of The Parameter*/
        BookingID.SqlDbType = SqlDbType.VarChar;
        /*Declaring The Size Of The Parameter*/
        BookingID.Size = 4;
        /*Making It  as output parameter the value will be reflected here*/
        BookingID.Direction = ParameterDirection.Output;
        /*ading parameter to the command*/
        cmdNextBookingID.Parameters.Add(BookingID);
        /*Opening The Connection*/
        con.Open();
        /*executing procedure By Using ExecuteNonQuery Command*/
        ret = cmdNextBookingID.ExecuteNonQuery();
        /*Closing The Connection*/
        con.Close();
        /*Converting The Varchar value To String*/
        sNextBookingID = Convert.ToString(BookingID.Value);
        return sNextBookingID;
    }
    /**********************************************************************************************
    *End Of The Function GenerateNextBookingID() 
    /**********************************************************************************************/


 /*-------------------------------------------------------------------------------------
 *Method Name :BookFlight
 *Description :This Method Is Taking An An Stored Procedure Flight_P_InsertingRecords_G12
 *             Makes A Object Of SqlCommand Which Is Used To Call The Procedure To
 *             Insert The Records Into The FlightBookingTable.
 *Input Parameters:Booking Id, Flight No, Customer Id, Date of Booking
 *                 Date of Journey, No of Adults, No of Children.
 *Return Value: Return 1 in case of successful insertion, 0 in case of any other errors.
/*-------------------------------------------------------------------------------------*/

    public int BookingFlight(string BookingId, int FlightNo, int CustomerID,
                                DateTime DateOfBooking, DateTime DateOfJourney,
                                int NoOfAdults, int NoOfChildren)
    {
        int iStatus;
        /*Creating SqlCommand Object To Execute The Query*/
        SqlCommand cmdFlightBooking = new SqlCommand();
        /*Assigning The Connection*/
        cmdFlightBooking.Connection = con;
        /*Name Of The Stored Procedure To Be Called*/
        cmdFlightBooking.CommandText = "Flight_P_InsertingRecords_G12";
        /*Declaring The Command Type To Be Stored Procedure*/
        cmdFlightBooking.CommandType = CommandType.StoredProcedure;


        /*Adding The Parameters Required By The Stored Procedure*/
        cmdFlightBooking.Parameters.AddWithValue("@in_i_BookingId", BookingId);
        cmdFlightBooking.Parameters.AddWithValue("@in_i_FlightNo", FlightNo);
        cmdFlightBooking.Parameters.AddWithValue("@in_i_CustomerId", CustomerID);
        cmdFlightBooking.Parameters.AddWithValue("@in_dt_DateOfBooking", DateOfBooking);
        cmdFlightBooking.Parameters.AddWithValue("@in_dt_DateOfJourney", DateOfJourney);
        cmdFlightBooking.Parameters.AddWithValue("@in_i_NoOfAdults", NoOfAdults);
        cmdFlightBooking.Parameters.AddWithValue("@in_i_NoOfChildren", NoOfChildren);
        /*Adding An OutPut Parameter*/
        SqlParameter opstatus = new SqlParameter("@out_i_Status", SqlDbType.Int);
        opstatus.Direction = ParameterDirection.Output;
        cmdFlightBooking.Parameters.Add(opstatus);
        /*Opening The Connection*/
        con.Open();
        /*Executing The Query*/
        cmdFlightBooking.ExecuteNonQuery();
        /*Closing The Connection*/
        con.Close();

        iStatus = Convert.ToInt16(opstatus.Value);
        return iStatus;
    }

    /**********************************************************************************************
    *End Of The Function BookingFlight() 
    /**********************************************************************************************/


    /*********************************************************************************************
       *Method Name       : PaymentInsert()
       *Description       :It Inserts The Details Into The Flight Payment Table
       *                  
       *                   
       *Input parameters  :BookingId,AdultCharges,ChildCharges,TotalTax
     **********************************************************************************************/


    public void PaymentInsert(string BookingId, double AdultCharges, double ChildCharges, double TotalTax)
    {
        /*Creating SqlCommand Object To Execute The Query*/
        SqlCommand cmdFlightBooking = new SqlCommand();
        /*Assigning The Connection*/
        cmdFlightBooking.Connection = con;

        cmdFlightBooking.CommandText = "Insert Into Tbl_Flight_Payment_G12 Values('" + BookingId + "' ," + AdultCharges + " , " + ChildCharges + " , " + TotalTax + " )";

        /*Declaring The Command Type */
        cmdFlightBooking.CommandType = CommandType.Text;
        /*Opening The Connection*/
        con.Open();
        /*Executing The Query*/
        cmdFlightBooking.ExecuteNonQuery();
        /*Closing The Connection*/
        con.Close();

    }
    /**********************************************************************************************
    *End Of The Function PaymentInsert() 
    /**********************************************************************************************/

    /*********************************************************************************************
          *Method Name       : TravellerInsert()
          *Description       :It Inserts The Details Into The Flight Travellers Table
                         
          *Input parameters  :BookingId,FName, LName,TravellerType
    **********************************************************************************************/

    public void TravellerInsert(string BookingId1, string FName, string LName, string TravellerType)
    {
        /*Creating SqlCommand Object To Execute The Query*/
        SqlCommand cmdInsertTraveller = new SqlCommand();
        /*Assigning The Connection*/
        cmdInsertTraveller.Connection = con;
        cmdInsertTraveller.CommandText = "Insert Into Tbl_Flight_Travellers_G12 Values('" + BookingId1 + "','" + FName + "','" + LName + "','" + TravellerType + "')";
        /*Declaring The Command Type */
        cmdInsertTraveller.CommandType = CommandType.Text;
        /*Opening The Connection*/
        con.Open();
        /*Executing The Query*/
        cmdInsertTraveller.ExecuteNonQuery();
        /*Closing The Connection*/
        con.Close();


    }
    /**********************************************************************************************
   *End Of The Function TravellerInsert() 
   /**********************************************************************************************/

}
/**********************************************************************************************
*End Of The FlightDataBaseLayer
/**********************************************************************************************/

