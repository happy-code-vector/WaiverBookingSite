<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FindUserAccess.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.FindUserAccess" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Find User Access
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>Email address</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="email@domain.com"></asp:TextBox>
            <p class="help-block">Find a user account by email address and display everything this user has access to.</p>
        </div>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
    </div>
</div>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Results</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phResults" runat="server"></asp:PlaceHolder>
        
    </div><!-- /.box-body -->
</div>

