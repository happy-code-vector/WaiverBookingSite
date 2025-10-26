<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListMonitoredMailingsForLead.ascx.cs" Inherits="WaiverFile.CRM.Controls.ListMonitoredMailingsForLead" %>
   <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Customer Email Correspondence - Inbox</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         
                         <telerik:GridBoundColumn DataField="received" FilterControlAltText="Filter Received column" HeaderText="Date Received" SortExpression="received" UniqueName="received"></telerik:GridBoundColumn>

                          <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="from,subject" DataTextField="FromDisplayName" DataNavigateUrlFormatString="mailto:{0}?subject={1}" FilterControlAltText="Filter from column" HeaderText="From" UniqueName="FromDisplayName">
                        </telerik:GridHyperLinkColumn>
                         
                         <telerik:GridBoundColumn DataField="subject" FilterControlAltText="Filter Subject column" HeaderText="Subject" SortExpression="subject" UniqueName="subject"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="BodyPreview" FilterControlAltText="Filter Body column" HeaderText="Message" SortExpression="BodyPreview" UniqueName="BodyPreview"></telerik:GridBoundColumn>

                         
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WPC_VIEW_MAILMESSAGE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="View" Text="View" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                       
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Customer Email Correspondence - Sent</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid2" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False"  DataSourceID="SqlDataSource2" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ID">
        
        <Columns>

                      
                         <telerik:GridBoundColumn DataField="received" FilterControlAltText="Filter Received column" HeaderText="Date Sent" SortExpression="received" UniqueName="received"></telerik:GridBoundColumn>

                          <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="to,subject" DataTextField="to" DataNavigateUrlFormatString="mailto:{0}?subject={1}" FilterControlAltText="Filter to column" HeaderText="To" UniqueName="To">
                        </telerik:GridHyperLinkColumn>
                         
                         <telerik:GridBoundColumn DataField="subject" FilterControlAltText="Filter Subject column" HeaderText="Subject" SortExpression="subject" UniqueName="subject"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="BodyPreview" FilterControlAltText="Filter Body column" HeaderText="Message" SortExpression="BodyPreview" UniqueName="BodyPreview"></telerik:GridBoundColumn>

                         
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WPC_VIEW_MAILMESSAGE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="View" Text="View" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                    
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select mm.Folder, mm.ID, sent, Received, subject, bodyPreview, [to], [from], EmailAddress, DisplayName, FromDisplayName
from tblMailMessage mm inner join tblMailAccount a on a.ID=mm.MailAccount
where ((CustomerID=@customerID and @customerID<>'00000000-0000-0000-0000-000000000000') or mm.ID in (select MailMessageID from tblMailMessageLead where LeadID=@leadid)) and folder=@folder order by sent desc">
                  </asp:SqlDataSource>
                         

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select mm.Folder, mm.ID, sent, Received, subject, bodyPreview, [to], [from], EmailAddress, DisplayName, FromDisplayName
from tblMailMessage mm inner join tblMailAccount a on a.ID=mm.MailAccount
where ((CustomerID=@customerID and @customerID<>'00000000-0000-0000-0000-000000000000') or mm.ID in (select MailMessageID from tblMailMessageLead where LeadID=@leadid)) and folder=@folder order by sent desc">
                  </asp:SqlDataSource>
                         