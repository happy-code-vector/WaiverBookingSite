<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFAccountSetupPack.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.FormWFAccountSetupPack" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
     function OnClientItemsRequesting(sender, eventArgs) {
         var context = eventArgs.get_context();
         context["FilterString"] = eventArgs.get_text();
    }
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function () {
        $('#checkAll').click(function (e) {
            e.preventDefault();
            $('.checkbox-list input[type="checkbox"]').prop('checked', true);
        });

        $('#checkNone').click(function (e) {
            e.preventDefault();
            $('.checkbox-list input[type="checkbox"]').prop('checked', false);
        });
    });
</script>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">WaiverFile Account Setup Pack - Waivers
</h3>
    </div><!-- /.box-header -->
    <div class="box-body  no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        
        <telerik:RadGrid Skin="Bootstrap" EnableEmbeddedSkins="true" 
               ID="RadGrid1" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource"
                 OnDeleteCommand="RadGrid1_DeleteCommand" 
              GridLines="None">
              <MasterTableView DataKeyNames="ID">
                <RowIndicatorColumn>
                  <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
                <ExpandCollapseColumn>
                  <HeaderStyle Width="20px" />
                </ExpandCollapseColumn>
                <Columns>
                  <telerik:GridBoundColumn DataField="Name" HeaderText="Name"
                    SortExpression="Name" UniqueName="Name">
                  </telerik:GridBoundColumn>
      

                  <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="This item will be permanently deleted. Do you wish to continue?"
                    HeaderText="Delete" Text="Delete" UniqueName="column1">
                  </telerik:GridButtonColumn>
                </Columns>
              </MasterTableView>
            </telerik:RadGrid>

    </div><!-- /.box-body -->
    
</div>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Site Pages
</h3>
    </div><!-- /.box-header -->
    <div class="box-body  no-padding">
<asp:PlaceHolder ID="phErr2" runat="server"></asp:PlaceHolder>
        
        <telerik:RadGrid Skin="Bootstrap" EnableEmbeddedSkins="true" 
               ID="RadGrid2" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid2_NeedDataSource"
                 OnDeleteCommand="RadGrid2_DeleteCommand" 
              GridLines="None">
              <MasterTableView DataKeyNames="ID">
                <RowIndicatorColumn>
                  <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
                <ExpandCollapseColumn>
                  <HeaderStyle Width="20px" />
                </ExpandCollapseColumn>
                <Columns>
                  <telerik:GridBoundColumn DataField="Path" HeaderText="Path"
                    SortExpression="Path" UniqueName="Path">
                  </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="Slug" HeaderText="Slug"
                   SortExpression="Slug" UniqueName="Slug">
                 </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="Slug" HeaderText="Slug"
  SortExpression="Slug" UniqueName="Slug">
</telerik:GridBoundColumn>

                  <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="This item will be permanently deleted. Do you wish to continue?"
                    HeaderText="Delete" Text="Delete" UniqueName="column1">
                  </telerik:GridButtonColumn>
                </Columns>
              </MasterTableView>
            </telerik:RadGrid>

    </div><!-- /.box-body -->
    
</div>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Add Items to Pack</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErrAddForm" runat="server"></asp:PlaceHolder>
        
           <div class="form-group">
                      <label for="<%=cboSite.ClientID %>">Waiver Site / Customer</label>
                     <telerik:RadComboBox ID="cboSite" runat="server" EnableLoadOnDemand="true" OnClientItemsRequesting="OnClientItemsRequesting" OnSelectedIndexChanged="cboSite_SelectedIndexChanged" AutoPostBack="true">
          <WebServiceSettings Method="SearchWaiverSitesForRadCombo" Path="/Controls/SysAdmin/WFSiteSearch.asmx" />
          </telerik:RadComboBox>
                </div>
             
        <div class="row">
            <div class="col-sm-6">
                <h4>Add Waiver Forms</h4>
                 <div class="form-group">
                    <label>Select a Waiver Form</label>
                    <asp:DropDownList runat="server" ID="cboWaiverForm" CssClass="form-control"></asp:DropDownList>
                </div>
                <asp:Button runat="server" ID="btnAddWaiverForm" CssClass="btn btn-primary" Text="Add Waiver Form" OnClick="btnAddWaiverForm_Click" />
            </div>
            <div class="col-sm-6">
                <h4>Add Web Pages</h4>
                <a href="#" id="checkAll">Check All</a> | <a href="#" id="checkNone">Check None</a>
                
                 <div class="form-group">
                     <asp:CheckBoxList ID="cblPages" runat="server" CssClass="checkbox-list">

                </asp:CheckBoxList>
                     </div>
                <asp:Button runat="server" ID="btnAddPages" CssClass="btn btn-primary" Text="Add Pages" OnClick="btnAddPages_Click" />
                <p class="help-block"> * this will set all sub-controls for standard pages too</p>
            </div>
        </div>

        


        <asp:CheckBox runat="server" ID="chkSetSiteSettings" Checked="true" /> Set package account-level settings from this account
    </div><!-- /.box-body -->
    <div class="box-footer">
        
    </div>
</div>

