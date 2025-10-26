<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WaiverFile.sitebooking.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
                <h1 class="h2 mt-auto">Recover Your Account</h1>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <div class="needs-validation" novalidate="">
            <div class="position-relative mb-4">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control form-control-lg" placeholder="Email" TextMode="Email" AutoCompleteType="Email"></asp:TextBox>
              <div class="invalid-tooltip bg-transparent py-0">Enter a valid email address!</div>
            </div>
           
        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-lg btn-primary w-100" Text="Submit" OnClick="btnSubmit_Click" />
    </div>      


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
