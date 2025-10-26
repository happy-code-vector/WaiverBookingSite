<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="ViewBooking.aspx.cs" Inherits="WaiverFile.sitebooking.ViewBooking" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    
   <asp:Panel runat="server" ID="pnlAccessLink" Visible="false" CssClass="card shadow-sm border-0">
    <div class="card-body">
        <h5 class="card-title mb-3">Secure Access Link Required</h5>
        <p class="card-text">
            We can send you a secure link to view your booking.
            The link will be sent to <strong><asp:Literal runat="server" ID="litEmail" /></strong>.
        </p>
        <asp:Button runat="server"
                    ID="btnSendAccessLink"
                    CssClass="btn btn-primary"
                    Text="Send me the link"
                    OnClick="btnSendAccessLink_Click" />
    </div>
</asp:Panel>

    
        <div class="alert alert-info" runat="server" id="divTokenNotice">
    <i class="fa fa-info-circle"></i> 
    You're viewing this booking via a secure link sent to your email.
            <a href="CustomerLogout.aspx" class="btn btn-sm btn-outline-primary ms-2"><i class="fa fa-sign-out"></i> End Session</a>
   
</div>


    <asp:PlaceHolder runat="server" ID="phMain"></asp:PlaceHolder>

    
    <asp:Panel runat="server" ID="pnlDialogs" Visible="false">
   <!-- Updated JavaScript for Cancellation Modal -->

        

