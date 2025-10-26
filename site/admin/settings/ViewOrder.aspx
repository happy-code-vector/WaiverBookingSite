<%@ Page Title="View Order / Payment" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="WaiverFile.site.admin.settings.ViewOrder" %> 

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 

<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 

  
<asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label><table border="0" cellspacing="0" cellpadding="3" class="orderform">
<tr>
<td><h1><asp:Label runat="server" ID="lblCompanyName"></asp:Label></h1></td>
<td align="right"><table cellspacing="0" class="orderform_block">
<tr><td class="orderform_label">Date</td><td class="orderform_label">Order #</td></tr>
<tr><td class="orderform_field">
    <cc1:HybridDatePicker ID="dtOrderDate" runat="server" IsEditMode="False">
    </cc1:HybridDatePicker>
    </td><td class="orderform_field"><cc1:HybridTextBox ID="txtOrderNumber" runat="server" IsEditMode="False"></cc1:HybridTextBox></td></tr>
</table>
    <a href="/wp-content/Plugins/WPCommerce/Controls/PrintPackingSlip.aspx?id=<%=order_ID.ToString() %>" target="_blank"></a></td>
</tr>
<tr>
<td>
    <strong>Billing Address</strong> 
    <div id="changeBillingAddress" style="display:none;">
        &nbsp;</div>
    <asp:Label ID="lblBillingAddress" runat="server"></asp:Label></td>
<td>
    <strong>Shipping Address</strong> &nbsp; &nbsp; &nbsp;<div id="changeShippingAddress" style="display:none;">
        &nbsp;</div>
    <asp:Label ID="lblShippingAddress" runat="server"></asp:Label></td>
</tr>
<tr>
<td colspan="2"><h3>Items</h3>
    <rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="false"  ID="rgOrderItems" runat="server" AutoGenerateColumns="False" GridLines="None" OnItemDataBound="rgOrderItems_ItemDataBound">
        <MasterTableView ShowFooter="true"><Columns>
<rad:GridBoundColumn DataField="Name" UniqueName="column" HeaderText="Name"></rad:GridBoundColumn>
<rad:GridBoundColumn DataField="Details" UniqueName="column1" HeaderText="Details"></rad:GridBoundColumn>
<rad:GridBoundColumn DataField="Quantity" UniqueName="column2" HeaderText="Quantity"></rad:GridBoundColumn>
<rad:GridBoundColumn DataField="Price" UniqueName="Price" HeaderText="Price" DataFormatString="{0:c}"></rad:GridBoundColumn>
<rad:GridTemplateColumn UniqueName="Amount" HeaderText="Amount">
<ItemTemplate>
<%#DataBinder.Eval(Container.DataItem, "Amount", "{0:c}")%>
</ItemTemplate>
</rad:GridTemplateColumn>
            
</Columns>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>
</MasterTableView>
    </rad:RadGrid></td>
</tr>
<tr><td colspan="2"><h3>Status History</h3><rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="false"  ID="rgStatusHistory" runat="server" AutoGenerateColumns="False" GridLines="None">
    <MasterTableView>
        <Columns>
            <rad:GridBoundColumn DataField="DateSet" HeaderText="Date" UniqueName="column1">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="Status" HeaderText="Status" UniqueName="column">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="Comments" HeaderText="Comments" UniqueName="column2">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="UpdatedByName" HeaderText="Updated By" UniqueName="column3">
            </rad:GridBoundColumn>
        </Columns>
        <ExpandCollapseColumn Resizable="False" Visible="False">
            <HeaderStyle Width="20px" />
        </ExpandCollapseColumn>
        <RowIndicatorColumn Visible="False">
            <HeaderStyle Width="20px" />
        </RowIndicatorColumn>
    </MasterTableView>
    </rad:RadGrid>&nbsp;</td></tr>
<tr>
<td colspan="2"><asp:Label ID="lblAgreement" runat="server"></asp:Label></td>
</tr>
</table>


</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
</asp:Content> 