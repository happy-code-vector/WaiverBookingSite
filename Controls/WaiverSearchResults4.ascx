<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverSearchResults4.ascx.cs" Inherits="WaiverFile.Controls.WaiverSearchResults4" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<script type="text/javascript">
    function resetForm() {
        var inputs = document.getElementsByTagName('input');
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == 'text')
                inputs[i].value = "";
        }
    }
    String.prototype.replaceAll = function (search, replacement) {
        var target = this;
        return target.split(search).join(replacement);
    };

    $(document).ready(function () {

        $('.partlist_withcheckin').each(function () {
            var txt = $(this).data('names');

            var a = txt.split('|'),
                i;

            var txtOut = '';
            var currName = '';
            var currAgedOut = false;
            var currIsSignee = false;
            var isAlreadyCheckedIn = false;
            var partID = '';
            var checkInDate = '';
            var numUnchecked = 0;
            var partAge = '';
            var dob;

            for (i = 0; i < a.length; i++) {



                if (i % 8 == 0) {

                    currName = a[i];
                } else if (i % 8 == 1) {
                    dob = a[i];

                } else if (i % 8 == 2) {
                    currAgedOut = a[i] == '1';

                }
                else if (i % 8 == 3) {
                    
                    partAge = a[i];

                    if (partAge == '0' || partAge>140) { partAge = ''; } else {
                        var ageOut = ' (';
                        <%if (includePartAge)
                             {
         %>   ageOut += partAge;  <%
                             }
                          %>
                    <%if (includePartAge && includePartDOB)
                             {
         %>   ageOut += ', '; <%
                             }
                          %>
                    <%if (includePartDOB)
                             {
         %>    ageOut += a[i - 2]; <%
                             }
                          %>
                        ageOut += ')';
                        partAge = ageOut;


                    }
                } else if (i % 8 == 4) {
                    currIsSignee = a[i] == '1';

                } else if (i % 8 == 5) {
                    isAlreadyCheckedIn = a[i] == '1';
                } else if (i % 8 == 6) {
                    partID = a[i];
                }
                else if (i % 8 == 7) {
                    checkInDate = a[i];

                    var checkAdd = '';
                <% if (_includeCheckInStuff){ %>
                    if (isAlreadyCheckedIn) {
                        checkAdd = '';
                    } else {
                        var checkedCode = ' checked="checked"';
                        if (currAgedOut == true && currIsSignee != true) { checkedCode = ''; }
                        checkAdd = '<input type="checkbox" class="checkinselect" data-partid="' + partID + '" value="' + partID + '" ' + checkedCode + '/> ';
                        numUnchecked++;
                    }
                <%}%>

                    //last item. render it. 
                    txtOut += '<li>' + checkAdd;

                    if (currAgedOut == true && currIsSignee!=true) {
                        txtOut += '<span class="text-danger">' + currName + ' <br/><small>(Old enough to sign own waiver)</small></span>';
                    } else {
                        txtOut += currName;
                    }
                    txtOut += partAge;

                    if (isAlreadyCheckedIn) {
                        txtOut += '<br/><small class="text-muted">Checked in ' + checkInDate + '(<a href="javascript:void(0);" class="btnundocheckin" data-partid="' + partID + '">Undo</a>)</small>';
                    }
                    txtOut += '</li>';

                }

                $(this).html('<ul class="list-unstyled">' + txtOut + '</ul>');

            }
            if (numUnchecked == 0) {
                $(this).parent().parent().find('.btncheckin').addClass('disabled');
                $(this).parent().parent().find('.btncheckin').removeClass('btn-primary');
                $(this).parent().parent().find('.btncheckin').addClass('btn-muted');
            }

        });

          $('.show_part').click(function(){
          var recordnum = $(this).data('recordnum');

          var thediv = $(this).parent().find("[data-recordnum='" + recordnum + "']");
          $(this).parent().find(".part_num").hide();
          var txt = $(this).data('names');

          var a = txt.split('|'),
          i;

          var txtOut = '';
              var currName = '';
              var dob = '';
          var currAgedOut = false;
              var currIsSignee = false;
              var partAge = '';
          for (i = 0; i < a.length; i++) {
          if(i % 8 == 0){
              currName = a[i];
          } else if (i % 8 == 1) {
              dob = a[i];
          }else if(i % 8 == 2){
          currAgedOut = a[i]=='1';
          }
          else if (i % 8 == 3) {

              partAge = a[i];

              if (partAge == '0') { partAge = ''; } else {
                  var ageOut = ' (';
                        <%if (includePartAge)
                             {
         %>   ageOut += partAge;  <%
                             }
                          %>
                    <%if (includePartAge && includePartDOB)
                             {
         %>   ageOut += ', '; <%
                             }
                          %>
                    <%if (includePartDOB)
                             {
         %>    ageOut += a[i - 2]; <%
                             }
                          %>
                  ageOut += ')';
                  partAge = ageOut;

              }
          }else if (i % 8 == 4) {
          currIsSignee = a[i]=='1';
              

          if(currAgedOut==true && currIsSignee!=true){
          txtOut += '<span class="text-danger">' + currName + ' <br/><small>(Old enough to sign own waiver)</small></span>';
          }else{
          txtOut += currName;
              }
              txtOut += partAge;
          txtOut += '<br/>';
          }
          }


          thediv.html(txtOut);
          thediv.fadeIn();
          $(this).hide();
          });
         $('.btnundocheckin').click(function () {
             var partid = $(this).data('partid');
                 
                 $.ajax({
                     type: "POST",
                     url: "/Controls/MainHandler.ashx",
                     data: { siteid: '<%=site.ID%>', cmd: 'UNDO_CHECKIN', partid: partid },
                     success: function (dataRaw) {
                         if (dataRaw == "SUCCESS") {
                             //IT WORKED. SHOW A MESSAGE
                             $("#checkinsuccess").show().delay(5000).fadeOut();
                         } else {
                             alert('Error: ' + dataRaw);
                         }
                     }


                 });
             


         });
        $('.btncheckin').click(function () {
            var theButton = $(this);
             var waiverid = $(this).data('waiverid');
             var partIDListForCheckIn = '';

             //collect selected participant id's and initate a new checkin for each. 
             $('.partcell').each(function () {
                 if ($(this).data('waiverid') == waiverid) {
                     //GOT IT

                     $(this).find('input[type="checkbox"]').each(function () {
                         if ($(this).is(':checked')) {
                             if (partIDListForCheckIn != '') {
                                 partIDListForCheckIn += '|';
                             }
                             partIDListForCheckIn += $(this).data('partid');
                         }
                     });

                     return;
                 }
             });




             $.ajax({
                 type: "POST",
                 url: "/Controls/MainHandler.ashx",
                 data: { siteid: '<%=site.ID%>', cmd: 'NEW_CHECKIN_MULTIPLE', waiverid: waiverid, partIDList: partIDListForCheckIn },
                 success: function (dataRaw) {
                     if (dataRaw == "SUCCESS") {
                         //IT WORKED. SHOW A MESSAGE
                         theButton.addClass('disabled');
                         theButton.addClass('btn-muted');
                         theButton.removeClass('btn-primary');
                         $("#checkinsuccess").show().delay(5000).fadeOut();
                        
                     } else {
                         alert('Error: ' + dataRaw);
                     }
                 }


             });


         });


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

<div id="checkinsuccess" class="WPERR_Success" style="display:none;">Check-in saved.</div>

<script type="text/javascript">
    window.closeModal = function (eventid, eventdisplayname) {
        $('#iframeModal').modal('hide');
        eventButtonHandle(eventid, eventdisplayname);
        
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


 <div class="pull-right" style="padding-top:15px;">
<a href="settings/SearchResultSettings.aspx" class="btn btn-default"><i class="fa fa-cog"></i> Configure Search Fields</a>
    </div>
<h3 style="display:inline-block;">Waiver Search</h3>


<asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>


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


<div class="row">
    <div class="col-sm-6">
        <label for="<%=txtTerms.ClientID %>">Terms</label>
        <asp:TextBox runat="server" ID="txtTerms" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="col-sm-6">
         <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
        <input type="reset" value="Clear" class="btn btn-default" onclick="resetForm();return false;" />
    </div>
</div>



<asp:PlaceHolder ID="phResults" runat="server"></asp:PlaceHolder>