<!-- Request Cancellation - -->
<div class="modal fade" id="modalRequestCancel" tabindex="-1" aria-labelledby="modalRequestCancelLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content rounded-4">
      <div class="modal-header">
        <h5 class="modal-title" id="modalRequestCancelLabel">
          <asp:Literal runat="server" ID="litCancelModalTitle" Text="Cancel booking" />
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        <!-- Booking summary -->
        <div class="mb-3 d-flex align-items-center gap-2">
          <label class="form-label mb-0">Booking ID</label>
          <code><asp:Literal runat="server" ID="litCancelBookingId" ClientIDMode="Static" /></code>
          <asp:HiddenField runat="server" ID="cancel_BookingId" ClientIDMode="Static" />
        </div>

        <!-- Cancellation Policy Notice -->
        <asp:Panel runat="server" ID="pnlCancellationPolicyNotice" CssClass="alert alert-info mb-3">
          <i class="fa fa-info-circle"></i>
          <asp:Literal runat="server" ID="litCancellationPolicyMessage" />
        </asp:Panel>

        <!-- Fee Warning (if applicable) -->
        <asp:Panel runat="server" ID="pnlCancellationFeeWarning" Visible="false" CssClass="alert alert-warning mb-3">
          <strong><i class="fa fa-exclamation-triangle"></i> Cancellation Fee</strong><br />
          A <strong><asp:Literal runat="server" ID="litCancellationFee" /></strong> cancellation fee will be charged.
          You will receive a <strong><asp:Literal runat="server" ID="litRefundAmount" /></strong> refund.
        </asp:Panel>

        <!-- Direct Cancel Mode (CanSelfCancel = true) -->
        <asp:Panel runat="server" ID="pnlDirectCancel" Visible="false">
          <div class="mb-3">
            <label for="cancel_DirectReason" class="form-label">Reason for cancellation (optional)</label>
            <asp:TextBox runat="server" ID="cancel_DirectReason" ClientIDMode="Static" 
              CssClass="form-control" TextMode="MultiLine" Rows="3"
              placeholder="Let us know why you're cancelling..." />
          </div>

          <div class="form-check mb-3">
            <asp:CheckBox runat="server" ID="cancel_DirectAck" ClientIDMode="Static" CssClass="form-check-input" />
            <label class="form-check-label" for="cancel_DirectAck">
              <strong>I understand this action is immediate and cannot be undone.</strong>
              <asp:Literal runat="server" ID="litDirectCancelFeeAck" Visible="false" />
            </label>
          </div>
        </asp:Panel>

        <!-- Request Mode (CanSelfCancel = false, but requests allowed) -->
        <asp:Panel runat="server" ID="pnlRequestCancel" Visible="false">
          <div class="alert alert-warning mb-3">
            <i class="fa fa-clock-o"></i>
            Direct cancellation is not available for this booking. You can submit a cancellation request for review.
          </div>

          <div class="row g-3 mb-2">
            <div class="col-sm-6">
              <label for="cancel_Phone" class="form-label">Phone (optional)</label>
              <asp:TextBox runat="server" ID="cancel_Phone" ClientIDMode="Static" CssClass="form-control" />
            </div>
            <div class="col-sm-6">
              <label for="cancel_ContactMethod" class="form-label">Preferred contact method</label>
              <asp:DropDownList runat="server" ID="cancel_ContactMethod" ClientIDMode="Static" CssClass="form-select">
                <asp:ListItem Value="email" Selected="True">Email</asp:ListItem>
                <asp:ListItem Value="phone">Phone</asp:ListItem>
              </asp:DropDownList>
            </div>
          </div>

          <div class="mb-3">
            <label for="cancel_Reason" class="form-label">Reason</label>
            <asp:DropDownList runat="server" ID="cancel_Reason" ClientIDMode="Static" CssClass="form-select">
              <asp:ListItem Value="">Choose…</asp:ListItem>
              <asp:ListItem>Schedule conflict</asp:ListItem>
              <asp:ListItem>Illness</asp:ListItem>
              <asp:ListItem>Travel / weather</asp:ListItem>
              <asp:ListItem>Booked by mistake / duplicate</asp:ListItem>
              <asp:ListItem>Other</asp:ListItem>
            </asp:DropDownList>
          </div>

          <div class="row g-3 mb-2">
            <div class="col-sm-6">
              <label for="cancel_Outcome" class="form-label">Preferred outcome</label>
              <asp:DropDownList runat="server" ID="cancel_Outcome" ClientIDMode="Static" CssClass="form-select">
                <asp:ListItem Value="">Choose…</asp:ListItem>
                <asp:ListItem Value="refund">Refund (per policy)</asp:ListItem>
                <asp:ListItem Value="credit">Account credit</asp:ListItem>
                <asp:ListItem Value="reschedule">Reschedule instead</asp:ListItem>
              </asp:DropDownList>
            </div>
          </div>

          <div class="mb-3">
            <label for="cancel_Notes" class="form-label">Details (optional)</label>
            <asp:TextBox runat="server" ID="cancel_Notes" ClientIDMode="Static" 
              CssClass="form-control" TextMode="MultiLine" Rows="4"
              placeholder="Add any helpful context…" />
          </div>

          <div class="form-check mt-2">
            <asp:CheckBox runat="server" ID="cancel_RequestAck" ClientIDMode="Static" CssClass="form-check-input" />
            <label class="form-check-label" for="cancel_RequestAck">
              I understand this is a request and will be reviewed by staff.
            </label>
          </div>
        </asp:Panel>

        <!-- Not Allowed Mode (CanSelfCancel = false AND requests not allowed) -->
        <asp:Panel runat="server" ID="pnlCancelNotAllowed" Visible="false">
          <div class="alert alert-danger">
            <i class="fa fa-ban"></i>
            <strong>Cancellation Not Available</strong><br />
            <asp:Literal runat="server" ID="litNotAllowedReason" />
          </div>
          <p class="mb-0">
            Please <a href="contact" class="alert-link">contact support</a> if you need assistance with this booking.
          </p>
        </asp:Panel>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-link" data-bs-dismiss="modal">Close</button>
        
        <!-- Direct Cancel Button -->
        <asp:Button runat="server" ID="btnDirectCancel" ClientIDMode="Static" Visible="false"
          CssClass="btn btn-danger rounded-pill" Text="Cancel Booking" 
          OnClick="btnDirectCancel_Click" 
          OnClientClick="return confirm('Are you sure you want to cancel this booking? This action cannot be undone.');" />
        
        <!-- Submit Request Button -->
        <asp:Button runat="server" ID="btnSubmitCancelRequest" ClientIDMode="Static" Visible="false"
          CssClass="btn btn-primary rounded-pill" Text="Submit request" 
          OnClick="btnSubmitCancelRequest_Click" />
      </div>
    </div>
  </div>
</div>


