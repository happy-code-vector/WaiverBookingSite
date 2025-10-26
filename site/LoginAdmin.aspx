
<%@ Page Title="LoginAdmin" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="WaiverFile.site.LoginAdmin" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/IPALoginAdmin.ascx" tagprefix="uc1" tagname="IPALoginAdmin" %> 
<%@ register src="~/Controls/LoginSAMLCapture.ascx" tagprefix="uc1" tagname="LoginSAMLCapture" %> 


<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 

       <asp:Panel runat="server" ID="pnlLoginSAML">
       <uc1:LoginSAMLCapture runat="server" />
      
           <h2>Enterprise Log In</h2>
           <div class="well">
        <div class="row">
    <div class="col-xs-12">
        
          <asp:Button runat="server" ID="btnEnterpriseLogin" CssClass="btn btn-primary" Text="Enterprise Login" OnClick="btnEnterpriseLogin_Click" />
           <a href="/Saml2/LogOut" runat="server" id="btnLogOut" class="btn btn-primary">Logout</a>
    </div>
            </div>
</div>
           <hr />
   </asp:Panel>

    <asp:Panel runat="server" ID="pnlLoginRegular">

<uc1:IPALoginAdmin runat ="server" id="IPALoginAdmin1" /> 
<a href="ForgotPassword.aspx">Forgot your password?</a>

        </asp:Panel>
    
   
</asp:Content> 