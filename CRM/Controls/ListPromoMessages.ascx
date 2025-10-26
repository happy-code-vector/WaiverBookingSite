<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListPromoMessages.ascx.cs" Inherits="WaiverFile.CRM.Controls.ListPromoMessages" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Promo Messages
<span class="addbuttons"><a href="?sc=WFCRM_EDIT_PROMOMESSAGE&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" OnRowDrop="RadGrid1_RowDrop"  AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" OnItemCommand="RadGrid1_ItemCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="False">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>
             <telerik:GridDragDropColumn HeaderStyle-Width="18px" Visible="true">
<HeaderStyle Width="18px"></HeaderStyle>
                            </telerik:GridDragDropColumn>
                          
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                       
                         <telerik:GridBoundColumn DataField="filterMode" FilterControlAltText="Filter FilterMode column" HeaderText="FilterMode" SortExpression="filterMode" UniqueName="filterMode"></telerik:GridBoundColumn>
  
                         
            
                         
                         <telerik:GridBoundColumn DataField="subject" FilterControlAltText="Filter Subject column" HeaderText="Subject" SortExpression="subject" UniqueName="subject"></telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="lastModified" FilterControlAltText="Filter LastModified column" HeaderText="Last Modified" SortExpression="lastModified" UniqueName="lastModified"></telerik:GridBoundColumn>

                        <telerik:GridButtonColumn CommandName="TEST"  FilterControlAltText="Filter test column" HeaderText="Test Send to Me" Text="Test" UniqueName="test"></telerik:GridButtonColumn>
                        
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WFCRM_EDIT_PROMOMESSAGE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
    <ClientSettings AllowRowsDragDrop="True">
                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="false"></Selecting>
                        
                    </ClientSettings>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFPromoMessage where status<>99  order by OrderNum, subject">
                  </asp:SqlDataSource>
                         