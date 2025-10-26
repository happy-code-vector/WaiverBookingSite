<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListAffiliates.ascx.cs" Inherits="WaiverFile.CRM.Controls.ListAffiliates" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Affiliates
<span class="addbuttons"><a href="?sc=WFCRM_EDIT_AFFILIATE&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
            <telerik:GridBoundColumn DataField="firstname" FilterControlAltText="Filter First column" HeaderText="First" SortExpression="firstname" UniqueName="firstname"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="lastname" FilterControlAltText="Filter Last column" HeaderText="Last" SortExpression="lastname" UniqueName="lastname"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="company" FilterControlAltText="Filter Company column" HeaderText="Company" SortExpression="company" UniqueName="company"></telerik:GridBoundColumn>
            
            <telerik:GridHyperLinkColumn  DataNavigateUrlFields="emailaddress" DataNavigateUrlFormatString="mailto:{0}" FilterControlAltText="Filter column1 column" HeaderText="Email" UniqueName="Email">
                        </telerik:GridHyperLinkColumn>

                         
                         <telerik:GridBoundColumn DataField="code" FilterControlAltText="Filter Code column" HeaderText="Code" SortExpression="code" UniqueName="code"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="dateCreated" FilterControlAltText="Filter DateCreated column" HeaderText="DateCreated" SortExpression="dateCreated" UniqueName="dateCreated"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

            
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WFCRM_LIST_AFFILIATE_CLIENT_ACCESS&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Manage Clients" Text="Manage Clients" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WFCRM_EDIT_AFFILIATE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Affiliate Settings" Text="Affiliate Settings" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
             <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="customer_ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_EDITCUSTOMER&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Customer Screen" Text="Customer Screen" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>

                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblCRMAffiliate a left join tblCustomer c on a.customerid=c.customer_ID where a.status<>4">
                  </asp:SqlDataSource>
                         