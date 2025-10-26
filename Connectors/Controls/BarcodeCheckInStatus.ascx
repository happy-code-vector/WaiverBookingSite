<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BarcodeCheckInStatus.ascx.cs" Inherits="WaiverFile.Connectors.Controls.BarcodeCheckInStatus" %>
<div class="row">
    <div class="col-sm-6">
        <label>Check In Status: </label>
        <asp:Label ID="lblCheckInStatus" runat="server"></asp:Label>

    </div>
    <div class="col-sm-6">
        <asp:Button runat="server" ID="btnCheckIn" CssClass="btn btn-primary pull-right" OnClick="btnCheckIn_Click" Text="Check In" />
        </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <asp:PlaceHolder ID="phClientDetails" runat="server"></asp:PlaceHolder>
    </div>
</div>