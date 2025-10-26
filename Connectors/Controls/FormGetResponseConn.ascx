<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormGetResponseConn.ascx.cs" Inherits="WaiverFile.Connectors.Controls.FormGetResponseConn" %>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">GetResponse Settings</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <p>The GetResponse connector will send all collected contact data to your GetResponse account once per hour.</p>

         <div class="form-group">
            <label>API Key</label>
            <asp:TextBox ID="txtAPIKey" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
             <p class="help-block">Generate your API key at <a href="https://app.getresponse.com/api" target="_blank">app.getresponse.com/api</a></p>
        </div>

       <asp:Button runat="server" ID="btnConnect" CssClass="btn btn-primary" Text="Save" OnClick="btnConnect_Click" />
       
    </div><!-- /.box-body -->
    <div class="box-footer">
    </div>
</div>
