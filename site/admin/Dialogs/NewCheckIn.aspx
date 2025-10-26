<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminDialog.Master" AutoEventWireup="true" CodeBehind="NewCheckIn.aspx.cs" Inherits="WaiverFile.site.admin.Dialogs.NewCheckIn" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph0" runat="server">
    <script type="text/javascript">
        function showHideTabs() {
            if ($('#<%=rbEvent.ClientID%>').is(':checked')) {
                $('#div_tabs').show();
            } else {
                $('#div_tabs').hide();
            }
            
        }
        $(document).ready(function () {


        <%if (_showCloseJs) {  %>

            window.parent.closeModal(true);

        <%}%>

        showHideTabs();
        var hfTabSelect = $('#<%=hfTabSelect.ClientID%>').val();
            if (hfTabSelect == 'UPCOMING') {

            }
            else if ( hfTabSelect == 'PAST') {
                $('#tab_past_link').trigger('click');
            }
            $('#<%=rbGenAdm.ClientID%>').click(function () {
                showHideTabs();
            });
            $('#<%=rbEvent.ClientID%>').click(function () {
                showHideTabs();
            });
            $('#btnCheckAllParts').click(function () {
                $('#<%=cblParticipants.ClientID%> input[type=checkbox]').each(function () {
                    $(this).prop('checked', true);
                });
            });
            
            $('#btnCancel').click(function () {
                window.parent.closeModal(false);
            });
            $('#btnCheckNoParts').click(function () {
                $('#<%=cblParticipants.ClientID%> input[type=checkbox]').each(function () {
                   $(this).prop('checked', false);
                });
            });
            //CAPTURE TAB SELECT AND SAVE IN hfTabSelect
            var activeTab = null;
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                $('#<%=hfTabSelect.ClientID%>').val($(e.target).data('tabval'));
            });
        });
    </script>

  
     <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
     

    <div class="form-group">
        <label>Participants <small>(<a href="javascript:void(0);" id="btnCheckAllParts">Check All</a> | <a href="javascript:void(0);" id="btnCheckNoParts">Check None</a>)</small></label>
    </div>
    <div class="form-group">
     <div class="checkboxlist">
        <asp:CheckBoxList ID="cblParticipants" runat="server" CssClass="entrycheckbox"></asp:CheckBoxList>
     </div>
        </div>

    <div class="form-group form-inline">    
        <asp:RadioButton runat="server" ID="rbGenAdm" GroupName="SELECTION" Text="General Admission" />

        <asp:RadioButton runat="server" ID="rbEvent" GroupName="SELECTION" Text="Select an Event" />

    </div>

    <asp:HiddenField runat="server" ID="hfTabSelect" />
    <div class="panel with-nav-tabs panel-default" style="display:none;" id="div_tabs">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#tab_upcoming" id="tab_upcoming_link" data-tabval="UPCOMING">Upcoming Events</a></li>
                    <li><a data-toggle="tab" href="#tab_past" id="tab_past_link" data-tabval="PAST">Past Events</a></li>
                </ul>
            </div>
            <div class="panel-body" style="padding:0;">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab_upcoming">
                        

<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound" AllowPaging="True"  AllowMultiRowSelection="false"
            AllowSorting="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

    <ClientSettings>
        <Selecting AllowRowSelect="True" />
    </ClientSettings>
<MasterTableView DataKeyNames="WaiverEventID,WaiverEventRecurringID" ClientDataKeyNames="WaiverEventID,WaiverEventRecurringID"><SortExpressions>
    <telerik:GridSortExpression FieldName="DateStart" />
                                                                     </SortExpressions>


<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
         <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                </telerik:GridClientSelectColumn>
        <telerik:GridBoundColumn DataField="Name" 
            FilterControlAltText="Filter Name column" HeaderText="Name" 
            SortExpression="Name" UniqueName="Name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateStart" DataType="System.DateTime"  
            FilterControlAltText="Filter DateStart column" HeaderText="Start" 
            SortExpression="DateStart" UniqueName="DateStart">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateEnd" DataType="System.DateTime" 
            FilterControlAltText="Filter DateEnd column" HeaderText="End" 
            SortExpression="DateEnd" UniqueName="DateEnd">
        </telerik:GridBoundColumn>
        
    </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
</MasterTableView>

<FilterMenu EnableImageSprites="False">
<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>
</FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>
</HeaderContextMenu>
</telerik:RadGrid>
                             
                      </div>
                    <div class="tab-pane fade" id="tab_past">
                       
<telerik:RadGrid ID="RadGrid2" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid2_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound" AllowPaging="True"  AllowMultiRowSelection="false"
            AllowSorting="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

    <ClientSettings>
        <Selecting AllowRowSelect="True" />
    </ClientSettings>
<MasterTableView DataKeyNames="WaiverEventID,WaiverEventRecurringID" ClientDataKeyNames="WaiverEventID,WaiverEventRecurringID"><SortExpressions>
    <telerik:GridSortExpression FieldName="DateStart" />
                                                                     </SortExpressions>


<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
         <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                </telerik:GridClientSelectColumn>
        <telerik:GridBoundColumn DataField="Name" 
            FilterControlAltText="Filter Name column" HeaderText="Name" 
            SortExpression="Name" UniqueName="Name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateStart" DataType="System.DateTime"  
            FilterControlAltText="Filter DateStart column" HeaderText="Start" 
            SortExpression="DateStart" UniqueName="DateStart">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateEnd" DataType="System.DateTime" 
            FilterControlAltText="Filter DateEnd column" HeaderText="End" 
            SortExpression="DateEnd" UniqueName="DateEnd">
        </telerik:GridBoundColumn>
        
    </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
</MasterTableView>

<FilterMenu EnableImageSprites="False">
<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>
</FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>
</HeaderContextMenu>
</telerik:RadGrid>
                             
                    </div>
                   
                    </div>
                </div>
        </div>


<div class="form-group">
    <asp:CheckBox runat="server" ID="chkMarkAsCheckedIn" Text="Mark as checked in" />
</div>
   <asp:Button runat="server" ID="btnSave" Text="Add" CssClass="btn btn-primary" OnClick="btnSave_Click" />
    <a href="javascript:void(0);" class="btn btn-muted" id="btnCancel">Cancel</a>

    

</asp:Content>
