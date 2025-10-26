<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SendLink_Expedia.aspx.cs" Inherits="WaiverFile.site.admin.SendLink_Expedia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">


    <h1>Send Form Link</h1>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
     <div class="row">
     <div class="col-sm-6">
         <label>Customer Email Address</label>
         <asp:TextBox runat="server" ID="txtCustomerEmail" CssClass="form-control" AutoCompleteType="Email"></asp:TextBox>
         <p class="help-block">If an address is provided, an email will be sent with the link. If not, you can still copy the link and share it manually. </p>
     </div>
   
 </div>

         <div class="row">
     <div class="col-sm-6">
         <label>Select a form</label>
         <asp:DropDownList runat="server" ID="cboForms" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="cboForms_SelectedIndexChanged"></asp:DropDownList>
     </div>
   
 </div>

    
         <div class="row">
     <div class="col-xs-12">

    <asp:PlaceHolder runat="server" ID="phFields"></asp:PlaceHolder>
    
         </div></div>
    
         <div class="row">
     <div class="col-xs-12">

    <asp:CheckBox runat="server" ID="chkLockFields" Text="Lock pre-filled fields" Checked="true" />
    
         </div></div>

      <div class="row">
<div class="col-xs-12">

    <asp:Button runat="server" ID="btnSend" Text="Send" CssClass="btn btn-primary" OnClick="btnSend_Click" />

</div></div>

</asp:Content>
