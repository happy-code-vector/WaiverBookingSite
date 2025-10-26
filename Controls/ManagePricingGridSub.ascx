<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManagePricingGridSub.ascx.cs" Inherits="WaiverFile.Controls.ManagePricingGridSub" %>
     <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

   <div class="panel-heading ">
       <h4 class="panel-title">
           <a data-toggle="collapse" href="#<%=this.ClientID %>collapse" <%if (!StartOpen) { %>aria-expanded="false"<%} %>>
               <i class="indicator fa fa-caret-down" aria-hidden="true">&nbsp;</i> <asp:Label ID="lblPricingGridName" runat="server"></asp:Label>
           </a>
                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-link pull-right" OnClick="btnDelete_Click" ToolTip="Delete" Style="margin-top:-7px;">
    <i class="fa fa-trash"></i>
</asp:LinkButton>
       </h4>
        
   </div>
   <div id="<%=this.ClientID %>collapse" class="panel-collapse collapse  <%if (StartOpen) { %>in<%} %>">
      
       
       <h3 style="margin-top:0;">Person Types
       <a href="EditPersonType.aspx?gridid=<%=Grid.ID %>" class="btn btn-primary pull-right"><i class="fa fa-plus-circle"></i> Add</a>
           </h3>

    <telerik:RadGrid ID="RadGrid1" runat="server"  Skin="Bootstrap" AllowRowReorder="True" AutoGenerateColumns="False" 
 OnRowDrop="RadGrid1_RowDrop" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" 
 AllowPaging="True" AllowSorting="True" >

    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="description" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="description" UniqueName="description"></telerik:GridBoundColumn>
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>

    </telerik:RadGrid>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFPricingGridPersonType where gridID=@gridID order by ordernum, name">
                  </asp:SqlDataSource>
                         


       
       <h3>Time Rules
       <a href="EditTimeRule.aspx?gridid=<%=Grid.ID %>" class="btn btn-primary pull-right"><i class="fa fa-plus-circle"></i> Add</a>
           </h3>

<telerik:RadGrid ID="RadGrid2" runat="server" Skin="Bootstrap" AllowRowReorder="True" AutoGenerateColumns="False"  OnDeleteCommand="RadGrid2_DeleteCommand" DataSourceID="SqlDataSource2" 
     AllowPaging="True" AllowSorting="True" OnRowDrop="RadGrid2_RowDrop">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="description" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="description" UniqueName="description"></telerik:GridBoundColumn>

            
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
 




<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFPricingGridTimeRule where gridID=@gridID order by ordernum, name">
                  </asp:SqlDataSource>
                         


   </div>
