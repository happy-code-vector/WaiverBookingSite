<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailFormEnsureLead.ascx.cs" Inherits="WaiverFile.Controls.EmailFormEnsureLead" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title"><%=_headerText %></h3>
    </div>
    <div class="box-body">
        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <p>
            <label>Name</label>
            <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
            </p>
        <p>
            <label>Company</label>
            <asp:TextBox runat="server" ID="txtCompany" CssClass="form-control"></asp:TextBox>
            </p>
        <p>
            <label>Phone</label>
            <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control"></asp:TextBox>
            </p>
        <p>
            <label>Email</label>
            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
            </p>
        <p>
            <label>Message</label>
            <asp:TextBox runat="server" ID="txtMessage" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </p>

        <p>
        <cc1:recaptcha runat="server" id="reCaptcha1"></cc1:recaptcha>
            </p>
    </div>
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" Text="Send Message" CssClass="btn btn-primary" OnClick="btnSave_Click" />
</div>
    </div>
