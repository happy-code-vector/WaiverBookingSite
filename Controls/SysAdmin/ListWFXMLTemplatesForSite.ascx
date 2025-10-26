<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWFXMLTemplatesForSite.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.ListWFXMLTemplatesForSite" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">XSL Template Overrides - <%=siteName %>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         
                         <telerik:GridBoundColumn DataField="baseFilename" FilterControlAltText="Filter BaseFilename column" HeaderText="BaseFilename" SortExpression="baseFilename" UniqueName="baseFilename"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="Notes" FilterControlAltText="Filter Notes column" HeaderText="Notes" SortExpression="Notes" UniqueName="Notes"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SavedBy" FilterControlAltText="Filter SavedBy column" HeaderText="Saved By" SortExpression="SavedBy" UniqueName="SavedBy"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DateSaved" FilterControlAltText="Filter DateSaved column" HeaderText="Saved On" SortExpression="DateSaved" UniqueName="DateSaved"></telerik:GridBoundColumn>
                         
                         <telerik:GridBoundColumn DataField="enabled" FilterControlAltText="Filter Enabled column" HeaderText="Enabled" SortExpression="enabled" UniqueName="enabled"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_EDIT_XSLTEMPLATE&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="PERMANENTLY DELETES all vesion of this template. Continue?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select t.*, notes,DateSaved, (select u.First_Name + ' ' + u.Last_Name from tblWPUser u where u.ID=v.SavedBy) as savedBy from tblWFXSLTemplate t
inner join tblWFXSLTemplateVersion v on v.TemplateID=t.ID and v.IsCurrent=1
where siteid=@siteid">
                  </asp:SqlDataSource>
                         
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Add New XSL Override Template For Site - <%=siteName %></h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErrAdd" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=cboBaseFilename.ClientID %>">Base Filename</label>
                     <asp:DropDownList ID="cboBaseFilename" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                <p class="help-block">
                    Creates a new template for the selected base file. Starts with the default XSL code. 
                </p>

                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Create" onclick="btnSave_Click" />
    </div>
</div>

