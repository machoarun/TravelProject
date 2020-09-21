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
/*------------------------------------------------------------------------*/
/*Project : Make My Trip
 Sub-system name : Search Travel Packages
 Author : <Sharavana>
 Module name : Travel Module
 Description : This Program Specification gives the detailed
             flow for the user to search for available travel
              packages. 
 
/*------------------------------------------------------------------------*/

public partial class Search_Table : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Comparing startdate to the Current Date
        CompareValidator1.ValueToCompare = DateTime.Now.ToShortDateString();

        CalToDate.Visible = false;
        CalFromDate.Visible = false;

        //Creation of Object and Dataset
        Travel ObjFetch = new Travel();
        DataSet dsCityName = new DataSet();
        DataSet dsCustId = new DataSet();

        //Calling method to fetch Customer Id
        dsCustId = ObjFetch.FetchCustId();

        //Populating into the Dropdownbox
        drpCustID.DataSource = dsCustId.Tables["Tbl_Customer_Group12"];
        drpCustID.DataValueField = "CustomerID";
        drpCustID.DataTextField = "CustomerID";
        drpCustID.DataBind();

        //Calling method to fetch City name
        dsCityName = ObjFetch.FetchCityName();

        //Populating into the Dropdownbox
        drpCity.DataSource = dsCityName.Tables["Tbl_City_Group12"];
        drpCity.DataValueField = "CityCode";
        drpCity.DataTextField = "CityName";
        drpCity.DataBind();

    }



    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    protected void BtnFromDate_Click(object sender, EventArgs e)
    {
        CalFromDate.Visible = true;

    }
    protected void BtnToDate_Click(object sender, EventArgs e)
    {
        CalToDate.Visible = true;
    }
    protected void CalFromDate_SelectionChanged(object sender, EventArgs e)
    {
        //Converting Date to the ShortDate format
        txtFromDate.Text = CalFromDate.SelectedDate.ToShortDateString();
    }
    protected void CalToDate_SelectionChanged(object sender, EventArgs e)
    {
        //Converting Date to the ShortDate format
        txtToDate.Text = CalToDate.SelectedDate.ToShortDateString();

    }
    protected void txtFromDate_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //Transfering the Values to the next page PackageDetails.aspx
        //using querystring  
        Response.Redirect("PackageDetails.aspx?FromDate="
            + txtFromDate.Text + "&ToDate=" + txtToDate.Text + "&City="
            + drpCity.SelectedItem.Text + "&Travelers="
            + drpTravelers.SelectedItem.Text + "&CityCode="
            + drpCity.SelectedValue.ToString() + "&CustId="
            + drpCustID.SelectedItem.Text.ToString());
    }
}
