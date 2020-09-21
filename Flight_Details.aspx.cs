using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
/*---------------------------------------------------------------------*/
/*
 * Project : Make My Trip
 Sub-system name : Display Flight Details
 Author : <Ankush Rikhi>
 Module name : Flight Module
 Description : This Program Specification gives the detailed
              flow for the user to view Flight details.
              Program*/
/*---------------------------------------------------------------------*/

public partial class Flight_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        /*Assinging The Values To The Labels*/
        lblSource.Text = Session["Source"].ToString();
        lblDestination.Text = Session["Destination"].ToString();
        lblAdults.Text = "Adults " + Session["Adults"].ToString();
        lblDepartureDate.Text = Session["DepartureDate"].ToString();
        lblChildrens.Text = "Childrens " + Session["Children"].ToString();
        lblDepTime1.Text = Session["DepartureTime1"].ToString();
        lblDepTime2.Text = Session["DepartureTime2"].ToString();
       
        string source = Session["Source_Val"].ToString();
        string destination = Session["Destination_Val"].ToString();
        
        /*Making The Object Of The FlightDataBaseLayer*/
        FlightDataBaseLayer objFlight = new FlightDataBaseLayer();
        DataSet dsFlightDetails = new DataSet();
        /* Calling The Method To Fill The Grid*/
        dsFlightDetails = objFlight.GridDetails(source, destination);
        /*Validating That The Grid Is Empty*/
        if (dsFlightDetails.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script>alert('No Flights Available ..Go Back And Try Again')</script>");
            /*If Empty Taking The Control Back*/
            Server.Transfer("Flight_Search.aspx");

        }
        /*Data Binding To The Grid*/

        grdFlightDetails.DataSource = dsFlightDetails.Tables[0];

        Page.DataBind();


    }


    /*On Selecting The Grid Values*/

    protected void grdFlightDetails_SelectedIndexChanged2(object sender, EventArgs e)
    {
        /*Selecting The index of the selected row*/
        int i = Convert.ToInt32(grdFlightDetails.SelectedIndex);
        /*Taking The Session Variables Into The Parameters*/
        string source = Session["Source_Val"].ToString();
        string destination = Session["Destination_Val"].ToString();
        int NoOfAdults = Convert.ToInt32(Session["Adults"].ToString());
        int NoOfChildrens = Convert.ToInt32(Session["Children"].ToString());
        DateTime DateOfJourney = Convert.ToDateTime(Session["DepartureDate"].ToString());
        /*Making The Object Of  FlightDataBaseLayer*/
        FlightDataBaseLayer objFlight = new FlightDataBaseLayer();
        DataSet dsFlightDetails = new DataSet();
        dsFlightDetails = objFlight.GridDetails(source, destination);

        int FlightNo = Convert.ToInt32(dsFlightDetails.Tables[0].Rows[i][5]);

 

        //FlightDataBaseLayer obj = new FlightDataBaseLayer();
        /*Calling The Function To Check The Seat Availability*/
        int iRet = objFlight.CheckSeatStatus(FlightNo, DateOfJourney, NoOfAdults, NoOfChildrens);
        if (iRet == 1)
        {

            Response.Write("<script>alert('Seats Are Avaialable')</script>");
            /*If Seats Are Available Assigning The Grid Values Into The Sessions
             * To Pass To The Other Pages*/
            Session["FlightName"] = dsFlightDetails.Tables[0].Rows[i][0].ToString();
            Session["Source"] = dsFlightDetails.Tables[0].Rows[i][1].ToString();
            Session["Destination"] = dsFlightDetails.Tables[0].Rows[i][2].ToString();
            Session["AdultFare"] = dsFlightDetails.Tables[0].Rows[i][3].ToString();
            Session["ChildFare"] = dsFlightDetails.Tables[0].Rows[i][4].ToString();
            Session["FlightNo"] = dsFlightDetails.Tables[0].Rows[i][5].ToString();
            Session["DepartureTime"] = dsFlightDetails.Tables[0].Rows[i][6].ToString();
            Session["ArrivalTime"] = dsFlightDetails.Tables[0].Rows[i][7].ToString();
            Session["AirportTax"] = dsFlightDetails.Tables[0].Rows[i][8].ToString();
            /*Passing The Control To The Next Form*/
            Server.Transfer("Review_Flight_Details.aspx");


        }
        else
        {
            /*If Seats Are  Not Available*/
            Response.Write("<script>alert('Seats Are Not Available')</script>");
        }


    }
}
