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

public partial class PackageDetails : System.Web.UI.Page
{
    // Declaration of Variables
    public string CustId;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Assigning the Values from the Querystring to the variables
        DateTime FromDate = Convert.ToDateTime(Request.QueryString["FromDate"]);
        DateTime ToDate = Convert.ToDateTime(Request.QueryString["ToDate"]);
        this.CustId = Request.QueryString["CustId"].ToString();
        string CityCode = Request.QueryString["CityCode"];

        //Assigning the Values from the Querystring to the labels
        lblToDate.Text = ToDate.ToShortDateString();
        lblFromDate.Text = FromDate.ToShortDateString();
        lblCityname.Text = Convert.ToString(Request.QueryString["City"]);
        lblTravelers.Text = Request.QueryString["Travelers"];

        //Creation of Object and Dataset
        Travel objFindByCity = new Travel();
        DataSet dsPackageByCity = new DataSet();

        //Fetch the package details from the method FindPackageByCity
        dsPackageByCity = objFindByCity.FindPackageByCity
            (CityCode, lblCityname.Text, FromDate, ToDate);

        if (dsPackageByCity.Tables[0].Rows.Count == 0)
        {

            //Displaying  message when there are no packages available
            Response.Write("<script>alert('Packages are not available')</script>");
            Server.Transfer("Search_Table.aspx");
        }
        else
        {
            //Displaying  message when there packages are available
            Response.Write("<script>alert('Packages available !!!!!!')</script>");

            //Transfer the package details from the dataset to the datagridview
            gvPackages.DataSource = dsPackageByCity.Tables
                                ["Tbl_Package_Details_Group12"];
            gvPackages.DataBind();
        }
    }


    protected void gvPackages_SelectedIndexChanged(object sender, EventArgs e)
    {

        //Transfering the Values to the next page ReviewPackagenFareDetails.aspx
        //using querystring  
        Response.Redirect("ReviewPackagenFareDetails.aspx?PackageName="
           + gvPackages.SelectedRow.Cells[1].Text.ToString() + "&Travelers="
           + lblTravelers.Text + "&PackId="
           + gvPackages.SelectedRow.Cells[0].Text.ToString() + "&CustId="
           + this.CustId.ToString());
    }

}
