<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="DomainPurchase.aspx.cs" Inherits="WaiverFile.site.admin.CMS.DomainPurchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .purchase-summary {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            padding: 20px;
            margin-bottom: 30px;
        }
        .purchase-summary h3 {
            margin-top: 0;
            color: #28a745;
        }
        .price-breakdown {
            margin: 15px 0;
        }
        .price-breakdown .row {
            padding: 10px 0;
            border-bottom: 1px solid #dee2e6;
        }
        .price-breakdown .row:last-child {
            border-bottom: none;
            font-weight: bold;
            font-size: 1.2em;
            padding-top: 15px;
        }
        .section-header {
            background: #007bff;
            color: white;
            padding: 10px 15px;
            margin: 20px -15px 15px -15px;
            font-weight: bold;
        }
        .form-section {
            margin-bottom: 30px;
        }
        .checkbox-large {
            transform: scale(1.2);
            margin-right: 8px;
        }
        .domain-options {
            background: #fff3cd;
            border: 1px solid #ffc107;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            // Show/hide payment forms based on selection
            $('input[name$="rblPaymentMethods"]').change(function () {
                $('.payment_module_box').hide();
                var selectedValue = $(this).val();
                if (selectedValue.startsWith('PMOD_')) {
                    $('#pmod_' + selectedValue.substring(5)).show();
                } else if (selectedValue.startsWith('CCPROF_')) {
                    // Using saved card, no form to show
                }
            });

            // Trigger on load if one is selected
            $('input[name$="rblPaymentMethods"]:checked').trigger('change');
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph1" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ph0" runat="server">
  
        <h1><i class="fa fa-globe"></i> Purchase Domain</h1>
        
        <asp:PlaceHolder ID="phErrors" runat="server" />

        <!-- Purchase Summary -->
        <div class="purchase-summary">
            <h3><i class="fa fa-check-circle"></i> Domain Available!</h3>
            <div class="row">
                <div class="col-md-8">
                    <h2 style="margin: 0;"><asp:Label ID="lblDomain" runat="server" /></h2>
                    <p class="text-muted">1 Year Registration</p>
                </div>
                <div class="col-md-4 text-right">
                    <h2 style="margin: 0;"><asp:Label ID="lblPrice" runat="server" /></h2>
                    <p class="text-muted">per year</p>
                </div>
            </div>

            <div class="price-breakdown">
                <div class="row">
                    <div class="col-md-8">Domain Registration (1 year)</div>
                    <div class="col-md-4 text-right"><asp:Label ID="lblPrice2" runat="server" /></div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        Azure DNS Hosting (1 year)
                        <small class="text-muted"><br/>Professional DNS management with 100% uptime SLA</small>
                    </div>
                    <div class="col-md-4 text-right">$6.00</div>
                </div>
                <div class="row">
                    <div class="col-md-8">Total Today</div>
                    <div class="col-md-4 text-right"><asp:Label ID="lblTotal" runat="server" /></div>
                </div>
            </div>
        </div>

        <!-- Domain Options -->
        <div class="domain-options">
            <h4><i class="fa fa-cog"></i> Domain Options</h4>
            <div class="checkbox">
                <label>
                    <asp:CheckBox ID="chkPrivacyProtection" runat="server" CssClass="checkbox-large" />
                    <strong>WhoisGuard Privacy Protection</strong> - Hide your personal information from WHOIS lookups
                    <small class="text-muted"><br/>Included free for the first year, then $2.88/year</small>
                </label>
            </div>
        </div>

       
            <!-- Contact Information Section -->
            <div class="form-section">
                <div class="section-header">
                    <i class="fa fa-user"></i> Registrant Contact Information
                </div>
                <p class="text-muted">This information will be used for domain registration (WHOIS records).</p>
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>First Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Last Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Organization (Optional)</label>
                            <asp:TextBox ID="txtOrganization" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Email Address <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Phone Number <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+1.5551234567" />
                    <small class="form-text text-muted">Format: +CountryCode.PhoneNumber (e.g., +1.5551234567)</small>
                </div>

                <div class="form-group">
                    <label>Address Line 1 <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label>Address Line 2 (Optional)</label>
                    <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control" />
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>City <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>State/Province <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtState" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Postal/ZIP Code <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Country <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" placeholder="US" />
                    <small class="form-text text-muted">2-letter country code (e.g., US, CA, GB)</small>
                </div>
            </div>

            <!-- Payment Method Section -->
            <div class="form-section">
                <div class="section-header">
                    <i class="fa fa-credit-card"></i> Payment Method
                </div>
                
                <asp:Panel ID="pmtMethodHeaderWrap" runat="server">
                    <div class="form-group">
                        <label>Select Payment Method:</label>
                        <asp:RadioButtonList ID="rblPaymentMethods" runat="server" CssClass="radio" />
                    </div>
                </asp:Panel>

                <asp:PlaceHolder ID="phPaymentForms" runat="server" />
            </div>

            <!-- Terms and Purchase Button -->
            <div class="form-section">
                <div class="well">
                    <div class="checkbox">
                        <label>
                            <asp:CheckBox ID="chkAgreeTerms" runat="server" CssClass="checkbox-large" />
                            I agree to the <a href="/terms" target="_blank">Domain Registration Agreement</a> and 
                            <a href="/privacy" target="_blank">Privacy Policy</a>
                        </label>
                    </div>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnPurchase" runat="server" Text="Complete Purchase" 
                        CssClass="btn btn-success btn-lg" OnClick="btnPurchase_Click" />
                    <a href="DomainSearch.aspx" class="btn btn-default btn-lg">Cancel</a>
                </div>

                <p class="text-center text-muted" style="margin-top: 15px;">
                    <i class="fa fa-lock"></i> Your payment information is secure and encrypted
                </p>
            </div>
      
   
</asp:Content>