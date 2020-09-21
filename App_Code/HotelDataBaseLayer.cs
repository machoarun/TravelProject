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
using System.ComponentModel;

/// <summary>
/// Summary description for HotelDataBaseLayer
/// </summary>

[DataObject(true)]
public class HotelDataBaseLayer
{
    /*Establishing Connection in Constructor of class HotelDataBaseLayer*/
    SqlConnection con;
    public HotelDataBaseLayer()
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

    }
    /*populating drop down list from city table*/
    public DataTable City()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from tbl_city_group12", con);
        DataTable dt = new DataTable();

        da.Fill(dt);
        return dt;
    }
    /*populating drop down list from customer table*/
    public DataTable Customer()
    {
        SqlDataAdapter da1 = new SqlDataAdapter("select * from tbl_customer_group12", con);
        DataTable dt1 = new DataTable();

        da1.Fill(dt1);
        return dt1;

    }

    public String GetHotelID(string HotelName, string Location)
    {

        string HotelId;
      
        SqlCommand cmdHotelId = new SqlCommand("Select HotelID from tbl_Hotel_Details_Group12 where HotelName='" + HotelName + "'and Location=            (select citycode from tbl_city_group12 where cityname='" + Location + "')", con);
        /*opening Connection*/
        con.Open();

        /*executing query to select data*/
        HotelId = Convert.ToString(cmdHotelId.ExecuteScalar());

        /*closing Connection*/
        con.Close();


        return (HotelId);


    }

    /*populating grid view using DataObject Source from tbl_Hotel_Details_Group12*/
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataTable FindHotelByLocation(string City_Name)
    {
        //SqlCommand cmdHotelLocation = new SqlCommand("select Hotelname,location from tbl_Hotel_Details_Group12 where location=@cityname", con);
        SqlCommand cmdHotelLocation = new SqlCommand("select h.hotelname,c.cityname as 'location' from Tbl_Hotel_Details_Group12 h,                       tbl_city_group12 c where h.location=c.Citycode and hotelid in (select hotelid from Tbl_Hotel_Details_Group12 where  location=@cityname)",         con);
        cmdHotelLocation.Parameters.AddWithValue("@cityname", City_Name);
        SqlDataAdapter daHotelLocation = new SqlDataAdapter(cmdHotelLocation);
        DataTable dtHotelLocation = new DataTable();
        daHotelLocation.Fill(dtHotelLocation);
        return dtHotelLocation;

    }




    /*********************************************************************************************
     *Method Name       :ChechRoomStatus()
     *Description       :using Connected approach,it calls Stored Procedure:
     *                   Hotel_P_ChkRoomAvail_Group12
     *Input parameters  :HotelId, DeluxeRooms, EXERooms, CheckInDate, CheckOutDate
     *Output Parameters :SqlParameter para
     **********************************************************************************************/

    public int ChechRoomStatus(string HotelId, int DeluxeRooms, int EXERooms, DateTime CheckInDate,
                                       DateTime CheckOutDate)
    {
        int Ret;

        /*calling Stored Procedurs:Hotel_P_ChkRoomAvail_Group12*/
        SqlCommand cmdCheckRoomStatus = new SqlCommand("Hotel_P_ChkRoomAvail_Group12", con);
        cmdCheckRoomStatus.CommandType = CommandType.StoredProcedure;

        cmdCheckRoomStatus.Parameters.AddWithValue("@HotelId", HotelId);
        cmdCheckRoomStatus.Parameters.AddWithValue("@DeluxeRooms", DeluxeRooms);
        cmdCheckRoomStatus.Parameters.AddWithValue("@EXERooms", EXERooms);
        cmdCheckRoomStatus.Parameters.AddWithValue("@ChkInDate", CheckInDate);
        cmdCheckRoomStatus.Parameters.AddWithValue("@ChkOutDate", CheckOutDate);

        /*adding output parameter to sqlparameter class*/
        SqlParameter para = new SqlParameter("@Out_status", SqlDbType.Int);
        para.Direction = ParameterDirection.Output;
        cmdCheckRoomStatus.Parameters.Add(para);

        /*opening Connection*/
        con.Open();

        /*executing Non-Query to Retrieve Data*/
        cmdCheckRoomStatus.ExecuteNonQuery();
    
        /*closing Connection*/
        con.Close();

        Ret = Convert.ToInt32(para.Value);
        
        return Ret;

    }


    /*********************************************************************************************
      *Method Name        :HotelDetails()
      *Description        :using Disconnected approach,it fetches HotelName
      *                    DeluxRoomFare_PerDay,EXERoomFare_PerDay,HotelTax from 
      *                    tbl_Hotel_Details_Group12
      *Input parameters   :HotelId
      *Output Parameters  :Dataset(ds)
    **********************************************************************************************/
    public DataSet HotelDetails(string HotelId)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("select DeluxRoomFare_PerDay,EXERoomFare_PerDay,hotelTax from tbl_hotel_details_group12 where              hotelid='" + HotelId + "'", con);
        da.Fill(ds);
        return ds;
    }


    /*********************************************************************************************
     *Method Name       :CheckDiscount()
     *Description       :using Connected approach,it calls Stored Procedure:
     *                   Hotel_P_ChkDiscount_Group12
     *Input parameters  :HotelId, DeluxeRooms, EXERooms
     *Output Parameters :SqlParameter para
     **********************************************************************************************/
    public decimal CheckDiscount(string HotelId, int DeluxeRooms, int EXERooms)
    {
        decimal Ret;

        /*Calling Stored Procedurs:Hotel_P_ChkDiscount_Group12*/
        SqlCommand cmdCheckRoomStatus = new SqlCommand("Hotel_P_ChkDiscount_Group12", con);
        cmdCheckRoomStatus.CommandType = CommandType.StoredProcedure;

        cmdCheckRoomStatus.Parameters.AddWithValue("@HotelID", HotelId);
        cmdCheckRoomStatus.Parameters.AddWithValue("@DeluxeRooms", DeluxeRooms);
        cmdCheckRoomStatus.Parameters.AddWithValue("@EXERooms", EXERooms);




        /*adding output parameter:@Out_Discount to sqlparameter class*/
        SqlParameter Para = new SqlParameter("@Out_Discount", SqlDbType.Decimal);
        Para.Scale = 2;
        Para.Direction = ParameterDirection.Output;
        cmdCheckRoomStatus.Parameters.Add(Para);


        /*Opening Connection*/
        con.Open();

        /*Executing Non-Query to Retrieve Data*/
        cmdCheckRoomStatus.ExecuteNonQuery();

        /*closing Connection*/
        con.Close();


        Ret = Convert.ToDecimal(Para.Value);


        return Ret;
    }


    /*********************************************************************************************
     *Method Name       :GetNextBookingCode()
     *Description       :using Connected approach,it Generates next Booking Id from
     *                   tbl_Hotel_Booking_Group12
     *Input parameters  :None
     *Output Parameters :int NextBookingId       
     **********************************************************************************************/
    public int GetNextBookingCode()
    {
        /*declaring variable to collect Booking ID*/
        int NextBookingId;

        /*executing sqlcommand to select max(bookingid) from tbl_Hotel_Booking_Group12*/
        SqlCommand cmdNextBookingCode = new SqlCommand("select Max(BookingId) from tbl_Hotel_Booking_Group12",
                                                        con);

        /*opening Connection*/
        con.Open();

        /*executing query to select data*/
        NextBookingId = Convert.ToInt32(cmdNextBookingCode.ExecuteScalar());

        /*closing Connection*/
        con.Close();


        return (NextBookingId + 1);

    }
    /*********************************************************************************************
      *Method Name       :BookHotel()
      *Description       :using Connected approach,it calls Stored Procedure:
      *                   Hotel_P_InsertBooking_Group12
      *Input parameters  :CustomerId,DateOfBooking,DeluxRooms, EXERooms,CheckInDate,CheckOutDate,
      *                   HotelId
      *Output Parameters :SqlParameters Para1,Para2
    **********************************************************************************************/
    public int BookHotel(int CustomerId, DateTime DateOfBooking,
                               int DeluxRooms, int EXERooms,
                               DateTime CheckInDate, DateTime CheckOutDate, string HotelId)
    {
        int Ret = 0;

        /*calling Stored Procedurs:Hotel_P_InsertBooking_Group12*/
        SqlCommand cmdCheckRoomStatus = new SqlCommand("Hotel_P_InsertBooking_Group12", con);
        cmdCheckRoomStatus.CommandType = CommandType.StoredProcedure;

        cmdCheckRoomStatus.Parameters.AddWithValue("@CustID", CustomerId);
        cmdCheckRoomStatus.Parameters.AddWithValue("@DateOfBooking", DateOfBooking);
        cmdCheckRoomStatus.Parameters.AddWithValue("@DeluxeRooms", DeluxRooms);
        cmdCheckRoomStatus.Parameters.AddWithValue("@EXERooms", EXERooms);
        cmdCheckRoomStatus.Parameters.AddWithValue("@ChkInDate", CheckInDate);
        cmdCheckRoomStatus.Parameters.AddWithValue("@ChkOutDate", CheckOutDate);
        cmdCheckRoomStatus.Parameters.AddWithValue("@HotelID", HotelId);


        /*adding output parameter:@out_BookingId to sqlparameter class*/
        SqlParameter Para1 = new SqlParameter("@out_BookingId", SqlDbType.Int);
        Para1.Direction = ParameterDirection.Output;
        cmdCheckRoomStatus.Parameters.Add(Para1);

        /*adding output parameter:@Out_Status to sqlparameter class*/
        SqlParameter Para2 = new SqlParameter("@Out_Status", SqlDbType.Int);
        Para2.Direction = ParameterDirection.Output;
        cmdCheckRoomStatus.Parameters.Add(Para2);

        /*opening Connection*/
        con.Open();

        /*executing Non-Query to Retrieve Data*/
        cmdCheckRoomStatus.ExecuteNonQuery();

        /*closing Connection*/
        con.Close();


        //Ret = Convert.ToInt32(Para1.Value);
        Ret = Convert.ToInt32(Para2.Value);


        return Ret;
    }
    /*********************************************************************************************
     *Method Name       :InsertPayment()
     *Description       :using Connected approach,it inserts data into Tbl_Hotel_Payment_Group12
     *Input parameters  :BookingId,TotalCharges,TotalTaxAmount,DiscountAvailed
     *Output Parameters :int Ret=1 on success       
     **********************************************************************************************/

    public int InsertPayment(int BookingId, Double TotalCharges, Double TotalTaxAmount, int DiscountAvailed)
    {
        /*declaring variable to collect Status*/
        int Ret;

        /*executing sqlcommand to insert into Tbl_Hotel_Payment_Group12 */
        SqlCommand cmdInsertPayment = new SqlCommand("insert into Tbl_Hotel_Payment_Group12 values(" + BookingId + "," + TotalCharges + "," + TotalTaxAmount + "," + DiscountAvailed + ")", con);

        /*opening Connection*/
        con.Open();

        /*executing non-query to insert data*/
        Ret = Convert.ToInt32(cmdInsertPayment.ExecuteNonQuery());

        /*closing Connection*/
        con.Close();

        /* returning value*/
        return Ret;

    }
}