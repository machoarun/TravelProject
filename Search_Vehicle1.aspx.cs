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

/*---------------------------------------------------------------*/
/*Project : Make My Trip
 Sub-system name : Search Vehicles
 Author : <Pukhraj Bal >
 Module name : Vehicle Module
 Description : This Program Specification gives the detailed
                flow for the user to search for available vehicles.
  */
/*---------------------------------------------------------------*/
public partial class Vehicle_Module_Search_Vehicle1 : System.Web.UI.Page
{
    // on page load
    protected void Page_Load(object sender, EventArgs e)
    {
        // compare values of calendar 1 to today date
        CompareValidator2.ValueToCompare = DateTime.Today.ToShortDateString();

        // load the page with both calendars visibly off
        calJourney.Visible = false;
        calReturn.Visible = false;
        if (!Page.IsPostBack)
        {
            // populate the travel type control box
            ArrayList alTravelType = new ArrayList();
            alTravelType.Add("Day");
            alTravelType.Add("Drop");
            alTravelType.Add("Travel");
            drpTravelType.DataSource = alTravelType;

            
            ArrayList alTime = new ArrayList();
            for (int i = 6; i < 24; i++)
            {
                alTime.Add(i);
            }

            // populate the both time box
            drpStartTime.DataSource = alTime;
            drpReturnTime.DataSource = alTime;

            calJourney.Visible = false;
            calReturn.Visible = false;

            // Bind Data to Page
            Page.DataBind();
        }
    }

    // on clicking the start date button
    protected void btnStartDate_Click(object sender, EventArgs e)
    {
        calJourney.Visible = true;
        calReturn.Visible = false;
    }

    // on clicking the return date button
    protected void btnReturnDate_Click(object sender, EventArgs e)
    {
        calReturn.Visible = true;
        calJourney.Visible = false;
    }

    //on changing the date in return calendar
    protected void calReturn_SelectionChanged(object sender, EventArgs e)
    {
        txtReturnDate.Text = calReturn.SelectedDate.ToShortDateString();
        calReturn.Visible = false;
        calJourney.Visible = false;
    }
    protected void calJourney_SelectionChanged(object sender, EventArgs e)
    {
        calJourney.Visible = false;
        txtStartDate.Text = calJourney.SelectedDate.ToShortDateString();

        // if the travel type is Day or Drop
        if (drpTravelType.SelectedIndex == 1 || drpTravelType.SelectedIndex == 2)
        {
            txtReturnDate.Text = calJourney.SelectedDate.AddDays(1).ToShortDateString();
            txtReturnDate.Enabled = false;
            btnReturnDate.Enabled = false;
        }
        else
        {
 
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        // Declarattion of Differnet Seesions to be used
        Session["CustomerId"] = drpCustomerId.SelectedValue;
        Session["City"] = drpCity.SelectedValue;
        Session["CityName"] = drpCity.SelectedItem;
        Session["TravelType"] = drpTravelType.SelectedValue;
        Session["JourneyStartDate"] = txtStartDate.Text;
        Session["JourneyReturnDate"] = txtReturnDate.Text;
        Session["NoTravellers"] = txtPickUpAddress.Text;
        Session["JourneyStartTime"] = drpStartTime.SelectedValue;
        Session["JourneyEndTime"] = drpReturnTime.SelectedValue;
        Session["PickUpAddress"] = txtPickUpAddress.Text;
        Session["CurrentDate"] = DateTime.Today.ToShortDateString();

        // get the duration between dates
        TimeSpan ts = new TimeSpan();
        System.Globalization.DateTimeFormatInfo info = new System.Globalization.DateTimeFormatInfo();
        info.ShortDatePattern = "yyyy/MM/dd"; ;
        DateTime dt1 = DateTime.Parse(txtStartDate.Text, info);

        System.Globalization.DateTimeFormatInfo info1 = new System.Globalization.DateTimeFormatInfo();
        info1.ShortDatePattern = "yyyy/MM/dd"; ;
        DateTime dt2 = DateTime.Parse(txtReturnDate.Text, info1);

        // Get the duration of travel from the value of text boxes
        ts = dt2 - dt1;
        int i = ts.Days;
        Session["Duration"] = i.ToString();
        
        // move to next page
        Server.Transfer("Vehicle_Details.aspx");
    }
    
    // On changing the Index of the Travel Type drop down Box
    protected void drpTravelType_SelectedIndexChanged(object sender, EventArgs e)
    {
        // If Selected Item is "Day"  or "Drop" 
        if (drpTravelType.SelectedIndex == 1 || drpTravelType.SelectedIndex == 2)
        {
            drpStartTime.Text = "6";
            drpReturnTime.Text = "23";
            drpReturnTime.Enabled = false;
            drpStartTime.Enabled = false;
            btnReturnDate.Enabled = false;
        }
        // If Selected Item is "Travel"
        else
        {
            drpStartTime.Text = "6";
            drpReturnTime.Text = "6";
            drpStartTime.Enabled = true;
            drpReturnTime.Enabled = true;
            btnReturnDate.Enabled = true;
            txtReturnDate.Enabled = true;
        }
    }

    protected void drpCustomerId_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
