<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingDefault.Master" AutoEventWireup="true"
    CodeBehind="default.aspx.cs" Inherits="WaiverFile.sitebooking._defaultBookingPage" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <meta http-equiv="refresh" content="0;url=/home">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script type="text/javascript">
            window.location.href = '/home';
        </script>
        <p>Redirecting to <a href="/home">homepage</a>...</p>
    </asp:Content>