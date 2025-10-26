<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CancellationReport.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.CancellationReport" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Recently Cancelled Sites
</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">

       <rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False"  id="RadGrid2" runat="server" DataSourceID="sqlDataSource2" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" >
        <mastertableview datasourceid="sqlDataSource2" DataKeyNames="WFSubscriptionID"><Columns>

            <rad:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="url" DataNavigateUrlFormatString="https://www.waiverfile.com/b/{0}" DataTextField="url" FilterControlAltText="Filter column column" HeaderText="Url" Target="_blank" UniqueName="column">
            </rad:GridHyperLinkColumn>
            <rad:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="customer_ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=WF_EDITCUSTOMER&amp;id={0}&amp;c=1" DataTextField="customerName" DataTextFormatString="{0}" FilterControlAltText="Filter column1 column" HeaderText="Customer" UniqueName="column1">
            </rad:GridHyperLinkColumn>


            
<rad:GridBoundColumn DataField="name" UniqueName="name" HeaderText="Site Name" FilterControlAltText="Filter name column" SortExpression="name"></rad:GridBoundColumn>
            
            <rad:GridBoundColumn DataField="expirationDate" DataType="System.DateTime" FilterControlAltText="Filter expirationDate column" HeaderText="Expires" SortExpression="expirationDate" UniqueName="expirationDate" DataFormatString="{0:d}">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="cc" UniqueName="cc" HeaderText="Card" FilterControlAltText="Filter cc column" SortExpression="cc"></rad:GridBoundColumn>

          
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
        SelectCommand="select *,
       c.firstname + ' ' + c.lastname                 AS customerName,
       cc.cardtype + ' '
       + CONVERT(NVARCHAR(10), cc.cardexpirationmonth)
       + '/'
       + CONVERT(NVARCHAR(10), cc.cardexpirationyear) AS cc
	   from tblwaiversite s
       INNER JOIN tblwfsubscription sub
               ON sub.id = s.wfsubscriptionid
       INNER JOIN tblcustomer c
               ON c.customer_id = sub.customerid
       LEFT JOIN tblccprofile cc
              ON cc.ccprofileid = sub.ccprofileid
                   where sub.status = @cancelledStatus 
                   and sub.id in (select WFSubscriptionID from tblWFSubscriptionChangeLog l where l.ChangeAction = @changeActionStatus  and DateSaved >= dateadd(month, -12, GETUTCDATE())) and c.customer_ID in (select customer_ID from tblorder) order by ExpirationDate desc" ProviderName="System.Data.SqlClient" >
     <SelectParameters>
         <asp:Parameter Name="cancelledStatus" />
         <asp:Parameter Name="changeActionStatus" />
     </SelectParameters>
        </asp:SqlDataSource>

