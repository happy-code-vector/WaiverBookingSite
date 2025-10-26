<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AutoSMSMessages.aspx.cs" Inherits="WaiverFile.site.admin.SMS.AutoSMSMessages" %>
     <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
     <script type="text/javascript">


      function showHide(isAdmin) {
          if (isAdmin == true) {
                $('#btnNewWaiver').hide();
                $('#btnNewAdmin').show();
            } else {
                $('#btnNewWaiver').show();
                $('#btnNewAdmin').hide();
            }
         }

         $(function () {
             showHide(false); 

             $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                 var target = $(e.target).attr("href") // activated tab
                 if (target == '#tab_admin') {
                     showHide(true);
                 } else {
                     showHide(false);
                 }
             });
         });
     </script>



   <h3>Automatic SMS Messages</h3>

        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

        <div class="panel with-nav-tabs panel-default" id="div_tabs">
            <div class="panel-heading">
                <span class="pull-right hidden-xs">
                    <a href="AddScheduledMessage.aspx" id="btnNewWaiver" class="btn btn-primary"><i class="fa fa-plus-circle"></i> New</a>
                    <a href="EditAdminSMSMessage.aspx" id="btnNewAdmin" class="btn btn-primary"><i class="fa fa-plus-circle"></i> New</a>
                 </span>

                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#tab_waiver"><i class="fa fa-list"></i> Waiver-Triggered Messages</a></li>
                    <li><a data-toggle="tab" href="#tab_admin"><i class="fa fa-filter"></i> Admin Messages</a></li>
                </ul>
              
                
            </div>
            <div class="panel-body" style="padding:0;">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab_waiver" style="margin:-1px -1px -1px -1px">
        
                        <!-- first tab -->
                        <telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap"  AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="False" AllowPaging="False" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
            
                         <telerik:GridBoundColumn DataField="TriggerCriteria" FilterControlAltText="Filter TriggerCriteria column" HeaderText="Mode"  UniqueName="TriggerCriteria"></telerik:GridBoundColumn>

                         

                         <telerik:GridBoundColumn DataField="" FilterControlAltText="Filter Filters column" HeaderText="Filters" SortExpression="" UniqueName="filters"></telerik:GridBoundColumn>

                        
                         
                        

                          <telerik:GridBoundColumn DataField="message" FilterControlAltText="Filter Message column" HeaderText="Message" SortExpression="message" UniqueName="message"></telerik:GridBoundColumn>

                         
                         
                        
                        
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID,url" DataNavigateUrlFormatString="/b/{1}/admin/SMS/EditSMSScheduledMessage.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                    <telerik:GridButtonColumn CommandName="DISABLE"  FilterControlAltText="Filter column1 column" HeaderText="Turn Off" Text="Turn Off" UniqueName="column1"></telerik:GridButtonColumn>

                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select *,s.url,(left(m.message, 60)+ case when len(m.message)>60 then '...' end) as messageShort, case when m.SendingNumID='00000000-0000-0000-0000-000000000000' then 'Any available number' else n.FriendlyName end as sendingNumName from tblWFSMSScheduledMessage  m left join tblWFSMSSendingNum n on n.ID=m.SendingNumID left join tblWaiverSite s on s.id=m.siteid
where m.siteID=@siteID and m.status=@activeStatus">
                  </asp:SqlDataSource>
                         
                        <hr />
                        <h4 style="padding-left:15px;">Inactive Messages</h4>
                            <!-- first tab -->
                        <telerik:RadGrid ID="RadGrid3" runat="server" Skin="Bootstrap"  AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" DataSourceID="SqlDataSource3" AllowFilteringByColumn="False" AllowPaging="False" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource3" DataKeyNames="ID">
        
        <Columns>

                         
            
                         <telerik:GridBoundColumn DataField="TriggerCriteria" FilterControlAltText="Filter TriggerCriteria column" HeaderText="Mode"  UniqueName="TriggerCriteria"></telerik:GridBoundColumn>

                         

                         <telerik:GridBoundColumn DataField="" FilterControlAltText="Filter Filters column" HeaderText="Filters" SortExpression="" UniqueName="filters"></telerik:GridBoundColumn>

                        
                         
                        

                          <telerik:GridBoundColumn DataField="message" FilterControlAltText="Filter Message column" HeaderText="Message" SortExpression="message" UniqueName="message"></telerik:GridBoundColumn>

                         
                         
                        
                        
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID,url" DataNavigateUrlFormatString="/b/{1}/admin/SMS/EditSMSScheduledMessage.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                    <telerik:GridButtonColumn CommandName="ACTIVATE"  FilterControlAltText="Filter column1 column" HeaderText="Turn On" Text="Turn On" UniqueName="column1"></telerik:GridButtonColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select *,s.url,(left(m.message, 60)+ case when len(m.message)>60 then '...' end) as messageShort, case when m.SendingNumID='00000000-0000-0000-0000-000000000000' then 'Any available number' else n.FriendlyName end as sendingNumName from tblWFSMSScheduledMessage  m left join tblWFSMSSendingNum n on n.ID=m.SendingNumID left join tblWaiverSite s on s.id=m.siteid
where m.siteID=@siteID and (m.status=@draftStatus or m.status=@DisabledStatus) ">
                  </asp:SqlDataSource>


                    </div>
               
                    <div class="tab-pane fade in" id="tab_admin" style="margin:-1px -1px -1px -1px">


                        <!-- second tab - ADMIN MESSAGES -->
                              
<telerik:RadGrid ID="RadGrid2" runat="server" Skin="Bootstrap"  AutoGenerateColumns="False" OnItemDataBound="RadGrid2_ItemDataBound" OnDeleteCommand="RadGrid2_DeleteCommand" DataSourceID="SqlDataSource2" AllowFilteringByColumn="False" AllowPaging="False" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ID">
        
        <Columns>

                         
            
                         <telerik:GridBoundColumn DataField="messageType" FilterControlAltText="Filter messageType column" HeaderText="Message Type"  UniqueName="messageType"></telerik:GridBoundColumn>

                         

                        
                         
                        

                          <telerik:GridBoundColumn DataField="message" FilterControlAltText="Filter Message column" HeaderText="Message" SortExpression="message" UniqueName="message"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                        
                        
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID,url" DataNavigateUrlFormatString="/b/{1}/admin/SMS/EditAdminSMSMessage.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="
    select m.*, s.url from tblWFSMSAdministrativeMessage m inner join tblWaiverSite s on s.Id=m.SiteID where siteID=@siteID and m.status<>@deletedStatus order by messageType, message
    ">
                  </asp:SqlDataSource>
                         

    
                </div>
</div></div>
            </div>



</asp:Content>
