<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="DomainDetails.aspx.cs" Inherits="WaiverFile.site.admin.CMS.DomainDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .domain-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 8px;
            margin-bottom: 30px;
        }
        .domain-header h1 {
            margin: 0;
            color: white;
        }
        .domain-header .domain-status {
            margin-top: 10px;
        }
        .info-card {
            background: white;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .info-card h3 {
            margin-top: 0;
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .info-row {
            padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .info-row:last-child {
            border-bottom: none;
        }
        .info-label {
            font-weight: 600;
            color: #666;
        }
        .info-value {
            color: #333;
        }
        .action-buttons {
            margin-top: 20px;
        }
        .action-buttons .btn {
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .alert-expiring {
            background: #fff3cd;
            border: 1px solid #ffc107;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .alert-expired {
            background: #f8d7da;
            border: 1px solid #dc3545;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .dns-record {
            background: #f8f9fa;
            padding: 10px;
            margin: 5px 0;
            border-left: 3px solid #007bff;
            border-radius: 3px;
        }
        .dns-record .record-type {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 2px 8px;
            border-radius: 3px;
            font-size: 0.85em;
            font-weight: bold;
            margin-right: 10px;
        }
        .nameserver-list {
            list-style: none;
            padding: 0;
        }
        .nameserver-list li {
            padding: 8px;
            background: #f8f9fa;
            margin: 5px 0;
            border-radius: 3px;
            font-family: monospace;
        }
        .last-sync {
            font-size: 0.9em;
            color: #666;
            margin-top: 10px;
        }
    </style>
    <script type="text/javascript">
        function confirmAction(message) {
            return confirm(message);
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ph1" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ph0" runat="server">
        <a href="DomainSearch.aspx" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to Domains</a>
        
        <asp:PlaceHolder ID="phErrors" runat="server" />

        <!-- Domain Header -->
        <div class="domain-header">
            <h1><i class="fa fa-globe"></i> <asp:Label ID="lblDomainName" runat="server" /></h1>
            <div class="domain-status">
                <span class="label label-lg" id="lblStatusBadge" runat="server">
                    <asp:Label ID="lblStatus" runat="server" />
                </span>
            </div>
        </div>

        <!-- Expiration Warnings -->
        <asp:Panel ID="pnlExpirationWarning" runat="server" Visible="false" CssClass="alert-expiring">
            <h4><i class="fa fa-exclamation-triangle"></i> Domain Expiring Soon</h4>
            <p>
                Your domain will expire in <strong><asp:Label ID="lblDaysUntilExpiration" runat="server" /> days</strong>.
                Please renew your domain to avoid service interruption.
            </p>
            <asp:Button ID="btnRenewFromWarning" runat="server" Text="Renew Now" 
                CssClass="btn btn-warning" OnClick="btnRenew_Click" />
        </asp:Panel>

        <asp:Panel ID="pnlExpiredWarning" runat="server" Visible="false" CssClass="alert-expired">
            <h4><i class="fa fa-times-circle"></i> Domain Expired</h4>
            <p>
                Your domain has expired. You may still be able to renew it during the grace period.
                <strong>Act quickly to avoid losing your domain!</strong>
            </p>
            <asp:Button ID="btnRenewFromExpired" runat="server" Text="Renew Immediately" 
                CssClass="btn btn-danger" OnClick="btnRenew_Click" />
        </asp:Panel>

        <div class="row">
            <!-- Left Column: Domain Information -->
            <div class="col-md-6">
                <!-- General Information -->
                <div class="info-card">
                    <h3><i class="fa fa-info-circle"></i> General Information</h3>
                    
                    <div class="info-row">
                        <div class="row">
                            <div class="col-xs-6 info-label">Domain Status</div>
                            <div class="col-xs-6 info-value"><asp:Label ID="lblStatus2" runat="server" /></div>
                        </div>
                    </div>

                    <div class="info-row">
                        <div class="row">
                            <div class="col-xs-6 info-label">Expiration Date</div>
                            <div class="col-xs-6 info-value"><asp:Label ID="lblExpirationDate" runat="server" /></div>
                        </div>
                    </div>

                    <div class="info-row">
                        <div class="row">
                            <div class="col-xs-6 info-label">Registrar</div>
                            <div class="col-xs-6 info-value"><asp:Label ID="lblRegistrar" runat="server" /></div>
                        </div>
                    </div>

                    <div class="info-row">
                        <div class="row">
                            <div class="col-xs-6 info-label">DNS Provider</div>
                            <div class="col-xs-6 info-value"><asp:Label ID="lblDNSProvider" runat="server" /></div>
                        </div>
                    </div>

                    <div class="info-row">
                        <div class="row">
                            <div class="col-xs-6 info-label">Auto-Renew</div>
                            <div class="col-xs-6 info-value"><asp:Label ID="lblAutoRenew" runat="server" /></div>
                        </div>
                    </div>

                    <div class="info-row">
                        <div class="row">
                            <div class="col-xs-6 info-label">Privacy Protection</div>
                            <div class="col-xs-6 info-value"><asp:Label ID="lblPrivacyProtection" runat="server" /></div>
                        </div>
                    </div>

                    <div class="info-row">
                        <div class="row">
                            <div class="col-xs-6 info-label">Transfer Lock</div>
                            <div class="col-xs-6 info-value"><asp:Label ID="lblTransferLocked" runat="server" /></div>
                        </div>
                    </div>

                    <div class="last-sync">
                        <i class="fa fa-sync"></i> Last synced: <asp:Label ID="lblLastSync" runat="server" />
                    </div>
                </div>

                <!-- Nameservers -->
                <div class="info-card">
                    <h3><i class="fa fa-server"></i> Nameservers</h3>
                    <ul class="nameserver-list">
                        <asp:Repeater ID="rptNameservers" runat="server">
                            <ItemTemplate>
                                <li><%# Container.DataItem %></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>

            <!-- Right Column: DNS Records & Actions -->
            <div class="col-md-6">
                <!-- DNS Records -->
                <asp:Panel ID="pnlDNSRecords" runat="server" Visible="false">
                    <div class="info-card">
                        <h3><i class="fa fa-list"></i> DNS Records</h3>
                        
                        <asp:Repeater ID="rptDNSRecords" runat="server">
                            <ItemTemplate>
                                <div class="dns-record">
                                    <span class="record-type"><%# Eval("Type") %></span>
                                    <strong><%# Eval("Name") %></strong>
                                    <div style="margin-left: 45px; color: #666;">
                                        <%# Eval("Value") %>
                                        <small class="text-muted">(TTL: <%# Eval("TTL") %>s)</small>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="action-buttons">
                            <asp:Button ID="btnManageDNS" runat="server" Text="Manage DNS Records" 
                                CssClass="btn btn-primary" OnClick="btnManageDNS_Click" />
                        </div>
                    </div>
                </asp:Panel>

                <!-- Quick Actions -->
                <div class="info-card">
                    <h3><i class="fa fa-bolt"></i> Quick Actions</h3>
                    
                    <div class="action-buttons">
                        <asp:Button ID="btnRenew" runat="server" Text="Renew Domain" 
                            CssClass="btn btn-success" OnClick="btnRenew_Click" />
                        
                        <asp:Button ID="btnSyncStatus" runat="server" Text="Sync Status" 
                            CssClass="btn btn-info" OnClick="btnSyncStatus_Click" />
                        
                        <asp:Button ID="btnToggleLock" runat="server" Text="Toggle Transfer Lock" 
                            CssClass="btn btn-warning" OnClick="btnToggleLock_Click" 
                            OnClientClick="return confirmAction('Are you sure you want to change the transfer lock status?');" />
                        
                        <asp:Button ID="btnGetAuthCode" runat="server" Text="Get Auth Code" 
                            CssClass="btn btn-default" OnClick="btnGetAuthCode_Click"
                            ToolTip="Request EPP/Auth code for domain transfer" />
                    </div>

                    <hr />

                    <h4>Advanced Options</h4>
                    <div class="action-buttons">
                        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#modalSettings">
                            <i class="fa fa-cog"></i> Domain Settings
                        </a>
                        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#modalContact">
                            <i class="fa fa-user"></i> Update Contact Info
                        </a>
                    </div>
                </div>

                <!-- Help & Information -->
                <div class="info-card">
                    <h3><i class="fa fa-question-circle"></i> Need Help?</h3>
                    <ul>
                        <li><a href="/support/domain-renewal">How to renew your domain</a></li>
                        <li><a href="/support/dns-configuration">DNS configuration guide</a></li>
                        <li><a href="/support/domain-transfer">Transfer domain to another registrar</a></li>
                        <li><a href="/support/contact">Contact support</a></li>
                    </ul>
                </div>
            </div>
        </div>

    <!-- Settings Modal (placeholder for future functionality) -->
    <div class="modal fade" id="modalSettings" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Domain Settings</h4>
                </div>
                <div class="modal-body">
                    <p>Configure auto-renewal, privacy protection, and other domain settings.</p>
                    <!-- Add settings form here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save Changes</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>