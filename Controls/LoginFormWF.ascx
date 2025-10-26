<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginFormWF.ascx.cs" Inherits="WaiverFile.Controls.LoginFormWF" %>
<%if (((Waypoint.Core.WPPageLite)Page).AuthenticatedUser!=null){ %>
You are logged in. <a href="?action=logout">Log Out.</a>
<%}else{ %>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Login</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label for="<%=txtLogin.ClientID %>"><asp:Label runat="server" ID="lblLogin"></asp:Label></label>
            <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="<%=txtPassword.ClientID %>">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" onclick="btnSubmit_Click"  />
    </div>
</div>

 <br />
        <a href="<%=ForgotPasswordUrl %>">Forgot Password?</a>
<%} %>