<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditAccount.ascx.cs" Inherits="WaiverFile.Controls.EditAccount" %>
<div class="widget">
        <h3>Account Details</h3>
        <asp:PlaceHolder ID="phError" runat="server" />
        <div class="widgetcontent">
            <div class="form-group"><label>First Name</label><asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox></div>
            <div class="form-group"><label>Middle Name</label><asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control"></asp:TextBox></div>
            <div class="form-group"><label>Last Name</label><asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox></div>
            <div class="form-group"><asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"  onclick="btnSave_Click" /></div>

          

        </div></div>