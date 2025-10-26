<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WFViewer.ascx.cs" Inherits="WaiverFile.Controls.WorkflowUI.WFViewer" %>

<%@ Register Assembly="Telerik.Web.UI"  Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>


<script type="text/javascript">
    
   
    function RowSelected(sender, eventArgs) {
        var idList = '';
        var selList = $find("<%= RadGrid1.ClientID %>").get_masterTableView().get_selectedItems();
        if (selList.length == 0) {
            $('#btnMoveSelected').hide();
            $('#<%=btnRemoveSelected.ClientID%>').hide();
            
        } else {
            $('#btnMoveSelected').show();
            $('#<%=btnRemoveSelected.ClientID%>').show();
        }
    }
    function RowSelected2(sender, eventArgs) {
        var idList = '';
        var selList = $find("<%= RadGrid2.ClientID %>").get_masterTableView().get_selectedItems();
        if (selList.length == 0) {
            $('#<%=btnRestoreSelected.ClientID%>').hide();
        } else {
            $('#<%=btnRestoreSelected.ClientID%>').show();
        }
    }

    function movePart(partid) {
        $('#<%=hfMoveID.ClientID%>').val(partid);
        $('#pop_move').modal('show');
    }
    function moveSelected() {

        var idList = '';
        var selList = $find("<%= RadGrid1.ClientID %>").get_masterTableView().get_selectedItems();
        for (var i = 0; i < selList.length; i++) {
            var id = selList[i].getDataKeyValue("WaiverParticipantID");
            if (idList != '') { idList += ','; }
            idList += id;
        }
        movePart(idList);

    }

    




    $(function () {

        $('#btnAddParts').click(function () {
            $('#pop_add').modal('show');
        });

        $('#pop_add').on('shown.bs.modal', function () {
            $('#txtAddPartSearchText').focus();
        });
        $('#txtAddPartSearchText').on("keypress", function (e) {
            if (e.keyCode == 13) {
                PartSearch($('#txtAddPartSearchText').val());
                return false; // prevent the button click from happening
            }
        });
        $('#btnSearchPart').click(function () {
            PartSearch($('#txtAddPartSearchText').val());
        });
        $('#btnAddSelected').click(function () {
            //GET ALL SELECTED ITEMS popupSelectedEventID  popupSelectedSection
            var idsChecked = '';
            $('.chk_add_part:checked').each(function () {
                if (idsChecked != '') { idsChecked += ','; }
                idsChecked += $(this).val();
            });

            /*
            var targetSelector = 'table.GENADM';
            if (popupSelectedSection == 'events') {
                targetSelector = 'table.EVENTS';
            }
            $(targetSelector).closest('.ui-layout-pane').block({
                message: '<h4>Loading...</h4>',
                css: {}
            });*/


            $.ajax({
                type: "POST",
                url: "/Controls/DashboardV4Util.ashx",
                data: { cmd: "ADD_PARTS_WPW", dashid: '<%=dash.ID%>', stepID: '<%=stepCurr.ID.ToString()%>', idsChecked: idsChecked },
                success: function (data) {
                    //$('#pop_add').modal('hide');//CLOSE MODAL
                    //BumpReloadData(true, '', '');//REFRESH DATA
                },
                complete: function () {
                    $('#pop_add').modal('hide');//CLOSE MODAL
                    //ReloadData(true, '', '');
                    location.reload();
                }
            });
        });

    });






    function PartSearch(terms) {
        $('#findPartResults').html('Loading...');


        $.ajax({
            type: "POST",
            url: "/Controls/DashboardV4Util.ashx",
            data: { cmd: "PART_SEARCH_WPW", dashid: '<%=dash.ID%>', stepID: '<%=stepCurr.ID.ToString()%>', terms: terms },
            success: function (data) {
                //render!
                if (data.length == 0) {
                    $('#findPartResults').html('No results found.');
                } else {
                    var tbl = '<table class="table table-condensed"><thead><tr>'
                        + '<th>Select</th>'
                        + '<th>Participant</th>'
                        + '<th>Signed By</th>'
                        + '<th>Date Signed</th>' //<th>View</th>
                        + '</tr></thead><tbody>';
                    for (id in data) {
                        for (var currRow in data[id]) {
                            tbl += '<tr><td><input type="checkbox" class="chk_add_part" value="' + data[id][currRow]['p.WaiverParticipantID'] + '"/></td>';
                            tbl += '<td>' + data[id][currRow]['ParticipantNameFirst'] + ' ' + data[id][currRow]['ParticipantName'] + '</td > ';
                            tbl += '<td>' + data[id][currRow]['signednamefirst'] + ' ' + data[id][currRow]['signedname'] + '</td>';
                            tbl += '<td>' + formatDate(data[id][currRow]['DateSigned']);
                            if (data[id][currRow]['IsExpired'] == true) {
                                tbl += ' <span class="text-danger">Expired</span>';
                            }
                            if (data[id][currRow]['agedOut'] == true) {
                                tbl += ' <span class="text-danger">Participant old enough to sign own waiver</span>';
                            }
                            tbl += '</td>';
                            //tbl += '<td><a href="javascript:void(0);">View</a></td>';
                            tbl += '</tr>';
                        }
                    }
                    tbl += '</tbody></table>';
                    $('#findPartResults').html(tbl);
                }
            },
            complete: function () {

            }
        });

    }


    function formatDate(strDate) {
        var monthNames = [
            "Jan", "Feb", "Mar",
            "Apr", "May", "June", "July",
            "Aug", "Sept", "Oct",
            "Nov", "Dec"
        ];
        var date = new Date(strDate);
        var day = date.getDate();
        var monthIndex = date.getMonth();
        var year = date.getFullYear();

        return monthNames[monthIndex] + ' ' + day + ' ' + year;
    }

