<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="NotFound.aspx.cs" Inherits="WaiverFile.sitebooking.NotFound" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
  <div class="row align-items-center">
    <!-- Text Section -->
    <div class="col-lg-5 offset-lg-1 order-sm-2 col-sm-6">
        <hr class="section-heading-spacer">
        <div class="mb-3"></div> <!-- Replaced clearfix with margin -->
        <h2 class="section-heading">Hmm, this page wasn't found!</h2>
        <p class="lead">
            We're sorry, but the page you were looking for could not be found. 
            Please check your URL and try again.
        </p>
    </div>

    <!-- Image Section -->
    <div class="col-lg-5 order-sm-1 col-sm-6 d-flex justify-content-center">
        <img 
            alt="Page Not Found Graphic" 
            src="/sitebooking/images/waiverfile-not-found.jpg" 
            class="img-fluid rounded shadow-sm" 
            style="max-width: 70%; margin: 40px;"
        >
    </div>
</div>



</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server" />
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server" />

