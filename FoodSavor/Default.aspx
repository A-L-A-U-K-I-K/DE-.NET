<%@ Page Title="Food Savior" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FoodSavor._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
	<style type="text/css">
		.food {
			background-image: url(mainPage.jpg);
			opacity: 0.9;
			background-size: cover;
			width: 100%;
			height: 600px;
			color: white;
			z-index: -1;
			margin-top: 60px;
		}

		.centered {
			position: absolute;
			top: 30%;
			left: 20%;
		}

		.heading {
			font-size: 60px !important;
			text-shadow: 1px 1px 4px #000;
		}
	</style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="container-fluid food">
		<div class="centered">
			<h1 class="heading">Food Savior</h1>
		</div>
	</div>
</asp:Content>
