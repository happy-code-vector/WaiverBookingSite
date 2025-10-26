<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UsageReport.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.UsageReport" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title form-inline">WaiverFile Top Sites
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboDaysAgo" AutoPostBack="true" OnSelectedIndexChanged="cboDaysAgo_SelectedIndexChanged">
                <asp:ListItem Value="-8">Past 7 Days</asp:ListItem>
                <asp:ListItem Value="-15">Past 14 Days</asp:ListItem>
                <asp:ListItem Value="-31">Past 30 Days</asp:ListItem>
                <asp:ListItem Value="-61">Past 60 Days</asp:ListItem>
                <asp:ListItem Value="-91">Past 90 Days</asp:ListItem>
                <asp:ListItem Value="-181">Past 180 Days</asp:ListItem>
                <asp:ListItem Value="-366">Past 365 Days</asp:ListItem>

            </asp:DropDownList>
            <span class="addbuttons">
            <a href="?sc=WF_TRIAL_REPORT&c=1" class="ico_chart">Trial Report</a>
          </span>

        </h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">
        
        <div style="width:100%; overflow:auto;">
     <asp:PlaceHolder ID="phGrid" runat="server"></asp:PlaceHolder>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"></asp:SqlDataSource>
    </div><!-- /.box-body -->
</div>