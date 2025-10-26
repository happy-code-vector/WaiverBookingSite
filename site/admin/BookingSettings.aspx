<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="BookingSettings.aspx.cs" Inherits="WaiverFile.site.admin.BookingSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .setting-section {
            background: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 20px;
            margin-bottom: 25px;
        }
        .setting-section h4 {
            margin-top: 0;
            border-bottom: 2px solid #337ab7;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .setting-row {
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        .setting-row:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }
        .setting-label {
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
        }
        .setting-help {
            color: #666;
            font-size: 0.9em;
            margin-top: 5px;
            display: block;
        }
        .sub-setting {
            margin-left: 25px;
            margin-top: 15px;
            padding: 15px;
            background: #fff;
            border-left: 3px solid #337ab7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <div class="row">
        <div class="col-xs-12">
            <h3 class="page-header">
                <i class="fa fa-cog"></i> Booking Settings
            </h3>
        </div>
    </div>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

    <asp:Panel runat="server" ID="pnlMain">
        
        <div class="row">
            <div class="col-lg-10">

                <!-- Pricing & Fees Section -->
                <div class="setting-section">
                    <h4><i class="fa fa-dollar"></i> Pricing & Fees</h4>
                    
<!-- Booking Fee Display -->
<div class="setting-row">
    <label class="setting-label">Booking Fee Display</label>
    <asp:DropDownList ID="ddlBookingFeeDisplay" runat="server" CssClass="form-control" style="max-width: 400px;">
        <asp:ListItem Value="SHOW" Text="Show as separate line item (Standard)"></asp:ListItem>
        <asp:ListItem Value="HIDE" Text="Hide from customers (You absorb the cost)"></asp:ListItem>
    </asp:DropDownList>
    <span class="setting-help">
        Controls whether customers see the booking fee as a separate charge at checkout.
        <a href="#" data-toggle="modal" data-target="#modalBookingFeeExplanation" class="text-primary">
            <i class="fa fa-question-circle"></i> How does this work?
        </a>
    </span>
</div>

<!-- Modal: Booking Fee Explanation -->
<div class="modal fade" id="modalBookingFeeExplanation" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                <h4 class="modal-title"><i class="fa fa-info-circle"></i> How Booking Fees Work</h4>
            </div>
            <div class="modal-body">
                <p>A <strong>6% platform fee</strong> (rounded up to the nearest dollar) is charged on all bookings. This is in addition to standard credit card processing fees.</p>
                
                <hr />
                
                <h5><strong>Show as separate line item</strong> (Customers pay the fee)</h5>
                <div class="well well-sm">
                    <strong>Example:</strong> $47 activity<br />
                    • Platform fee: 6% of $47 = $2.82 → <strong>$3.00</strong> (rounded up)<br />
                    • Customer sees: $47.00 + $3.00 fee = <strong>$50.00 total</strong><br />
                    • Customer pays: <strong>$50.00</strong><br />
                    • You receive: <strong>~$47.00</strong> (before card processing fee)<br />
                    <br />
                    <em class="text-success">✓ You receive the full activity price</em>
                </div>
                
                <h5><strong>Hide from customers</strong> (You absorb the fee)</h5>
                <div class="well well-sm">
                    <strong>Example:</strong> $47 activity<br />
                    • Platform fee: 6% of $47 = $2.82 → <strong>$3.00</strong> (rounded up)<br />
                    • Customer sees: <strong>$47.00 total</strong> (no fee line)<br />
                    • Customer pays: <strong>$47.00</strong><br />
                    • You receive: <strong>~$44.00</strong> (before card processing fee)<br />
                    <br />
                    <em class="text-info">💡 Tip: Raise your prices by 6-7% to maintain revenue</em>
                </div>
                
                <hr />
                
                <p class="small text-muted">
                    <strong>Note:</strong> Credit card processing fees (typically 2.9% + $0.30) are separate and applied to all transactions. 
                    The platform fee is always 6% of the activity price, rounded up to the next whole dollar.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

                    <!-- Minimum Booking Amount -->
                    <div class="setting-row">
                        <label class="setting-label">Minimum Booking Amount</label>
                        <div class="form-inline">
                            <div class="input-group" style="max-width: 200px;">
                                <span class="input-group-addon">$</span>
                                <asp:TextBox ID="txtMinimumBookingAmount" runat="server" CssClass="form-control" 
                                    placeholder="0.00" TextMode="Number" step="0.01"></asp:TextBox>
                            </div>
                            <span class="help-block" style="display: inline-block; margin-left: 10px;">(Leave blank or 0 for no minimum)</span>
                        </div>
                        <span class="setting-help">
                            Require bookings to meet a minimum dollar amount. Customers cannot checkout if their cart total is below this amount.
                        </span>
                    </div>
                </div>

                <!-- Cancellation Policy Section -->
                <div class="setting-section">
                    <h4><i class="fa fa-ban"></i> Cancellation Policy</h4>
                    
                    <!-- Cancellation Allowed -->
                    <div class="setting-row">
                        <label class="setting-label">Customer Cancellation Policy</label>
                        <asp:DropDownList ID="ddlCancellationPolicy" runat="server" CssClass="form-control" 
                            AutoPostBack="true" OnSelectedIndexChanged="ddlCancellationPolicy_SelectedIndexChanged" 
                            style="max-width: 500px;">
                            <asp:ListItem Value="NO_CANCELLATIONS" Text="No cancellations allowed"></asp:ListItem>
                            <asp:ListItem Value="ALLOW_WITH_CUTOFF" Text="Allow cancellations with time restriction"></asp:ListItem>
                            <asp:ListItem Value="ALLOW_ANYTIME" Text="Allow cancellations anytime before activity"></asp:ListItem>
                        </asp:DropDownList>
                        <span class="setting-help">
                            Controls when customers can cancel their own bookings from their account dashboard.
                        </span>

                        <!-- Cancellation Cutoff (shown conditionally) -->
                        <asp:Panel ID="pnlCancellationCutoff" runat="server" Visible="false" CssClass="sub-setting">
                            <label class="setting-label">Cancellation Cutoff</label>
                            <div class="form-inline">
                                <asp:TextBox ID="txtCancellationCutoffValue" runat="server" CssClass="form-control" 
                                    style="width: 80px;" TextMode="Number" min="1" step="1"></asp:TextBox>
                                <asp:DropDownList ID="ddlCancellationCutoffUnit" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="HOURS" Text="hours"></asp:ListItem>
                                    <asp:ListItem Value="DAYS" Text="days"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="help-block" style="display: inline-block; margin-left: 10px;">before activity start time</span>
                            </div>
                            <span class="setting-help">
                                Customers cannot cancel within this time window. Example: "24 hours" means customers must cancel at least 24 hours before the activity.
                            </span>
                        </asp:Panel>
                    </div>

                    <!-- Cancellation Fee -->
                    <div class="setting-row">
                        <label class="setting-label">Standard Cancellation Fee</label>
                        <div class="form-inline">
                            <div class="radio" style="margin-right: 20px;">
                                <label>
                                    <asp:RadioButton ID="rbCancellationFeeNone" runat="server" GroupName="CancellationFee" 
                                        AutoPostBack="true" OnCheckedChanged="rbCancellationFee_CheckedChanged" />
                                    No fee (full refund)
                                </label>
                            </div>
                            <div class="radio" style="margin-right: 20px;">
                                <label>
                                    <asp:RadioButton ID="rbCancellationFeeFlat" runat="server" GroupName="CancellationFee" 
                                        AutoPostBack="true" OnCheckedChanged="rbCancellationFee_CheckedChanged" />
                                    Flat fee: $
                                    <asp:TextBox ID="txtCancellationFeeFlat" runat="server" CssClass="form-control input-sm" 
                                        style="width: 100px; display: inline-block; margin-left: 5px;" 
                                        TextMode="Number" step="0.01" min="0"></asp:TextBox>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <asp:RadioButton ID="rbCancellationFeePercent" runat="server" GroupName="CancellationFee" 
                                        AutoPostBack="true" OnCheckedChanged="rbCancellationFee_CheckedChanged" />
                                    Percentage: 
                                    <asp:TextBox ID="txtCancellationFeePercent" runat="server" CssClass="form-control input-sm" 
                                        style="width: 80px; display: inline-block; margin-left: 5px;" 
                                        TextMode="Number" step="1" min="0" max="100"></asp:TextBox>
                                    %
                                </label>
                            </div>
                        </div>
                        <span class="setting-help">
                            Fee charged when customers cancel within the allowed timeframe. Customers receive a refund minus this fee.
                        </span>
                    </div>

                    <!-- Late Cancellation Fee -->
                    <div class="setting-row">
                        <label class="setting-label">Late Cancellation Fee</label>
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="chkEnableLateCancellationFee" runat="server" 
                                    AutoPostBack="true" OnCheckedChanged="chkEnableLateCancellationFee_CheckedChanged" />
                                Charge a higher fee for last-minute cancellations
                            </label>
                        </div>

                        <asp:Panel ID="pnlLateCancellationFee" runat="server" Visible="false" CssClass="sub-setting">
                            <label class="setting-label">Late Cancellation Threshold</label>
                            <div class="form-inline">
                                <span>If cancelled within </span>
                                <asp:TextBox ID="txtLateCancellationThresholdValue" runat="server" CssClass="form-control input-sm" 
                                    style="width: 80px;" TextMode="Number" min="1" step="1"></asp:TextBox>
                                <asp:DropDownList ID="ddlLateCancellationThresholdUnit" runat="server" CssClass="form-control input-sm">
                                    <asp:ListItem Value="HOURS" Text="hours"></asp:ListItem>
                                    <asp:ListItem Value="DAYS" Text="days"></asp:ListItem>
                                </asp:DropDownList>
                                <span> before activity</span>
                            </div>

                            <div style="margin-top: 15px;">
                                <label class="setting-label">Late Cancellation Fee Amount</label>
                                <div class="form-inline">
                                    <div class="radio" style="margin-right: 20px;">
                                        <label>
                                            <asp:RadioButton ID="rbLateCancellationFeeFlat" runat="server" GroupName="LateCancellationFee" />
                                            Flat fee: $
                                            <asp:TextBox ID="txtLateCancellationFeeFlat" runat="server" CssClass="form-control input-sm" 
                                                style="width: 100px; display: inline-block; margin-left: 5px;" 
                                                TextMode="Number" step="0.01" min="0"></asp:TextBox>
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <asp:RadioButton ID="rbLateCancellationFeePercent" runat="server" GroupName="LateCancellationFee" />
                                            Percentage: 
                                            <asp:TextBox ID="txtLateCancellationFeePercent" runat="server" CssClass="form-control input-sm" 
                                                style="width: 80px; display: inline-block; margin-left: 5px;" 
                                                TextMode="Number" step="1" min="0" max="100"></asp:TextBox>
                                            %
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                            <span class="setting-help">
                                Example: If set to "12 hours / 50%", customers who cancel within 12 hours of the activity are charged 50% (instead of the standard fee above).
                            </span>
                        </asp:Panel>
                    </div>

                    <!-- Admin Override Note -->
                    <div class="alert alert-info" style="margin-bottom: 0;">
                        <i class="fa fa-info-circle"></i> <strong>Note:</strong> Administrators can always cancel any booking from the admin panel regardless of these settings. These policies only apply to customer self-service cancellations.
                    </div>
                </div>

                <!-- Cancellation Requests Section -->
                <div class="setting-section">
                    <h4><i class="fa fa-question-circle"></i> Cancellation Requests</h4>
                    
                    <div class="setting-row">
                        <label class="setting-label">Allow Cancellation Requests</label>
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="chkAllowCancellationRequests" runat="server" />
                                Show "Request Cancellation" option on bookings
                            </label>
                        </div>
                        <span class="setting-help">
                            When enabled, customers can submit a cancellation request form instead of directly cancelling. 
                            This is useful when you want to review cancellations manually or when direct cancellation is not allowed.
                            Requests appear in the admin panel for approval.
                        </span>
                    </div>
                </div>

                <!-- Save Button -->
                <div class="form-group">
                    <asp:Button ID="btnSave" runat="server" Text="Save Settings" CssClass="btn btn-primary btn-lg" 
                        OnClick="btnSave_Click" />
                </div>

            </div>

            <!-- Sidebar Help -->
            <div class="col-lg-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>Help</strong>
                    </div>
                    <div class="panel-body">
                        <p class="small text-muted">
                            These settings control how customers can book and cancel activities on your site.
                        </p>
                        <p class="small text-muted">
                            Changes take effect immediately for all new bookings.
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>
</asp:Content>
