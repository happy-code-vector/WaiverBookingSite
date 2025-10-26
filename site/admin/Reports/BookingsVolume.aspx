<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="BookingsVolume.aspx.cs" Inherits="WaiverFile.site.admin.Reports.BookingsVolume" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">
                <div class="pull-right"><a href="ReportSelect.aspx" class="btn btn-muted btn-sm"><i class="fa fa-chevron-left"></i> &nbsp; Back to Reports</a></div>
                <i class="fa fa-calendar-check-o"></i> Bookings Volume & Attendance
            </h2>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-filter"></i> Report Filters
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Date Mode</label>
                                <asp:DropDownList runat="server" ID="cboDateMode" CssClass="form-control">
                                    <asp:ListItem Value="BookedOn" Selected="True">Booked On (Creation Date)</asp:ListItem>
                                    <asp:ListItem Value="TakesPlaceOn">Takes Place On (Event Date)</asp:ListItem>
                                </asp:DropDownList>
                                <small class="help-block">Choose whether to filter by when booking was created or when event occurs</small>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Date Range</label>
                                <asp:DropDownList runat="server" ID="cboDateRange" CssClass="form-control">
                                    <asp:ListItem Value="Today">Today</asp:ListItem>
                                    <asp:ListItem Value="Yesterday">Yesterday</asp:ListItem>
                                    <asp:ListItem Value="Last7Days" Selected="True">Last 7 Days</asp:ListItem>
                                    <asp:ListItem Value="Last30Days">Last 30 Days</asp:ListItem>
                                    <asp:ListItem Value="ThisMonth">This Month</asp:ListItem>
                                    <asp:ListItem Value="LastMonth">Last Month</asp:ListItem>
                                    <asp:ListItem Value="ThisYear">This Year</asp:ListItem>
                                    <asp:ListItem Value="LastYear">Last Year</asp:ListItem>
                                    <asp:ListItem Value="Custom">Custom Range</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-3 custom-date-fields" style="display:none;">
                            <div class="form-group">
                                <label>Start Date</label>
                                <telerik:RadDatePicker ID="dtStart" runat="server" Skin="Bootstrap" Width="100%">
                                    <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
                                    <DateInput CssClass="form-control" LabelWidth="40%">
                                        <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                        <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                        <FocusedStyle Resize="None"></FocusedStyle>
                                        <DisabledStyle Resize="None"></DisabledStyle>
                                        <InvalidStyle Resize="None"></InvalidStyle>
                                        <HoveredStyle Resize="None"></HoveredStyle>
                                        <EnabledStyle Resize="None"></EnabledStyle>
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker>
                            </div>
                        </div>
                        <div class="col-md-3 custom-date-fields" style="display:none;">
                            <div class="form-group">
                                <label>End Date</label>
                                <telerik:RadDatePicker ID="dtEnd" runat="server" Skin="Bootstrap" Width="100%">
                                    <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
                                    <DateInput CssClass="form-control" LabelWidth="40%">
                                        <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                        <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                        <FocusedStyle Resize="None"></FocusedStyle>
                                        <DisabledStyle Resize="None"></DisabledStyle>
                                        <InvalidStyle Resize="None"></InvalidStyle>
                                        <HoveredStyle Resize="None"></HoveredStyle>
                                        <EnabledStyle Resize="None"></EnabledStyle>
                                    </DateInput>
                                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                </telerik:RadDatePicker>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Admission Item</label>
                                <asp:DropDownList runat="server" ID="cboAdmissionItem" CssClass="form-control" DataValueField="ID" DataTextField="Name">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Booking Status</label>
                                <asp:DropDownList runat="server" ID="cboBookingStatus" CssClass="form-control">
                                    <asp:ListItem Value="" Selected="True">All Statuses</asp:ListItem>
                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                    <asp:ListItem Value="2">Completed</asp:ListItem>
                                    <asp:ListItem Value="3">Cancelled</asp:ListItem>
                                    <asp:ListItem Value="4">No Show</asp:ListItem>
                                    <asp:ListItem Value="5">Checked In</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Group By</label>
                                <asp:DropDownList runat="server" ID="cboGroupBy" CssClass="form-control">
                                    <asp:ListItem Value="Day" Selected="True">By Day</asp:ListItem>
                                    <asp:ListItem Value="Hour">By Hour</asp:ListItem>
                                    <asp:ListItem Value="DayOfWeek">By Day of Week</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <asp:LinkButton runat="server" ID="btnRunReport" CssClass="btn btn-primary" OnClick="btnRunReport_Click">
                                <i class="fa fa-play-circle"></i> Run Report
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnExportExcel" CssClass="btn btn-success" OnClick="btnExportExcel_Click">
                                <i class="fa fa-file-excel-o"></i> Export to Excel
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnExportCSV" CssClass="btn btn-default" OnClick="btnExportCSV_Click">
                                <i class="fa fa-file-text-o"></i> Export to CSV
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:Panel runat="server" ID="pnlResults" Visible="false">
        
        <!-- Summary Metrics Row -->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-calendar fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litTotalBookings"></asp:Literal></div>
                                <div>Total Bookings</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-users fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litTotalParticipants"></asp:Literal></div>
                                <div>Total Participants</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-check-circle fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litCheckedIn"></asp:Literal></div>
                                <div>Checked In</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-ban fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litNoShows"></asp:Literal></div>
                                <div>No Shows</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Additional Metrics Row -->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <h4>Avg Participants/Booking</h4>
                        <h2><asp:Literal runat="server" ID="litAvgParticipants"></asp:Literal></h2>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <h4>Attendance Rate</h4>
                        <h2><asp:Literal runat="server" ID="litAttendanceRate"></asp:Literal></h2>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <h4>No-Show Rate</h4>
                        <h2><asp:Literal runat="server" ID="litNoShowRate"></asp:Literal></h2>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <h4>Cancelled Bookings</h4>
                        <h2><asp:Literal runat="server" ID="litCancelled"></asp:Literal></h2>
                    </div>
                </div>
            </div>
        </div>

        <!-- Chart Visualization -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart"></i> <asp:Literal runat="server" ID="litChartTitle"></asp:Literal>
                    </div>
                    <div class="panel-body">
                        <telerik:RadHtmlChart runat="server" ID="chartBookings" Width="100%" Height="400px" Skin="Bootstrap">
                            <PlotArea>
                                <Series>
                                    <telerik:ColumnSeries Name="Bookings" DataFieldY="BookingCount">
                                        <LabelsAppearance Visible="true" DataFormatString="{0}">
                                        </LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="{0} bookings" BackgroundColor="White"></TooltipsAppearance>
                                    </telerik:ColumnSeries>
                                    <telerik:LineSeries Name="Participants" DataFieldY="ParticipantCount">
                                        <LabelsAppearance Visible="false">
                                        </LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="{0} participants" BackgroundColor="White"></TooltipsAppearance>
                                        <MarkersAppearance MarkersType="Circle" Size="8" />
                                    </telerik:LineSeries>
                                </Series>
                                <XAxis DataLabelsField="PeriodLabel">
                                    <LabelsAppearance RotationAngle="45">
                                    </LabelsAppearance>
                                </XAxis>
                                <YAxis>
                                    <TitleAppearance Text="Count">
                                    </TitleAppearance>
                                </YAxis>
                            </PlotArea>
                            <Legend>
                                <Appearance Position="Bottom" />
                            </Legend>
                            <ChartTitle Text="">
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                    </div>
                </div>
            </div>
        </div>

        <!-- Peak Times Panel (visible when grouping by hour) -->
        <asp:Panel runat="server" ID="pnlPeakTimes" Visible="false">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o"></i> Peak Times Analysis
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>Busiest Hour</h4>
                                    <p class="lead"><asp:Literal runat="server" ID="litBusiestHour"></asp:Literal></p>
                                </div>
                                <div class="col-md-4">
                                    <h4>Quietest Hour</h4>
                                    <p class="lead"><asp:Literal runat="server" ID="litQuietestHour"></asp:Literal></p>
                                </div>
                                <div class="col-md-4">
                                    <h4>Peak Capacity</h4>
                                    <p class="lead"><asp:Literal runat="server" ID="litPeakCapacity"></asp:Literal> participants</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Detailed Breakdown Grid -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-table"></i> Detailed Breakdown
                    </div>
                    <div class="panel-body">
                        <telerik:RadGrid runat="server" ID="rgBookingsBreakdown" 
                            AllowSorting="True" 
                            AllowPaging="true" 
                            PageSize="50"
                            AutoGenerateColumns="False" 
                            OnNeedDataSource="rgBookingsBreakdown_NeedDataSource"
                            Skin="Bootstrap">
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="PeriodLabel" HeaderText="Period" UniqueName="PeriodLabel"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BookingCount" HeaderText="Bookings" UniqueName="BookingCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ParticipantCount" HeaderText="Participants" UniqueName="ParticipantCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CheckedInCount" HeaderText="Checked In" UniqueName="CheckedInCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="NoShowCount" HeaderText="No Shows" UniqueName="NoShowCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CancelledCount" HeaderText="Cancelled" UniqueName="CancelledCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AttendanceRate" HeaderText="Attendance %" UniqueName="AttendanceRate" DataFormatString="{0:N1}%"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AvgParticipants" HeaderText="Avg Participants" UniqueName="AvgParticipants" DataFormatString="{0:N1}"></telerik:GridBoundColumn>
                                </Columns>
                                <PagerStyle Mode="NextPrevAndNumeric" />
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
            </div>
        </div>

        <!-- Top Admission Items -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-trophy"></i> Top Admission Items by Volume
                    </div>
                    <div class="panel-body">
                        <telerik:RadGrid runat="server" ID="rgTopAdmissionItems" 
                            AllowSorting="True" 
                            AllowPaging="false" 
                            AutoGenerateColumns="False" 
                            OnNeedDataSource="rgTopAdmissionItems_NeedDataSource"
                            Skin="Bootstrap">
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="AdmissionItemName" HeaderText="Admission Item" UniqueName="AdmissionItemName"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BookingCount" HeaderText="Bookings" UniqueName="BookingCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ParticipantCount" HeaderText="Participants" UniqueName="ParticipantCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PercentOfTotal" HeaderText="% of Total" UniqueName="PercentOfTotal" DataFormatString="{0:N1}%"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>

    <script type="text/javascript">
        $(document).ready(function () {
            // Show/hide custom date fields
            function toggleCustomDates() {
                if ($('#<%= cboDateRange.ClientID %>').val() === 'Custom') {
                    $('.custom-date-fields').show();
                } else {
                    $('.custom-date-fields').hide();
                }
            }

            toggleCustomDates();
            $('#<%= cboDateRange.ClientID %>').change(function () {
                toggleCustomDates();
            });
        });
    </script>

</asp:Content>