<!-- Request Date / Time Change -->
<div class="modal fade" id="modalRequestDateTime" tabindex="-1" aria-labelledby="modalRequestDateTimeLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content rounded-4">
      <div class="modal-header">
        <h5 class="modal-title" id="modalRequestDateTimeLabel">Request date / time change</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        <!-- Booking summary -->
        <div class="mb-3">
          <label class="form-label">Booking ID</label>
          <div class="form-control-plaintext">
            <code><asp:Literal runat="server" ID="litDtBookingId" ClientIDMode="Static" /></code>
          </div>
          <asp:HiddenField runat="server" ID="dt_BookingId" ClientIDMode="Static" />
        </div>

        <div class="row g-3 mb-2">
          <div class="col-sm-6">
            <label for="dt_PreferredDate" class="form-label">Preferred date</label>
            <asp:TextBox runat="server" ID="dt_PreferredDate" ClientIDMode="Static" CssClass="form-control" TextMode="Date" />
          </div>
          <div class="col-sm-6">
            <label for="dt_PreferredTime" class="form-label">Preferred time</label>
            <asp:TextBox runat="server" ID="dt_PreferredTime" ClientIDMode="Static" CssClass="form-control" TextMode="Time" />
            <div class="form-check mt-2">
              <asp:CheckBox runat="server" ID="dt_TimeFlexible" ClientIDMode="Static" CssClass="form-check-input" />
              <label class="form-check-label" for="dt_TimeFlexible">Time is flexible</label>
            </div>
          </div>
        </div>

        <div class="row g-3 mb-2">
          <div class="col-sm-6">
            <label for="dt_AlternateDate" class="form-label">Alternate date (optional)</label>
            <asp:TextBox runat="server" ID="dt_AlternateDate" ClientIDMode="Static" CssClass="form-control" TextMode="Date" />
          </div>
          <div class="col-sm-6">
            <label for="dt_TimeWindow" class="form-label">Time window (optional)</label>
            <asp:DropDownList runat="server" ID="dt_TimeWindow" ClientIDMode="Static" CssClass="form-select">
              <asp:ListItem Value="">No preference</asp:ListItem>
              <asp:ListItem>Morning</asp:ListItem>
              <asp:ListItem>Midday</asp:ListItem>
              <asp:ListItem>Afternoon</asp:ListItem>
              <asp:ListItem>Evening</asp:ListItem>
            </asp:DropDownList>
          </div>
        </div>

        <div class="mb-3">
          <label for="dt_Notes" class="form-label">Notes / constraints (optional)</label>
          <asp:TextBox runat="server" ID="dt_Notes" ClientIDMode="Static" CssClass="form-control" TextMode="MultiLine" Rows="4"
            placeholder="Tell us about availability, travel constraints, etc." />
        </div>

        <div class="form-check mt-2">
          <asp:CheckBox runat="server" ID="dt_Ack" ClientIDMode="Static" CssClass="form-check-input" />
          <label class="form-check-label" for="dt_Ack">
            I understand changes depend on availability and may affect pricing.
          </label>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-link" data-bs-dismiss="modal">Close</button>
        <asp:Button runat="server" ID="btnSubmitDateChangeRequest" ClientIDMode="Static"
          CssClass="btn btn-primary rounded-pill" Text="Submit request" OnClick="btnSubmitDateChangeRequest_Click" />
      </div>
    </div>
  </div>
</div>



        
<!-- Request Date / Time Change -->
<div class="modal fade" id="modelSendWaiverInvite" tabindex="-1" aria-labelledby="modalRequestDateTimeLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content rounded-4">
      <div class="modal-header">
        <h5 class="modal-title" id="modelSendWaiverInviteLabel">Send Waiver Invite</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <asp:HiddenField runat="server" ID="hfWaiverInvitePersonID" />
      <div class="modal-body">
        <!-- Booking summary -->
       

          <div class="mb-3">
              <label for="dt_Notes" class="form-label">Name (optional)</label>
              <asp:TextBox runat="server" ID="txtWaiverInviteName" ClientIDMode="Static" CssClass="form-control" />
            </div>
        <div class="mb-3">
          <label for="dt_Notes" class="form-label">Email Address</label>
          <asp:TextBox runat="server" ID="txtWaiverInviteEmail" ClientIDMode="Static" CssClass="form-control" TextMode="Email" />
        </div>

  
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-link" data-bs-dismiss="modal">Close</button>
        <asp:Button runat="server" ID="btnSendWaiverInvite" ClientIDMode="Static"
          CssClass="btn btn-primary rounded-pill" Text="Submit request" OnClick="btnSendWaiverInvite_Click" />
      </div>
    </div>
  </div>
