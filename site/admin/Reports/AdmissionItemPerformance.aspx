<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdmissionItemPerformance.aspx.cs" Inherits="WaiverFile.site.admin.Reports.AdmissionItemPerformance" %>
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
                <i class="fa fa-star"></i> Admission Item Performance
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
                                <label>Date Range</label>
                                <asp:DropDownList runat="server" ID="cboDateRange" CssClass="form-control">
                                    <asp:ListItem Value="Today">Today</asp:ListItem>
                                    <asp:ListItem Value="Yesterday">Yesterday</asp:ListItem>
                                    <asp:ListItem Value="Last7Days">Last 7 Days</asp:ListItem>
                                    <asp:ListItem Value="Last30Days" Selected="True">Last 30 Days</asp:ListItem>
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
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Specific Item (Optional)</label>
                                <asp:DropDownList runat="server" ID="cboAdmissionItem" CssClass="form-control" DataValueField="ID" DataTextField="Name">
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
                                <i class="fa fa-ticket fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litTotalItems"></asp:Literal></div>
                                <div>Total Items</div>
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
                                <i class="fa fa-dollar fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litTotalRevenue"></asp:Literal></div>
                                <div>Total Revenue</div>
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
                                <i class="fa fa-calendar-check-o fa-5x"></i>
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
                <div class="panel panel-red">
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
        </div>

        <!-- Revenue Chart -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-pie-chart"></i> Revenue by Admission Item
                    </div>
                    <div class="panel-body">
                        <telerik:RadHtmlChart runat="server" ID="chartRevenue" Width="100%" Height="400px" Skin="Bootstrap">
                            <PlotArea>
                                <Series>
                                    <telerik:PieSeries DataFieldY="Revenue" NameField="ItemName">
                                        <LabelsAppearance DataFormatString="${0:N0}" Visible="true">
                                        </LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="${0:N2}" BackgroundColor="White"></TooltipsAppearance>
                                    </telerik:PieSeries>
                                </Series>
                            </PlotArea>
                            <Legend>
                                <Appearance Position="Right" />
                            </Legend>
                        </telerik:RadHtmlChart>
                    </div>
                </div>
            </div>
        </div>

        <!-- Top Performers -->
        <div class="row">
            <div class="col-lg-4">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <i class="fa fa-trophy"></i> Top Revenue Generator
                    </div>
                    <div class="panel-body">
                        <h3><asp:Literal runat="server" ID="litTopRevenueItem"></asp:Literal></h3>
                        <p class="text-muted"><asp:Literal runat="server" ID="litTopRevenueAmount"></asp:Literal></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <i class="fa fa-fire"></i> Most Popular Item
                    </div>
                    <div class="panel-body">
                        <h3><asp:Literal runat="server" ID="litMostPopularItem"></asp:Literal></h3>
                        <p class="text-muted"><asp:Literal runat="server" ID="litMostPopularCount"></asp:Literal> bookings</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <i class="fa fa-exclamation-triangle"></i> Highest Cancellation Rate
                    </div>
                    <div class="panel-body">
                        <h3><asp:Literal runat="server" ID="litHighestCancelItem"></asp:Literal></h3>
                        <p class="text-muted"><asp:Literal runat="server" ID="litHighestCancelRate"></asp:Literal>% cancelled</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Detailed Performance Grid -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-table"></i> Detailed Item Performance
                    </div>
                    <div class="panel-body">
                        <telerik:RadGrid runat="server" ID="rgItemPerformance" 
                            AllowSorting="True" 
                            AllowPaging="true" 
                            PageSize="25"
                            AutoGenerateColumns="False" 
                            OnNeedDataSource="rgItemPerformance_NeedDataSource"
                            OnItemDataBound="rgItemPerformance_ItemDataBound"
                            Skin="Bootstrap">
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ItemName" HeaderText="Admission Item" UniqueName="ItemName" SortExpression="ItemName"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Revenue" HeaderText="Revenue" UniqueName="Revenue" DataFormatString="{0:C2}" SortExpression="Revenue"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="OrderCount" HeaderText="Orders" UniqueName="OrderCount" DataFormatString="{0:N0}" SortExpression="OrderCount"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BookingCount" HeaderText="Bookings" UniqueName="BookingCount" DataFormatString="{0:N0}" SortExpression="BookingCount"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ParticipantCount" HeaderText="Participants" UniqueName="ParticipantCount" DataFormatString="{0:N0}" SortExpression="ParticipantCount"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AvgRevenuePerBooking" HeaderText="Avg Rev/Booking" UniqueName="AvgRevenuePerBooking" DataFormatString="{0:C2}" SortExpression="AvgRevenuePerBooking"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AvgParticipants" HeaderText="Avg Participants" UniqueName="AvgParticipants" DataFormatString="{0:N1}" SortExpression="AvgParticipants"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CancelledCount" HeaderText="Cancelled" UniqueName="CancelledCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="Cancel Rate" UniqueName="CancellationRate" SortExpression="CancellationRate">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCancelRate"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="RevenuePercent" HeaderText="% of Revenue" UniqueName="RevenuePercent" DataFormatString="{0:N1}%" SortExpression="RevenuePercent"></telerik:GridBoundColumn>
                                </Columns>
                                <PagerStyle Mode="NextPrevAndNumeric" />
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