<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFSubscriptionAddons.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ListWFSubscriptionAddons" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Subscription Add-On Services
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         

                  <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="company" FilterControlAltText="Filter company column" HeaderText="Company" SortExpression="company" UniqueName="company"></telerik:GridBoundColumn>
            

                   
                         
                         <telerik:GridBoundColumn DataField="serviceType" FilterControlAltText="Filter ServiceType column" HeaderText="ServiceType" SortExpression="serviceType" UniqueName="serviceType"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="startDate" FilterControlAltText="Filter StartDate column" HeaderText="StartDate" SortExpression="startDate" UniqueName="startDate"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="expirationDate" FilterControlAltText="Filter ExpirationDate column" HeaderText="ExpirationDate" SortExpression="expirationDate" UniqueName="expirationDate"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
            
            
                         
                         
                         <telerik:GridBoundColumn DataField="currentPriceDesc" FilterControlAltText="Filter CurrentPriceDesc column" HeaderText="CurrentPriceDesc" SortExpression="currentPriceDesc" UniqueName="currentPriceDesc"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="currentUsage" FilterControlAltText="Filter CurrentUsage column" HeaderText="CurrentUsage" SortExpression="currentUsage" UniqueName="currentUsage"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="overridePricing" FilterControlAltText="Filter OverridePricing column" HeaderText="OverridePricing" SortExpression="overridePricing" UniqueName="overridePricing"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="overrideAmount" FilterControlAltText="Filter OverrideAmount column" HeaderText="OverrideAmount" SortExpression="overrideAmount" UniqueName="overrideAmount"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="overrideInterval" FilterControlAltText="Filter OverrideInterval column" HeaderText="OverrideInterval" SortExpression="overrideInterval" UniqueName="overrideInterval"></telerik:GridBoundColumn>



                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="Customer_ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=EDITCUSTOMER&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="View Customer" Text="View Customer" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFSubscriptionAddonService a
inner join tblWFSubscription s on s.ID=a.WFSubscriptionID
inner join tblCustomer c on c.Customer_ID=s.CustomerID

">
                  </asp:SqlDataSource>
                         