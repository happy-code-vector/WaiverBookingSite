<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupWide.Master" AutoEventWireup="true" CodeBehind="Expedia.aspx.cs" Inherits="WaiverFile.Signup.Expedia" %>

<%@ Register Src="/controls/EasySignupV3.ascx" TagPrefix="uc1" TagName="EasySignupV3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentFullWidth" runat="server">


    <div class="row">
        <div class="col-lg-5 col-sm-6">
                <img alt="Expedia Cruises Logo" src="https://www.waiverfile.com/GalleryContent/Normal/Expedia Logo.png" class="img-responsive" />
<p>As a member of Expedia Cruises, you can leverage WaiverFile to collect your card authorization forms. To setup your account, complete the form to the right. Your new forms will be created and ready to use. </p>

        </div>
        <div class="col-lg-5 col-lg-offset-2 col-sm-6">
            <uc1:easysignupv3 runat="server" id="EasySignupV3"
                
                SignupCode="Expedia"
                ForgotPasswordUrl="/Forgot-Password.aspx" HipaaSelectMode="Dont_ask_disable_hipaa" EnableBruteForceBlocking="true"  NewOfferValidForDays="60" EnablePlugin_Expedia="true"
                />
        </div>
    </div>

    


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFullWidthGreyBG" runat="server"></asp:Content>
