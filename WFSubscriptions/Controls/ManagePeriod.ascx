<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManagePeriod.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ManagePeriod" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#btn_change_inc').click(function () {
            $('#inc_label').hide();
            $('#inc_edit').show();
        });
    });
</script>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Subscription Period (<%=ServiceWord %>)
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="row">
            <div class="col-sm-6">
                 <div class="form-group">
                    <label>Dates</label>
                    <asp:Label ID="lblDates" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <label>Base <%=ServiceWord %> Included</label>
                    <span id="inc_label">
                        <asp:Label ID="lblWaiversIncludedBase" runat="server"></asp:Label> (<a href="javascript:void(0);" id="btn_change_inc">Override</a>)
                    </span>
                    <div id="inc_edit" style="display:none;" class="form-inline">
                        
                    <asp:TextBox runat="server" ID="txtWaiversIncludedBase" CssClass="form-control"></asp:TextBox>
                    <asp:Button runat="server" ID="btnSaveWaiversIncludedBase" CssClass="btn btn-primary btn-sm" Text="Save" OnClick="btnSaveWaiversIncludedBase_Click" />
                        <p class="help-block">Set to -1 for unlimited</p>
                        </div>
                </div>
            </div>
            <div class="col-sm-6">
                 <div class="form-group">
                    <label>Total <%=ServiceWord %> Included</label>
                    <asp:Label ID="lblWaiversIncluded" runat="server"></asp:Label>
                    <p class="help-block">Calculated to include rollovers and packs.</p>
                </div>

                <div class="form-group">
                    <label><%=ServiceWord %> Used</label>
                    <asp:Label ID="lblWaiversUsed" runat="server"></asp:Label>
                </div>
            </div>
        </div>

       <asp:PlaceHolder ID="phProgress" runat="server"></asp:PlaceHolder>
       
        
    </div><!-- /.box-body -->
   
</div>


<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Addon Packs<span class="addbuttons"><a href="?sc=WF_SUBS_ADD_WAIVERPACK&c=1" class="ico_add">Add Pack</a></span>
</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">

       <rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False"  id="RadGrid1" runat="server" DataSourceID="sqlListWaiverPacks" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnDeleteCommand="RadGrid1_DeleteCommand">
        <mastertableview datasourceid="sqlListWaiverPacks"  DataKeyNames="ID"><Columns>
<rad:GridHyperLinkColumn DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=EDITORDER&amp;c=1&amp;id={0}" UniqueName="orderlink" DataNavigateUrlFields="Order_ID" HeaderText="Order" DataTextField="orderNumber" FilterControlAltText="Filter column2 column"></rad:GridHyperLinkColumn>

<rad:GridBoundColumn DataField="order_total" UniqueName="column3" DataFormatString="{0:c}" HeaderText="Total"></rad:GridBoundColumn>
<rad:GridBoundColumn DataField="dateCreated" UniqueName="column1" HeaderText="Date"></rad:GridBoundColumn>
<rad:GridBoundColumn DataField="numWaivers" UniqueName="numWaivers" HeaderText="Number Added" FilterControlAltText="Filter numWaivers column"></rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="orderstatus" DataType="System.Int32" HeaderText="Order Status"
                UniqueName="orderstatus">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="waiverpackstatus" FilterControlAltText="Filter waiverpackstatus column" HeaderText="Status" UniqueName="waiverpackstatus">
            </rad:GridBoundColumn>
            <rad:GridHyperLinkColumn DataNavigateUrlFields="ID" UniqueName="column5" DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=WF_SUBS_EDIT_WAIVERPACK&amp;c=1&amp;id={0}" HeaderText="Action" FilterControlAltText="Filter column5 column" Text="Edit" />

            <rad:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this block? " FilterControlAltText="Filter column column" HeaderText="Delete" Text="Delete" UniqueName="column">
            </rad:GridButtonColumn>
</Columns>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<EditFormSettings>
<EditColumn InsertImageUrl="Update.gif" UpdateImageUrl="Update.gif" CancelImageUrl="Cancel.gif"></EditColumn>
</EditFormSettings>
</mastertableview>

<FilterMenu EnableEmbeddedSkins="False"></FilterMenu>

<HeaderContextMenu EnableEmbeddedSkins="False"></HeaderContextMenu>
    </rad:RadGrid>
    <asp:SqlDataSource ID="sqlListWaiverPacks" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
        SelectCommand="spListWFWaiverPacksForPeriod" SelectCommandType="StoredProcedure">
        <SelectParameters>
        </SelectParameters>
        </asp:SqlDataSource>
        
        
    </div><!-- /.box-body -->
</div>




<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Rollovers
            <span class="addbuttons"><a href="?sc=WF_SUBS_EDIT_ROLLOVER&c=1" class="ico_add">Add Rollover</a></span>
</h3>
    </div><!-- /.box-header -->
    <div class="box-body no-padding">

          <rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False"  id="RadGrid2" runat="server" DataSourceID="sqlListRollovers" AutoGenerateColumns="False" OnDeleteCommand="RadGrid2_DeleteCommand">
        <mastertableview datasourceid="sqlListRollovers" DataKeyNames="ID"><Columns>

<rad:GridBoundColumn DataField="numWaivers" UniqueName="column3" HeaderText="Waivers"></rad:GridBoundColumn>
<rad:GridBoundColumn DataField="Moved" UniqueName="column1" HeaderText="Moved"></rad:GridBoundColumn>
           
<rad:GridHyperLinkColumn DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=WF_SUBS_MANAGEPERIOD&amp;c=1&amp;id={0}" UniqueName="column5" DataTextField="otherPeriod" DataNavigateUrlFields="otherPeriodID" HeaderText="Other Period" FilterControlAltText="Filter column5 column" Text="Edit"></rad:GridHyperLinkColumn>
<rad:GridHyperLinkColumn DataNavigateUrlFormatString="/wp-admin/default.aspx?sc=WF_SUBS_EDIT_ROLLOVER&amp;c=1&amp;id={0}" UniqueName="column5" DataNavigateUrlFields="ID" HeaderText="Action" FilterControlAltText="Filter column5 column" Text="Edit"></rad:GridHyperLinkColumn>

            <rad:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this rollover? " FilterControlAltText="Filter column column" HeaderText="Delete" Text="Delete" UniqueName="column">
            </rad:GridButtonColumn>
</Columns>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<EditFormSettings>
<EditColumn InsertImageUrl="Update.gif" UpdateImageUrl="Update.gif" CancelImageUrl="Cancel.gif"></EditColumn>
</EditFormSettings>
</mastertableview>

<FilterMenu EnableEmbeddedSkins="False"></FilterMenu>

<HeaderContextMenu EnableEmbeddedSkins="False"></HeaderContextMenu>
    </rad:RadGrid>
    <asp:SqlDataSource ID="sqlListRollovers" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
        SelectCommand="spListRolloversForPeriod" SelectCommandType="StoredProcedure">
        <SelectParameters>
        </SelectParameters>
        </asp:SqlDataSource>
        
        
    </div><!-- /.box-body -->
</div>


