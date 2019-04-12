<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ngoprofile.aspx.cs" Inherits="FoodSavor.ngoprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NgoHeadContent" runat="server">
	<script type="text/javascript">
		function showBrowseDialog() {
			var fileuploadctrl = document.getElementById('<%= FileUpload1.ClientID %>');
			fileuploadctrl.click();
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NgoBodyContent" runat="server">
	<div class="container-fluid text-center">
		<asp:ImageButton ID="Image1" runat="server" OnClientClick="showBrowseDialog()" OnClick="Image1_Click"/>
		<asp:FileUpload  ID="FileUpload1" Style="display: none" runat="server" AutoPostBack="true" />
	</div>
</asp:Content>
