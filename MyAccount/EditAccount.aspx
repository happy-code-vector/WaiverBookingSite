<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyAccountArea.Master" AutoEventWireup="true" CodeBehind="EditAccount.aspx.cs" Inherits="WaiverFile.MyAccount.EditAccount" %>

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    
     <h3>Account Details</h3>
 <asp:PlaceHolder ID="phError" runat="server" />
     <div class="form-group"><label for="<%=txtFirstName.ClientID %>">First Name</label><asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox></div>
     <div class="form-group"><label for="<%=txtMiddleName.ClientID %>">Middle Name</label><asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control"></asp:TextBox></div>
     <div class="form-group"><label for="<%=txtLastName.ClientID %>">Last Name</label><asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox></div>
     <div class="form-group"><label for="<%=txtCompany.ClientID %>">Company</label><asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"></asp:TextBox></div>
     <div class="form-group"><label for="<%=cboTimezone.ClientID %>">Time Zone</label><asp:DropDownList runat="server" ID="cboTimezone" CssClass="form-control"></asp:DropDownList></div>
     <div class="form-group"><asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" 
         onclick="btnSave_Click" /></div>

    <hr />
    <a href="Change-Email-Address.aspx" class="btn btn-primary">Change Email Address</a>
</asp:Content>
