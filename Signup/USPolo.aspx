<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupWide.Master" AutoEventWireup="true" CodeBehind="USPolo.aspx.cs" Inherits="WaiverFile.Signup.USPolo" %>

<%@ Register Src="/controls/EasySignupV3.ascx" TagPrefix="uc1" TagName="EasySignupV3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentFullWidth" runat="server">


    <div class="row">
        <div class="col-lg-5 col-sm-6">
              <p>&nbsp;</p>
<p>&nbsp;</p>
<p><img alt="WaiverFile Dashboard" src="/wp-content/images/waiver-form-monitor.png" class="img-responsive" /></p>

        </div>
        <div class="col-lg-5 col-lg-offset-2 col-sm-6">
            <uc1:easysignupv3 runat="server" id="EasySignupV3"
                
                SignupCode="USPOLO"
                ForgotPasswordUrl="/Forgot-Password.aspx"  EnableBruteForceBlocking="true"  
                />
        </div>
    </div>

    


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFullWidthGreyBG" runat="server"></asp:Content>
