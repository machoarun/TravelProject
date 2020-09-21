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
using System.Collections;
using System.ComponentModel;

/*-------------------------------------------------------------------------------------
 *Class Name : DataBaseLayer
 *Description: Default class
 *Input Parameters: None
 *Return Value: None
-------------------------------------------------------------------------------------*/
public class DataBaseLayer
{
    // Default Constructor
    public DataBaseLayer()
    {
    }
}

/*-------------------------------------------------------------------------------------
*Class Name : PopulateCust
*Description: The class is used to populate a drop down box with the help of a object 
*             data source
*Input Parameters: none
*Return Value: none
-------------------------------------------------------------------------------------*/
[DataObject(true)]
public class PopulateCust
{
    // Declaration of connection
    SqlConnection con;

    // Default Constructor to class
    public PopulateCust()
    {
        // Definition of connection
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    }

    /*-------------------------------------------------------------------------------------
    *Method Name : populatecust
    *Description: The method is used select the content of control box with the help of a object 
    *             data source
    *Input Parameters: none
    *Return Value: none
    -------------------------------------------------------------------------------------*/
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataSet populatecust()
    {
        SqlDataAdapter daCust = new SqlDataAdapter("SELECT customerid FROM Tbl_Customer_Group12 order by customerid ", con);
        DataSet dsCust = new DataSet();
        daCust.Fill(dsCust);
        return dsCust;
    }

}
/*-------------------------------------------------------------------------------------
*Class Name : PopulateCity
*Description: The class is used to populate a drop down box with the help of a object 
*             data source
*Input Parameters: none
*Return Value: none
-------------------------------------------------------------------------------------*/
[DataObject(true)]
public class PopulateCity
{
    // Declaration of connection
    SqlConnection con;
    // Default Constructor
    public PopulateCity()
    {
        // Definition of connection
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());        
    }

    /*-------------------------------------------------------------------------------------
     *Method Name : populatecity
     *Description: The method is used select the content of control box with the help of a object 
     *             data source
     *Input Parameters: none
     *Return Value: none
     -------------------------------------------------------------------------------------*/
    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataSet populatecity()
    {
        SqlDataAdapter daCity = new SqlDataAdapter("SELECT *  from [Tbl_City_Group12] ", con);
        DataSet dsCity = new DataSet();
        daCity.Fill(dsCity);
        return dsCity;
    }

}

