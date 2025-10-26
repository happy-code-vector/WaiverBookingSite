<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="CancelBooking.aspx.cs" Inherits="WaiverFile.site.admin.CancelBooking" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <script type="text/javascript">


        function updateRefundOptions(checkbox) {
            var txnId = checkbox.value;
            var optionsDiv = document.getElementById('refundOpt_' + txnId);

            if (checkbox.checked) {
                // Show refund options for this transaction
                optionsDiv.style.display = 'block';
            } else {
                // Hide refund options
                optionsDiv.style.display = 'none';

                // Reset to full refund
                var fullRadio = document.querySelector('input[name="refundType_' + txnId + '"][value="full"]');
                if (fullRadio) {
                    fullRadio.checked = true;
                }

                // Hide and clear partial amount
                var partialDiv = document.getElementById('partialAmt_' + txnId);
                if (partialDiv) {
                    partialDiv.style.display = 'none';
                }
                var partialInput = document.getElementById('partialAmount_' + txnId);
                if (partialInput) {
                    partialInput.value = '';
                }
            }

            updateRefundSummary();
        }

        function togglePartialAmount(txnId) {
            var partialRadio = document.querySelector('input[name="refundType_' + txnId + '"][value="partial"]');
            var partialDiv = document.getElementById('partialAmt_' + txnId);

            if (partialDiv) {
                if (partialRadio && partialRadio.checked) {
                    partialDiv.style.display = 'block';
                } else {
                    partialDiv.style.display = 'none';
                }
            }

            updateRefundSummary();
        }

        function updateRefundSummary() {
            var totalRefund = 0;
            var refundCount = 0;

            // Get all checked transaction checkboxes
            var checkboxes = document.querySelectorAll('input[name="refundTxn"]:checked');

            checkboxes.forEach(function (checkbox) {
                var txnId = checkbox.value;
                refundCount++;

                // Check if full or partial refund
                var fullRadio = document.querySelector('input[name="refundType_' + txnId + '"][value="full"]');
                var partialRadio = document.querySelector('input[name="refundType_' + txnId + '"][value="partial"]');

                if (partialRadio && partialRadio.checked) {
                    // Partial refund - get the amount
                    var partialInput = document.getElementById('partialAmount_' + txnId);
                    if (partialInput && partialInput.value) {
                        totalRefund += parseFloat(partialInput.value);
                    }
                } else {
                    // Full refund - extract amount from label text
                    var label = checkbox.parentElement;
                    var amountMatch = label.textContent.match(/\$([0-9,]+\.[0-9]{2})/);
                    if (amountMatch) {
                        var amount = amountMatch[1].replace(/,/g, '');
                        totalRefund += parseFloat(amount);
                    }
                }
            });

            // Update the summary label if it exists
            var summaryLabel = document.querySelector('[id$="lblRefundsSummary"]');
            if (summaryLabel) {
                if (refundCount > 0) {
                    var formatter = new Intl.NumberFormat('en-US', {
                        style: 'currency',
                        currency: 'USD'
                    });
                    summaryLabel.innerHTML = '<strong>' + formatter.format(totalRefund) + '</strong> across ' + refundCount + ' transaction(s)';
                } else {
                    summaryLabel.innerHTML = '<em>No refunds selected</em>';
                }
            }
        }

        // Initialize on page load
        (function () {
            // Add event listeners to partial amount inputs
            document.addEventListener('DOMContentLoaded', function () {
                var partialInputs = document.querySelectorAll('input[id^="partialAmount_"]');
                partialInputs.forEach(function (input) {
                    input.addEventListener('input', updateRefundSummary);
                    input.addEventListener('change', updateRefundSummary);
                });
            });
        })();

    </script>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

    <asp:Panel runat="server" ID="pnlMain">
        <!-- Page header / crumb -->
        <div class="row">
            <div class="col-xs-12">
                <h3 class="page-header" style="margin-top:10px;">
                    <i class="fa fa-ban"></i> Cancel Booking
                </h3>
                <ol class="breadcrumb" style="margin-bottom:15px;">
                    <li><a href="ViewBooking.aspx?id=<%=booking.ID %>"><i class="fa fa-chevron-left"></i> Back to Booking</a></li>
                    <li class="active">Cancel Booking</li>
                </ol>
            </div>
        </div>

        <div class="row">
            <!-- Main Content Column -->
            <div class="col-lg-8">
                
                <!-- Booking Overview Panel -->
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
                                    <dt>Customer</dt>
                                    <dd>
                                        <asp:Label runat="server" ID="lblCustomerName"></asp:Label><br />
                                        <small class="text-muted">
                                            <asp:Label runat="server" ID="lblCustomerEmail"></asp:Label>
                                        </small>
                                    </dd>
                                    <dt>Status</dt>
                                    <dd><asp:Label runat="server" ID="lblBookingStatus"></asp:Label></dd>
                                </dl>
                            </div>
                            <div class="col-sm-6">
                                <dl class="dl-horizontal" style="margin-bottom:0;">
                                    <dt>Date Range</dt>
                                    <dd><asp:Label runat="server" ID="lblDateRange"></asp:Label></dd>
                                    <dt>Activities</dt>
                                    <dd><asp:Label runat="server" ID="lblActivities"></asp:Label></dd>
                                    <dt>Total Participants</dt>
                                    <dd><asp:Label runat="server" ID="lblTotalParticipants"></asp:Label></dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Cancellation Options Panel -->
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <strong><i class="fa fa-exclamation-triangle"></i> Cancellation Options</strong>
                    </div>
                    <div class="panel-body">
                        
                        <!-- Cancel Type Selection -->
                        <div class="form-group">
                            <label class="control-label">Cancel:</label>
                            <div class="radio">
                                <label>
                                    <asp:RadioButton runat="server" ID="rbCancelAll" GroupName="cancelType" Checked="true" AutoPostBack="true" OnCheckedChanged="rbCancelType_CheckedChanged" />
                                    <strong>Entire Booking</strong> - Cancel all participants and activities
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <asp:RadioButton runat="server" ID="rbCancelPartial" GroupName="cancelType" AutoPostBack="true" OnCheckedChanged="rbCancelType_CheckedChanged" />
                                    <strong>Selected Participants Only</strong> - Choose specific people to cancel
                                </label>
                            </div>
                        </div>

                        <!-- Participant Selection (only visible for partial cancellation) -->
                        <asp:Panel runat="server" ID="pnlParticipantSelection" Visible="false">
                            <div class="form-group">
                                <label class="control-label">Select Participants to Cancel</label>
                                <div class="well well-sm">
                                    <asp:CheckBoxList 
                                        runat="server" 
                                        ID="cblParticipants"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="cblParticipants_SelectedIndexChanged">
                                    </asp:CheckBoxList>
                                </div>
                                <p class="help-block">Select which participants should be cancelled.</p>
                            </div>
                        </asp:Panel>

                        <!-- Cancellation Reason -->
                        <div class="form-group">
                            <label for="txtCancellationReason" class="control-label">Reason for Cancellation (optional):</label>
                            <asp:TextBox 
                                ID="txtCancellationReason" 
                                runat="server" 
                                CssClass="form-control" 
                                TextMode="MultiLine" 
                                Rows="3" 
                                placeholder="Enter reason for cancellation...">
                            </asp:TextBox>
                        </div>

                    </div>
                </div>

                <!-- Payment & Refund Panel -->
                <asp:Panel runat="server" ID="pnlPaymentRefund">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <strong><i class="fa fa-credit-card"></i> Payment & Refund Options</strong>
                        </div>
                        <div class="panel-body">
                            
                            <!-- No Orders Found -->
                            <asp:Panel runat="server" ID="pnlNoOrders" Visible="false">
                                <div class="alert alert-info" role="alert">
                                    <i class="fa fa-info-circle"></i>
                                    No payment records found for this booking. Cancellation will proceed without refunding.
                                </div>
                            </asp:Panel>

                            <!-- Orders & Transactions Display -->
                            <asp:PlaceHolder runat="server" ID="phOrdersAndTransactions"></asp:PlaceHolder>

                        </div>
                    </div>
                </asp:Panel>

                <!-- Warning Alert -->
                <div class="alert alert-danger" role="alert">
                    <i class="fa fa-exclamation-triangle"></i>
                    <strong>Warning:</strong> This action cannot be undone. 
                    <asp:Label runat="server" ID="lblWarningMessage"></asp:Label>
                </div>

                <!-- Action Buttons -->
                <div class="form-group">
                    <asp:Button 
                        ID="btnCancel" 
                        runat="server" 
                        Text="Cancel Booking" 
                        CssClass="btn btn-danger btn-lg" 
                        OnClick="btnCancel_Click" 
                        OnClientClick="return confirm('Are you sure you want to cancel this booking? This action cannot be undone.');" />
                    <a href="ViewBooking.aspx?id=<%=booking.ID%>" class="btn btn-default btn-lg">Go Back</a>
                </div>

            </div>

            <!-- Right Sidebar -->
            <div class="col-lg-4">
                
                <!-- Notes Panel -->
                <div class="panel panel-default">
                    <div class="panel-heading"><strong>Cancellation Notes</strong></div>
                    <div class="panel-body">
                        <p class="text-muted small">
                            <i class="fa fa-info-circle"></i> <strong>Entire Booking:</strong> Cancels all participants and activities. The booking status will be changed to "Cancelled".<br /><br />
                            <i class="fa fa-info-circle"></i> <strong>Partial Cancellation:</strong> Removes selected participants from the booking. If all participants are cancelled, the entire booking will be cancelled.<br /><br />
                            <i class="fa fa-credit-card"></i> <strong>Multiple Payments:</strong> If this booking has multiple orders/payments, you can select which transactions to refund.<br /><br />
                            <i class="fa fa-money"></i> <strong>Refund Processing:</strong> Selected refunds are processed through Stripe before the booking is cancelled. If any refund fails, the cancellation will be aborted.<br /><br />
                            <i class="fa fa-envelope"></i> <strong>Notifications:</strong> Customers will receive email notifications about cancellations and refunds if enabled.
                        </p>
                    </div>
                </div>

                <!-- Quick Stats Panel -->
                <asp:Panel runat="server" ID="pnlQuickStats" Visible="false">
                    <div class="panel panel-default">
                        <div class="panel-heading"><strong>Cancellation Impact</strong></div>
                        <div class="panel-body">
                            <dl style="margin-bottom: 0;">
                                <dt>Participants Affected</dt>
                                <dd><asp:Label runat="server" ID="lblAffectedParticipants"></asp:Label></dd>
                                <dt>Activities Affected</dt>
                                <dd><asp:Label runat="server" ID="lblAffectedActivities"></asp:Label></dd>
                                <dt>Refunds Selected</dt>
                                <dd><asp:Label runat="server" ID="lblRefundsSummary"></asp:Label></dd>
                            </dl>
                        </div>
                    </div>
                </asp:Panel>

            </div>
        </div>

    </asp:Panel>

    <!-- Loading Panel -->
    <asp:Panel ID="pnlLoading" runat="server" Visible="false" CssClass="text-center">
        <i class="fa fa-spinner fa-spin fa-3x"></i>
        <p class="text-muted">Processing cancellation...</p>
    </asp:Panel>

</asp:Content>
