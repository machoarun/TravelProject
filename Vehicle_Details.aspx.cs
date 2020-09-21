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

/*--------------------------------------------------------------*/
/* Project : Make My Trip
 Sub-system name : Display Vehicle Details
 Author : <Pukhraj Bal>
 Module name : Vehicle Module
 Description : This Program Specification gives the detailed
              flow for the user to view vehicle details.*/
/*--------------------------------------------------------------*/
public partial class Vehicle_Module_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // populate GridView
        Fare objGrid = new Fare();
        DataSet ds =  objGrid.populateGridview(Session["City"].ToString());
        GridViewVehicleDetails.DataSource = ds.Tables[0];
        GridViewVehicleDetails.DataBind();
        // Check if GridView is populated
        if (GridViewVehicleDetails.Rows.Count != 0)
        {
            lblCity.Text = Session["CityName"].ToString();
            lblJourneyDate.Text = Session["JourneyStartDate"].ToString();
            lblJourneyEndTime.Text = Session["JourneyEndTime"].ToString();
            lblTravelType.Text = Session["TravelType"].ToString();
            lblJourneyStartTime.Text = Session["JourneyStartTime"].ToString();

            Page.DataBind();
        }
        else
        {
            Response.Write("<script>alert('No Vehicle To this Location\t')</script>");
            Server.Transfer("Search_Vehicle.aspx");
        }
    }

    // on selection of a row on gridview
    protected void GridViewVehicleDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = GridViewVehicleDetails.SelectedIndex;
        Session["CarName"] = GridViewVehicleDetails.Rows[i].Cells[0].Text;

        Fare obj = new Fare();

        int available = obj.VehicleAvailability(Session["CarName"].ToString(), Session["City"].ToString(), Session["JourneyStartDate"].ToString(), Session["JourneyReturnDate"].ToString(), Session["JourneyStartTime"].ToString(), Session["JourneyEndTime"].ToString(), Session["TravelType"].ToString());

        // chcek if vehicle is vehicle is available
        if (available != 0)
        {
            Response.Write("<script>alert('Vehicle is Available')</script>");
            Server.Transfer("Review_Vehicle_Details.aspx");
        }
        else 
        {
            Response.Write("<script>alert('Vehicle is not available !!!')</script>");
            Server.Transfer("Search_Vehicle1.aspx");
        }
    }
    
}
