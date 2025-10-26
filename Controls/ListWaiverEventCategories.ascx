<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWaiverEventCategories.ascx.cs" Inherits="WaiverFile.Controls.ListWaiverEventCategories" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<a href="EditEventCategory.aspx" class="btn btn-primary pull-right" ><i class="fa fa-plus-circle"></i> New Category</a>




 <div class="form-group form-inline" style="margin-top: 20px;">
     <h3 style="display:inline; margin-right: 20px;">Event Categories</h3>
     </div>
     



<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" OnRowDrop="RadGrid1_RowDrop" OnItemCommand="RadGrid1_ItemCommand" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" >
<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID" DataSourceID="SqlDataSource1">


    <Columns>
          <telerik:GridDragDropColumn HeaderStyle-Width="18px" Visible="true">
<HeaderStyle Width="18px"></HeaderStyle>
                            </telerik:GridDragDropColumn>

        
    

        <telerik:GridBoundColumn DataField="Name" 
            FilterControlAltText="Filter Name column" HeaderText="Name" 
            SortExpression="Name" UniqueName="Name">
        </telerik:GridBoundColumn>

            <telerik:GridHyperLinkColumn  DataNavigateUrlFields="ID" Text="Edit" DataNavigateUrlFormatString="EditEventCategory.aspx?id={0}"
            HeaderText="Edit" UniqueName="editcol">
        </telerik:GridHyperLinkColumn>

        <telerik:GridButtonColumn CommandName="DISABLE" 
           
            FilterControlAltText="Filter column1 column" HeaderText="Disable" Text="Disable" 
            UniqueName="disablecol">
        </telerik:GridButtonColumn>
        <telerik:GridButtonColumn CommandName="DELETE" 
           
            FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" ConfirmText="Are you sure you wish to delete this?" 
            UniqueName="deletecol">
        </telerik:GridButtonColumn>
    </Columns>
    
</MasterTableView>

    <ClientSettings AllowRowsDragDrop="True">
                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="false"></Selecting>
                        
                    </ClientSettings>

</telerik:RadGrid>





<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWaiverEventCategory where siteID=@siteID and Status=@status order by OrderNum, Name ">
                  </asp:SqlDataSource>
              




 <div class="form-group form-inline" style="margin-top: 20px;">
     <h3 style="display:inline; margin-right: 20px;">Disabled Categories</h3>
     </div>
     



<telerik:RadGrid ID="RadGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="RadGrid2_ItemCommand" OnDeleteCommand="RadGrid2_DeleteCommand" DataSourceID="SqlDataSource2"  >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID" DataSourceID="SqlDataSource2">


<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

     <Columns>
        
        <telerik:GridBoundColumn DataField="Name" 
            FilterControlAltText="Filter Name column" HeaderText="Name" 
            SortExpression="Name" UniqueName="Name">
        </telerik:GridBoundColumn>
        <telerik:GridButtonColumn CommandName="DISABLE" 
           
            FilterControlAltText="Filter column1 column" HeaderText="Enable" Text="Enable" 
            UniqueName="enablecol">
        </telerik:GridButtonColumn>
        <telerik:GridButtonColumn CommandName="DELETE" 
           
            FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" ConfirmText="Are you sure you wish to delete this?" 
            UniqueName="deletecol">
        </telerik:GridButtonColumn>
    </Columns>
    
    

</MasterTableView>

</telerik:RadGrid>



<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWaiverEventCategory where siteID=@siteID and Status=@status order by OrderNum, Name">
                  </asp:SqlDataSource>
              