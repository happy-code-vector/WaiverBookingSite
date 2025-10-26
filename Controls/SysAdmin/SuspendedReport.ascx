<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SuspendedReport.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.SuspendedReport" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Suspended Sites
</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">

       <rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False"  id="RadGrid2" runat="server" DataSourceID="sqlDataSource2" AutoGenerateColumns="False" OnDeleteCommand="RadGrid1_DeleteCommand">
        <mastertableview datasourceid="sqlDataSource2" DataKeyNames="WFSubscriptionID"><Columns>

            <rad:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="url" DataNavigateUrlFormatString="https://www.waiverfile.com/b/{0}" DataTextField="url" FilterControlAltText="Filter column column" HeaderText="Url" Target="_blank" UniqueName="column">
            </rad:GridHyperLinkColumn>
            <rad:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="customer_ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=WF_EDITCUSTOMER&amp;id={0}&amp;c=1" DataTextField="customerName" DataTextFormatString="{0}" FilterControlAltText="Filter column1 column" HeaderText="Customer" UniqueName="column1">
            </rad:GridHyperLinkColumn>


            
<rad:GridBoundColumn DataField="name" UniqueName="name" HeaderText="Site Name" FilterControlAltText="Filter name column" SortExpression="name"></rad:GridBoundColumn>
            
            <rad:GridBoundColumn DataField="expirationDate" DataType="System.DateTime" FilterControlAltText="Filter expirationDate column" HeaderText="Expires" SortExpression="expirationDate" UniqueName="expirationDate" DataFormatString="{0:d}">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="cc" UniqueName="cc" HeaderText="Card" FilterControlAltText="Filter cc column" SortExpression="cc"></rad:GridBoundColumn>

            <rad:GridButtonColumn CommandName="DELETE" FilterControlAltText="Filter column2 column" HeaderText="Set to Cancelled" Text="Set to Cancelled" UniqueName="column2">
            </rad:GridButtonColumn>
</Columns>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<EditFormSettings>
<EditColumn InsertImageUrl="Update.gif" UpdateImageUrl="Update.gif" CancelImageUrl="Cancel.gif"></EditColumn>
</EditFormSettings>
</mastertableview>

<FilterMenu EnableEmbeddedSkins="False"></FilterMenu>

<HeaderContextMenu EnableEmbeddedSkins="False"></HeaderContextMenu>
    </rad:RadGrid>
 
        
        
    </div><!-- /.box-body -->
</div>


 <asp:SqlDataSource ID="sqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
        SelectCommand="" ProviderName="System.Data.SqlClient" >
        </asp:SqlDataSource>

