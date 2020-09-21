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
/// Summary description for TravelDataBaselayer
/// </summary>
public class TravelDataBaselayer
{
    public TravelDataBaselayer()
    {
    }

}

public class Travel
{
    //Declaring the connection object
    SqlConnection con;
    public Travel()
    {
        con = new SqlConnection
        (ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    }

    /**************************************************************************
     * Method Name : FetchCustId
     * Description:  This method is used to query the city table to get the 
     * city names. Declare a command object. Set all the input, output and 
     * return parameters and execute the command object. 
     * Input Parameters: None.
     * Return Value: It returns an object of DataReader/Dataset
     ***************************************************************************/


    public DataSet FetchCustId()
    {
        SqlDataAdapter daCustID;
        DataSet dsCustID = new DataSet();
        daCustID = new SqlDataAdapter("Select * from Tbl_Customer_Group12 ", con);
        daCustID.Fill(dsCustID, "Tbl_Customer_Group12");
        return dsCustID;
    }


    /*************************************************************************
    * Method Name : FetchCityName
    * Description:  This method is used to query the city table to get the city names
    * Declare a command object. Set all the input, output and return parameters and 
    * execute the command object. 
    * Input Parameters: None.
    * Return Value: It returns an object of DataReader/Dataset
    * ************************************************************************/

    public DataSet FetchCityName()
    {
        SqlDataAdapter daCityName;
        DataSet dsCityName = new DataSet();
        //Parameterized Query to fetch the values from the Tbl_City_Group12
        daCityName = new SqlDataAdapter
            ("Select * from Tbl_City_Group12", con);
        //Transmits SELECT statement to the data store usig Fill
        daCityName.Fill(dsCityName, "Tbl_City_Group12");
        return dsCityName;
    }



    /***************************************************************************
    * Method Name : FindPackageByCity
    * Description: Populate PackageID ,PackageName and CityName to the Datagrid.
    * StartDate , EndDate, Description, Fare ,Tax from the selected city.
    * Input Parameters: SelectedCity
    * Return Value: Returns the dataset dsPackageByCity.
    *****************************************************************************/


    public DataSet FindPackageByCity
       (string SelectedCityCode, string CityName,
           DateTime FromDate, DateTime ToDate)
    {

        SqlDataAdapter daPackageByCity;
        DataSet dsPackageByCity = new DataSet();
        //Fetches the Package Details from table Tbl_Package_Details_Group12
        daPackageByCity = new SqlDataAdapter
            ("select a.Packageid, a.PackageName, b.Cityname from " +
            "Tbl_Package_Details_Group12 a, Tbl_City_Group12 b " +
            "where a.Location = b.CityCode and a.PackageId in " +
            "(select a.PackageId from Tbl_Package_Details_Group12 " +
            "a where a.Location ='" + SelectedCityCode + "' and " +
         "a.Startdate between '" + FromDate + " '  " +
             "and ' " + ToDate + "')", con);

        //Transmits SELECT statement to the data store using Fill
        daPackageByCity.Fill(dsPackageByCity, "Tbl_Package_Details_Group12");
        return dsPackageByCity;
    }


    /***********************************************************************
     * Method Name : FetchReview
     * Description: Populate StartDate, EndDate, FarePerPerson, Tax into 
     * the labels
     * StartDate , EndDate, Description, Fare ,Tax from the selected city.
     * Input Parameters: none
     * Return Value: Returns the dataset dsReview.
    **************************************************************************/



    public DataSet FetchReview(string PackId)
    {
        SqlDataAdapter daReview;
        DataSet dsReview = new DataSet();
        //Parameterized Query to fetch the values from the Tbl_City_Group12
        daReview = new SqlDataAdapter
            ("Select StartDate, EndDate, FarePerPerson, Tax " +
            "from Tbl_Package_Details_Group12 " +
            "where PackageId = '" + PackId + "' ", con);
        //Transmits SELECT statement to the data store using Fill
        daReview.Fill(dsReview, "Tbl_Package_Details_Group12");
        return dsReview;
    }


    /*************************************************************************
    * Method Name : FetchCustDetails
    * Description: Fetches the Customer details 
    * Input Parameters: Package ID, Customer ID, Date of Booking, Seats
    * Return Value: dsCustDetails
    **************************************************************************/


    public DataSet FetchCustDetails(string CustId)
    {
        SqlDataAdapter daCustDetails;
        DataSet dsCustDetails = new DataSet();
        //Parameterized Query to fetch the values from the Tbl_City_Group12
        daCustDetails = new SqlDataAdapter
            ("Select FirstName, LastName from Tbl_Customer_Group12" +
            " where CustomerId = '" + CustId + "' ", con);
        //Transmits SELECT statement to the data store usig Fill
        daCustDetails.Fill(dsCustDetails, "Tbl_Customer_Group12");
        return dsCustDetails;
    }


    /***********************************************************************
     *Method Name : GetNextBookingID
     *Description: The method is used to call query to get next 
     *travel booking code using MAX function in SQL database. 
     *Declare command object, all the requireddata type, output / return
     *parameters and execute the query and handle the return values.
     *Send the return values to calling method .
     *Input Parameters: None.
     *Return Value: It returns next Travel booking id.
     ************************************************************************/

    public int GetNextBookingID()
    {
        int NextBookingID;
        //Call the query to get next travel booking code
        SqlCommand cmdNextBookingID = new SqlCommand
            ("Select Max(BookingId) from Tbl_Travel_Booking_Group12", con);
        con.Open();
        NextBookingID = (int)cmdNextBookingID.ExecuteScalar();
        con.Close();
        return (NextBookingID + 1);
    }


    /*************************************************************************
     *Method Name : InsertValues1
     *Description: Inserting values into table Tbl_Travel_Booking_Group12
     *Input Parameters: PackId, CustId, DateOfBooking, NoOfSeats.
     *Return Value: Integer Ret1
    **************************************************************************/


    public int InsertValues1
        (string PackId, int CustId, DateTime DateOfBooking, int NoOfSeats)
    {
        int Ret1 = 0;
        SqlCommand cmdInsert = new SqlCommand
            ("Insert into Tbl_Travel_Booking_Group12 values" +
            "('" + PackId + "'," + CustId + ", " +
            "'" + DateOfBooking + "', " + NoOfSeats + " )", con);
        con.Open();
        Ret1 = Convert.ToInt16(cmdInsert.ExecuteNonQuery());
        con.Close();
        return Ret1;

    }


    /***********************************************************************
     *Method Name : InsertValues2
     *Description: Inserting values into table Tbl_Package_Travelers_Group12
     *Input Parameters: int i_BookingId, int CustId, 
     *string FirstName, string LastName.
     *Return Value: Integer Ret2
    ************************************************************************/


    public int InsertValues2
        (int i_BookingId, int CustId, string FirstName, string LastName)
    {
        int Ret2 = 0;
        char c_TravelerType = 'A';

        SqlCommand cmdInsert = new SqlCommand
                ("Insert into Tbl_Package_Travelers_Group12 values" +
                "(" + i_BookingId + "," + CustId + ", '" + FirstName + "'" +
                ",'" + LastName + "', '" + c_TravelerType + "' )", con);
        con.Open();
        Ret2 = cmdInsert.ExecuteNonQuery();
        con.Close();
        return Ret2;
    }


    /************************************************************************
     *Method Name : InsertValues3
     *Description: Inserting values into table Tbl_Package_Payment_Group12
     *Input Parameters: string PackId, int i_BookingId, 
     *double TotalFare, double Taxes
     *Return Value: Integer Ret3
    **********************************************************************/


    public int InsertValues3(int i_BookingId, double TotalFare, double Taxes)
    {
        int Ret3 = 0;
        SqlCommand cmdInsert = new SqlCommand
            ("Insert into Tbl_Package_Payment_Group12 values " +
            "(" + i_BookingId + ", " + TotalFare + "," + Taxes + " )", con);
        con.Open();
        Ret3 = Convert.ToInt16(cmdInsert.ExecuteNonQuery());
        con.Close();
        return Ret3;
    }


        /**********************************************************************
    *Method Name : UpdateStatus
    *Description: Updating values into table Tbl_Package_Status_Group12
    *Input Parameters: string PackId, int NoOfSeats
    *Return Value: 1
    **********************************************************************/
    public int UpdateStatus(string PackId, int NoOfSeats)
    {

        SqlCommand cmdUpdateStatus = new SqlCommand
            ("Update Tbl_Package_Status_Group12 set RemainingSeats= "+
            "((Select RemainingSeats from Tbl_Package_Status_Group12 "+
            "where PackageId ='" + PackId + "' ) -" + NoOfSeats + " ) "+
            "where PackageId ='" + PackId + "'", con);
        con.Open();
        Convert.ToInt16(cmdUpdateStatus.ExecuteNonQuery());
        con.Close();
        return 1;
        
    }




}



