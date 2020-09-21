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
/*-----------------------------------------------------------------------------*/
/*
 * Project : Make My Trip
 *Sub-system name : Search Flight
 *Author : <Ankush Rikhi>
 *Module name : Flight Module
 *Description : This Program Specification gives the detailed
 *flow for the user to search for available Flights.
 *
 * */
/*-----------------------------------------------------------------------------*/
public partial class Flight_Search : System.Web.UI.Page


{
    protected void Page_Load(object sender, EventArgs e)
    {

        /*Compare Validation for the Current date should be less than Departure date*/
        cvDate.ValueToCompare = DateTime.Now.ToShortDateString();
        /*Making Object Of The FlightDataBaseLayer*/

        FlightDataBaseLayer objFlight = new FlightDataBaseLayer();
        /*Declaring The DataSet*/
        DataSet dsCustomerId = new DataSet();
        /*Calling The Method And Filling The DataSet*/
        dsCustomerId = objFlight.GetCustomerId();

        /*Filling The DropDownList With CustomerId*/
        drpCustomerId.DataSource = dsCustomerId.Tables[0];
        drpCustomerId.DataTextField = dsCustomerId.Tables[0].Columns[0].ToString();
        drpCustomerId.DataValueField = dsCustomerId.Tables[0].Columns[0].ToString();

        /*Filling The DropDownList With CityNames*/
        /*Declaring The DataSets For The Source And Destination*/
        DataSet dsSourceCity = new DataSet();
        DataSet dsDestinationCity = new DataSet();
        /*Calling The Method And Filling The DataSet*/
        dsSourceCity = objFlight.GetCity();
        /*Calling The Method And Filling The DataSet*/
        dsDestinationCity = objFlight.GetCity();
        /*Assigning The DataSource For Source*/
        drpSource.DataSource = dsSourceCity.Tables[0];
        /*Assigning The DataValueField And DataTextField*/
        drpSource.DataTextField = dsSourceCity.Tables[0].Columns[1].ToString();
        drpSource.DataValueField = dsSourceCity.Tables[0].Columns[0].ToString();



        /*Assigning The DataSource For Destination*/
        drpDestination.DataSource = dsDestinationCity.Tables[0];
        drpDestination.DataTextField = dsDestinationCity.Tables[0].Columns[1].ToString();
        drpDestination.DataValueField = dsDestinationCity.Tables[0].Columns[0].ToString();

       
        
        /*For Filling The Data Controls binding The Page*/
        Page.DataBind();
    }
    /*Displaying The Date In The TextBox Using Calender*/
    protected void btnDepartureDate_Click(object sender, EventArgs e)
    {
        /*On Click Make Calender Visible True*/
        calDepatureDate.Visible = true;
    }

    protected void calDepatureDate_SelectionChanged(object sender, EventArgs e)
    {
        /*Making Calender Disable after selecting the date*/
        calDepatureDate.Visible = false;
        /*Assigning The Date To The TextBox*/
        txtDepartureDate.Text = calDepatureDate.SelectedDate.ToShortDateString();
    }
/*---------------On Click Of btnSearchFlights_Click Button*/
    protected void btnSearchFlights_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            /*Making Sessions To Pass The Values To Other Pages*/
            Session["CustomerId"] = drpCustomerId.SelectedItem;
            Session["Source"] = drpSource.SelectedItem;
            Session["Source_Val"] = drpSource.SelectedValue;
            Session["Destination_Val"] = drpDestination.SelectedValue;
            Session["Destination"] = drpDestination.SelectedItem;
            Session["DepartureTime1"] = drpTime1.SelectedItem;
            Session["DepartureTime2"] = drpTime2.SelectedItem;
            Session["DepartureDate"] = txtDepartureDate.Text;
            Session["Adults"] = drpAdults.SelectedItem;
            Session["Children"] = drpChildren.SelectedItem;
            /*Transfering The Control To The Next Page*/

            Server.Transfer("Flight_Details.aspx");

        }


    }
}
