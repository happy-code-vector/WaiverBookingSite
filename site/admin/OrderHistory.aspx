<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="WaiverFile.site.admin.OrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <h3>Payment History</h3>


    <%@ Register Assembly="Telerik.Web.UI"
    Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<rad:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" OnItemDataBound="RadGrid1_ItemDataBound">
    <MasterTableView DataSourceID="SqlDataSource1">
        <Columns>
            <rad:GridBoundColumn DataField="orderNumber" HeaderText="Order Number" UniqueName="column">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="dateCreated" HeaderText="Order Date" UniqueName="column1">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="statusName" HeaderText="Status" UniqueName="column3">
            </rad:GridBoundColumn>
            <rad:GridHyperLinkColumn DataNavigateUrlFields="Order_ID" DataNavigateUrlFormatString="/MyAccount/ViewOrder.aspx?id={0}"
                HeaderText="View" Text="View Order Details" UniqueName="viewcol">
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




</asp:Content>
