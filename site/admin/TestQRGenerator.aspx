<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="TestQRGenerator.aspx.cs" Inherits="WaiverFile.site.admin.TestQRGenerator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <p>
    <label>Number of QR's to Generate</label>
    <asp:TextBox runat="server" ID="txtNum" CssClass="form-control"></asp:TextBox>
        </p>
    <asp:Button runat="server" ID="btnGo" Text="Generate QR codes" CssClass="btn btn-primary" OnClick="btnGo_Click" />
    <hr />

    <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
</asp:Content>
