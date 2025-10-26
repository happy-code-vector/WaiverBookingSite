<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListSiteUsers.ascx.cs" Inherits="WaiverFile.Controls.ListSiteUsers" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/AddUser.aspx" class="btn btn-primary pull-right" style="margin-top: 20px;"><i class="fa fa-plus-circle"></i> Add New User</a>

 <div class="form-group form-inline" style="margin-top: 20px;">
       <h3 style="display:inline; margin-right: 20px;">Manage Site Administrative Access</h3>
    </div>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
     

        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand" AllowSorting="true">
            <MasterTableView DataKeyNames="ID,SiteID,UserID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="First_Name" FilterControlAltText="Filter First_Name column" HeaderText="First" SortExpression="First_Name" UniqueName="First_Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Last_Name" FilterControlAltText="Filter Last_Name column" HeaderText="Last" SortExpression="Last_Name" UniqueName="Last_Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Email_Address" FilterControlAltText="Filter Email_Address column" HeaderText="Email" SortExpression="Email_Address" UniqueName="Email_Address">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MobileNumber" FilterControlAltText="Filter MobileNumber column" HeaderText="Mobile Number" SortExpression="MobileNumber" UniqueName="MobileNumber">
                    </telerik:GridBoundColumn>
                    <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="wpuserid" DataNavigateUrlFormatString="/admin/Settings/EditUserAccess.aspx?id={0}" FilterControlAltText="Filter column column" HeaderText="Add/Edit Mobile Number" Text="Add/Edit Mobile Number" UniqueName="mobileNumCol">
                    </telerik:GridHyperLinkColumn>
                    <telerik:GridBoundColumn DataField="Role" DataType="System.Int32" FilterControlAltText="Filter Role column" HeaderText="Role" SortExpression="Role" UniqueName="Role">
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="wpuserid" DataNavigateUrlFormatString="/admin/Settings/EditUserAccess.aspx?id={0}" FilterControlAltText="Filter column column" HeaderText="Change Role" Text="Change Role" UniqueName="changerole">
                    </telerik:GridHyperLinkColumn>
                   <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to remove access for this user?" FilterControlAltText="Filter column1 column" HeaderText="Remove Access" Text="Remove Access" UniqueName="delete"></telerik:GridButtonColumn>
                        

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
    SelectCommand="SELECT u.id as wpuserid,CustomPropertiesXml.value('(/data/SAML)[1]','nvarchar(255)') as SAML, * from tblWPUser u inner join tblWaiverSiteUser wu on u.id=wu.userid left join tblWFSMSMobileNum num on num.WPUserID=u.ID and num.SiteID=@siteid and IsGlobalOptOut<>1 and isDeleted<>1 where wu.siteid=@siteid and (CustomPropertiesXml.value('(/data/SAML)[1]','nvarchar(255)') is null or CustomPropertiesXml.value('(/data/SAML)[1]','nvarchar(255)')='') order by last_name, first_name ">


</asp:SqlDataSource>

<asp:Label ID="lblSAMLNote" runat="server" Visible="false" Text="* Note: Users managed through the enterprise will not be visible here, and their roles and access permissions cannot be changed. These settings are controlled by your organization. "></asp:Label>

<asp:Panel runat="server" ID="pnlUnassignedSamlUsers">
    <hr />
    <h3>New Users Without Assigned Roles</h3>

    <asp:PlaceHolder runat="server" ID="phUnassignedUsers"></asp:PlaceHolder>
</asp:Panel>


