<%@ Page Title="Daily Revenue & Orders Summary" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="DailyRevenue.aspx.cs" Inherits="WaiverFile.site.admin.Reports.DailyRevenue" %>
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
                <i class="fa fa-line-chart"></i> Daily Revenue & Orders Summary
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
                                <asp:DropDownList runat="server" ID="cboDateRange" CssClass="form-control" AutoPostBack="false">
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
                                <i class="fa fa-shopping-cart fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litOrderCount"></asp:Literal></div>
                                <div>Total Orders</div>
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
                                <i class="fa fa-money fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litGrossRevenue"></asp:Literal></div>
                                <div>Gross Revenue</div>
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
                                <i class="fa fa-credit-card fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litNetRevenue"></asp:Literal></div>
                                <div>Net Revenue</div>
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
                                <i class="fa fa-undo fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litRefundAmount"></asp:Literal></div>
                                <div>Refunds</div>
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
                        <h4>Average Order Value</h4>
                        <h2><asp:Literal runat="server" ID="litAOV"></asp:Literal></h2>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <h4>Total Tax Collected</h4>
                        <h2><asp:Literal runat="server" ID="litTotalTax"></asp:Literal></h2>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <h4>Processing Fees</h4>
                        <h2><asp:Literal runat="server" ID="litProcessingFees"></asp:Literal></h2>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <h4>Refund Count</h4>
                        <h2><asp:Literal runat="server" ID="litRefundCount"></asp:Literal></h2>
                    </div>
                </div>
            </div>
        </div>

        <!-- Daily Breakdown Grid -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-calendar"></i> Daily Breakdown
                    </div>
                    <div class="panel-body">
                        <telerik:RadGrid runat="server" ID="rgDailyBreakdown" 
                            AllowSorting="True" 
                            AllowPaging="true" 
                            PageSize="31"
                            AutoGenerateColumns="False" 
                            OnNeedDataSource="rgDailyBreakdown_NeedDataSource"
                            Skin="Bootstrap">
                            <MasterTableView>
                                <Columns>
                                     <telerik:GridTemplateColumn HeaderText="Date" UniqueName="OrderDate" SortExpression="OrderDate">
                                        <ItemTemplate>
                                            <a href='<%# GetOrdersLink(Eval("OrderDate")) %>'>
                                                <%# Eval("OrderDate", "{0:MM/dd/yyyy}") %>
                                            </a>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="DayOfWeek" HeaderText="Day" UniqueName="DayOfWeek"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="OrderCount" HeaderText="Orders" UniqueName="OrderCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="GrossRevenue" HeaderText="Gross Revenue" UniqueName="GrossRevenue" DataFormatString="{0:C2}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TaxAmount" HeaderText="Tax" UniqueName="TaxAmount" DataFormatString="{0:C2}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="RefundAmount" HeaderText="Refunds" UniqueName="RefundAmount" DataFormatString="{0:C2}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProcessingFees" HeaderText="Fees" UniqueName="ProcessingFees" DataFormatString="{0:C2}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="NetRevenue" HeaderText="Net Revenue" UniqueName="NetRevenue" DataFormatString="{0:C2}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AvgOrderValue" HeaderText="Avg. Order Value" UniqueName="AvgOrderValue" DataFormatString="{0:C2}"></telerik:GridBoundColumn>
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