</script>
    

<div class="row">
    <div class="col-xs-12">
        
      <h3 class="pull-left"><%=Heading %></h3>
        <div class=" pull-right" style="margin-top:15px;">
            <a href="WFFieldSelect.aspx?id=<%=workflowID %>" class="btn btn-default" ><i class="fa fa-cog"></i> View Settings</a>
        <asp:LinkButton runat="server" ID="btnExport" CssClass="btn btn-default" OnClick="BtnExport_Click"><i class="fa fa-download" ></i> Export to Excel</asp:LinkButton>
            <a href="javascript:void(0);" id="btnAddParts" class="btn btn-default"><i class="fa fa-plus-circle"></i> Add Participants</a>
        

              
<a href="javascript:void(0);" onclick="moveSelected()" class="btn btn-primary" id="btnMoveSelected" style="display:none;">
   <i class="fa fa-arrows"></i> Move Selected</a>

            <asp:LinkButton runat="server" ID="btnRemoveSelected" OnClick="btnRemoveSelected_Click" CssClass="btn btn-danger" style="display:none;"><i class="fa fa-times-circle"></i> Remove Selected</asp:LinkButton>

            </div>
    </div>
</div>
  <asp:PlaceHolder ID="phBreadCrumbs" runat="server"></asp:PlaceHolder>

   


<div class="row">
    <div class="col-xs-12">

<asp:PlaceHolder runat="server" ID="phNavigationButtons"></asp:PlaceHolder>

    </div>
</div>
<div class="row">
    <div class="col-xs-12">

      


<telerik:RadGrid Skin="Bootstrap"  ID="RadGrid1" runat="server" AutoGenerateColumns="False" AllowMultiRowSelection="true" OnItemDataBound="RadGrid1_ItemDataBound" OnNeedDataSource="RadGrid1_NeedDataSource" OnDataBound="RadGrid1_DataBound" OnItemCommand="RadGrid1_ItemCommand" AllowSorting="true" >
    <MasterTableView ClientDataKeyNames="WaiverParticipantID"  >
        <Columns>
              <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="WaiverParticipantID" DataNavigateUrlFormatString="javascript:movePart('{0}');" FilterControlAltText="Filter column2 column" HeaderText="Move" Text="Move" UniqueName="colfixed_move">
            </telerik:GridHyperLinkColumn>
            <telerik:GridButtonColumn CommandName="remove" Text="Remove" UniqueName="colfixed_rem"></telerik:GridButtonColumn>
        </Columns>
        <ExpandCollapseColumn Resizable="False" Visible="False">
            <HeaderStyle Width="20px" />
        </ExpandCollapseColumn>
        <RowIndicatorColumn Visible="False">
            <HeaderStyle Width="20px" />
        </RowIndicatorColumn>
    </MasterTableView>
    <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True"></Selecting>
                <ClientEvents OnRowSelected="RowSelected" OnRowDeselected="RowSelected"  />
            </ClientSettings>
    <GroupingSettings CaseSensitive="false" />
</telerik:RadGrid>
         </div>
</div>
<hr />
<div class="row">
    <div class="col-xs-12">

      <h4>Removed Participants</h4>
        <asp:Button runat="server" ID="btnRestoreSelected" CssClass="btn btn-primary" Text="Restore Selected" OnClick="btnRestoreSelected_Click" Style="display:none;" />

        

