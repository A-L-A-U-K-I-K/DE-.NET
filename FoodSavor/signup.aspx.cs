using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.HtmlControls;

namespace FoodSavor
{
	public partial class signup : System.Web.UI.Page
	{
		SqlConnection con;
		SqlDataReader sdr;
		SqlCommand cmd;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user"] != null)
			{
				if(Request.Cookies["user"]["usertype"].Equals("customer"))
					Response.Redirect("~/cont/UserPage.aspx");
				else
					Response.Redirect("~/cont/NgoPage.aspx");
			}
			con = new SqlConnection();
			con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\Gdrive\use4\Food\oep_food\FoodSavor\FoodSavor\App_Data\FoodSavor.mdf;Integrated Security=True";
			if (con.State != ConnectionState.Open)
			{
				con.Open();
			}
		}

		protected void signupBtn_Click(object sender, EventArgs e)
		{
			string fname, lname, rname, email, mobile, password;
			fname = reg_fname_text.Text.Trim();
			lname = reg_lname_text.Text.Trim();
			rname = reg_rname_text.Text.Trim();
			email = reg_email_text.Text.Trim();
			mobile = reg_mobile_text.Text.Trim();
			password = reg_pass_text.Text.Trim();

			reg_email_exist.Visible = false;
			reg_mobile_exist.Visible = false;

			cmd = new SqlCommand();
			cmd.Connection = con;
			cmd.CommandType = CommandType.Text;
			cmd.CommandText = "select * from customer where email like '" + email + "' or mobile like '" + mobile + "'";
			sdr = cmd.ExecuteReader();

			if (sdr.HasRows)
			{
				while (sdr.Read())
				{
					if (sdr.GetValue(4).Equals(email))
					{
						reg_email_exist.Visible = true;
					}
					if (sdr.GetValue(5).Equals(mobile))
					{
						reg_mobile_exist.Visible = true;
					}
				}
			}
			else
			{
				sdr.Close();
				cmd = new SqlCommand();
				cmd.Connection = con;
				cmd.CommandType = CommandType.Text;
				cmd.CommandText = "insert into customer(fname,lname,rname,email,mobile,password) " +
					"values('" + fname + "','" + lname + "','" + rname + "','" + email + "','" + mobile + "','" + password + "')";
				if (cmd.ExecuteNonQuery() > 0)
				{
					HttpCookie cookie = new HttpCookie("user");
					cookie["usertype"] = "customer";
					if (rname.Equals(""))
						cookie["username"] = lname + " " + fname;
					else
						cookie["username"] = rname;
					cookie["email"] = email;
					cookie["password"] = password;
					cookie.Expires = DateTime.Now.AddDays(30);
					Response.Cookies.Add(cookie);
					Response.Redirect("UserPage.aspx");
				}
				else
				{
					Response.Write("<script>alert('Registeration Failed')</script>");
				}
			}
			con.Close();
		}
        
    }
}