<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFPageTemplates.ascx.cs" Inherits="WaiverFile.Controls.CMSControls.ListWFPageTemplates" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">PageTemplates
<span class="addbuttons"><a href="?sc=WFCMS_EDIT_TEMPLATE&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                                                 
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="userControlPath" FilterControlAltText="Filter userControlPath column" HeaderText="User Control Path" SortExpression="userControlPath" UniqueName="userControlPath"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="description" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="description" UniqueName="description"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="previewImageUrl" FilterControlAltText="Filter PreviewImageUrl column" HeaderText="PreviewImageUrl" SortExpression="previewImageUrl" UniqueName="previewImageUrl"></telerik:GridBoundColumn>

                         
            
            <telerik:GridBoundColumn DataField="useForStandardPages" FilterControlAltText="Filter useForStandardPages column" HeaderText="Use for Standard Pages" SortExpression="useForStandardPages" UniqueName="useForStandardPages"></telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WFCMS_EDIT_TEMPLATE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFPageTemplate where ThemeID=@ThemeID">
                  </asp:SqlDataSource>
                         