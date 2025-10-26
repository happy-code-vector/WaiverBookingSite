<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="DomainSearch.aspx.cs" Inherits="WaiverFile.site.admin.CMS.DomainSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .domain-search-box {
            max-width: 600px;
            margin: 30px auto;
        }
        .domain-result {
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .domain-available {
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .domain-unavailable {
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        .domain-premium {
            background-color: #fff3cd;
            border-color: #ffeaa7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
        <h1>Domain Name Search</h1>
        
        <asp:PlaceHolder ID="phErrors" runat="server" />

        <div class="domain-search-box">
            <div class="form-group">
                <label>Search for a domain name:</label>
                <div class="input-group">
                    <asp:TextBox ID="txtDomainSearch" runat="server" CssClass="form-control" 
                        placeholder="example.com" />
                    <span class="input-group-btn">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" 
                            CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                    </span>
                </div>
                <small class="form-text text-muted">
                    Enter a domain name with or without extension. We'll check .com, .net, .org, and .io if no extension is provided.
                </small>
            </div>
        </div>

        <asp:Panel ID="pnlSearchResults" runat="server" Visible="false">
            <h3>Search Results</h3>
           <asp:Repeater ID="rptSearchResults" runat="server" OnItemCommand="rptSearchResults_ItemCommand">
    <ItemTemplate>
        <div class="domain-result <%# (bool)Eval("Available") ? ((bool)Eval("IsPremium") ? "domain-premium" : "domain-available") : "domain-unavailable" %>">
            <div class="row">
                <div class="col-md-6">
                    <h4><%# Eval("Domain") %></h4>
                    <%# (bool)Eval("IsPremium") ? "<span class='label label-warning'>Premium Domain</span>" : "" %>
                </div>
                <div class="col-md-3 text-right">
                    <strong><%# string.Format("{0:C}", Eval("Price")) %>/year</strong>
                </div>
                <div class="col-md-3 text-right">
                    <asp:Button ID="btnPurchase" runat="server" 
                        Text="Purchase" 
                        CssClass="btn btn-success" 
                        CommandName="Purchase" 
                        CommandArgument='<%# Eval("Domain") %>'
                        Visible='<%# (bool)Eval("Available") %>' />
                    
                    <span class="text-muted" style='<%# (bool)Eval("Available") ? "display:none;" : "" %>'>
                        Not Available
                    </span>
                    
                    <asp:HiddenField ID="hfPrice" runat="server" Value='<%# Eval("Price") %>' />
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
        </asp:Panel>
    <asp:Panel ID="pnlCustomerDomains" runat="server" Visible="false" CssClass="mt-5">
    <h3>Your Domains</h3>
    <asp:Repeater ID="rptCustomerDomains" runat="server">
        <ItemTemplate>
            <div class="panel panel-default domain-panel">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-4 col-md-5 col-sm-12">
                            <h4 class="domain-name">
                                <i class="fa fa-globe"></i> <%# Eval("Domain") %>
                            </h4>
                        </div>
                        <div class="col-lg-8 col-md-7 col-sm-12">
                            <div class="domain-info">
                                <div class="domain-badge-group">
                                    <span class="label label-<%# GetStatusClass(Eval("Status").ToString()) %>">
                                        <%# Eval("Status").ToString().Replace("_"," ") %>
                                    </span>
                                    <span class="label label-<%# (bool)Eval("Settings.AutoRenew") ? "success" : "warning" %>">
                                        <i class="fa fa-<%# (bool)Eval("Settings.AutoRenew") ? "check-circle" : "exclamation-circle" %>"></i>
                                        <%# (bool)Eval("Settings.AutoRenew") ? "Auto-Renew" : "Manual Renew" %>
                                    </span>
                                </div>
                                <div class="domain-meta">
                                    <span class="expiration-date">
                                        <i class="fa fa-calendar"></i> Expires: <strong><%# Eval("ExpirationDate", "{0:MMM dd, yyyy}") %></strong>
                                    </span>
                                </div>
                                <div class="domain-actions">
                                    <a href="DomainDetails.aspx?id=<%# Eval("ID") %>" class="btn btn-primary btn-sm">
                                        <i class="fa fa-cog"></i> Manage Domain
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Panel>

<style>
    .domain-panel {
        margin-bottom: 15px;
        transition: box-shadow 0.3s ease;
    }
    
    .domain-panel:hover {
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    
    .domain-name {
        margin: 0;
        font-size: 18px;
        color: #333;
        font-weight: 600;
    }
    
    .domain-name i {
        color: #5cb85c;
        margin-right: 8px;
    }
    
    .domain-info {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    
    .domain-badge-group {
        display: flex;
        gap: 8px;
        flex-wrap: wrap;
    }
    
    .domain-badge-group .label {
        font-size: 12px;
        padding: 4px 10px;
        font-weight: 600;
    }
    
    .domain-meta {
        color: #666;
        font-size: 14px;
    }
    
    .expiration-date i {
        margin-right: 5px;
    }
    
    .domain-actions {
        margin-top: 5px;
    }
    
    @media (min-width: 768px) {
        .domain-info {
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }
        
        .domain-actions {
            margin-top: 0;
        }
    }
    
    @media (max-width: 767px) {
        .domain-name {
            margin-bottom: 15px;
        }
        
        .domain-actions {
            margin-top: 10px;
        }
        
        .domain-actions .btn {
            display: block;
            width: 100%;
        }
    }
</style>
</asp:Content>
