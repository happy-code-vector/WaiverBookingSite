<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExportWaivers.ascx.cs" Inherits="WaiverFile.Controls.ExportWaivers" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>




<script type="text/javascript">

    window.closeModal = function (eventid, eventdisplayname) {
        $('#iframeModal').modal('hide');
        eventButtonHandle(eventid, eventdisplayname);
        //var clickButton = document.getElementById("<%= btnRun.ClientID %>");
        //clickButton.click();
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
        if ($('#<%=cboDateRange.ClientID%>').val() == 'CHOOSE') {
            $('.choosedates').each(function () { $(this).show(); });
            $('.eventselectrow').hide();
        } else if ($('#<%=cboDateRange.ClientID%>').val() == 'EVENT') {
            $('.choosedates').each(function () { $(this).hide(); });
            $('.eventselectrow').show();
        } else {
            $('.choosedates').each(function () { $(this).hide(); });
            $('.eventselectrow').hide();
        }
    }
    $(document).ready(function () {
        showHideDates();
        $('#<%=cboDateRange.ClientID%>').change(function () { showHideDates(); })

        $('#btnClearEvent').click(function () {
            $('#<%=hfEventID.ClientID%>').val('00000000-0000-0000-0000-000000000000');
            $('#eventselect').html('None');
            $('#btnClearEvent').hide();
        });
        $('#btnSetEvent').click(function () {
            showModalFindEvent();
        });
        eventButtonHandle('<%=eventID.ToString()%>', '<%=eventNameOnLoad%>');

    });
</script>



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




    <h3>Waiver Archives</h3>
    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<div class="row">
    <div class="col-md-4">

        
<h4>Prepare a new Archive</h4>
<p>A zip file will be generated containing an archive copy of all waiver forms collected for the date range specified. </p>

    
<div class="form-group">
    <label>Date Range</label>
    <asp:DropDownList runat="server" ID="cboDateRange" CssClass="form-control">
            
        <asp:ListItem Value="PAST_WEEK">Past Week</asp:ListItem>
        <asp:ListItem Value="PAST_MONTH">Past Month</asp:ListItem>
        <asp:ListItem Value="PAST_YEAR">Past Year</asp:ListItem>
        <asp:ListItem Value="CHOOSE">Choose Dates</asp:ListItem>
        <asp:ListItem Value="ALL">All Dates</asp:ListItem>
        <asp:ListItem Value="EVENT">Select an Event</asp:ListItem>
 
    </asp:DropDownList>
</div>
        
<div class="row">
 <div class="col-sm-6">
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
     <div class="col-sm-6">
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

        <div class="row eventselectrow">
            <div class="col-xs-12">
               <asp:HiddenField runat="server" ID="hfEventID" />
              <label>Event <a href="javascript:void(0);" id="btnClearEvent" class="btn btn-default btn-xs">Clear</a>
              <a href="javascript:void(0);" id="btnSetEvent" class="btn btn-default btn-xs">Choose</a></label>
            
                <div id="eventselect" class="form-control"><%=eventNameOnLoad %></div>
         </div>
                    </div>

        
    
    <p><asp:Button ID="btnRun" runat="server" CssClass="btn btn-primary" Text="Prepare Archive" 
            onclick="btnRun_Click" /></p>

    </div>
    <div class="col-md-8"><asp:PlaceHolder ID="phPendingDownloads" runat="server"></asp:PlaceHolder></div>
</div>


