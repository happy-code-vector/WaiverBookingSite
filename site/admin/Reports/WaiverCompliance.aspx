<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WaiverCompliance.aspx.cs" Inherits="WaiverFile.site.admin.Reports.WaiverCompliance" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ph0" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">
                <div class="pull-right"><a href="ReportSelect.aspx" class="btn btn-muted btn-sm"><i class="fa fa-chevron-left"></i> &nbsp; Back to Reports</a></div>
                <i class="fa fa-file-text"></i> Waiver Compliance Report
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
                                <label>Date Range (Event Date)</label>
                                <asp:DropDownList runat="server" ID="cboDateRange" CssClass="form-control">
                                    <asp:ListItem Value="Today">Today</asp:ListItem>
                                    <asp:ListItem Value="Tomorrow">Tomorrow</asp:ListItem>
                                    <asp:ListItem Value="Next7Days" Selected="True">Next 7 Days</asp:ListItem>
                                    <asp:ListItem Value="Next30Days">Next 30 Days</asp:ListItem>
                                    <asp:ListItem Value="ThisMonth">This Month</asp:ListItem>
                                    <asp:ListItem Value="NextMonth">Next Month</asp:ListItem>
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
                                <label>Admission Item</label>
                                <asp:DropDownList runat="server" ID="cboAdmissionItem" CssClass="form-control" DataValueField="ID" DataTextField="Name">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Compliance Status</label>
                                <asp:DropDownList runat="server" ID="cboComplianceStatus" CssClass="form-control">
                                    <asp:ListItem Value="" Selected="True">All</asp:ListItem>
                                    <asp:ListItem Value="Compliant">Compliant (Has Waiver)</asp:ListItem>
                                    <asp:ListItem Value="Missing">Missing Waiver</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Person Types</label>
                                <telerik:RadListBox runat="server" ID="lstPersonTypes" 
                                    Height="120px" 
                                    Width="100%"
                                    SelectionMode="Multiple" 
                                    CheckBoxes="true"
                                    Skin="Bootstrap">
                                </telerik:RadListBox>
                                <small class="help-block">Uncheck all to show all types</small>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>&nbsp;</label><br />
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
    </div>

    <asp:Panel runat="server" ID="pnlResults" Visible="false">
        
        <!-- Summary Metrics Row -->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
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
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-check-circle fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litCompliant"></asp:Literal></div>
                                <div>Compliant</div>
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
                                <i class="fa fa-exclamation-triangle fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litMissing"></asp:Literal></div>
                                <div>Missing Waivers</div>
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
                                <i class="fa fa-percent fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><asp:Literal runat="server" ID="litComplianceRate"></asp:Literal></div>
                                <div>Compliance Rate</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Compliance Chart -->
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-pie-chart"></i> Compliance Overview
                    </div>
                    <div class="panel-body">
                        <telerik:RadHtmlChart runat="server" ID="chartCompliance" Width="100%" Height="300px" Skin="Bootstrap">
                            <PlotArea>
                                <Series>
                                    <telerik:PieSeries>
                                        <SeriesItems>
                                            <telerik:PieSeriesItem BackgroundColor="#5cb85c" Name="Compliant" Y="0" />
                                            <telerik:PieSeriesItem BackgroundColor="#d9534f" Name="Missing Waiver" Y="0" />
                                        </SeriesItems>
                                        <LabelsAppearance DataFormatString="{0}" Visible="true">
                                        </LabelsAppearance>
                                        <TooltipsAppearance DataFormatString="{0} participants" BackgroundColor="White"></TooltipsAppearance>
                                    </telerik:PieSeries>
                                </Series>
                            </PlotArea>
                            <Legend>
                                <Appearance Position="Bottom" />
                            </Legend>
                        </telerik:RadHtmlChart>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart"></i> Compliance by Admission Item
                    </div>
                    <div class="panel-body">
                        <telerik:RadHtmlChart runat="server" ID="chartByItem" Width="100%" Height="300px" Skin="Bootstrap">
                            <PlotArea>
                                <Series>
                                    <telerik:ColumnSeries Name="Compliant" DataFieldY="CompliantCount" Stacked="true">
                                        <Appearance>
                                            <FillStyle BackgroundColor="#5cb85c" />
                                        </Appearance>
                                        <TooltipsAppearance DataFormatString="{0} compliant" BackgroundColor="White"></TooltipsAppearance>
                                    </telerik:ColumnSeries>
                                    <telerik:ColumnSeries Name="Missing" DataFieldY="MissingCount" Stacked="true">
                                        <Appearance>
                                            <FillStyle BackgroundColor="#d9534f" />
                                        </Appearance>
                                        <TooltipsAppearance DataFormatString="{0} missing" BackgroundColor="White"></TooltipsAppearance>
                                    </telerik:ColumnSeries>
                                </Series>
                                <XAxis DataLabelsField="ItemName">
                                    <LabelsAppearance RotationAngle="45">
                                    </LabelsAppearance>
                                </XAxis>
                                <YAxis>
                                    <TitleAppearance Text="Participants">
                                    </TitleAppearance>
                                </YAxis>
                            </PlotArea>
                            <Legend>
                                <Appearance Position="Bottom" />
                            </Legend>
                        </telerik:RadHtmlChart>
                    </div>
                </div>
            </div>
        </div>

        <!-- Missing Waivers Alert -->
        <asp:Panel runat="server" ID="pnlMissingAlert" Visible="false">
            <div class="row">
                <div class="col-lg-12">
                    <div class="alert alert-danger">
                        <i class="fa fa-exclamation-triangle"></i> <strong>Action Required:</strong> 
                        <asp:Literal runat="server" ID="litMissingAlert"></asp:Literal> participants are missing waivers for upcoming events.
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Detailed Participant Compliance Grid -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-list"></i> Participant Compliance Details
                    </div>
                    <div class="panel-body">
                        <telerik:RadGrid runat="server" ID="rgParticipantCompliance" 
                            AllowSorting="True" 
                            AllowPaging="true" 
                            PageSize="50"
                            AutoGenerateColumns="False" 
                            OnNeedDataSource="rgParticipantCompliance_NeedDataSource"
                            OnItemDataBound="rgParticipantCompliance_ItemDataBound"
                            Skin="Bootstrap">
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="BookingNumber" HeaderText="Booking #" UniqueName="BookingNumber" SortExpression="BookingNumber"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EventDate" HeaderText="Event Date" DataFormatString="{0:MM/dd/yyyy}" UniqueName="EventDate" SortExpression="EventDate"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AdmissionItemName" HeaderText="Admission Items" UniqueName="AdmissionItemName" SortExpression="AdmissionItemName"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ParticipantCount" HeaderText="# Participants" UniqueName="ParticipantCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="Waiver Status" UniqueName="WaiverStatus" SortExpression="WaiverStatus">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblWaiverStatus"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="WaiverSignedDate" HeaderText="Last Signed Date" DataFormatString="{0:MM/dd/yyyy}" UniqueName="WaiverSignedDate"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CustomerEmail" HeaderText="Customer Email" UniqueName="CustomerEmail"></telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="Actions" UniqueName="Actions">
                                        <ItemTemplate>
                                            <asp:HyperLink runat="server" ID="lnkViewBooking" CssClass="btn btn-xs btn-primary" 
                                                NavigateUrl='<%# GetBookingUrl(Eval("BookingID")) %>'>
                                                <i class="fa fa-eye"></i> View Booking
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                                <PagerStyle Mode="NextPrevAndNumeric" />
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
            </div>
        </div>

        <!-- Compliance by Item Summary -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-table"></i> Compliance Summary by Admission Item
                    </div>
                    <div class="panel-body">
                        <telerik:RadGrid runat="server" ID="rgItemSummary" 
                            AllowSorting="True" 
                            AllowPaging="false" 
                            AutoGenerateColumns="False" 
                            OnNeedDataSource="rgItemSummary_NeedDataSource"
                            OnItemDataBound="rgItemSummary_ItemDataBound"
                            Skin="Bootstrap">
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ItemName" HeaderText="Admission Item" UniqueName="ItemName" SortExpression="ItemName"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalParticipants" HeaderText="Total Participants" UniqueName="TotalParticipants" DataFormatString="{0:N0}" SortExpression="TotalParticipants"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CompliantCount" HeaderText="Compliant" UniqueName="CompliantCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="MissingCount" HeaderText="Missing" UniqueName="MissingCount" DataFormatString="{0:N0}"></telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="Compliance Rate" UniqueName="ComplianceRate" SortExpression="ComplianceRate">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblComplianceRate"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
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