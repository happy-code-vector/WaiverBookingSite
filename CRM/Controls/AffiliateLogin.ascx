<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AffiliateLogin.ascx.cs" Inherits="WaiverFile.CRM.Controls.AffiliateLogin" %>

<div class="row">
    <div class="col-xs-12">
            <asp:PlaceHolder ID="phStatusMessage" runat="server"></asp:PlaceHolder>
    </div>
</div>


<div class="row">
<asp:Panel ID="pnlJoin" runat="server">
    <div class="col-sm-6">
    <div class="well">
        <h3>Become an Affiliate</h3>
        <p>The WaiverFile affiliate program is a great way to bring a great product to your clients, and bring in extra revenue at the same time!
        </p>
        <a href="/Contact.aspx">Contact us</a> to learn more
    </div>
        </div>
</asp:Panel>

<asp:Panel runat="server" ID="pnlFiller">
       <div class="col-sm-6">
           <img src="/wp-content/images/affiliate.jpg" alt="WaiverFile Affiliate Program" class="img-responsive postimg" />
           </div>
</asp:Panel>
   

<asp:Panel ID="pnlLogIn" runat="server">
    <div class="col-sm-6">
    <div class="well">
        <h3>Affiliate Log-In</h3>
        <p>Log in to your affiliate account.</p>
        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>Email</label>
            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Password</label>
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:CheckBox runat="server" ID="chkRememberMe" Text="Keep me logged in" />
            </div>
        <div class="form-group">
            <asp:Button runat="server" CssClass="btn btn-primary" Text="Log In" ID="btnLogIn" OnClick="btnLogIn_Click" />
            </div>
    </div>
        </div>
</asp:Panel>
</div>