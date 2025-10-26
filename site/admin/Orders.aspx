<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WaiverFile.site.admin.Orders" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<div class="pull-right" style="margin-top:20px;">
    <a href="OrderSearch.aspx" class="btn btn-default"><i class="fa fa-search"></i> Order Search</a>
</div>
<h3 style="display:inline-block;">Orders</h3>

<style type="text/css">
    .datebox{ float:left; padding-right:5px;}
    .labelfill{ width:100%; height: 22px;}
    .search-box{ margin-bottom: 10px; }
</style>

<!-- Quick Search Bar -->
<div class="row search-box">
    <div class="col-sm-6">
        <div class="form-group">
            <label for="<%=txtQuickSearch.ClientID %>">Quick Search (Customer Name, Email, or Order Number): </label>
            <div class="input-group">
                <asp:TextBox ID="txtQuickSearch" runat="server" CssClass="form-control" placeholder="Enter customer name, email, or order number..."></asp:TextBox>
                <div class="input-group-btn">
                    <asp:Button ID="btnQuickSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnQuickSearch_Click" />
                    <asp:Button ID="btnClearSearch" runat="server" CssClass="btn btn-default" Text="Clear" OnClick="btnClearSearch_Click" />
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <div class="form-group">
            <label for="<%=cboDateRange.ClientID %>">Show: </label>
            <asp:DropDownList ID="cboDateRange" runat="server" CssClass="form-control" OnSelectedIndexChanged="cboDateRange_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Value="RECENT">Recent Orders</asp:ListItem>
                <asp:ListItem Value="ALL">All Orders</asp:ListItem>
                <asp:ListItem Value="TODAY">Today's Orders</asp:ListItem>
                <asp:ListItem Value="THISWEEK">This Week</asp:ListItem>
                <asp:ListItem Value="THISMONTH">This Month</asp:ListItem>
                <asp:ListItem Value="CUSTOM">Custom Dates</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-sm-6">
        <div id="customDatesPanel" style="display:none;">
            <div class="form-group datebox">
                <label for="<%=rdpFromDate.ClientID %>">From Date: </label><br />
                <telerik:RadDatePicker ID="rdpFromDate" runat="server" Skin="Bootstrap">
                </telerik:RadDatePicker>
            </div>
            <div class="form-group datebox">
                <label for="<%=rdpToDate.ClientID %>">To Date: </label><br />
                <telerik:RadDatePicker ID="rdpToDate" runat="server" Skin="Bootstrap">
                </telerik:RadDatePicker>
            </div>
            <div class="form-group datebox">
                <div class="labelfill"></div>
                <asp:Button runat="server" id="btnUpdate" CssClass="btn btn-primary" Text="Update Dates" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </div>         
    <div class="col-sm-2" id="filtersToggle">
        <div class="form-group text-right">
            <label>&nbsp;</label><br />
            <button type="button" id="btnToggleFilters" class="btn btn-default">
                <i class="fa fa-filter"></i> Filters
            </button>
        </div>
    </div>
</div>

<!-- Advanced Filters Panel -->
<div class="row" id="advancedFiltersPanel" style="display:none; margin-top:10px; padding:15px; background-color:#f8f9fa; border:1px solid #e3e6ea; border-radius:4px;">
    <div class="col-sm-3">
        <div class="form-group">
            <label for="<%=cboOrderStatus.ClientID %>">Order Status: </label>
            <asp:DropDownList ID="cboOrderStatus" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
    </div>
  
    <div class="col-sm-4">
        <div class="form-group">
            <label>Order Total Range: </label>
            <div style="display:flex; align-items:center;">
                <asp:TextBox ID="txtMinTotal" runat="server" CssClass="form-control" placeholder="Min" style="width:80px; margin-right:5px;"></asp:TextBox>
                <span style="margin-right:5px;">to</span>
                <asp:TextBox ID="txtMaxTotal" runat="server" CssClass="form-control" placeholder="Max" style="width:80px;"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="col-sm-2">
        <div class="form-group">
            <label>&nbsp;</label><br />
            <asp:Button ID="btnApplyFilters" runat="server" Text="Apply Filters" 
                CssClass="btn btn-primary" OnClick="btnApplyFilters_Click" />
            <br />
            <button type="button" id="btnClearFilters" class="btn btn-link btn-sm" style="margin-top:5px;">
                Clear All
            </button>
        </div>
    </div>
</div>