/*-------------------------------------------------------------------------------------
*Method Name : Fare
*Description: The class is used for Calculation of DIfferent parameters required
*Input Parameters: none
*Return Value: none
-------------------------------------------------------------------------------------*/
public class Fare
{
    // Declaration of Sql Connection 
    SqlConnection con;
    /*-------------------------------------------------------------------------------------
    *Method Name : Fare
    *Description: Default Constructor To the Class
    *Input Parameters: none
    *Return Value: none
    -------------------------------------------------------------------------------------*/
    public Fare()
    {
        // Definition of the connection
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());     
    }
    /*-------------------------------------------------------------------------------------
    *Method Name : retfare
    *Description: The method is used to return the Charge Per Day for a specified Vehicle 
    *             and corresponding location.  
    *Input Parameters: Car, Location.
    *Return Value: Return Charge per day.
    -------------------------------------------------------------------------------------*/
    public int retfare(string car, string location)
    {
        SqlCommand cmFare =
            new SqlCommand("select RatePerDay from Tbl_Vehicle_Details_Group12 where Location='" + location +                                                     "' and VehicleType='" + car + "'", con);
        con.Open();
        int fare = Convert.ToInt32(cmFare.ExecuteScalar());
        con.Close();
        return fare;
    }

    /*-------------------------------------------------------------------------------------
    *Method Name : taxes
    *Description: The method is used to return the taxes applied for a specified Vehicle 
    *             and corresponding location.  
    *Input Parameters: Car, Location.
    *Return Value: Return total Tax amount in integer.
    -------------------------------------------------------------------------------------*/
    public int taxes(string car, string location)
    {
      
        SqlCommand cmFare =
            new SqlCommand("select tax*100 from Tbl_Vehicle_Details_Group12 where Location='" + location                                                                      + "' and VehicleType='" + car + "'", con);
        con.Open();
        int tax = Convert.ToInt32(cmFare.ExecuteScalar());
        con.Close();
        return tax;
    }

    /*-------------------------------------------------------------------------------------
    *Method Name : totalAmount
    *Description: The method is used to call procedure prCalcAmtTaxDisc from SQL database. 
    *             Method Calculate the Total Amount for the Customer on a trip. 
    *Input Parameters: Booking ID.
    *Return Value: Return total amount in integer if the vehicle is booked
    *              for a trip.
    -------------------------------------------------------------------------------------*/
    public int totalAmount(string BookingID)
    {
        // declare return parameter
        int ret = 0;

        SqlCommand cmdAmountVehicle = new SqlCommand();

        cmdAmountVehicle.Connection = con;
        cmdAmountVehicle.CommandText = "prCalcAmtTaxDisc";
        cmdAmountVehicle.CommandType = CommandType.StoredProcedure;

        // Assign Values to different parameters of procedure
        cmdAmountVehicle.Parameters.AddWithValue("@BookingId", BookingID);

        SqlParameter Para = new SqlParameter("@out_TotalAmount", SqlDbType.Decimal);
        Para.Direction = ParameterDirection.Output;
        cmdAmountVehicle.Parameters.Add(Para);

        SqlParameter Para1 = new SqlParameter("@out_TaxAmount", SqlDbType.Decimal);
        Para1.Direction = ParameterDirection.Output;
        cmdAmountVehicle.Parameters.Add(Para1);

        SqlParameter Para2 = new SqlParameter("@out_DiscountAvailed", SqlDbType.Decimal);
        Para2.Direction = ParameterDirection.Output;
        cmdAmountVehicle.Parameters.Add(Para2);

        con.Open();
        cmdAmountVehicle.ExecuteNonQuery();
        con.Close();

        ret = Convert.ToInt32(Para.Value);

        return ret;
    }

    /*-------------------------------------------------------------------------------------
     *Method Name : BookVehicle
     *Description: The method is used to call procedure proc_insert_vehicle_booking from 
     *              SQL database. Declare command object, procedure name, all the required 
     *              data type, input/output and return parameters and execute the procedure
     *              and handle the return value send the return value to calling method 
     *Input Parameters: Vehicle Type, Address, Customer Id, Date Of Booking, 
     *              Start Date, End Date, Start Time, End Time, Travel Type, Location.
     *Return Value: Return 1 in case of successful insertion, 0 in case of any other errors.
     -------------------------------------------------------------------------------------*/
    public int BookVehicle(string carname, string pickadd, string custid, string bookingDate, string StartDate,                                               string EndDate, string startTime, string EndTime, string TravelType, string location)
    {
        int ret = 0;

        SqlCommand cmdBookVehicle = new SqlCommand();

        cmdBookVehicle.Connection = con;
        cmdBookVehicle.CommandText = "prVehicleBooking";
        cmdBookVehicle.CommandType = CommandType.StoredProcedure;

        // Assign Values to different parameters of procedure
        cmdBookVehicle.Parameters.AddWithValue("@Vehicle", carname);
        cmdBookVehicle.Parameters.AddWithValue("@Address", pickadd);
        cmdBookVehicle.Parameters.AddWithValue("@CustomerId", custid);
        cmdBookVehicle.Parameters.AddWithValue("@DateBooking", bookingDate);
        cmdBookVehicle.Parameters.AddWithValue("@StartDate", StartDate);
        cmdBookVehicle.Parameters.AddWithValue("@EndDate", EndDate);
        cmdBookVehicle.Parameters.AddWithValue("@StartTime", startTime);
        cmdBookVehicle.Parameters.AddWithValue("@EndTime", EndTime);
        cmdBookVehicle.Parameters.AddWithValue("@TravelType", TravelType);
        cmdBookVehicle.Parameters.AddWithValue("@Location", location);

        SqlParameter Para = new SqlParameter("@out_Status_VehBook", SqlDbType.TinyInt);
        Para.Direction = ParameterDirection.Output;
        cmdBookVehicle.Parameters.Add(Para);

        SqlParameter Para1 = new SqlParameter("@out_BookingId", SqlDbType.Int);
        Para1.Direction = ParameterDirection.Output;
        cmdBookVehicle.Parameters.Add(Para1);

        con.Open();
        cmdBookVehicle.ExecuteNonQuery();
        con.Close();

        ret = Convert.ToInt32(Para1.Value);

        return ret;

    }
    /*-------------------------------------------------------------------------------------
   *Method Name : CheckDiscountDisountAvailable
   *Description: The method is used to call procedure prCheckDiscAvaialbility from 
   *              SQL database. Declare command object, procedure name, all the required 
   *              data type, input/output and return parameters and execute the procedure
   *              and handle the return value send the return value to calling method 
   *Input Parameters: CustOmer, Vehicle Type, Location.
   *Return Value: Return Discount% in case of successful retrieval, 0 in case of any other errors.
   -------------------------------------------------------------------------------------*/
    public int CheckDiscountDisountAvailable(string custid, string VehicleType, string location)
    {

        SqlCommand cmdChckDiscount = new SqlCommand();

        cmdChckDiscount.Connection = con;
        cmdChckDiscount.CommandText = "prCheckDiscAvaialbility";
        cmdChckDiscount.CommandType = CommandType.StoredProcedure;

        // Assign Values to different parameters of procedure
        cmdChckDiscount.Parameters.AddWithValue("@CustomerId", custid);
        cmdChckDiscount.Parameters.AddWithValue("@VehicleType", VehicleType);
        cmdChckDiscount.Parameters.AddWithValue("@Location", location);


        SqlParameter Para = new SqlParameter("@out_Discount", SqlDbType.Decimal);
        Para.Direction = ParameterDirection.Output;
        cmdChckDiscount.Parameters.Add(Para);

        con.Open();
        cmdChckDiscount.ExecuteNonQuery();
        con.Close();

        int ret = Convert.ToInt32(Para.Value);

        return ret;

    }
    /*-------------------------------------------------------------------------------------
        * Method Name : VehicleAvailability
        *Description: The method is used to call procedure proc_check_vehicle_availability from 
        *             SQL database. Declare command object, procedure name, all the required data 
        *             type, input/output and return parameters and execute the procedure and handle
        *             the return value send the return value to calling method 
        *Input Parameters: Vehicle Type, Location, Start Date, End Date, Start Time, End Time 
        *Return Value: Value will be 1 if the vehicle is available or else the value will be 0.
      -------------------------------------------------------------------------------------*/
    public int VehicleAvailability(string VehicleType, string Location, string StartDate, string EndDate,
                            string StartTime, string EndTime, string TravelType)
    {
        int ret = 0;
        
 
        SqlCommand cmdVehAvailable = new SqlCommand();
        cmdVehAvailable.Connection = con;
        cmdVehAvailable.CommandText = "prCheckAvaVehicle";
        cmdVehAvailable.CommandType = CommandType.StoredProcedure;

        // Assign Values to different parameters of procedure
        cmdVehAvailable.Parameters.AddWithValue("@VehicleType", VehicleType);
        cmdVehAvailable.Parameters.AddWithValue("@Location", Location);
        cmdVehAvailable.Parameters.AddWithValue("@StartDate", StartDate);
        cmdVehAvailable.Parameters.AddWithValue("@EndDate", EndDate);
        cmdVehAvailable.Parameters.AddWithValue("@StartTime", StartTime);
        cmdVehAvailable.Parameters.AddWithValue("@EndTime", EndTime);
        cmdVehAvailable.Parameters.AddWithValue("@TravelType", TravelType);

        SqlParameter ParaOut = new SqlParameter("@out_Status", SqlDbType.Int);
        ParaOut.Direction = ParameterDirection.Output;
        cmdVehAvailable.Parameters.Add(ParaOut);

        con.Open();
        cmdVehAvailable.ExecuteNonQuery();
        con.Close();

        ret = Convert.ToInt32(ParaOut.Value);
       
        return ret;
    }

    /*-------------------------------------------------------------------------------------
    *Method Name : populateGridview
    *Description: The method is used to Populate the gridView with Vehicle types for the 
    *             specified location.    
    *Input Parameters: Location.
    *Return Value: Return Dataset.
    -------------------------------------------------------------------------------------*/
    public DataSet populateGridview(string location)
    {
        SqlDataAdapter daCust = new SqlDataAdapter("select a.VehicleType," + "b.CityName from " +
          "[Tbl_Vehicle_Details_Group12] a,[Tbl_City_Group12] b where a.location='" + location + "' and a.location=b.citycode", con);

        DataSet dsCust = new DataSet();
        daCust.Fill(dsCust);
        return dsCust;

    }
    /*-------------------------------------------------------------------------------------
    *Method Name : Payment
    *Description: The method is used to insert into the Vehicle_Payemnt_details Table
    *             the data for the generated Booking ID  .    
    *Input Parameters: BookingID,TotalCharges,totalTaxAmount, DiscountAvailable.
    *Return Value: Return Dataset.
    -------------------------------------------------------------------------------------*/
    public int Payment(string BookingID,string TotalCharges,string totalTaxAmount, string DiscountAvailable)
    {
        int ret = 0;

        SqlCommand cmdPayment = new SqlCommand();

        cmdPayment.Connection = con;
        cmdPayment.CommandText = "payment";
        cmdPayment.CommandType = CommandType.StoredProcedure;

        // Assign Values to different parameters of procedure
        cmdPayment.Parameters.AddWithValue("@BookingId", BookingID);
        cmdPayment.Parameters.AddWithValue("@TotalCharges", TotalCharges);
        cmdPayment.Parameters.AddWithValue("@totalTaxAmount", totalTaxAmount);
        cmdPayment.Parameters.AddWithValue("@DiscountAvailable", DiscountAvailable);

        con.Open();
        cmdPayment.ExecuteNonQuery();
        con.Close();

        return ret;
    }
}
/*-------------------------------------------------------------------------------------*
 *  End Of Class Fare
/*-------------------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------------------
*Class Name : DataBaseLayer
*Description: Default Class of the Database File
*Input Parameters: None
*Return Value: None
-------------------------------------------------------------------------------------*/
