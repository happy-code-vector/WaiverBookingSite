<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="CustomerLogout.aspx.cs" Inherits="WaiverFile.sitebooking.CustomerLogout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container py-5">
         <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
         <asp:Panel runat="server" ID="pnlLoggedIn" Visible="false">
        <div class="alert alert-success d-flex align-items-center" role="alert">
            <i class="ci-check-circle me-2 fs-lg"></i>
            <div>
                You have been successfully logged out.
                <a href="./" class="alert-link ms-1">Continue</a>
            </div>
        </div>
    </asp:Panel>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
