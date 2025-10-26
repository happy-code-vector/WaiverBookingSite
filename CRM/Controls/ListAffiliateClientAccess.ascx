<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListAffiliateClientAccess.ascx.cs" Inherits="WaiverFile.CRM.Controls.ListAffiliateClientAccess" %>
 <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

 <script type="text/javascript">
     function OnClientItemsRequesting(sender, eventArgs) {
         var context = eventArgs.get_context();
         context["FilterString"] = eventArgs.get_text();
     }
</script>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Customers for Affiliate: <asp:Label ID="lblAffiliateName2" runat="server"></asp:Label>
<span class="addbuttons"><asp:LinkButton runat="server" ID="btnDeleteSelected" CssClass="ico_d btn btn-danger" Text="Delete Selected" OnClick="btnDeleteSelected_Click"></asp:LinkButton>  <a href="?sc=WFCRM_EDIT_AFFILIATE&c=1" class="ico_add">Add</a></span>
</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True"  AllowMultiRowSelection="true">
    <groupingsettings casesensitive="False" />
     <ClientSettings>
        <Selecting AllowRowSelect="True" />
    </ClientSettings>
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="CustomerID">
        
        <Columns>

                      <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                </telerik:GridClientSelectColumn>
            <telerik:GridBoundColumn DataField="firstname" FilterControlAltText="Filter First column" HeaderText="First" SortExpression="firstname" UniqueName="firstname"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="lastname" FilterControlAltText="Filter Last column" HeaderText="Last" SortExpression="lastname" UniqueName="lastname"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="company" FilterControlAltText="Filter Company column" HeaderText="Company" SortExpression="company" UniqueName="company"></telerik:GridBoundColumn>
            
                         
                    
             <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="customer_ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_EDITCUSTOMER&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="View Customer" Text="View Customer" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>

                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to remove this client from this affiliate?" FilterControlAltText="Filter column1 column" HeaderText="Remove Client" Text="Remove Client" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblCRMCustomerData d inner join tblCustomer c on c.Customer_ID=d.CustomerID
where d.AffiliateID=@AffiliateID">
                  </asp:SqlDataSource>
                  



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Assign Customer to Affiliate <asp:Label ID="lblAffiliateName" runat="server"></asp:Label>
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        
          


        <div class="form-group">
            <label>Select a Customer</label>
            <telerik:RadComboBox ID="cboCustomer" runat="server" EnableLoadOnDemand="true" OnClientItemsRequesting="OnClientItemsRequesting">
            <WebServiceSettings Method="SearchCustomerForRadCombo" Path="/Controls/SearchCustomersCRM.asmx" />
            </telerik:RadComboBox>
        </div>
        <div class="form-group">
            <asp:CheckBox runat="server" ID="chkTakeOverExisting" Text="Move customer to this affiliate even if associated with another" />
        </div>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Assign" OnClick="btnSave_Click" />
        
    </div>
</div>

