<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Subscribers.aspx.cs" Inherits="WaiverFile.site.admin.SMS.Subscribers" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">


    <script type="text/javascript">
        function showHide(isList) {
            if (isList == true) {
                $('#btnHeadNewSegment').hide();
                $('#btnHeadNewList').show();
            } else {
                $('#btnHeadNewSegment').show();
                $('#btnHeadNewList').hide();
            }
        }

        $(function () {
            showHide(true); //todo: handle postback swap.

            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                var target = $(e.target).attr("href") // activated tab
                if (target == '#tab_lists') {
                    showHide(true);
                } else {
                    showHide(false);
                }
            });
            
            $('#btnAddList').click(function () {
                $('#pop_add').modal('show');

            });
            $('#btnHeadNewList').click(function () {
                $('#pop_add').modal('show');

            });

            <%if (startOnSegmentsTab)
        {%>
            $('[href="#tab_segments"]').tab('show');
            <%}%>
     });
    </script>

    <style type="text/css">
        .buttonwrap{
            padding-top:15px;text-align:right;
        }
        @media (max-width:640px){
            .buttonwrap{ text-align:center; padding-top:0;padding-bottom:10px; }
        }
    </style>

    <div class="row">
        <div class="col-sm-5"><h3>Subscribers</h3></div>
        <div class="col-sm-7">
            <div class="buttonwrap">
           
            <span class="visible-xs" style="padding-bottom:7px;">
            <a href="javascript:void(0);" class="btn btn-default" id="btnAddList"><i class="fa fa-list"></i> Add List</a>
            <a href="EditSegment.aspx" class="btn btn-default"><i class="fa fa-filter"></i> Add Segment</a>
                </span>
            
            <a href="SMSExcelImport.aspx" class="btn btn-default"><i class="fa fa-upload"></i> Import Contacts</a>

    </div></div>
    </div>
    
    
                                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

        
        <div class="panel with-nav-tabs panel-default" id="div_tabs">
            <div class="panel-heading">
                <span class="pull-right hidden-xs">
                    <a href="#" id="btnHeadNewList" class="btn btn-primary"><i class="fa fa-plus-circle"></i> New List</a>
                    <a href="EditSegment.aspx" id="btnHeadNewSegment" class="btn btn-primary"><i class="fa fa-plus-circle"></i> New Segment</a>
                 </span>

                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#tab_lists"><i class="fa fa-list"></i> Lists</a></li>
                    <li><a data-toggle="tab" href="#tab_segments"><i class="fa fa-filter"></i> Segments</a></li>
                </ul>
              
                
            </div>
            <div class="panel-body" style="padding:0;">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab_lists" style="margin:-1px -1px -1px -1px">
        
                                       <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>



<telerik:RadGrid ID="RadGrid2" runat="server" Skin="Bootstrap"  AutoGenerateColumns="False" OnItemDataBound="RadGrid2_ItemDataBound" OnDeleteCommand="RadGrid2_DeleteCommand" DataSourceID="SqlDataSource2"  AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ID">
        
        <Columns>

                            
                           <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="SubscribersViewList.aspx?id={0}" DataTextField="name" FilterControlAltText="Filter name column" HeaderText="List Name" Text="View" UniqueName="viewCol" AllowFiltering="False">
                                                        </telerik:GridHyperLinkColumn>

                         
                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="numMembers" FilterControlAltText="Filter Subscribers column" HeaderText="Subscribers" SortExpression="numMembers" UniqueName="numMembers"></telerik:GridBoundColumn>

                         
                           <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="SubscribersViewList.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="View Subscribers" Text="View" UniqueName="viewCol2" AllowFiltering="False">
                                                        </telerik:GridHyperLinkColumn>

                                                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="RenameSubscriberList.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Rename" Text="Rename" UniqueName="renameCol" AllowFiltering="False">
                                                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from (
select 
(select count(*) from tblWFSMSMobileNum num where num.SiteID=@siteid and IsGlobalOptOut=0) as numMembers,
'00000000-0000-0000-0000-000000000000' as ID, @siteid as SiteID, 0 as Status, 'All Subscribers' as Name
union 
select 
(select count(*) from tblWFSMSMobileNum num inner join tblWFSMSListMobileNum b on b.MobileNumID=num.ID where b.ListID=listOuter.ID and num.SiteID=@siteid and IsGlobalOptOut=0) as numMembers,
*
from tblWFSMSList listOuter where siteID=@siteid and status&lt;&gt;@deletedStatus ) sub
order by case when Name='All Subscribers' then 0 else 1 end , Name desc">
    <SelectParameters>
        <asp:Parameter Name="siteid" />
        <asp:Parameter Name="siteID" />
        <asp:Parameter Name="deletedStatus" />
    </SelectParameters>
                  </asp:SqlDataSource>
                         
                        
                    </div>
               
                    <div class="tab-pane fade in" id="tab_segments" style="margin:-1px -1px -1px -1px">
        
                                    


                             
                                <telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1"  AllowPaging="True" AllowSorting="True">
                                    <groupingsettings casesensitive="False" />
                                    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
                                        <Columns>

                         
                                                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                                                         <telerik:GridBoundColumn DataField="numMembers" FilterControlAltText="Filter Subscribers column" HeaderText="Subscribers" SortExpression="numMembers" UniqueName="numMembers"></telerik:GridBoundColumn>

                         
                         
                                                         

                                                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="SubscribersViewList.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="View" Text="View" UniqueName="viewCol" AllowFiltering="False">
                                                        </telerik:GridHyperLinkColumn>

                                                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="EditSegment.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editCol" AllowFiltering="False">
                                                        </telerik:GridHyperLinkColumn>
                                                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                


                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFSMSSegment where siteID=@siteID and status<>@deletedStatus order by Name">
                                                  </asp:SqlDataSource>
                         
                       
                    </div>
               
                 
                </div>

                </div>
            </div>
    

                
<!-- Modal -->
<div class="modal fade" id="pop_add" tabindex="-1" role="dialog" aria-labelledby="lblPopAdd">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblPopAdd">New Subscriber List</h4>
      </div>
      <div class="modal-body">
        
          <div class="form-group">
                      <label for="<%=txtName.ClientID %>">List Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
       

      
      <div class="modal-footer">
          <asp:Button runat="server" ID="btnSaveNewList" CssClass="btn btn-primary" Text="Save" OnClick="btnSaveNewList_Click" />
          
           <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelAdd" data-dismiss="modal">Cancel</a>
           
      </div>
    </div>
  </div>
</div>





</asp:Content>
