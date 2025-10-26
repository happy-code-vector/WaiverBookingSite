<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverMonitorWithCheckinSidebar.ascx.cs" Inherits="WaiverFile.Controls.WaiverMonitorWithCheckinSidebar" %>

<ul class="nav in">
    <li class="sidebar-search">
        <label>Check-in View</label>
        <asp:DropDownList runat="server" ID="cboCheckinSelection" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cboCheckinSelection_SelectedIndexChanged">
            <asp:ListItem Value="VIEW_ALL">View All</asp:ListItem>
            <asp:ListItem Value="CHECKED_IN">Checked-In</asp:ListItem>
            <asp:ListItem Value="NOT_CHECKED_IN">Not Checked-In</asp:ListItem>
        </asp:DropDownList>
    </li>
</ul>
