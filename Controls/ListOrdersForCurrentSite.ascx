<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListOrdersForCurrentSite.ascx.cs" Inherits="WaiverFile.Controls.ListOrdersForCurrentSite" %>
<%@ Register Assembly="Telerik.Web.UI"
    Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="false"  ID="RadGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" OnItemDataBound="RadGrid1_ItemDataBound">
    <MasterTableView DataSourceID="SqlDataSource1">
        <Columns>
            <rad:GridBoundColumn DataField="orderNumber" HeaderText="Order Number" UniqueName="column">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="dateCreated" HeaderText="Order Date" UniqueName="column1">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="statusName" HeaderText="Status" UniqueName="column3">
            </rad:GridBoundColumn>
            <rad:GridHyperLinkColumn DataNavigateUrlFields="Order_ID" DataNavigateUrlFormatString="/admin/Settings/ViewOrder.aspx?id={0}"
                HeaderText="View" Text="View Order Details" UniqueName="viewCol">
            </rad:GridHyperLinkColumn>
        </Columns>
        <ExpandCollapseColumn Resizable="False" Visible="False">
            <HeaderStyle Width="20px" />
        </ExpandCollapseColumn>
        <RowIndicatorColumn Visible="False">
            <HeaderStyle Width="20px" />
        </RowIndicatorColumn>
    </MasterTableView>
</rad:RadGrid>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>">
</asp:SqlDataSource>
