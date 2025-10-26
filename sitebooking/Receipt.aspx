<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="WaiverFile.sitebooking.Receipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container py-5">
    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
         </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server" />
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server" />

