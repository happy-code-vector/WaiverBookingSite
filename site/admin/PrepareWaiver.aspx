<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="PrepareWaiver.aspx.cs" Inherits="WaiverFile.site.admin.PrepareWaiver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

<asp:Panel runat="server" ID="pnlMain">

  <asp:Panel ID="pnlWaiverForm" runat="server" CssClass="container">

    <!-- Heading -->
    <div class="page-header">
      <h3>
        <asp:Label ID="lblHeading" runat="server" Text="Waiver Invite"></asp:Label>
      </h3>
    </div>

    <asp:Panel runat="server" ID="pnlRecipient">

      <!-- Name -->
      <div class="form-group">
        <label for="txtName" class="control-label">Name</label>
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
      </div>

      <!-- Email -->
      <div class="form-group">
        <label for="txtEmail" class="control-label">Email</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
      </div>

    </asp:Panel>

    <!-- Adult Indicator (if included automatically) -->
    <asp:Panel runat="server" ID="pnlAdultIncluded" CssClass="form-group">
      <div class="alert alert-info">
        <asp:Label ID="lblAdultIncluded" runat="server" Text="Includes 1 Adult (auto-assigned)"></asp:Label>
      </div>
    </asp:Panel>

    <!-- # of Children Dropdown -->
    <asp:Panel runat="server" ID="pnlChildren" CssClass="form-group">
      <label for="cboChildren" class="control-label">Number of Children</label>
      <asp:DropDownList ID="cboChildren" runat="server" CssClass="form-control">
      </asp:DropDownList>
    </asp:Panel>

    <!-- Activities / Items CheckboxList -->
    <asp:Panel runat="server" ID="pnlAdmissionItemSelection" CssClass="form-group">
      <label class="control-label">Sign For</label>
      <asp:CheckBoxList ID="cblItems" runat="server" CssClass="list-unstyled">
      </asp:CheckBoxList>
    </asp:Panel>

    <!-- Submit Button -->
    <div class="form-group">
      <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Continue" OnClick="btnSubmit_Click" />
    </div>

  </asp:Panel>

</asp:Panel>


</asp:Content>
