<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="request.aspx.cs" Inherits="FoodSavor.request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NgoHeadContent" runat="server">
	<style type="text/css">
		.username {
			color: blueviolet;
			font-size: x-large;
		}

		.date-time {
			color: black;
			font-size: large;
		}

		.request {
			width: 25%;
			background-color: aliceblue;
			border-radius: 10px;
			box-shadow: rgba(0,0,0,0.5) 2px -3px 7px 0px inset;
			padding: 30px !important;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NgoBodyContent" runat="server">
	<asp:Repeater ID="request_layout" runat="server">
		<HeaderTemplate>
			<h1 class="text-center">Requests</h1>
		</HeaderTemplate>
		<ItemTemplate>
			<div class="container request">
				<div class="row">
					<div class="col-sm-12">
						<asp:Label CssClass="username" ID="username" runat="server" Text='<%# "Donator: " + Request.Cookies["user"] != null ? Request.Cookies["user"]["username"] : null %>'></asp:Label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<asp:Label CssClass="date-time" ID="date_time" runat="server" Text='<%# Eval("datetime") %>'></asp:Label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<asp:Label ID="food_desc" runat="server" Text='<%# "Description<br>" + Eval("fdesc") %>'></asp:Label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<asp:Label ID="food_weight" runat="server" Text='<%# "WeightL " + Eval("fweight") %>'></asp:Label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<asp:Label ID="address" runat="server" Text='<%# "Pickup Location: " +  Eval("address") + ", " + Eval("city") + ", " + Eval("state") %>'></asp:Label>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<asp:Button runat="server" Text="Accept" />
					</div>
					<div class="col-sm-6">
					</div>
				</div>
			</div>
		</ItemTemplate>
	</asp:Repeater>
</asp:Content>
