<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWorkflows.ascx.cs" Inherits="WaiverFile.Controls.WorkflowUI.ListWorkflows" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


 <div class="pull-right" style="margin-top:20px;">
            <a href="AddWorkflow.aspx" class="btn btn-primary" ><i class="fa fa-plus-circle"></i> New Workflow</a>
        </div>
<h3 style="display:inline-block;">Workflows</h3>


<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server"  AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" OnItemCommand="RadGrid1_ItemCommand" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                        <telerik:GridHyperLinkColumn DataTextField="name" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Workflows/Viewer.aspx?id={0}" FilterControlAltText="Filter name column" HeaderText="Name" UniqueName="name">
                        </telerik:GridHyperLinkColumn>
                         
                         
                         
            <telerik:GridButtonColumn CommandName="STATUS_SWAP" DataTextField="status" FilterControlAltText="Filter status column" HeaderText="Status" UniqueName="statuscol"></telerik:GridButtonColumn>
                         
                         

                         
                         <telerik:GridBoundColumn DataField="mode" FilterControlAltText="Filter Mode column" HeaderText="Mode" SortExpression="mode" UniqueName="mode"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Workflows/Viewer.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="View Waivers" Text="View Waivers" UniqueName="viewCol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Workflows/EditWorkflow.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editCol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFWorkflow where siteid=@siteid and status<>@deletedStatus">
                  </asp:SqlDataSource>
                         