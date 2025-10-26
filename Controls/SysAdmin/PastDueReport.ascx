<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PastDueReport.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.PastDueReport" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Past Due Report
</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">

       <rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False"  id="RadGrid1" runat="server" DataSourceID="sqlDataSource1" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" OnItemDataBound="RadGrid1_ItemDataBound">
        <mastertableview datasourceid="sqlDataSource1"><Columns>

         



<rad:GridBoundColumn DataField="customerName" UniqueName="customerName" HeaderText="Customer" FilterControlAltText="Filter customerName column" SortExpression="customerName"></rad:GridBoundColumn>
<rad:GridBoundColumn DataField="company" UniqueName="company" HeaderText="Company" FilterControlAltText="Filter company column" SortExpression="company" ></rad:GridBoundColumn>
            
             <rad:GridBoundColumn DataField="Service" HeaderText="Service"
                UniqueName="Service" FilterControlAltText="Filter Service column" SortExpression="Service">
            </rad:GridBoundColumn>
            
            <rad:GridBoundColumn DataField="NumRecentWaivers" HeaderText="Waivers"
                UniqueName="NumRecentWaivers" FilterControlAltText="Filter NumRecentWaivers column" SortExpression="NumRecentWaivers" DataType="System.Int32">
            </rad:GridBoundColumn>
            
          <rad:GridBoundColumn DataField="cc" HeaderText="Card"
                UniqueName="cc" FilterControlAltText="Filter cc column" SortExpression="cc">
            </rad:GridBoundColumn>

                 <rad:GridBoundColumn DataField="annualRev_TOT" HeaderText="ARR Estimate"
                UniqueName="annualRev_TOT" FilterControlAltText="Filter annualRev_TOT column" SortExpression="annualRev_TOT" DataFormatString="{0:c}">
            </rad:GridBoundColumn>

            <rad:GridBoundColumn DataField="Last_Login" DataType="System.DateTime" FilterControlAltText="Filter Last Login column" HeaderText="Last Login" SortExpression="Last_Login" UniqueName="Last_Login" DataFormatString="{0:d}">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="ExpirationDate" DataType="System.DateTime" FilterControlAltText="Filter ExpirationDate column" HeaderText="Expiration Date" SortExpression="ExpirationDate" UniqueName="ExpirationDate" DataFormatString="{0:d}">
            </rad:GridBoundColumn>


            <rad:GridHyperLinkColumn DataNavigateUrlFields="Url" DataNavigateUrlFormatString="/b/{0}" DataTextField="Url" DataTextFormatString="/b/{0}" Target="_blank" HeaderText="View Site"></rad:GridHyperLinkColumn>

            <rad:GridHyperLinkColumn DataNavigateUrlFields="Customer_ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=WF_EDITCUSTOMER&amp;c=1&amp;id={0}" Text="View Customer" HeaderText="View Customer"></rad:GridHyperLinkColumn>

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


 <asp:SqlDataSource ID="sqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
        SelectCommand="
select c.Customer_ID,sub.Service, (select top 1 url from tblwaiversite s where s.WFSubscriptionID=sub.ID) as url, c.firstName + ' ' + c.lastName as customerName,c.Company, sub1.NumUsed, u.Last_Login, cc.cardtype + ' ' + convert(nvarchar(10), 
                  cc.CardExpirationMonth) +'/' + convert(nvarchar(10), cc.CardExpirationYear) as cc ,
				  (select (
case 
when pp.BillingInterval=1 then price * 365
when pp.BillingInterval=2 then price * 52
when pp.billinginterval=3 then price * 12 
when pp.billinginterval=4 then price * 4
when pp.billinginterval=5 then price 
when pp.billinginterval=6 then 0
when pp.billinginterval=7 then price * 2
else price end) ) as annualRev_TOT
,

(select (
case 
when pp.BillingInterval is null then 0 
when pp.BillingInterval=1 then price * 365
when pp.BillingInterval=2 then price * 52
when pp.billinginterval=3 then price * 12 
when pp.billinginterval=4 then price * 4
when pp.billinginterval=5 then price 
when pp.billinginterval=6 then 0
when pp.billinginterval=7 then price * 2
else price end) 
+ (case when cc.CCProfileID is null then 0 else 100 end)
+ case when Last_Login < dateadd(day,-90,getutcdate()) then 0 else ((90- datediff(day,last_login,getutcdate()) )/ 90) * 100 end
+ case when Last_Login < dateadd(day,-90,getutcdate()) then 0 else ((90- datediff(day,last_login,getutcdate()) ))  end
+ (case when ExpirationDate &gt; dateadd(day,-60,getutcdate()) then 0 else 5 end)
+ (case when NumUsed is null then 0 else numused end) )

 as score


, sub.ExpirationDate, 
(select sum (numused ) from tblWFSubscriptionPeriod per where per.WFSubscriptionID=sub.ID and per.PeriodEnds &gt; dateadd(day,-180,getutcdate())) as numRecentWaivers
                 from 
				
				 tblWFSubscription sub 
				 inner  join 
				 tblCustomer c 
                 on c.Customer_ID = sub.CustomerID 
				 inner join tblCRMLead l on l.CustomerID = c.Customer_ID 
				 
                 inner 
                 join tblWPUser u on u.ID = c.WPUserID 
                 left 
                 join tblCCProfile cc 
                 on cc.CCProfileID = sub.CCProfileID 
                 left 
                 join tblWFSubscriptionPeriod sub1 on sub1.id = (select top 1 ID from tblWFSubscriptionPeriod sp where sp.WFSubscriptionID = sub.ID order by PeriodEnds desc )  
				 left join tblWFPlanPrice pp on pp.ID=sub1.WFPlanPriceID
                where (sub.Status =2 or sub.Status=6 or sub.Status=1)
      and (sub.SuspendDate is null or SuspendDate='9999-12-31 00:00:00.000')
				 and sub.ExpirationDate&lt;dateadd(hour,-48,GETUTCDATE())
                and l.LastFollowup &lt; dateadd(day,@followupCutoffDaysBack,getutcdate()) 

				and (
				   not cc.CardExpirationYear is null 
				   or 
				   (select sum (numused ) from tblWFSubscriptionPeriod per where per.WFSubscriptionID=sub.ID and per.PeriodEnds &gt; dateadd(day,-180,getutcdate())) &gt; 0

				)

				 order by score desc, case when cc.CardExpirationYear is null then 1 else 0 end 



" ProviderName="System.Data.SqlClient" >
     <SelectParameters>
         <asp:Parameter DefaultValue="-7" Name="followupCutoffDaysBack" DbType="Int32" />
     </SelectParameters>
        </asp:SqlDataSource>