<telerik:RadGrid Skin="Bootstrap"  ID="RadGrid2" runat="server"  AllowSorting="false"  AutoGenerateColumns="False" ClientSettings-Selecting-AllowRowSelect="true" AllowMultiRowSelection="True"  DataSourceID="SqlDataSource1" OnItemCommand="RadGrid2_ItemCommand" >
    <MasterTableView ClientDataKeyNames="WaiverParticipantID" datasourceid="SqlDataSource1"  >
        
        <ExpandCollapseColumn Resizable="False" Visible="False">
            <HeaderStyle Width="20px" />
        </ExpandCollapseColumn>
        <RowIndicatorColumn Visible="False">
            <HeaderStyle Width="20px" />
        </RowIndicatorColumn>
    <Columns>
           <telerik:GridClientSelectColumn UniqueName="selectColumnTwo">
                    </telerik:GridClientSelectColumn>

        <telerik:GridBoundColumn DataField="ParticipantNameFirst" FilterControlAltText="Filter ParticipantNameFirst column" HeaderText="Participant First Name" SortExpression="ParticipantNameFirst" UniqueName="ParticipantNameFirst"></telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="ParticipantName" FilterControlAltText="Filter ParticipantName column" HeaderText="Participant Last Name" SortExpression="ParticipantName" UniqueName="ParticipantName"></telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="SignedNameFirst" FilterControlAltText="Filter SignedNameFirst column" HeaderText="Signee First Name" SortExpression="SignedNameFirst" UniqueName="SignedNameFirst"></telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="SignedName" FilterControlAltText="Filter SignedName column" HeaderText="Signee Last Name" SortExpression="SignedName" UniqueName="SignedName"></telerik:GridBoundColumn>
        <telerik:GridButtonColumn CommandName="restore" Text="Restore" UniqueName="colfixed_rem"></telerik:GridButtonColumn>
    </Columns>
           
    </MasterTableView>
         <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True"></Selecting>
                <ClientEvents OnRowSelected="RowSelected2" OnRowDeselected="RowSelected2"  />
            </ClientSettings>
    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>


</telerik:RadGrid>
         </div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="    select wpw.ID, p.WaiverParticipantID, p.WaiverID, p.ParticipantNameFirst, p.ParticipantName, w.SignedNameFirst, w.SignedName from tblWaiverParticipant p 
inner join tblWFWaiverParticipantWorkflow wpw on wpw.WaiverParticipantID=p.WaiverParticipantID
inner join tblwaiver w on w.WaiverID=p.WaiverID
where wpw.WorkflowStepID=@WorkflowStepID and IsCurrent=1 and IsIncluded=0">
    <SelectParameters>
        <asp:Parameter Name="WorkflowStepID" DefaultValue="00000000-0000-0000-0000-000000000000" />
    </SelectParameters>
</asp:SqlDataSource>

    
</div>



<!-- Modal -->
<div class="modal fade" id="pop_move" tabindex="-1" role="dialog" aria-labelledby="lblPopMove">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblPopMove">Move Participants</h4>
      </div>
      <div class="modal-body">

          <div class="form-group">
              <label for="<%=cboTargetStep.ClientID %>">Select a Destination</label>
              <asp:DropDownList runat="server" ID="cboTargetStep" CssClass="form-control"></asp:DropDownList>
          </div>
          
          

      </div>
      <div class="modal-footer">

          <span id="move_part_dest_validation" class="text-danger" style="display:none;">Please select a destination</span>
           
          <asp:HiddenField runat="server" ID="hfMoveID" />
          <asp:Button runat="server" ID="btnMove" CssClass="btn btn-primary" Text="Move" OnClick="btnMove_Click" />
          <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelMove" data-dismiss="modal">Cancel</a>
      </div>
    </div>
  </div>
</div>



<!-- Modal -->
<div class="modal fade" id="pop_add" tabindex="-1" role="dialog" aria-labelledby="lblPopAdd">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblPopAdd">Add Participants</h4>
      </div>
      <div class="modal-body">
        <div class="form-inline">
          <div class="form-group">
              <div class="row">
                  <div class="col-sm-4"><label>Search</label></div>
                  <div class="col-sm-6"><input type="text" id="txtAddPartSearchText" name="txtAddPartSearchText" class="form-control" placeholder="Search by name" /></div>
                  <div class="col-sm-2"><input type="button" id="btnSearchPart" name="btnSearchPart" class="btn btn-primary" value="Search" /></div>
              </div>
                </div>
            </div>
          <hr />

          <div id="findPartResults"></div>

      </div>
      <div class="modal-footer">
          <!--<div class="pull-left">
              <input type="checkbox" id="chkCheckInNewPart" name="chkCheckInNewPart" checked="checked" /> <label for="chkCheckInNewPart">Mark as Checked In</label>
          </div>-->
          <a href="javascript:void(0);" class="btn btn-primary" id="btnAddSelected">Add Selected</a>
           <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelAdd" data-dismiss="modal">Cancel</a>
           
      </div>
    </div>
  </div>
</div>



