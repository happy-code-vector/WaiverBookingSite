<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateWFAccountSetupPack.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.CreateWFAccountSetupPack" %>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Create a WaiverFile Account Setup Package</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <p class="help-block">* Begin the name with "Sample - " to offer it in the setup wizard</p>
        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
    </div>
</div>
