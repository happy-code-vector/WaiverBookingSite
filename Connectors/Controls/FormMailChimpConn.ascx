<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormMailChimpConn.ascx.cs" Inherits="WaiverFile.Connectors.Controls.FormMailChimpConn" %>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">MailChimp Settings</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <p>The MailChimp connector will send all collected contact data to your MailChimp account once per hour.</p>
       <asp:Button runat="server" ID="btnConnect" CssClass="btn btn-primary" Text="Connect to MailChimp" OnClick="btnConnect_Click" />
        <% if(_continueUrl!=""){ %><a href="<%=_continueUrl %>" class="btn btn-primary"><i class="fa fa-arrow-circle-right"></i> <%=_continueText%></a><% } %>
        <br /><br />
        <asp:Button runat="server" ID="btnDisconnect" CssClass="btn btn-danger" Text="Disconnect from MailChimp" OnClick="btnDisconnect_Click" />
        
    </div><!-- /.box-body -->
    <div class="box-footer">
    </div>
</div>
