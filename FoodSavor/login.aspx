<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FoodSavor.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<style type="text/css">
		body {
			background-color: #f0f0f0;
		}

		.container-fluid {
			width: 100%;
			height: auto;
			margin-top: 70px;
		}

		/* Full-width input fields */
		input[type=text], input[type=password] {
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			display: block;
			border-radius: 5px;
			border: 1px solid #ccc;
			box-sizing: border-box;
		}

		/* Set a style for all buttons */
		.button {
			background-color: #4CAF50;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			cursor: pointer;
			width: 100%;
		}

			.button:hover {
				opacity: 0.8;
			}

		span.psw {
			float: right;
		}

		.heading {
			color: #5f5f5f;
			font-size: 24px;
		}

		.login {
			border: 1px solid #ccc;
			height: 100%;
			width: 60%;
			display: inline-block;
			margin: 30px;
			padding-top: 40px;
			padding-bottom: 40px;
			box-shadow: rgba(124,124,124,4) 1px 1px 1px inset;
			background-color: white;
		}

		hr {
			border: 1px solid #8f8f8f;
			opacity: 0.5;
			margin: 20px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="container-fluid text-center">
		<div class="login">
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" style="text-align: left;">
					<asp:Label CssClass="heading" ID="Label4" runat="server" Text="Login"></asp:Label>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" style="text-align: left;">
					<br />
					<asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
					<asp:TextBox AutoPostBack="true" TextMode="SingleLine" ID="TextBox1" runat="server" placeholder="Enter Username"></asp:TextBox>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" style="text-align: left;">
					<asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
					<asp:TextBox AutoPostBack="true" TextMode="Password" ID="TextBox2" runat="server" placeholder="Enter Password"></asp:TextBox>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-5" style="text-align: left;">
					<asp:Label ID="Label3" runat="server" Text="">
						<asp:CheckBox AutoPostBack="true" ID="CheckBox1" runat="server" Text="Remember Me" Checked="true" />
					</asp:Label>
				</div>
				<div class="col-md-5">
					<span class="psw">Forgot <a href="~/">password?</a></span>
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10">
					<asp:Button CssClass="button" AutoPostBack="true" ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click" />
				</div>
				<div class="col-md-1">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10" style="text-align: left;">
					<span>New user? <a href="~/signup">Sign Up</a></span>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</div>
	</div>
</asp:Content>