</div>



        </asp:Panel>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            (function () {
                'use strict';

                function showModal(id) {
                    var el = document.getElementById(id);
                    if (!el) return;
                    bootstrap.Modal.getOrCreateInstance(el).show();
                }

                function prefillFromBtn(btn, map) {
                    if (!btn) return;
                    var d = btn.dataset || {};
                    if (d.bookingId && map.bookingId) {
                        var hid = document.getElementById(map.bookingId.hidden);
                        var lbl = document.getElementById(map.bookingId.label);
                        if (hid) hid.value = d.bookingId;
                        if (lbl) lbl.textContent = d.bookingId;
                    }
                }

                function bindAckToggle(checkboxId, submitId) {
                    var cb = document.getElementById(checkboxId);
                    var btn = document.getElementById(submitId);
                    if (!cb || !btn) return;
                    function sync() { btn.disabled = !cb.checked; }
                    cb.addEventListener('change', sync);
                    sync();
                }

                function guardAspSubmitWithCheckbox(btnId, checkboxId) {
                    var btn = document.getElementById(btnId);
                    var cb = document.getElementById(checkboxId);
                    if (!btn || !cb) return;

                    btn.addEventListener('click', function (e) {
                        if (!cb.checked) {
                            e.preventDefault();
                            e.stopPropagation();
                            cb.focus();
                            var label = cb.nextElementSibling;
                            if (label) {
                                label.classList.add('text-danger');
                                setTimeout(function () { label.classList.remove('text-danger'); }, 2000);
                            }
                            alert('Please check the acknowledgement box before proceeding.');
                            return false;
                        }
                        // guard double-clicks
                        setTimeout(function () {
                            btn.setAttribute('disabled', 'disabled');
                            btn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Processing...';
                        }, 0);
                    });
                }

                // Wire buttons (now DOM is ready, IDs exist)
                var btnCancel = document.getElementById('btnRequestCancel');
                if (btnCancel) {
                    btnCancel.addEventListener('click', function (e) {
                        e.preventDefault();
                        prefillFromBtn(btnCancel, {
                            bookingId: { hidden: 'cancel_BookingId', label: 'litCancelBookingId' }
                        });
                        showModal('modalRequestCancel');
                    });
                }

                var btnDT = document.getElementById('btnRequestDateTimeChange');
                if (btnDT) {
                    btnDT.addEventListener('click', function (e) {
                        e.preventDefault();
                        prefillFromBtn(btnDT, {
                            bookingId: { hidden: 'dt_BookingId', label: 'litDtBookingId' }
                        });
                        showModal('modalRequestDateTime');
                    });
                }

                var flex = document.getElementById('dt_TimeFlexible');
                var timeInput = document.getElementById('dt_PreferredTime');
                if (flex && timeInput) {
                    function syncTimeFlex() { timeInput.toggleAttribute('disabled', flex.checked); if (flex.checked) timeInput.value = ''; }
                    flex.addEventListener('change', syncTimeFlex);
                    syncTimeFlex();
                }

                // Required acks
                bindAckToggle('cancel_DirectAck', 'btnDirectCancel');
                bindAckToggle('cancel_RequestAck', 'btnSubmitCancelRequest');
                bindAckToggle('dt_Ack', 'btnSubmitDateChangeRequest');

                guardAspSubmitWithCheckbox('btnDirectCancel', 'cancel_DirectAck');
                guardAspSubmitWithCheckbox('btnSubmitCancelRequest', 'cancel_RequestAck');
                guardAspSubmitWithCheckbox('btnSubmitDateChangeRequest', 'dt_Ack');

            })();
        });
    </script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
