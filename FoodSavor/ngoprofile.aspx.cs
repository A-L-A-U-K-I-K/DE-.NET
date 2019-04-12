using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSavor
{
	public partial class ngoprofile : System.Web.UI.Page
	{
		SqlConnection con;
		SqlCommand cmd;
		SqlDataReader sdr;
		string path;
		
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				con = new SqlConnection();
				con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\Gdrive\use4\Food\oep_food\FoodSavor\FoodSavor\App_Data\FoodSavor.mdf;Integrated Security=True";
				if (con.State != ConnectionState.Open)
				{
					con.Open();
				}
				cmd = new SqlCommand();
				cmd.Connection = con;
				cmd.CommandType = CommandType.Text;
				string email = Request.Cookies["user"]["email"];
				cmd.CommandText = "select * from ngo where email like '" + email + "'";
				sdr = cmd.ExecuteReader();
				if (sdr.HasRows)
				{
					sdr.Read();
					path = sdr.GetValue(9).ToString();
					Image1.ImageUrl = "~/ngo/" + path;
				}
				else
				{
					Response.Write("<script>alert('Hello')</script>");
				}
			}
			else
			{
				Response.Redirect("Default.aspx");
			}
		}

		protected void Image1_Click(object sender, ImageClickEventArgs e)
		{
			Response.Write("<script>alert('Hello')</script>");
			path = Path.GetFileName(FileUpload1.PostedFile.FileName);
			FileUpload1.SaveAs("ngo/main.png");
			Image1.ImageUrl = "~/ngo/main.png";
		}
	}
}