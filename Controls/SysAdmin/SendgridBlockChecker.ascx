<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SendgridBlockChecker.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.SendgridBlockChecker" %>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">SendGrid Block Checker</span>
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        <p>
            We use SendGrid to send emails to end users. SendGrid will monitor for bouncebacks and other issues and prevent repeat sending to 
            addresses that fail. This helps maintain a high sender score. To check the status and unblock recipient email addresses, use the form below.
        </p>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>Email address</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="user@domain.com"></asp:TextBox>
        </div>
        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
        <hr />
        
        <asp:Label runat="server" ID="lblStatus"></asp:Label><br />
        <asp:Button runat="server" ID="btnUnblock" CssClass="btn btn-primary" Text="Unblock" OnClick="btnUnblock_Click" Visible="false" />

    </div><!-- /.box-body -->
    <div class="box-footer">
        
    </div>
</div>
