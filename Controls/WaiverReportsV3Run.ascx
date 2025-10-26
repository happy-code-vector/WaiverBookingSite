<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverReportsV3Run.ascx.cs" Inherits="WaiverFile.Controls.WaiverReportsV3Run" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>



<div id="iframeModal" class="modal fade modal-fullscreen  footer-to-bottom" tabindex="-1" role="dialog">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Select an Event</h4>
      </div>
      <div class="modal-body" >
         <iframe id="modaliframe" style="width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:10;"></iframe> 
      </div>
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<script type="text/javascript">
    window.closeModal = function (eventid, eventdisplayname) {
        $('#iframeModal').modal('hide');
        eventButtonHandle(eventid, eventdisplayname);
        //$('#<%=btnRunReport.ClientID%>').trigger('click'); //this didnt work? 
        var clickButton = document.getElementById("<%= btnRunReport.ClientID %>");
        clickButton.click();
    };
    function eventButtonHandle(eventid, eventdisplayname) {
        if (eventid == '00000000-0000-0000-0000-000000000000') {
            $('#eventselect').html('None');
            $('#btnClearEvent').hide();
        } else {
            $('#btnClearEvent').show();
            $('#eventselect').html(eventdisplayname);
        }
        $('#<%=hfEventID.ClientID%>').val(eventid);
    }
    function showModalFindEvent() {
        var wpe = $(this).data('wpe');
        $('#modaliframe').attr('src', '/b/<%=site.Url%>/admin/Dialogs/FindEvent.aspx');
        //show modal
        $('#iframeModal').modal('show');

    }
    function showHideDates() {
        if ($('#<%=cboDateRange.ClientID%>').val() == 'Custom_range') {
            $('.choosedates').each(function () { $(this).show(); });
        } else {
            $('.choosedates').each(function () { $(this).hide(); });
        }
    }

    $(document).ready(function () {
        $('#btnClearEvent').click(function () {
            $('#<%=hfEventID.ClientID%>').val('00000000-0000-0000-0000-000000000000');
            $('#eventselect').html('None');
            $('#btnClearEvent').hide();
        });
        $('#btnSetEvent').click(function () {
            showModalFindEvent();
        });
        eventButtonHandle('<%=eventID.ToString()%>', '<%=eventNameOnLoad%>');

    showHideDates();
    $('#<%=cboDateRange.ClientID%>').change(function () { showHideDates(); })

});

</script>

<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

<asp:Panel runat="server" ID="pnlMain">

    <div class="control-group">
    <h1><asp:Label ID="lblHeading" runat="server"></asp:Label></h1>
    
        <p class="help-block"><asp:Label ID="lblDesc" runat="server"></asp:Label>
            </p>

         <div class="row">
        <div class="col-sm-6"><div class="form-group">
        <label>Date Range</label>
        <asp:DropDownList runat="server" ID="cboDateRange" CssClass="form-control">
        </asp:DropDownList>
    </div></div>
        <div class="col-sm-6">
               <asp:HiddenField runat="server" ID="hfEventID" />
              <label>Event <a href="javascript:void(0);" id="btnClearEvent" class="btn btn-default btn-xs">Clear</a>
              <a href="javascript:void(0);" id="btnSetEvent" class="btn btn-default btn-xs">Choose</a></label>
            
                <div id="eventselect" class="form-control"><%=eventNameOnLoad %></div>
         
                    </div>
                </div>



           <div class="row">
             <div class="col-sm-3">
            <div class="form-group choosedates">
                <label for="<%=dtStart.ClientID %>">Start Date</label><telerik:RadDatePicker ID="dtStart" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
                            <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
               
                            <DateInput CssClass="form-control"   LabelWidth="40%">
                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                <FocusedStyle Resize="None"></FocusedStyle>
                                <DisabledStyle Resize="None"></DisabledStyle>
                                <InvalidStyle Resize="None"></InvalidStyle>
                                <HoveredStyle Resize="None"></HoveredStyle>
                                <EnabledStyle Resize="None"></EnabledStyle>
                            </DateInput>
                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
               
                        </telerik:RadDatePicker>
            </div>
                 </div>
                 <div class="col-sm-3">
               <div class="form-group choosedates">
                   <label for="<%=dtEnd.ClientID %>">End Date</label><telerik:RadDatePicker ID="dtEnd" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
                            <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
               
                            <DateInput CssClass="form-control"   LabelWidth="40%">
                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                <FocusedStyle Resize="None"></FocusedStyle>
                                <DisabledStyle Resize="None"></DisabledStyle>
                                <InvalidStyle Resize="None"></InvalidStyle>
                                <HoveredStyle Resize="None"></HoveredStyle>
                                <EnabledStyle Resize="None"></EnabledStyle>
                            </DateInput>
                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
        
                        </telerik:RadDatePicker>
               </div>
                </div>
             </div>  

</div>


    <hr />

<div class="row">
    <div class="col-sm-9">
        <asp:LinkButton runat="server" ID="btnRunReport" CssClass="btn btn-primary" OnClick="btnRunReport_Click"><i class="fa fa-play-circle"></i> Run Report</asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnExportExcel" CssClass="btn btn-primary" OnClick="btnExportExcel_Click"><i class="fa fa-download"></i> Export to Excel</asp:LinkButton>
        <asp:CheckBox runat="server" ID="chkUseOldExcelFormat" /> Use old Excel format (versions older than Excel 2007)
    </div>
    <div class="col-sm-3 text-right">
        <a href="EditReport.aspx?id=<%=report.ID %><%if(eventID!=Guid.Empty){ %>&evtid=<%=eventID %><%} %>" class="btn btn-default"><i class="fa fa-cog"></i> Edit Report</a>
    </div>
</div>

<hr />


<asp:PlaceHolder ID="phResults" runat="server"></asp:PlaceHolder>
    
<telerik:RadGrid runat="server" Visible="False" ID="rgResults" AllowSorting="True" PageSize="100" AllowPaging="true" AllowCustomPaging="true" AutoGenerateColumns="False" OnItemDataBound="rgResults_ItemDataBound" OnNeedDataSource="rgResults_NeedDataSource" OnDataBound="rgResults_DataBound" OnInfrastructureExporting="rgResults_InfrastructureExporting">
    <MasterTableView>
    <PagerStyle Mode="NextPrevAndNumeric" PageSizeLabelText="Page Size: " PageSizes="100,500,1000,5000" />
        </MasterTableView>
</telerik:RadGrid>



</asp:Panel>