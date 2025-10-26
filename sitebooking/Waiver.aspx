<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="Waiver.aspx.cs" Inherits="WaiverFile.sitebooking.Waiver" %>
<%@ register src="~/Controls/WaiverFormEntry3.ascx" tagprefix="uc1" tagname="WaiverFormEntry" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>


    <asp:Panel runat="server" ID="pnlComplete" Visible="false">
        <div class="d-flex align-items-center justify-content-center p-4 bg-light rounded shadow-sm">
              <i class="bi bi-check-circle-fill text-success display-4 me-3"></i>
              <div>
                <h4 class="mb-1 text-success">All Waivers Completed</h4>
                <p class="mb-0 text-muted">Thank you.</p>
              </div>
            </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="pnlGetbookingInfo" Visible ="false">
        <h1 class="h2 mt-auto">Find Your Booking</h1>
        <p>Please enter your booking ID and the email address you used when making your reservation. We’ll use this information to locate your booking and take you to the waiver form.</p>
          <div class="needs-validation" novalidate="">
          <div class="position-relative mb-4">

              <label for="<%=txtBookingID.ClientID %>">Booking ID</label>
              <asp:TextBox runat="server" ID="txtBookingID" CssClass="form-control form-control-lg" placeholder="Booking ID" ></asp:TextBox>
            
          </div>
          <div class="mb-4">
            <div class="password-toggle">
                 <label for="<%=txtBookingID.ClientID %>">Email Address</label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control form-control-lg" placeholder="Email" TextMode="Email" AutoCompleteType="Email"></asp:TextBox>
<div class="invalid-tooltip bg-transparent py-0">Enter a valid email address!</div>
             
            </div>
          </div>
         
      <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-lg btn-primary w-100" Text="Continue" OnClick="btnSubmit_Click" />
  </div>      


    </asp:Panel>


        <asp:PlaceHolder runat="server" ID="phWorkflow"></asp:PlaceHolder>

        <asp:PlaceHolder runat="server" id="phSelection"></asp:PlaceHolder>



        
        <asp:PlaceHolder runat="server" ID="phProgressBar"></asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="phErr2"></asp:PlaceHolder>
        

        <asp:PlaceHolder runat="server" ID="phEntryForm"></asp:PlaceHolder>


    
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
