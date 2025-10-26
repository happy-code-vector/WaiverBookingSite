<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MailingTester.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.MailingTester" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Mailing Tester
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <p>Select a subscription and mailing and this will send a sample of that message to you.</p>
        <div class="form-group">
            <label>Subscription</label>
            <asp:DropDownList runat="server" ID="cboSubscriptions" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Mailing</label>
            <asp:DropDownList runat="server" ID="cboMailing" CssClass="form-control"></asp:DropDownList>
        </div>
        
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSend" CssClass="btn btn-primary" Text="Submit" OnClick="btnSend_Click" />
    </div>
</div>

 