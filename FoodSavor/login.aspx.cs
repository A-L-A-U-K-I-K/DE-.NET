﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FoodSavor
{
    public partial class login : System.Web.UI.Page
    {
		SqlConnection con;
		SqlDataReader sdr;
		SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
			if (Request.Cookies["user"] != null)
			{
				if (Request.Cookies["user"]["usertype"].Equals("customer"))
					Response.Redirect("UserPage.aspx");
				else
					Response.Redirect("NgoPage.aspx");
			}
			con = new SqlConnection();
			con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\Gdrive\use4\Food\oep_food\FoodSavor\FoodSavor\App_Data\FoodSavor.mdf;Integrated Security=True";
			if (con.State != ConnectionState.Open)
			{
				con.Open();
			}
			login_error.Style.Add("display", "none");
		}

		protected void loginBtn_Click(object sender, EventArgs e)
        {
			string email, password;
			email = login_email.Text.Trim();
			password = login_password.Text.ToString().Trim();

			cmd = new SqlCommand();
			cmd.Connection = con;
			cmd.CommandType = CommandType.Text;
			if (customer.Checked)
			{
				cmd.CommandText = "select * from customer where email like '" + email + "' and password like '" + password + "'";
			}
			else
			{
				cmd.CommandText = "select * from ngo where email like '" + email + "' and password like '" + password + "'";
			}
			sdr = cmd.ExecuteReader();
			if (sdr.HasRows)
			{
				sdr.Read();
				login_error.Style.Add("display", "none");
				HttpCookie cookie = new HttpCookie("user");
				if (customer.Checked)
				{
					if (sdr.GetValue(3).ToString().Equals(""))
						cookie["username"] = sdr.GetValue(2).ToString() + " " + sdr.GetValue(1).ToString();
					else
						cookie["username"] = sdr.GetValue(3).ToString();
					cookie["usertype"] = "customer";
				}
				else
				{
					cookie["username"] = sdr.GetValue(2).ToString();
					cookie["usertype"] = "ngo";
				}
				cookie["email"] = email;
				cookie["password"] = password;
				cookie.Expires = DateTime.Now.AddDays(30);
				Response.Cookies.Add(cookie);
				if(cookie["usertype"].Equals("customer"))
					Response.Redirect("UserPage.aspx");
				else
					Response.Redirect("NgoPage.aspx");
			}
			else
			{
				login_error.Style.Add("display", "block");
			}
			sdr.Close();
			con.Close();
		}
    }
}