<telerik:RadScriptBlock runat="server">
<script type="text/javascript">

    function showHideDates() {
        var selectedValue = $('#<%=cboDateRange.ClientID %>').val();
        if (selectedValue === 'CUSTOM') {
            $('#customDatesPanel').slideDown(300);
        } else {
            $('#customDatesPanel').slideUp(300);
        }
    }

    $(document).ready(function () {
        // Handle date range dropdown change
        showHideDates();
        $('#<%=cboDateRange.ClientID %>').change(function () {
            showHideDates();
        });

        // Handle filters toggle
        $('#btnToggleFilters').click(function () {
            var panel = $('#advancedFiltersPanel');
            var button = $(this);

            if (panel.is(':visible')) {
                panel.slideUp(300);
                button.html('<i class="fa fa-filter"></i> Filters');
                button.removeClass('btn-info').addClass('btn-default');
            } else {
                panel.slideDown(300);
                button.html('<i class="fa fa-filter"></i> Hide Filters');
                button.removeClass('btn-default').addClass('btn-info');
            }
        });

        // Handle clear filters
        $('#btnClearFilters').click(function () {
            // Reset all filter controls
            $('#<%=cboOrderStatus.ClientID %>').val('');
            $('#<%=txtQuickSearch.ClientID %>').val('');
            $('#<%=txtMinTotal.ClientID %>').val('');
            $('#<%=txtMaxTotal.ClientID %>').val('');
            $('#<%=cboDateRange.ClientID %>').val('RECENT');

            // Clear date pickers
            var fromDatePicker = $find('<%= rdpFromDate.ClientID %>');
            var toDatePicker = $find('<%= rdpToDate.ClientID %>');
            if (fromDatePicker) fromDatePicker.clear();
            if (toDatePicker) toDatePicker.clear();

            // Hide custom dates panel
            $('#customDatesPanel').slideUp(300);

            // Trigger apply filters
            $('#<%=btnApplyFilters.ClientID %>').click();
        });

        // Handle Enter key in search box
        $('#<%=txtQuickSearch.ClientID %>').keypress(function (e) {
            if (e.which == 13) {
                $('#<%=btnQuickSearch.ClientID %>').click();
                return false;
            }
        });
    });

    function viewOrder(orderId) {
        window.location.href = 'ViewOrder.aspx?id=' + orderId;
        return false;
    }

    function viewCustomer(customerId) {
        window.location.href = 'ViewCustomer.aspx?id=' + customerId;
        return false;
    }
</script>
</telerik:RadScriptBlock>

<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" Skin="Bootstrap" 
    OnNeedDataSource="RadGrid1_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound" 
    AllowPaging="True" PageSize="25" AllowSorting="True">
    
    <MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">
        <SortExpressions>
            <telerik:GridSortExpression FieldName="DateCreated" SortOrder="Descending" />
        </SortExpressions>

        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
            <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>

        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
            <HeaderStyle Width="20px"></HeaderStyle>
        </ExpandCollapseColumn>

        <Columns>
            <telerik:GridTemplateColumn HeaderText="Order #" UniqueName="OrderNumber" SortExpression="OrderNumber" AllowSorting="true">
                <ItemTemplate>
                    <a href="ViewOrder.aspx?id=<%# Eval("ID") %>" class="btn btn-link btn-sm">
                        <strong>#<%# Eval("OrderNumber") %></strong>
                    </a>
                </ItemTemplate>
                <HeaderStyle Width="100px" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Customer" UniqueName="Customer" SortExpression="FullName" AllowSorting="true">
                <ItemTemplate>
                    <div>
                        <a href="ViewCustomer.aspx?id=<%# Eval("WFCustomerID") %>" class="text-primary">
                            <strong><%# Eval("FullName") %></strong>
                        </a><br />
                        <small class="text-muted">
                            <a href="mailto:<%# Eval("Email") %>"><%# Eval("Email") %></a>
                        </small>
                    </div>
                </ItemTemplate>
                <HeaderStyle Width="200px" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Order Total" UniqueName="OrderTotal" SortExpression="OrderTotal" AllowSorting="true">
                <ItemTemplate>
                    <strong>$<%# String.Format("{0:N2}", Eval("OrderTotal")) %></strong>
                </ItemTemplate>
                <HeaderStyle Width="100px" />
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Status" UniqueName="CurrentStatus" SortExpression="CurrentStatus" AllowSorting="true">
                <ItemTemplate>
                    <asp:Label ID="lblOrderStatus" runat="server" Text='<%# Eval("CurrentStatus") %>' CssClass="label"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Status Notes" UniqueName="StatusComments">
                <ItemTemplate>
                    <small class="text-muted"><%# Eval("StatusComments") %></small>
                </ItemTemplate>
                <HeaderStyle Width="150px" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Order Date" UniqueName="DateCreated" SortExpression="DateCreated" AllowSorting="true">
                <ItemTemplate>
                    <small><%# String.Format("{0:MM/dd/yyyy}", Eval("DateCreated")) %></small>
                </ItemTemplate>
                <HeaderStyle Width="90px" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Status Date" UniqueName="StatusDate" SortExpression="StatusDate" AllowSorting="true">
                <ItemTemplate>
                    <small><%# Eval("StatusDate") != null && Eval("StatusDate") != DBNull.Value ? String.Format("{0:MM/dd/yyyy}", Eval("StatusDate")) : "" %></small>
                </ItemTemplate>
                <HeaderStyle Width="90px" />
            </telerik:GridTemplateColumn>
            
         
            
            <telerik:GridTemplateColumn HeaderText="Actions" UniqueName="Actions">
                <ItemTemplate>
                    <a href="ViewOrder.aspx?id=<%# Eval("ID") %>" class="btn btn-primary btn-sm" title="View order" style="color:#fff;">
                       View
                    </a>
                </ItemTemplate>
                <HeaderStyle Width="80px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>

        </Columns>

        <EditFormSettings>
            <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
        </EditFormSettings>
    </MasterTableView>

    <FilterMenu EnableImageSprites="False">
        <WebServiceSettings>
            <ODataSettings InitialContainerName=""></ODataSettings>
        </WebServiceSettings>
    </FilterMenu>

    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
        <WebServiceSettings>
            <ODataSettings InitialContainerName=""></ODataSettings>
        </WebServiceSettings>
    </HeaderContextMenu>
</telerik:RadGrid>

</asp:Content>