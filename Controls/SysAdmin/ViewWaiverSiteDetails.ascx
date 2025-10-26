<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewWaiverSiteDetails.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ViewWaiverSiteDetails" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<div class="row">
    <div class="col-sm-6"><div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title"><asp:Label ID="lblSiteName" runat="server"></asp:Label>
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        
        <asp:PlaceHolder id="phDetails" runat="server"></asp:PlaceHolder>

    </div><!-- /.box-body -->
</div>
</div>
    <div class="col-sm-6"><div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Site Tools</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        
        <h4>Re-send Welcome Email</h4>
        
        <div class="form-group">
            <label>BCC Email</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtBCC" placeholder="BCC"></asp:TextBox>
            <p class="help-block">Optional. Specify an address to BCC a copy of the email to.</p>
        </div>
        
        <asp:Button runat="server" ID="btnSendWelcomeEmail" Text="Re-send Welcome Email" OnClick="btnSendWelcomeEmail_Click" CssClass="btn btn-primary" />

        <hr />


    </div><!-- /.box-body -->
</div>
</div>
</div>

<div class="row">
    <div class="col-xs-12">

        <div style="width:100%; overflow:auto;">
        <asp:PlaceHolder ID="phGrid" runat="server"></asp:PlaceHolder>
            </div>
    </div>
</div>