<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditSiteUser.ascx.cs" Inherits="WaiverFile.Controls.EditSiteUser" %>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Edit Site Access</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>User: </label>
            <asp:Label ID="lblName" runat="server"></asp:Label>
        </div>
         <div class="form-group">
            <label>Access Level</label>
            <asp:DropDownList runat="server" ID="cboRole" CssClass="form-control"></asp:DropDownList>
        </div>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Submit" OnClick="btnSave_Click" />
    </div>
</div>
