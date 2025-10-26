<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VerifyWaiver.ascx.cs" Inherits="WaiverFile.Controls.VerifyWaiver" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>
 
<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
<asp:Panel runat="server" ID="pnlSuccess">

   <div class="WPERR_Success">Waiver Verified!</div>
    <p>Thank you for verifying your waiver. </p>
    <p> </p>
    <a href="Default.aspx" class="btn btn-default btn-muted">Sign Another Waiver</a>

</asp:Panel>
<asp:Panel runat="server" ID="pnlSuccess_already">

   <div class="WPERR_Success">Waiver Already Verified!</div>
    <p>Thank you for verifying your waiver. </p>
    <p> </p>
    <a href="Default.aspx" class="btn btn-default btn-muted">Sign Another Waiver</a>

</asp:Panel>
<asp:Panel runat="server" ID="pnlMain"> 
   
<div class="row">
    <div class="col-sm-6  col-sm-offset-3 col-md-4 col-md-offset-4">
        <div class="panel panel-default alt">
                <div class="panel-body">
                    <h3>Verify Your Waiver</h3>
                    <div class="form-group">
                        <label for="<%=txtEmail.ClientID %>">Email Address</label>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtEmail.ClientID %>">Verification Code</label>
                        <asp:TextBox runat="server" ID="txtCode" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                         <cc1:recaptcha runat="server" id="reCaptcha1"></cc1:recaptcha>
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" ID="btnVerify" CssClass="btn btn-primary btn-block" Text="Verify" OnClick="btnVerify_Click"  />
                    </div>
                </div>
        </div>
    </div>
</div>
    

</asp:Panel>
