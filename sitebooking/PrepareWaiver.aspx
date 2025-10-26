<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="PrepareWaiver.aspx.cs" Inherits="WaiverFile.sitebooking.PrepareWaiver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

    <asp:Panel runat="server" ID="pnlMain">

        <asp:Panel ID="pnlWaiverForm" runat="server" CssClass="container mt-4">

  <!-- Heading -->
  <div class="mb-4">
    <h3 class="h5">
      <asp:Label ID="lblHeading" runat="server" Text="Waiver Invite"></asp:Label>
    </h3>
  </div>


            <asp:Panel runat="server" ID="pnlRecipient">
  <!-- Name -->
  <div class="mb-3">
    <label for="txtName" class="form-label">Name</label>
    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
  </div>

  <!-- Email -->
  <div class="mb-3">
    <label for="txtEmail" class="form-label">Email</label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
  </div>
                </asp:Panel>

  
   <asp:Panel runat="server" ID="pnlAdultIncluded" CssClass="mb-3">
       <!-- Adult Indicator (if included automatically) -->
    <div class="alert alert-secondary p-2 mb-0">
      <asp:Label ID="lblAdultIncluded" runat="server" Text="Includes 1 Adult (auto-assigned)"></asp:Label>
    </div>
  </asp:Panel>

  <!-- # of Children Dropdown -->
  <asp:Panel runat="server" ID="pnlChildren" CssClass="mb-3">
    <label for="cboChildren" class="form-label">Number of Children</label>
    <asp:DropDownList ID="cboChildren" runat="server" CssClass="form-select">
    </asp:DropDownList>
  </asp:Panel>

  <!-- Activities / Items CheckboxList -->
            <asp:Panel runat="server" ID="pnlAdmissionItemSelection" CssClass="mb-3">
  
    <label class="form-label">Sign For</label>
    <asp:CheckBoxList ID="cblItems" runat="server" CssClass="list-unstyled">
    </asp:CheckBoxList>
  </asp:Panel>

  <!-- Submit Button -->
  <div class="mb-3">
    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Continue" OnClick="btnSubmit_Click" />
  </div>

</asp:Panel>


    </asp:Panel>

    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
