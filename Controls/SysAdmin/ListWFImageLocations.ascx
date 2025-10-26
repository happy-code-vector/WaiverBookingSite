<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFImageLocations.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ListWFImageLocations" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Image Locations
<span class="addbuttons"><a href="?sc=WF_EDIT_IMAGE_LOCATIONS&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="description" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="description" UniqueName="description"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="recommendedWidth" FilterControlAltText="Filter RecommendedWidth column" HeaderText="Rec. W" SortExpression="recommendedWidth" UniqueName="recommendedWidth"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="recommendedHeight" FilterControlAltText="Filter RecommendedHeight column" HeaderText="Rec. H" SortExpression="recommendedHeight" UniqueName="recommendedHeight"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="uploadMinWidth" FilterControlAltText="Filter UploadMinWidth column" HeaderText="Min W" SortExpression="uploadMinWidth" UniqueName="uploadMinWidth"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="uploadMinHeight" FilterControlAltText="Filter UploadMinHeight column" HeaderText="Min H" SortExpression="uploadMinHeight" UniqueName="uploadMinHeight"></telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="uploadMaxWidth" FilterControlAltText="Filter UploadMaxWidth column" HeaderText="Max W" SortExpression="uploadMaxWidth" UniqueName="uploadMaxWidth"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="uploadMaxHeight" FilterControlAltText="Filter UploadMaxHeight column" HeaderText="Max H" SortExpression="uploadMaxHeight" UniqueName="uploadMaxHeight"></telerik:GridBoundColumn>
                         
                         <telerik:GridBoundColumn DataField="autoResizeBoundingBoxWidth" FilterControlAltText="Filter AutoResizeBoundingBoxWidth column" HeaderText="Resize W" SortExpression="autoResizeBoundingBoxWidth" UniqueName="autoResizeBoundingBoxWidth"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="autoResizeBoundingBoxHeight" FilterControlAltText="Filter AutoResizeBoundingBoxHeight column" HeaderText="Resize H" SortExpression="autoResizeBoundingBoxHeight" UniqueName="autoResizeBoundingBoxHeight"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_EDIT_IMAGE_LOCATIONS&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Mark as Deleted" UniqueName="deletecol"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFImageLocation">
                  </asp:SqlDataSource>
                         