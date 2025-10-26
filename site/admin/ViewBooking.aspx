<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ViewBooking.aspx.cs" Inherits="WaiverFile.site.admin.ViewBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <!-- Page header / crumb -->
<div class="row">
  <div class="col-xs-12">
    <h3 class="page-header" style="margin-top:10px;">Booking <%=booking.BookingNumber %> - <%=booking.Customer.First_Name %> <%=booking.Customer.Middle_Name %> <%=booking.Customer.Last_Name %></h3>
    <ol class="breadcrumb" style="margin-bottom:15px;">
      <li><a href="Bookings.aspx"><i class="fa fa-chevron-left"></i> Back to Bookings</a></li>
      <li class="active">Booking <%=booking.BookingNumber %></li>
    </ol>
  </div>
</div>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

    <asp:PlaceHolder runat="server" ID="phMain"></asp:PlaceHolder>
</asp:Content>
