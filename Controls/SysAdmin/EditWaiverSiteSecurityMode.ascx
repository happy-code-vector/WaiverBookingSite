<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditWaiverSiteSecurityMode.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.EditWaiverSiteSecurityMode" %>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Change Waiver Site Security Mode
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        
        <asp:PlaceHolder ID="phSiteDetails" runat="server"></asp:PlaceHolder>
        
        
        <div class="form-group">
            <label>New Security Mode</label>
            <asp:DropDownList runat="server" ID="cboSecurityMode" CssClass="form-control"></asp:DropDownList>
        </div>
      
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Change" OnClick="btnSave_Click" />
    </div>
</div>
