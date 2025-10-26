<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MobileNumFormEntry.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.MobileNumFormEntry" %>

<div class="col-sm-6">
    <div class="form-group has-feedback">
        <label><asp:Label ID="lbl" runat="server"></asp:Label></label>
        <asp:TextBox ID="txtMobileNum" runat="server" CssClass="form-control"  type="tel"></asp:TextBox>
       <asp:PlaceHolder ID="phExtraInfo" runat="server"></asp:PlaceHolder>
    </div>
  </div>