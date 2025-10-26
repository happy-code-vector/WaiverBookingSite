<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="WaiverFile.site.admin.Bookings" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

   
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <!--
<div class="pull-right" style="margin-top:20px;">
    <a href="BookingSearch.aspx" class="btn btn-default"><i class="fa fa-search"></i> Booking Search</a>
    <a href="NewBooking.aspx" class="btn btn-primary"><i class="fa fa-plus-circle"></i> New Booking</a>
</div>-->
<h3 style="display:inline-block;">Bookings</h3>

    <style type="text/css">
        .datebox{ float:left; padding-right:5px;}
        .labelfill{ width:100%; height: 22px;}
        
    </style>

<div class="row">
    <div class="col-sm-4">
        <div class="form-group">
            <label for="<%=cboDateRange.ClientID %>">Show: </label>
            <asp:DropDownList ID="cboDateRange" runat="server" CssClass="form-control" OnSelectedIndexChanged="cboDateRange_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Value="UPCOMING">Upcoming Bookings (Upcoming 60 days)</asp:ListItem>
                <asp:ListItem Value="RECENT">Recent Bookings (Previous 30 days)</asp:ListItem>
                <asp:ListItem Value="ALL">All Bookings</asp:ListItem>
                <asp:ListItem Value="TODAY">Today's Bookings</asp:ListItem>
                <asp:ListItem Value="THISWEEK">This Week</asp:ListItem>
                <asp:ListItem Value="CUSTOM">Custom Dates</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-sm-6">
    <div id="customDatesPanel" style="display:none;">
                <div class="form-group datebox">
                    <label for="<%=rdpFromDate.ClientID %>">From Date: </label><br />
                    <telerik:RadDatePicker ID="rdpFromDate" runat="server" Skin="Bootstrap" >
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
            <label for="<%=cboBookingStatus.ClientID %>">Booking Status: </label>
            <asp:DropDownList ID="cboBookingStatus" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label for="<%=cboWaiverStatus.ClientID %>">Waiver Status: </label>
            <asp:DropDownList ID="cboWaiverStatus" runat="server" CssClass="form-control">
                <asp:ListItem Value="">All</asp:ListItem>
                <asp:ListItem Value="COMPLETE">Complete</asp:ListItem>
                <asp:ListItem Value="MISSING">Missing Waivers</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="form-group">
            <label for="<%=cblAdmissionItems.ClientID %>">Admission Items: </label>
            <div style="max-height:120px; overflow-y:auto; border:1px solid #ccc; padding:5px; background-color:white;">
                <asp:CheckBoxList ID="cblAdmissionItems" runat="server" CssClass="checkbox-list">
                </asp:CheckBoxList>
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
            $('#filtersToggle').removeClass('col-sm-2').addClass('col-sm-2');
        } else {
            $('#customDatesPanel').slideUp(300);
            $('#filtersToggle').removeClass('col-sm-2').addClass('col-sm-2');
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
            $('#<%=cboBookingStatus.ClientID %>').val('');
            $('#<%=cboWaiverStatus.ClientID %>').val('');
            $('#<%=cboDateRange.ClientID %>').val('ALL');

            // Clear date pickers
            var fromDatePicker = $find('<%= rdpFromDate.ClientID %>');
            var toDatePicker = $find('<%= rdpToDate.ClientID %>');
            if (fromDatePicker) fromDatePicker.clear();
            if (toDatePicker) toDatePicker.clear();

            // Uncheck all admission items except "All"
            $('#<%=cblAdmissionItems.ClientID %> input[type="checkbox"]').each(function (index) {
                if (index === 0) {
                    $(this).prop('checked', true); // Check "All"
                } else {
                    $(this).prop('checked', false); // Uncheck others
                }
            });

            // Hide custom dates panel
            $('#customDatesPanel').slideUp(300);

            // Trigger apply filters
            $('#<%=btnApplyFilters.ClientID %>').click();
        });

        // Handle admission items "All" checkbox
        $('#<%=cblAdmissionItems.ClientID %> input[type="checkbox"]').change(function () {
            var allCheckbox = $('#<%=cblAdmissionItems.ClientID %> input[type="checkbox"]').first();
            var otherCheckboxes = $('#<%=cblAdmissionItems.ClientID %> input[type="checkbox"]').not(':first');

            if ($(this).is(allCheckbox)) {
                // If "All" is clicked
                if ($(this).is(':checked')) {
                    otherCheckboxes.prop('checked', false);
                }
            } else {
                // If any other checkbox is clicked
                if ($(this).is(':checked')) {
                    allCheckbox.prop('checked', false);
                }

                // If no individual items are checked, check "All"
                if (otherCheckboxes.filter(':checked').length === 0) {
                    allCheckbox.prop('checked', true);
                }
            }
        });
    });

    function viewBooking(bookingId) {
        window.location.href = 'ViewBooking.aspx?id=' + bookingId;
        return false;
    }
