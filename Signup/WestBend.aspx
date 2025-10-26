<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupWide.Master" AutoEventWireup="true" CodeBehind="WestBend.aspx.cs" Inherits="WaiverFile.Signup.WestBend" %>

<%@ Register Src="/Controls/SignupCustom_WestBend.ascx" TagPrefix="uc1" TagName="SignupWestBend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentFullWidth" runat="server">


    <div class="row">
        <div class="col-lg-5 col-sm-6">
              
           
                    <p>&nbsp;</p>
<p><img src="https://www.waiverfile.com/GalleryContent/Original/west-bend-logo-2025sm.jpg" alt="West Bend Logo" class="img-responsive">
</p>
<p>As a customer of West Bend, you have been provided with access to use WaiverFile to collect your waivers electronically. To setup your account, please complete the form.&nbsp;</p>
<h3>Intro Video</h3>
<iframe width="100%" height="375" src="https://www.youtube.com/embed/5xSbncWMCCI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>





        </div>
        <div class="col-lg-5 col-lg-offset-2 col-sm-6">
            <h3>Setup Your Account</h3>

            <uc1:SignupWestBend runat="server" ID="SignupWestBend1" TermsUrl="https://www.waiverfile.com/WestBend/Terms.aspx" SignupCode="westbend" SuccessUrl="/Singup/SignupThanks.aspx" SetupOptionLabel="Setup Options"   />
        </div>
    </div>

    


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFullWidthGreyBG" runat="server"></asp:Content>
