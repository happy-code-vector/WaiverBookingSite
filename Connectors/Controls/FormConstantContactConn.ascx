<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormConstantContactConn.ascx.cs" Inherits="WaiverFile.Connectors.Controls.FormConstantContactConn" %>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Constant Contact Settings</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <p>The Constant Contact connector will send all collected contact data to your Constant Contact account once per hour.</p>
       <asp:Button runat="server" ID="btnConnect" CssClass="btn btn-primary" Text="Connect to Constant Contact" OnClick="btnConnect_Click" />
        <% if(_continueUrl!=""){ %><a href="<%=_continueUrl %>" class="btn btn-primary"><i class="fa fa-arrow-circle-right"></i> <%=_continueText%></a><% } %>
        <br /><br />
        <asp:Button runat="server" ID="btnDisconnect" CssClass="btn btn-danger" Text="Disconnect from Constant Contact" OnClick="btnDisconnect_Click" />
        
    </div><!-- /.box-body -->
    <div class="box-footer">
    </div>
</div>
