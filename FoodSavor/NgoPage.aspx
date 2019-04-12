<%@ Page Title="Food Savior" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="NgoPage.aspx.cs" Inherits="FoodSavor.NgoPage" %>

<asp:Content ID="headerngo" ContentPlaceHolderID="NgoHeadContent" runat="server">
	<style>
		.container-fluid {
			padding: 50px;
		}

		.logo1 {
			font-size: 200px;
		}

		.bg-grey {
			background-color: #f6f6f6;
		}

		/* Full-width input fields */
		input[type=text], input[type=email] {
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			display: block;
			border-radius: 5px;
			border: 1px solid #ccc;
			box-sizing: border-box;
		}

		textarea {
			width: 100%;
			height: 100px;
			padding: 12px 20px;
			margin: 8px 0;
			display: block;
			border-radius: 5px;
			border: 1px solid #ccc;
			box-sizing: border-box;
		}

		.slider-image {
			width: 100%;
			height: 550px !important;
		}

		.centered{
			position: absolute;
			top: 70%;
			left: 45%;
		}

		.carousel-caption{
			bottom: 200px;
		}

		.btn-lg{
			font-size: 24px;
			padding: 10px 20px;
			z-index: 99;
			border: 1px solid #bbb;
		}
	</style>
</asp:Content>


<asp:Content ID="bodyngo" ContentPlaceHolderID="NgoBodyContent" runat="server">

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<asp:Image CssClass="slider-image" runat="server" ImageUrl="~/assets/carousel-1.jpg"/>
				<div class="carousel-caption">
					<h2 class="display-2">Hello</h2>
				</div>
			</div>

			<div class="item">
				<asp:Image CssClass="slider-image" runat="server" ImageUrl="~/assets/carousel-2.jpg"/>
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago!</p>
				</div>
			</div>

			<div class="item">
				<asp:Image CssClass="slider-image" runat="server" ImageUrl="~/assets/carousel-3.jpg"/>
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We love the Big Apple!</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class="centered">
		<asp:Button CssClass="btn btn-success btn-lg" ID="request" runat="server" Text="Request" OnClick="request_Click"/>		
	</div>

	<%--About Us--%>
	<div class="container-fluid text-center">
		<div class="row">
			<div class="col-sm-6">
				<h2 style="font-weight: bold;">About Us</h2>
				<br />
				<h4 style="text-align: justify;">Indians waste as much food as the whole of United Kingdom consumes –
					a statistic that may not so much indicative of our love of surfeit,
					as it is of our population. Still, food wastage is an alarming issue in India.
				</h4>
				<h4 style="text-align: justify;">Our street and garbage bins, landfills have sufficient proof to prove it. 
					Weddings, canteens, hotels, social and family functions, households spew out so much food.  
					According to the United Nations Development Programme, up to 40% of the food produced in India is wasted.
				</h4>
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-user logo1"></span>
			</div>
		</div>
	</div>
	<%--Vision and Mission--%>
	<div class="container-fluid bg-grey text-center">
		<span class="glyphicon glyphicon-globe logo1"></span>
		<h2><strong>Our VISION</strong></h2>
		<h4>Expand our global network linking available sources of 
				surplus food to those in need through existing charitable organizations.</h4>
		<h4>Grow our company in a manner that provides a level of 
				profitability necessary to carry out our vision.</h4>
		<h2><strong>Our MISSION</strong></h2>
		<h4>Our primary aim was to reduce food wastage in restaurants and special occasions</h4>
	</div>
	<%--Contact--%>
	<div class="container-fluid">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5">
				<p>Contact us and we'll get back to you within 24 hours.</p>
				<p><span class="glyphicon glyphicon-map-marker"></span>Surat,INDIA</p>
				<p><span class="glyphicon glyphicon-phone"></span>+91 1234567890</p>
				<p><span class="glyphicon glyphicon-envelope"></span>foodsavour@gmail.com</p>
			</div>
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-6 ">
						<asp:TextBox TextMode="SingleLine" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
					</div>
					<div class="col-sm-6 ">
						<asp:TextBox TextMode="Email" ID="TextBox2" runat="server" placeholder="Email"></asp:TextBox>
					</div>
				</div>
				<asp:TextBox TextMode="MultiLine" ID="TextBox3" runat="server" placeholder="Comment Here"></asp:TextBox>
				<div class="row">
					<div class="col-sm-12 form-group text-right">
						<asp:Button CssClass="btn btn-primary btn-md" ID="Button1" runat="server" Text="Send" />
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
