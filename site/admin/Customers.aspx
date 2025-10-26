<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="WaiverFile.site.admin.Customers" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<h3 style="display:inline-block;">Customers</h3>

<style type="text/css">
    .datebox{ float:left; padding-right:5px;}
    .labelfill{ width:100%; height: 22px;}
    .search-box{ margin-bottom: 10px; }
</style>

<!-- Quick Search Bar -->
<div class="row search-box">
    <div class="col-sm-6">
        <div class="form-group">
            <label for="<%=txtQuickSearch.ClientID %>">Quick Search (Name, Email, or Phone): </label>
            <div class="input-group">
                <asp:TextBox ID="txtQuickSearch" runat="server" CssClass="form-control" placeholder="Enter customer name, email, or phone..."></asp:TextBox>
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
                <asp:ListItem Value="ALL">All Customers</asp:ListItem>
                <asp:ListItem Value="RECENT">Recent (Last 30 Days)</asp:ListItem>
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
            <label for="<%=cboHasPassword.ClientID %>">Account Status: </label>
            <asp:DropDownList ID="cboHasPassword" runat="server" CssClass="form-control">
                <asp:ListItem Value="">All</asp:ListItem>
                <asp:ListItem Value="1">Has Password</asp:ListItem>
                <asp:ListItem Value="0">No Password</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label for="<%=cboBookingCount.ClientID %>">Booking Activity: </label>
            <asp:DropDownList ID="cboBookingCount" runat="server" CssClass="form-control">
                <asp:ListItem Value="">All</asp:ListItem>
                <asp:ListItem Value="0">No Bookings</asp:ListItem>
                <asp:ListItem Value="1">1-5 Bookings</asp:ListItem>
                <asp:ListItem Value="6">6+ Bookings</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="form-group">
            <label>Total Spent Range: </label>
            <div style="display:flex; align-items:center;">
                <asp:TextBox ID="txtMinSpent" runat="server" CssClass="form-control" placeholder="Min" style="width:80px; margin-right:5px;"></asp:TextBox>
                <span style="margin-right:5px;">to</span>
                <asp:TextBox ID="txtMaxSpent" runat="server" CssClass="form-control" placeholder="Max" style="width:80px;"></asp:TextBox>
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
            $('#<%=cboHasPassword.ClientID %>').val('');
            $('#<%=cboBookingCount.ClientID %>').val('');
            $('#<%=txtQuickSearch.ClientID %>').val('');
            $('#<%=txtMinSpent.ClientID %>').val('');
            $('#<%=txtMaxSpent.ClientID %>').val('');
            $('#<%=cboDateRange.ClientID %>').val('ALL');

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

    function viewCustomer(customerId) {
        window.location.href = 'ViewCustomer.aspx?id=' + customerId;
        return false;
    }
</script>
</telerik:RadScriptBlock>

    <div class="table-responsive">
<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" Skin="Bootstrap" 
    OnNeedDataSource="RadGrid1_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound" 
    AllowPaging="True" PageSize="25" AllowSorting="True">
    
    <MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">
        <SortExpressions>
            <telerik:GridSortExpression FieldName="Created" SortOrder="Descending" />
        </SortExpressions>

        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
            <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>

        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
            <HeaderStyle Width="20px"></HeaderStyle>
        </ExpandCollapseColumn>

        <Columns>
            <telerik:GridTemplateColumn HeaderText="Customer" UniqueName="CustomerName" SortExpression="Last_Name" AllowSorting="true">
                <ItemTemplate>
                    <div>
                        <strong><%# Eval("First_Name") %> <%# Eval("Last_Name") %></strong>
                        <xsl:if test="string-length(normalize-space(<%# Eval("Company_name") %>)) &gt; 0">
                            <br />
                            <small class="text-muted"><%# Eval("Company_name") %></small>
                        </xsl:if>
                    </div>
                </ItemTemplate>
                <HeaderStyle Width="180px" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Email" UniqueName="Email" SortExpression="Email" AllowSorting="true">
                <ItemTemplate>
                    <a href="mailto:<%# Eval("Email") %>"><%# Eval("Email") %></a>
                </ItemTemplate>
                <HeaderStyle Width="200px" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridBoundColumn DataField="Phone" HeaderText="Phone" 
                SortExpression="Phone" UniqueName="Phone">
                <HeaderStyle Width="120px" CssClass="hidden-xs" />
                 <ItemStyle CssClass="hidden-xs" />
            </telerik:GridBoundColumn>
            
            <telerik:GridTemplateColumn HeaderText="Account Status" UniqueName="HasPassword" SortExpression="HasPassword" AllowSorting="true">
                <ItemTemplate>
                    <asp:Label ID="lblHasPassword" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="100px" CssClass="hidden-xs" />
                <ItemStyle HorizontalAlign="Center" />
                 <ItemStyle CssClass="hidden-xs" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridBoundColumn DataField="TotalBookings" HeaderText="Bookings" 
                SortExpression="TotalBookings" UniqueName="TotalBookings" DataType="System.Int32">
                <HeaderStyle Width="80px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            
            <telerik:GridTemplateColumn HeaderText="Total Spent" UniqueName="TotalSpent" SortExpression="TotalSpent" AllowSorting="true">
                <ItemTemplate>
                    <strong>$<%# String.Format("{0:N2}", Eval("TotalSpent")) %></strong>
                </ItemTemplate>
                <HeaderStyle Width="100px" />
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Last Booking" UniqueName="LastBookingDate" SortExpression="LastBookingDate" AllowSorting="true">
                <ItemTemplate>
                    <small><%# Eval("LastBookingDate") != null && Eval("LastBookingDate") != DBNull.Value ? String.Format("{0:MM/dd/yyyy}", Eval("LastBookingDate")) : "-" %></small>
                </ItemTemplate>
                <HeaderStyle Width="100px" CssClass="hidden-xs" />
                 <ItemStyle CssClass="hidden-xs" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Last Login" UniqueName="Last_Login" SortExpression="Last_Login" AllowSorting="true">
                <ItemTemplate>
                    <small><%# Eval("Last_Login") != null && Eval("Last_Login") != DBNull.Value ? String.Format("{0:MM/dd/yyyy}", Eval("Last_Login")) : "-" %></small>
                </ItemTemplate>
                <HeaderStyle Width="100px" CssClass="hidden-xs" />
                 <ItemStyle CssClass="hidden-xs" />
            </telerik:GridTemplateColumn>
            
            <telerik:GridTemplateColumn HeaderText="Created" UniqueName="Created" SortExpression="Created" AllowSorting="true">
                <ItemTemplate>
                    <small><%# String.Format("{0:MM/dd/yyyy}", Eval("Created")) %></small>
                </ItemTemplate>
                <HeaderStyle Width="100px" CssClass="hidden-xs" />
                 <ItemStyle CssClass="hidden-xs" />
            </telerik:GridTemplateColumn>
            
        
             <telerik:GridTemplateColumn HeaderText="Actions" UniqueName="Actions">
    <ItemTemplate>
        <a href='<%# "ViewCustomer.aspx?id=" + Eval("ID") %>' class="btn btn-primary btn-sm" title="View customer" style="color:#fff;">
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
        </div>


</asp:Content>
