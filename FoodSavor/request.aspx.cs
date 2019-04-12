using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSavor
{
	public partial class request : System.Web.UI.Page
	{
		SqlConnection con;
		SqlDataAdapter sda;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				if (Request.Cookies["user"]["usertype"].Equals("customer"))
					Response.Redirect("UserPage.aspx");
			}
			con = new SqlConnection();
			con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\Gdrive\use4\Food\oep_food\FoodSavor\FoodSavor\App_Data\FoodSavor.mdf;Integrated Security=True";
			if (con.State != ConnectionState.Open)
			{
				con.Open();
			}
			sda = new SqlDataAdapter("select * from donation",con);
			DataSet ds = new DataSet();
			sda.Fill(ds);
			request_layout.DataSource = ds;
			request_layout.DataBind();
		}
	}
}