<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListSitesPendingDelete.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ListSitesPendingDelete" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">WaiverFile Sites Marked for Deletion
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>
            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
            </telerik:GridBoundColumn>
           
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="Url" DataNavigateUrlFormatString="http://www.waiverfile.com/b/{0}" DataTextField="Url" DataTextFormatString="{0}" FilterControlAltText="Filter column column" HeaderText="Url" Target="_blank" UniqueName="column">
            </telerik:GridHyperLinkColumn>
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="CustomerID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_EDITCUSTOMER&amp;c=1" FilterControlAltText="Filter column2 column" HeaderText="Customer" Text="View Customer" UniqueName="column2" AllowFiltering="False">
            </telerik:GridHyperLinkColumn>
             <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_VIEW_WAIVERSITE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="View Details" Text="View Details" UniqueName="viewcol" AllowFiltering="False">
            </telerik:GridHyperLinkColumn>
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_DELETE_WAIVER_SITE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Prepare to Delete" Text="Prepare to Delete" UniqueName="column1" AllowFiltering="False">
            </telerik:GridHyperLinkColumn>


            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWaiverSite where status=@pending_delete_status order by name">
                  </asp:SqlDataSource>
