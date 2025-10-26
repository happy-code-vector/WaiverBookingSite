<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SuspensionReport.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.SuspensionReport" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>

<script type="text/javascript">
    function CheckAll(id) {
        var masterTable = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
        var row = masterTable.get_dataItems();
        if (id.checked == true) {
            for (var i = 0; i < row.length; i++) {
                masterTable.get_dataItems()[i].findElement("chkTax").checked = true;
            }
        }
        else {
            for (var i = 0; i < row.length; i++) {
                masterTable.get_dataItems()[i].findElement("chkTax").checked = false;
            }
        }
    }


    function Check(id) {

        var masterTable = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
        var row = masterTable.get_dataItems();
        /*var hidden = document.getElementById("HiddenField1");
        if (id.checked == false) {

            var checkBox = document.getElementById(hidden.value);
            checkBox.checked = false;
        }
        else {
            var checkBox = document.getElementById(hidden.value);
            checkBox.checked = true;
            for (var i = 0; i < row.length; i++) {
                if (masterTable.get_dataItems()[i].findElement("chkTax").checked == false) {
                    var checkBox = document.getElementById(hidden.value);
                    checkBox.checked = false;
                }
            }
        }*/

    }
</script>

<asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Suspension Report
            <span class="addbuttons">
                <asp:LinkButton runat="server" ID="btnDownloadExcel1" OnClick="btnDownloadExcel_Click" CssClass="ico_down">Download to Excel</asp:LinkButton>
                
</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">

        <div style="padding:15px;">

          <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

       

        <div class="row">
            <div class="col-sm-9">
                  <asp:RadioButtonList runat="server" ID="rblMode" RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="rblMode_SelectedIndexChanged">
                
                <asp:ListItem Value="READY" Selected="True">Ready to Suspend (All suspension notices sent)</asp:ListItem>
                <asp:ListItem Value="SUSPENDED">Suspended</asp:ListItem>
                <asp:ListItem Value="PENDING">Pre-Suspension (receiving 14 days of messages)</asp:ListItem>
            </asp:RadioButtonList>

            </div>
            <div class="col-sm-3 text-center">
                
                
                <asp:Button ID="btnSuspendChecked" CssClass="btn btn-primary btn-block" runat="server" Text="Suspend Checked" OnClick="btnSuspendChecked_Click" />
                <asp:Button ID="btnCancelSuspensionChecked" CssClass="btn btn-primary btn-block" runat="server" Text="Cancel Suspension for Checked" OnClick="btnCancelSuspensionChecked_Click" />
                <asp:Button ID="btnLiftSuspension" CssClass="btn btn-primary btn-block" runat="server" Text="Lift Suspension *" OnClick="btnLiftSuspension_Click" />
                <span runat="server" id="spanLiftSuspensionNote"><em>* Changes status back to Expired</em></span>
            </div>
          
        </div>
             </div>


       <rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False" AllowMultiRowSelection="True"  id="RadGrid1" runat="server" AllowSorting="true" AllowFilteringByColumn="true" DataSourceID="sqlDataSource1" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both" OnItemDataBound="RadGrid1_ItemDataBound">
        <ClientSettings>
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
           
           <mastertableview datasourceid="sqlDataSource1" DataKeyNames="subscriptionID"><Columns>

             
         
            <rad:GridTemplateColumn UniqueName="CheckTemp" HeaderStyle-Width="40" 
                     HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="30" 
                     ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Black"
                     AllowFiltering="false">
                           <HeaderTemplate>
                            <asp:CheckBox ID="chkall" runat="server" onclick="CheckAll(this);" AutoPostBack="false" />
                           </HeaderTemplate>
                           <ItemTemplate>
                           <asp:CheckBox ID="chkTax" runat="server" onclick="Check(this);" AutoPostBack="false" />
                           </ItemTemplate>
                    </rad:GridTemplateColumn>



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

              <rad:GridBoundColumn DataField="suspenddate" DataType="System.DateTime" FilterControlAltText="Filter Suspend date column" HeaderText="Suspend Date" SortExpression="suspenddate" UniqueName="suspenddate" DataFormatString="{0:d}">
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
select c.Customer_ID,sub.Service,sub.suspenddate,sub.ID as subscriptionID, (select top 1 url from tblwaiversite s where s.WFSubscriptionID=sub.ID) as url, c.firstName + ' ' + c.lastName as customerName,c.Company, sub1.NumUsed, u.Last_Login, cc.cardtype + ' ' + convert(nvarchar(10), 
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
                where  ( (@mode='READY' AND not sub.suspendDate is null and sub.suspendDate&lt;&gt;@dbMaxDate and sub.suspendDate&lt;&gt;@dbMinDate and SUB.suspendDate &lt; GETUTCDATE() ) or
                        (@mode='SUSPENDED' AND sub.status=@suspendedStatus ) or
                        (@mode='PENDING' AND not sub.suspendDate is null and sub.suspendDate&lt;&gt;@dbMaxDate and sub.suspendDate&lt;&gt;@dbMinDate and SUB.suspendDate &gt; GETUTCDATE() )
     

				) and sub.ExpirationDate&lt;dateadd(hour,-48,GETUTCDATE())
                
			 order by score desc, case when cc.CardExpirationYear is null then 1 else 0 end 



" ProviderName="System.Data.SqlClient" >
     <SelectParameters>
         <asp:Parameter DefaultValue="-7" Name="followupCutoffDaysBack" DbType="Int32" />
         <asp:ControlParameter ControlID="rblMode" PropertyName="SelectedValue" Name="mode" DbType="String" DefaultValue="READY" />
         
     </SelectParameters>
        </asp:SqlDataSource>


