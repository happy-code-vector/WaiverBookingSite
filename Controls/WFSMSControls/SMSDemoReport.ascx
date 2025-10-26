<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SMSDemoReport.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.SMSDemoReport" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Demos

</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Site Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="company" FilterControlAltText="Filter company column" HeaderText="Company" SortExpression="company" UniqueName="company"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="createDate" FilterControlAltText="Filter CreateDate column" HeaderText="Demo Created" SortExpression="createDate" UniqueName="createDate"></telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>


                         
                        <telerik:GridBoundColumn DataField="sendingprofilecreated" FilterControlAltText="Filter sendingprofilecreated column" HeaderText="Sending Profile Submitted" SortExpression="sendingprofilecreated" UniqueName="sendingprofilecreated"></telerik:GridBoundColumn>
                         
            <telerik:GridBoundColumn DataField="RequestStatus" FilterControlAltText="Filter RequestStatus column" HeaderText="Profile Status" SortExpression="RequestStatus" UniqueName="RequestStatus"></telerik:GridBoundColumn>
            
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="sendingprofileid" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_REVIEW_SMS_PROFILE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Review Profile" Text="Review Profile" UniqueName="sendingprofileid" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         
            
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="Customer_ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=EDITCUSTOMER&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="View Customer" Text="View Customer" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select d.id, c.Company,s.Url,c.Customer_ID,p.ID as sendingprofileid , s.Name, c.firstName, c.lastName, c.email,c.Company, d.testsmsnumber, d.TestSendingEnabled, d.BusinessNumber, d.Status, d.CreateDate, p.AccountSID, p.Created as [sendingprofilecreated], p.RequestStatus  from tblWFSMSDemo d inner join tblwaiversite s on s.id=d.siteid
inner join tblCustomer c on c.Customer_ID=s.CustomerID
left join tblWFSMSTwilioCustomerProfile p on p.CustomerID=s.CustomerID
order by d.createdate desc
">
                  </asp:SqlDataSource>
                         