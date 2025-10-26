<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWaiverSitesForCustomer.ascx.cs" Inherits="WaiverFile.Controls.ListWaiverSitesForCustomer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">WaiverFile Sites
<span class="addbuttons"><a href="?sc=WF_ADD_WAIVER_SITE&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>
            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter column3 column" HeaderText="Status" UniqueName="column3">
            </telerik:GridBoundColumn>
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="Url" DataNavigateUrlFormatString="http://www.waiverfile.com/b/{0}" DataTextField="Url" DataTextFormatString="{0}" FilterControlAltText="Filter column column" HeaderText="Url" Target="_blank" UniqueName="column">
            </telerik:GridHyperLinkColumn>
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="CustomerID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_EDITCUSTOMER&amp;c=1" FilterControlAltText="Filter column2 column" HeaderText="Customer" Text="View Customer" UniqueName="column2" AllowFiltering="False">
            </telerik:GridHyperLinkColumn>
             <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_VIEW_WAIVERSITE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="View Details" Text="View Details" UniqueName="viewcol" AllowFiltering="False">
            </telerik:GridHyperLinkColumn>
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_EDIT_WAIVER_SITE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
            </telerik:GridHyperLinkColumn>


            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWaiverSite where CustomerID=@CustomerID order by name">
                  </asp:SqlDataSource>
