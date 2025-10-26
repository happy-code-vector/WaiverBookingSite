<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactForm.ascx.cs" Inherits="WaiverFile.Controls.CMSEndUserControls.ContactForm" %>
<%@ Register Assembly="WaiverFile" Namespace="WaiverFile.Controls.CMSControls" TagPrefix="cc1" %>
<asp:PlaceHolder ID="phErr" runat="server" />
<asp:PlaceHolder ID="PlaceHolder1" runat="server" />

<% if (!string.IsNullOrEmpty(FormHeader)) { %>
    <h3 class="text-center pb-2"><%= FormHeader %></h3>
<% } %>
<% if (!string.IsNullOrEmpty(FormParagraph)) { %>
    <p class="text-center pb-3 mx-auto" style="max-width: 450px"><%= FormParagraph %></p>
<% } %>

<div class="row g-4">
    <asp:Panel runat="server" ID="pnlFirstName" CssClass="col-md-6">
        <label class="form-label">First Name</label>
        <asp:TextBox data-labelname="First Name" ID="txtFirst" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="First Name"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlMiddleName" CssClass="col-md-6">
        <label class="form-label">Middle Name</label>
        <asp:TextBox data-labelname="Middle Name" ID="txtMiddle" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Middle Name"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlLastName" CssClass="col-md-6">
        <label class="form-label">Last Name</label>
        <asp:TextBox data-labelname="Last Name" ID="txtLast" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Last Name"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlName" CssClass="col-md-6">
        <label class="form-label">Name</label>
        <asp:TextBox data-labelname="Name" ID="txtName" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Name"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlTitle" CssClass="col-md-6">
        <label class="form-label">Title</label>
        <asp:TextBox data-labelname="Title" ID="txtTitle" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Title"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlCompany" CssClass="col-md-6">
        <label class="form-label">Company</label>
        <asp:TextBox data-labelname="Company" ID="txtCompany" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Company"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlAddress" CssClass="col-md-6">
        <label class="form-label">Address</label>
        <asp:TextBox data-labelname="Address" ID="txtAddress" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Address"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlCity" CssClass="col-md-6">
        <label class="form-label">City</label>
        <asp:TextBox data-labelname="City" ID="txtCity" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="City"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlState" CssClass="col-md-6">
        <label class="form-label">State</label>
        <asp:TextBox data-labelname="State" ID="txtState" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="State"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlZip" CssClass="col-md-6">
        <label class="form-label">Zip</label>
        <asp:TextBox data-labelname="Zip" ID="txtZip" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Zip"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlPhone" CssClass="col-md-6">
        <label class="form-label">Phone</label>
        <asp:TextBox data-labelname="Phone" ID="txtPhone" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Phone"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlFax" CssClass="col-md-6">
        <label class="form-label">Fax</label>
        <asp:TextBox data-labelname="Fax" ID="txtFax" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Fax"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlEmailAddress" CssClass="col-md-6">
        <label class="form-label">Email</label>
        <asp:TextBox data-labelname="Email" ID="txtEmail" runat="server" CssClass="form-control form-control-lg rounded-pill" placeholder="Email" AutoCompleteType="Email"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlMessage" CssClass="col-12">
        <label class="form-label">Message</label>
        <asp:TextBox data-labelname="Message" ID="txtMessage" runat="server" CssClass="form-control form-control-lg rounded-6" TextMode="MultiLine" Rows="5"></asp:TextBox>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlCaptcha" CssClass="col-12">
        <cc1:WFCaptcha runat="server" ID="wfCaptcha1" />
    </asp:Panel>

    <div class="col-12 text-center pt-2 pb-3">
        <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-lg btn-dark rounded-pill" OnClick="btnSend_Click" />
    </div>
</div>
