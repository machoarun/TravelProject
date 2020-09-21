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
/*--------------------------------------------------------------------------*/
/* Project : Make My Trip
 Sub-system name : Search Hotel
 Author : <Dilpreet k Singh>
 Module name : Hotel Module
 Description : This Program Specification gives the detailed
flow for the user to search for available hotels.*/
/*--------------------------------------------------------------------------*/

public partial class SearchHotel : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        CompareValidator1.ValueToCompare = DateTime.Now.ToShortDateString();

        /*Creating object of DataBase Layer*/
        HotelDataBaseLayer hobj = new HotelDataBaseLayer();
        DataTable dt = new DataTable();

        /*calling Function city to fill drop down list ddlCity*/
        dt = hobj.City();
        ddlCity.DataSource = dt;
        ddlCity.DataValueField = "CityCode";
        ddlCity.DataTextField = "CityName";

        /*calling Function customer to fill drop down list ddlCustId*/
        DataTable dt1 = new DataTable();
        dt1 = hobj.Customer();
        ddlCustID.DataSource = dt1;
        ddlCustID.DataValueField = "Customerid";
        ddlCustID.DataTextField = "Customerid";

        Page.DataBind();

    }



    protected void txtArrival_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtArrival_TextChanged1(object sender, EventArgs e)
    {

    }

    protected void txtDLXRooms_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtDepart_TextChanged1(object sender, EventArgs e)
    {

    }

    protected void txtEXERooms_TextChanged(object sender, EventArgs e)
    {

    }

    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnArrival_Click(object sender, EventArgs e)
    {
       
            calArrival.Visible = true;
        
    }
    protected void btnDepart_Click(object sender, EventArgs e)
    {
            calDepart.Visible = true;
        
    }
    protected void calArrival_SelectionChanged(object sender, EventArgs e)
    {
        /*button to get date from calender into textbox*/
        calArrival.Visible = false;
        {
            txtArrival.Text = Convert.ToString(calArrival.SelectedDate.ToShortDateString());
        }
    }
    protected void calDepart_SelectionChanged(object sender, EventArgs e)
    {
        /*button to get date from calender into textbox*/
        calDepart.Visible = false;
        {

            txtDepart.Text = Convert.ToString(calDepart.SelectedDate.ToShortDateString());

        }


    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        /*Declaring variables for taking Sum of Rooms Booked by customers*/
        int del = Convert.ToInt32(txtDLXRooms.Text);
        int exe = Convert.ToInt32(txtEXERooms.Text);
        int sum = del + exe;

        /*Checking validation for total Rooms a customer can book*/
        if (sum > 4 || sum < 1)
        {
            Response.Write("<script>alert('Please select valid Number of Rooms.Sum of Deluxe and Executive rooms Should be less than 4 and greater            than 0')</script>");
            txtDLXRooms.Text = "";
            txtEXERooms.Text = "";
        }
        else
        {
            Session["City"] = ddlCity.SelectedValue;
            Session["City_loc"] = ddlCity.SelectedItem;
            Session["CustId"] = ddlCustID.SelectedValue;
            Session["ArrivalDate"] = txtArrival.Text;
            Session["DepartDate"] = txtDepart.Text;
            Session["DlxRooms"] = txtDLXRooms.Text;
            Session["ExeRooms"] = txtEXERooms.Text;

            /*Moving to next page HotelDetails.aspx*/
            Server.Transfer("HotelDetails.aspx");
        }


    }

}
