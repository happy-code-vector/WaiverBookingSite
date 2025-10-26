<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ChangeBookingTime.aspx.cs" Inherits="WaiverFile.site.admin.ChangeBookingTime" %>
 <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <asp:HiddenField runat="server" ID="hfSelectedSlotId" ClientIDMode="Static" />

    <style>
  .selected-row { outline: 2px solid #F6871F; outline-offset: -2px; }
  

</style>

    
<script>
    (function ($) {
        $('#<%= btnSave.ClientID %>').prop('disabled', 'disabled');

        $(document).on('click', '.js-pick-slot', function (e) {
            e.preventDefault();



            var $btn = $(this);
            var slotId = ($btn.data('slotid') || '').toString();

            console.log($btn.data('warnoverbook'));
            console.log($btn);
            if ($btn.data('warnoverbook') == true) {
                $('#warnoverbook').show();
                console.log('show it');
            } else {
                $('#warnoverbook').hide();
                console.log('hide it');
            }

            // write hidden field
            $('#hfSelectedSlotId').val(slotId); // empty string means ALLDAY for server

            $('#<%= btnSave.ClientID %>').prop('disabled', false);

            // highlight picked row (non-destructive)
            var $table = $btn.closest('table');            // scope to the current table
            $table.find('tbody tr').removeClass('selected-row');
            $btn.closest('tr').addClass('selected-row');
        });
    })(jQuery);
</script>

    <asp:Panel runat="server" id="pnlMain">

     

        <!-- Booking: Change Date/Time (Bootstrap 3 + SB Admin 2) -->
<!-- Requires: Bootstrap 3 CSS/JS, jQuery, Font Awesome 4.7 -->

  <!-- Page header / crumb -->
  <div class="row">
    <div class="col-xs-12">
      <h3 class="page-header" style="margin-top:10px;">Change Date/Time</h3>
      <ol class="breadcrumb" style="margin-bottom:15px;">
        <li><a href="ViewBooking.aspx?id=<%=booking.ID %>"><i class="fa fa-chevron-left"></i> Back to Booking</a></li>
        <li class="active">Change Date/Time</li>
      </ol>
    </div>
  </div>

  <!-- Overview Panel -->
  <div class="row">
    <div class="col-lg-8">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong>Booking Overview</strong>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="col-sm-6">
              <dl class="dl-horizontal" style="margin-bottom:0;">
                <dt>Booking #</dt>
                <dd><code><%=booking.BookingNumber %></code></dd>
                <dt>Admission Item</dt>
                <dd><%=bai.Item.Name %></dd>
              </dl>
            </div>
            <div class="col-sm-6">
              <dl class="dl-horizontal" style="margin-bottom:0;">
                <dt>Date</dt>
                <dd><asp:Label runat="server" ID="lblDates"></asp:Label></dd>
                    <% if (bai.IsAllDay){ %>
                  <dd>
                <div runat="server" id="divAllDay">
                  <span class="label label-default"><i class="fa fa-clock-o"></i> All day</span>
                </div>
                      </dd>
                  <%} %>
              </dl>
              <!-- Show only if All Day -->
              
            </div>
          </div>
        </div>
      </div>

      <!-- Form Panel -->
      <div id="frmChangeDateTime" class="panel panel-default">
        <div class="panel-heading">
          <strong>Select Participant(s) to Move</strong>
        </div>
        <div class="panel-body">

          <!-- Participants (checkbox list) -->
          <div class="form-group">
            <label class="control-label">Participants</label>
            <div class="well well-sm" style="margin-bottom:0;">
              <!-- Repeat this block for each person -->
              
                <asp:CheckBoxList
                        runat="server"
                        ID="cblPersons"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="cblPersons_SelectedIndexChanged">
                    </asp:CheckBoxList>
               
              </div>
              <!-- /repeat -->
            <p class="help-block">Select who this date/time change applies to.</p>
          </div>

          <!-- New Date -->
          <div class="form-group">
            <label for="dtNewDate" class="control-label">New Date</label>
            <div class="input-group" style="max-width:320px;">
                <telerik:RadDatePicker ID="rdpCheckIn" runat="server" skin="Bootstrap"  AutoPostBack="true" OnSelectedDateChanged="rdpCheckIn_SelectedDateChanged"  />

             
            </div>
            <p class="help-block">Pick a date to view available time slots.</p>
          </div>

            <asp:PlaceHolder runat="server" ID="phSlots"></asp:PlaceHolder>

          <div id="warnoverbook" style="display:none;" class="WPERR_Warning">Overbooking: choosing this time or day exceeds capacity. Continue only if intended.</div>
 

       <!-- Actions -->
<div class="form-group">
  <asp:Button
      ID="btnSave"
      runat="server"
      CssClass="btn btn-primary"
      Text='Save Changes'
      OnClick="btnSave_Click"
   
  />  <!-- preserves FontAwesome HTML -->
  <a href="ViewBooking.aspx?id=<%=booking.ID%>" class="btn btn-default">Cancel</a>
</div>

          
        </div>
      </div>
    </div>

    <!-- Right column (optional notes/help) -->
    <div class="col-lg-4">
      <div class="panel panel-default">
        <div class="panel-heading"><strong>Notes</strong></div>
        <div class="panel-body">
          <p class="text-muted small">
            • Selecting a new date reveals available time slots.<br>
            • If “All day” is enabled for the item, time slots may be hidden or ignored.<br>
            • Only checked participants will be updated.
          </p>
        </div>
      </div>
    </div>
  </div>



    </asp:Panel>
</asp:Content>
