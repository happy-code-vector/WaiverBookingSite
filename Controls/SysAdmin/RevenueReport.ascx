<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RevenueReport.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.RevenueReport" %>



<div class="row">



<div class="col-sm-3">
<div class="small-box bg-green">
                <div class="inner">
                  <h3><%=string.Format("{0:c}", _totalAnnualRevenue)%></h3>
                  <p>Total Annual Revenue</p>
                </div>
                <div class="icon">
                  <i class="fa fa-money"></i>
                </div>
              </div>
    </div>


<div class="col-sm-3">
<div class="small-box bg-yellow">
                <div class="inner">
                  <h3><%=string.Format("{0:c}", _totalAnnualRevenueBilledOnline)%></h3>
                  <p>On Auto Credit Card</p>
                </div>
                <div class="icon">
                  <i class="fa fa-credit-card"></i>
                </div>
              </div>
    </div>

    <div class="col-sm-3">
<div class="small-box bg-aqua">
                <div class="inner">
                  <h3><%=_payingCustomerCount %></h3>
                  <p>Paying Customers</p>
                </div>
                <div class="icon">
                  <i class="fa fa-users"></i>
                </div>
                
              </div>
    </div>


<div class="col-sm-3">
<div class="small-box bg-aqua">
                <div class="inner">
                  <h3><%=_payingCustomerCountBilledOnline %></h3>
                  <p>Customers with CC Profiles</p>
                </div>
                <div class="icon">
                 <i class="fa fa-credit-card"></i>
                </div>
              </div>
    </div>
    </div>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Revenue Report
            <span class="addbuttons">
                <asp:LinkButton runat="server" ID="btnExport" CssClass="ico_e" OnClick="btnExport_Click">Export to Excel</asp:LinkButton>
                </span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="False" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         <telerik:GridBoundColumn DataField="annualPrice" FilterControlAltText="Filter annualPrice column" HeaderText="Annual Price" SortExpression="annualPrice" UniqueName="annualPrice" DataType="System.Decimal" ReadOnly="True"></telerik:GridBoundColumn>

                         
            <telerik:GridHyperLinkColumn DataNavigateUrlFields="url" DataTextField="url" HeaderText="Url" DataNavigateUrlFormatString="https://www.waiverfile.com/b/{0}" Target="_blank"></telerik:GridHyperLinkColumn>
                         

                         
                         <telerik:GridBoundColumn DataField="isManualBilling" FilterControlAltText="Filter isManualBilling column" HeaderText="Manual Billing" SortExpression="isManualBilling" UniqueName="isManualBilling" ReadOnly="True"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="Company" FilterControlAltText="Filter Company column" HeaderText="Company" SortExpression="Company" UniqueName="Company"></telerik:GridBoundColumn>

            <telerik:GridBoundColumn DataField = "firstName" FilterControlAltText="Filter firstName column" HeaderText="First Name" SortExpression="firstName" UniqueName="firstName"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField = "lastName" FilterControlAltText="Filter lastName column" HeaderText="Last Name" SortExpression="lastName" UniqueName="lastName"></telerik:GridBoundColumn>


                                        <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="Email" SortExpression="email" UniqueName="email">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StartDate" DataType="System.DateTime" FilterControlAltText="Filter StartDate column" HeaderText="Start Date" SortExpression="StartDate" UniqueName="StartDate">
                                        </telerik:GridBoundColumn>
            
        </Columns>

    </MasterTableView>

<FilterMenu EnableEmbeddedSkins="False"></FilterMenu>

<HeaderContextMenu EnableEmbeddedSkins="False"></HeaderContextMenu>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>



<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select sub.ID,
case 
when pp.BillingInterval=1 then price * 365
when pp.BillingInterval=2 then price * 52
when pp.billinginterval=3 then price * 12 
when pp.billinginterval=4 then price * 4
when pp.billinginterval=5 then price 
when pp.billinginterval=6 then 0
when pp.billinginterval=7 then price * 2
else price end
as annualPrice ,
(select top 1 url from tblwaiversite s where wfsubscriptionid=sub.id) as url, 
case when sub.CCProfileID='00000000-0000-0000-0000-000000000000' then 'Manual' else '' end as isManualBilling,
c.Company, c.firstName, c.lastName, c.email,
StartDate from tblwfsubscription sub
inner join tblwfplanprice pp on pp.id=sub.wfplanpriceid
inner join tblCustomer c on c.Customer_ID=sub.CustomerID
where sub.status=1 and expirationdate > getutcdate() and case when pp.billinginterval=3 then price * 12 else price end > 0
order by case when pp.billinginterval=3 then price * 12 else price end desc
    
">
    
                  </asp:SqlDataSource>
                         


