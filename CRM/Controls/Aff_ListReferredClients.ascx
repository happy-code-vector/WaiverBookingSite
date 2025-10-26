<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Aff_ListReferredClients.ascx.cs" Inherits="WaiverFile.CRM.Controls.Aff_ListReferredClients" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="row">
    <div class="col-xs-12 text-right">
        <asp:Button runat="server" ID="btnExportToExcel" Text="Export to Excel" CssClass="btn btn-primary" OnClick="btnExportToExcel_Click" />
    </div>
</div>
<div class="row">
    <div class="col-xs-12"></div>
</div>

<telerik:RadGrid ID="RadGrid1" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" CellSpacing="-1" GridLines="Both">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="CustomerID">
        <Columns>
            <telerik:GridBoundColumn DataField="firstname" FilterControlAltText="Filter First column" HeaderText="First" SortExpression="firstname" UniqueName="firstname"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="lastname" FilterControlAltText="Filter Last column" HeaderText="Last" SortExpression="lastname" UniqueName="lastname"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="company" FilterControlAltText="Filter Company column" HeaderText="Company" SortExpression="company" UniqueName="company"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="policyNum" FilterControlAltText="Filter policynum column" HeaderText="Policy Number" SortExpression="company" UniqueName="policynum"></telerik:GridBoundColumn>
            <telerik:GridHyperLinkColumn AllowFiltering="true" AllowSorting="true" DataTextField="email"  DataNavigateUrlFields="email" DataNavigateUrlFormatString="mailto:{0}" FilterControlAltText="Filter column1 column" HeaderText="Email" UniqueName="Email"></telerik:GridHyperLinkColumn>
                         
                         
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="CustomerID" DataNavigateUrlFormatString="/Affiliates/ViewClient.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="View Client" Text="View Client" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
             
                         
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select settingsdata.value('/CustomerDataDetails[1]/CustomSettings[1]/KeysAndValues[Key=&quot;WESTBEND_POLICYNUM&quot;][1]/Value[1]','nvarchar(255)') as policynum,* from tblCRMCustomerData d inner join tblCustomer c on c.Customer_ID=d.CustomerID where d.AffiliateID=@AffiliateID">
    <SelectParameters>
        <asp:Parameter Name="AffiliateID" />
    </SelectParameters>
</asp:SqlDataSource>