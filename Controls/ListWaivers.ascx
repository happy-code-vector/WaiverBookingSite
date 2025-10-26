<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWaivers.ascx.cs" Inherits="WaiverFile.Controls.ListWaivers" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
    var popupSelectedEventID = '';

    $(document).ready(function () {

        $('#pop_add').on('shown.bs.modal', function () {
            $('#txtAddPartSearchText').focus();
        });

       

        $('.btnAddParts2').each(function () {
            $(this).click(function () {
                popupSelectedEventID = $(this).data('eventid');
                popupSelectedSection = $(this).data('section');
                $('#pop_add').modal('show');

            });
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
                url: "/Controls/DashboardV5Util.ashx",
                data: { cmd: "ADD_PARTS", dashid: '<%=dash.ID%>', popupSelectedSection: popupSelectedSection, popupSelectedEventID: popupSelectedEventID, idsChecked: idsChecked, isCheckedIn: $('#chkCheckInNewPart').is(':checked') },
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
            data: { cmd: "PART_SEARCH", dashid: '<%=dash.ID%>', popupSelectedSection: popupSelectedSection, popupSelectedEventID: popupSelectedEventID, terms: terms },
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

 <div class="form-group form-inline" style="margin-top: 20px;">
     <h3 style="display:inline; margin-right: 20px;"><asp:PlaceHolder ID="phHeaderText" runat="server"></asp:PlaceHolder></h3>

     <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Reports.aspx?evtid=<%=strwaivereventid %>&mode=evt" class="btn btn-default pull-right" style="margin-left:5px;"><i class="fa fa-line-chart"></i> Reports</a>&nbsp;
     <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/PrintEvent.aspx?id=<%=strwaivereventid %>" target="_blank" class="btn btn-default pull-right" style="margin-left:5px;"><i class="fa fa-print"></i> Print Views</a>&nbsp;
    
     <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/EventParticipants.aspx?id=<%=strwaivereventid %>" class="btn btn-muted pull-right" style="margin-left:0; border-top-left-radius:0; border-bottom-left-radius:0;"><i class="fa fa-users"></i> Participants</a>
     <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/EventSignatures.aspx?id=<%=strwaivereventid %>" class="btn btn-muted active pull-right" style="border-top-right-radius:0; border-bottom-right-radius:0;"><i class="fa fa-list"></i> Waivers</a>

  </div>

<hr />

 <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<asp:LinkButton runat="server" ID="btnExportExcel" CssClass="btn btn-default btn-sm pull-right" onclick="BtnExportExcel_Click"><i class="fa fa-download" ></i> Export to Excel</asp:LinkButton>   
<h3 style="display:inline-block;margin-top:0;">Waivers</h3>


<div class="clear"></div>

<telerik:RadGrid ID="RadGrid1" OnInfrastructureExporting="RadGrid_InfrastructureExporting" runat="server" AutoGenerateColumns="False"  OnDeleteCommand="RadGrid1_DeleteCommand" OnItemDataBound="RadGrid1_ItemDataBound"
    CellSpacing="0" DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="True" 
            AllowSorting="True">
<MasterTableView DataKeyNames="WaiverID" DataSourceID="SqlDataSource1" ShowFooter="true">
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="signedNameFirst" Aggregate="Count" 
            FilterControlAltText="Filter signedNameFirst column" HeaderText="First" 
            SortExpression="signedNameFirst" UniqueName="signedNameFirst">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="signedName" 
            FilterControlAltText="Filter signedName column" HeaderText="Last" 
            SortExpression="signedName" UniqueName="signedName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateSigned" DataType="System.DateTime" 
            FilterControlAltText="Filter DateSigned column" HeaderText="Date" 
            SortExpression="DateSigned" UniqueName="DateSigned">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Address" 
            FilterControlAltText="Filter Address column" HeaderText="Address" 
            SortExpression="Address" UniqueName="Address">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="City" 
            FilterControlAltText="Filter City column" HeaderText="City" 
            SortExpression="City" UniqueName="City">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="State" 
            FilterControlAltText="Filter State column" HeaderText="State" 
            SortExpression="State" UniqueName="State">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Zip" 
            FilterControlAltText="Filter Zip column" HeaderText="Zip" SortExpression="Zip" 
            UniqueName="Zip">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Phone" 
            FilterControlAltText="Filter Phone column" HeaderText="Phone" 
            SortExpression="Phone" UniqueName="Phone">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DOB" 
            FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" 
            UniqueName="DOB">
        </telerik:GridBoundColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="Email" 
            DataNavigateUrlFormatString="mailto:{0}" DataTextField="Email" 
            FilterControlAltText="Filter EmailCol column" HeaderText="Email" 
            UniqueName="EmailCol">
        </telerik:GridHyperLinkColumn>
        <telerik:GridBoundColumn DataField="numparticipants" DataType="System.Int32" Aggregate="Sum"
            FilterControlAltText="Filter numparticipants column" HeaderText="Participants" 
            ReadOnly="True" SortExpression="numparticipants" UniqueName="numparticipants">
        </telerik:GridBoundColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="WaiverID" 
            DataNavigateUrlFormatString="/admin/ViewWaiver.aspx?id={0}" 
            FilterControlAltText="Filter column column" HeaderText="View" Text="View" 
            UniqueName="viewCol">
        </telerik:GridHyperLinkColumn>
        <telerik:GridButtonColumn CommandName="DELETE" 
            ConfirmText="All participants signed on this form will be removed from this event. Continue?" 
            FilterControlAltText="Filter column1 column" HeaderText="Remove" Text="Remove" 
            UniqueName="column1">
        </telerik:GridButtonColumn>
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
    SelectCommand="select w.WaiverID, w.WaiverEventID,w.WaiverTextID, w.DateSigned, w.Address, w.City, w.State, w.Zip, w.Phone, w.DOB, w.Email,signedName, signedNameFirst, COUNT(p.WaiverParticipantID) as numparticipants
 from tblWaiver w inner join tblWaiverParticipant p on w.WaiverID=p.WaiverID inner join tblWaiverParticipantEvent wpe on wpe.siteID=@siteID and wpe.WaiverParticipantID=p.WaiverParticipantID
where wpe.WaiverEventID=@WaiverEventID AND (w.IsWorkflowSessionPrimary is null or w.IsWorkflowSessionPrimary=1) and w.WaiverEventID=@WaiverEventID and w.siteID=@siteID and w.WaiverIsDeleted=0 and wpe.IsCurrent=1 and wpe.isIncluded=1
group by w.WaiverID, w.WaiverEventID,w.WaiverTextID, w.DateSigned, w.Address, w.City, w.State, w.Zip, w.Phone, w.DOB, w.Email,signedName, signedNameFirst
order by signedname"></asp:SqlDataSource>




    
         <div class="form-group" style="margin-top: 20px;">
             
 
    <h3>Additional Participants</h3>

             <span class="pull-right">
             <a href="javascript:void(0);" class="btn btn-default btn-sm btnAddParts2" data-section="events" data-eventid="<%=waiverEventID %>"><i class="fa fa-plus-circle"></i> Add</a>


             <asp:LinkButton runat="server" ID="btnExportToExcel2" CssClass="btn btn-default btn-sm " onclick="BtnExportExcel2_Click"><i class="fa fa-download" ></i> Export to Excel</asp:LinkButton>

                 </span>

             <p>The following participants were added to this event (not originally signed for this event).</p>

             

             </div>

 
<telerik:RadGrid ID="RadGrid2" runat="server" AutoGenerateColumns="False"  OnItemDataBound="RadGrid2_ItemDataBound" OnItemCommand="RadGrid2_ItemCommand" OnInfrastructureExporting="RadGrid_InfrastructureExporting"
    CellSpacing="0" DataSourceID="SqlDataSource2" GridLines="None" AllowPaging="True" 
            AllowSorting="True">
<MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource2" ShowFooter="true">
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="ParticipantNameFirst"  Aggregate="Count" 
            FilterControlAltText="Filter First column" HeaderText="First" 
            SortExpression="ParticipantNameFirst" UniqueName="ParticipantNameFirst">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="ParticipantName" 
            FilterControlAltText="Filter Last column" HeaderText="Last" 
            SortExpression="ParticipantName" UniqueName="ParticipantName">
        </telerik:GridBoundColumn>
      
        <telerik:GridBoundColumn DataField="signedName" 
            FilterControlAltText="Filter signedName column" HeaderText="Signed By" 
            SortExpression="signedName" UniqueName="signedName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateSigned" DataType="System.DateTime" 
            FilterControlAltText="Filter DateSigned column" HeaderText="Date" 
            SortExpression="DateSigned" UniqueName="DateSigned">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Address" 
            FilterControlAltText="Filter Address column" HeaderText="Address" 
            SortExpression="Address" UniqueName="Address">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="City" 
            FilterControlAltText="Filter City column" HeaderText="City" 
            SortExpression="City" UniqueName="City">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="State" 
            FilterControlAltText="Filter State column" HeaderText="State" 
            SortExpression="State" UniqueName="State">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Zip" 
            FilterControlAltText="Filter Zip column" HeaderText="Zip" SortExpression="Zip" 
            UniqueName="Zip">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Phone" 
            FilterControlAltText="Filter Phone column" HeaderText="Phone" 
            SortExpression="Phone" UniqueName="Phone">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DOB" 
            FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" 
            UniqueName="DOB">
        </telerik:GridBoundColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="Email" 
            DataNavigateUrlFormatString="mailto:{0}" DataTextField="Email" 
            FilterControlAltText="Filter EmailCol column" HeaderText="Email" 
            UniqueName="EmailCol">
        </telerik:GridHyperLinkColumn>
      
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="WaiverID" 
            DataNavigateUrlFormatString="/admin/ViewWaiver.aspx?id={0}" 
            FilterControlAltText="Filter column column" HeaderText="View" Text="View" 
            UniqueName="viewCol">
        </telerik:GridHyperLinkColumn>
        <telerik:GridButtonColumn CommandName="REMOVE" 
            FilterControlAltText="Filter column1 column" HeaderText="Remove" Text="Remove" 
            UniqueName="column1">
        </telerik:GridButtonColumn>
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
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
    SelectCommand="SELECT id, w.waiverid, 
       w.waivereventid, 
       w.waivertextid, 
       w.datesigned, 
       w.address, 
       w.city, 
       w.state, 
       w.zip, 
       w.phone, 
       p.dob, 
       w.email, 
       signedname + case when SignedNameFirst='' then '' else ', ' end + SignedNameFirst as signedname,
	   p.ParticipantName, p.ParticipantNameFirst
	   ,wpe.IsCheckedIn
       
FROM   tblWaiverParticipantEvent wpe
inner join tblWaiverParticipant p on wpe.siteID=@siteID and p.WaiverParticipantID=wpe.WaiverParticipantID
inner join tblWaiver w on w.WaiverID=p.WaiverID
WHERE  wpe.waivereventid = @WaiverEventID AND (w.IsWorkflowSessionPrimary is null or w.IsWorkflowSessionPrimary=1) and w.waivereventid &lt;&gt; @WaiverEventID 
       AND w.siteid = @siteID 
       AND w.waiverisdeleted = 0 
       AND wpe.iscurrent = 1 
       AND wpe.isincluded = 1 
ORDER  BY p.ParticipantName, p.ParticipantNameFirst"></asp:SqlDataSource>






         <div class="form-group" style="margin-top: 20px;">
             
 
    <h3>Removed Participants</h3>
             <asp:LinkButton runat="server" ID="btnExportToExcel3" CssClass="btn btn-default btn-sm pull-right" onclick="BtnExportExcel3_Click"><i class="fa fa-download" ></i> Export to Excel</asp:LinkButton>
             <p>The following waivers were part of this event but have been removed.</p>
             </div>

 
<telerik:RadGrid ID="RadGrid3" runat="server" OnInfrastructureExporting="RadGrid_InfrastructureExporting"  AutoGenerateColumns="False"  OnItemDataBound="RadGrid3_ItemDataBound" OnItemCommand="RadGrid3_ItemCommand"
    CellSpacing="0" DataSourceID="SqlDataSource3" GridLines="None" AllowPaging="True" 
            AllowSorting="True">
<MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource3" ShowFooter="true">
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="ParticipantNameFirst"  Aggregate="Count" 
            FilterControlAltText="Filter First column" HeaderText="First" 
            SortExpression="ParticipantNameFirst" UniqueName="ParticipantNameFirst">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="ParticipantName" 
            FilterControlAltText="Filter Last column" HeaderText="Last" 
            SortExpression="ParticipantName" UniqueName="ParticipantName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="signedname" 
            FilterControlAltText="Filter Signed By column" HeaderText="Signed By" 
            SortExpression="signedname" UniqueName="signedname">
        </telerik:GridBoundColumn>
      
        <telerik:GridBoundColumn DataField="DateSigned" DataType="System.DateTime" 
            FilterControlAltText="Filter DateSigned column" HeaderText="Date" 
            SortExpression="DateSigned" UniqueName="DateSigned">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Address" 
            FilterControlAltText="Filter Address column" HeaderText="Address" 
            SortExpression="Address" UniqueName="Address">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="City" 
            FilterControlAltText="Filter City column" HeaderText="City" 
            SortExpression="City" UniqueName="City">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="State" 
            FilterControlAltText="Filter State column" HeaderText="State" 
            SortExpression="State" UniqueName="State">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Zip" 
            FilterControlAltText="Filter Zip column" HeaderText="Zip" SortExpression="Zip" 
            UniqueName="Zip">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Phone" 
            FilterControlAltText="Filter Phone column" HeaderText="Phone" 
            SortExpression="Phone" UniqueName="Phone">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DOB" 
            FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" 
            UniqueName="DOB">
        </telerik:GridBoundColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="Email" 
            DataNavigateUrlFormatString="mailto:{0}" DataTextField="Email" 
            FilterControlAltText="Filter EmailCol column" HeaderText="Email" 
            UniqueName="EmailCol">
        </telerik:GridHyperLinkColumn>
      
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="WaiverID" 
            DataNavigateUrlFormatString="/admin/ViewWaiver.aspx?id={0}" 
            FilterControlAltText="Filter column column" HeaderText="View" Text="View" 
            UniqueName="viewCol">
        </telerik:GridHyperLinkColumn>
        <telerik:GridButtonColumn CommandName="RESTORE" 
            FilterControlAltText="Filter column1 column" HeaderText="Restore" Text="Restore" 
            UniqueName="column1">
        </telerik:GridButtonColumn>
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
<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
    SelectCommand="SELECT wpe.id, w.waiverid, 
       w.waivereventid, 
       w.waivertextid, 
       w.datesigned, 
       w.address, 
       w.city, 
       w.state, 
       w.zip, 
       w.phone, 
       p.dob, 
       w.email, 
       signedname + case when SignedNameFirst='' then '' else ', ' end + SignedNameFirst as signedname,
	   p.ParticipantName, p.ParticipantNameFirst
	   ,wpe.IsCheckedIn
       
FROM   tblWaiverParticipantEvent wpe
inner join tblWaiverParticipant p on wpe.siteID=@siteID and  p.WaiverParticipantID=wpe.WaiverParticipantID
inner join tblWaiver w on w.WaiverID=p.WaiverID
WHERE  wpe.waivereventid = @WaiverEventID AND (w.IsWorkflowSessionPrimary is null or w.IsWorkflowSessionPrimary=1) 
       AND w.siteid = @siteID 
       AND wpe.iscurrent = 1 
       AND wpe.isincluded = 0 
ORDER  BY p.ParticipantName, p.ParticipantNameFirst"></asp:SqlDataSource>



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
          <div class="pull-left">
              <input type="checkbox" id="chkCheckInNewPart" name="chkCheckInNewPart" checked="checked" /> <label for="chkCheckInNewPart">Mark as Checked In</label>
          </div>
          <a href="javascript:void(0);" class="btn btn-primary" id="btnAddSelected">Add Selected</a>
           <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelAdd" data-dismiss="modal">Cancel</a>
           
      </div>
    </div>
  </div>
</div>