</script>
</telerik:RadScriptBlock>

<telerik:RadScriptBlock runat="server">
<script type="text/javascript">
    function viewBooking(bookingId) {
        window.location.href = 'ViewBooking.aspx?id=' + bookingId;
        return false;
    }
</script>
</telerik:RadScriptBlock>


<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" Skin="Bootstrap" 
    OnNeedDataSource="RadGrid1_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound" 
    AllowPaging="True" PageSize="25" AllowSorting="True">
    
    <MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">
        <SortExpressions>
            <telerik:GridSortExpression FieldName="FirstActivityStart" SortOrder="Ascending" />
        </SortExpressions>

        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
            <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>

        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
            <HeaderStyle Width="20px"></HeaderStyle>
        </ExpandCollapseColumn>

        <Columns>
            <telerik:GridTemplateColumn HeaderText="Booking #" UniqueName="BookingNumber" SortExpression="BookingNumber" AllowSorting="true">
                <ItemTemplate>
                    <a href="ViewBooking.aspx?id=<%# Eval("ID") %>" class="btn btn-link btn-sm">
                        <strong><%# Eval("BookingNumber") %></strong>
                    </a>
                </ItemTemplate>
                <HeaderStyle Width="120px" />
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn HeaderText="Customer" UniqueName="Customer" SortExpression="Last_Name" AllowSorting="true">
                <ItemTemplate>
                    <div>
                        <strong><%# Eval("First_Name") %> <%# Eval("Last_Name") %>,</strong>
                        <small class="text-muted"><a href="mailto:<%# Eval("Email") %>"><%# Eval("Email") %></a></small>
                    </div>
                </ItemTemplate>
                <HeaderStyle Width="200px" />
            </telerik:GridTemplateColumn>
             <telerik:GridBoundColumn DataField="numPeople" HeaderText="People" 
     SortExpression="numPeople" UniqueName="numPeople" DataType="System.Int32">
     <HeaderStyle Width="70px" />
     <ItemStyle HorizontalAlign="Center" />
 </telerik:GridBoundColumn>
            <telerik:GridTemplateColumn HeaderText="Status" UniqueName="Status" SortExpression="Status" AllowSorting="true">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' CssClass="label"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="100px" />
            </telerik:GridTemplateColumn>
           
            <telerik:GridTemplateColumn HeaderText="Waivers" UniqueName="WaiverStatus" SortExpression="numPeopleMissingWaivers">
                <ItemTemplate>
                    <asp:Label ID="lblWaiverStatus" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="100px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridBoundColumn DataField="Activities" HeaderText="Activities" 
                SortExpression="Activities" UniqueName="Activities">
                <HeaderStyle Width="150px" />
            </telerik:GridBoundColumn>
            <telerik:GridTemplateColumn HeaderText="Activity Dates" UniqueName="ActivityPeriod" SortExpression="FirstActivityStart">
                <ItemTemplate>
                    <div>
                        <small class="text-muted">
                            <%# FormatActivityPeriod(Eval("FirstActivityStart"), Eval("LastActivityEnd"), Eval("ActivityDates")) %>
                        </small>
                    </div>
                </ItemTemplate>
                <HeaderStyle Width="150px" />
            </telerik:GridTemplateColumn>
            <telerik:GridBoundColumn DataField="DateCreated" DataType="System.DateTime" 
                HeaderText="Created" SortExpression="DateCreated" UniqueName="DateCreated"
                DataFormatString="{0:MM/dd/yyyy}">
                <HeaderStyle Width="100px" />
            </telerik:GridBoundColumn>
            <telerik:GridTemplateColumn HeaderText="Actions" UniqueName="Actions">
                <ItemTemplate>
                    <a href="ViewBooking.aspx?id=<%# Eval("ID") %>" class="btn btn-primary btn-sm" title="Manage booking" style="color:#fff;">
                       Manage
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
