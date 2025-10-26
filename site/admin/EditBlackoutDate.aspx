<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditBlackoutDate.aspx.cs" Inherits="WaiverFile.site.admin.EditBlackoutDate" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">



    

<script type="text/javascript">


    function ShowHideAllDay() {
        if ($('#<%=chkSpecifyTime.ClientID%>').is(':checked')) {
            $('#row_with_time').show();
            $('#row_all_day').hide();     

        } else {
            $('#row_with_time').hide();
            $('#row_all_day').show();    
            
            
        }
    }

    $(function () {
        //BEGIN - MOBILE NUMS
        ShowHideAllDay();
        $('#<%=chkSpecifyTime.ClientID%>').click(function () { ShowHideAllDay(); });
    });


        function showHidePastDatesWarning() {
            if (!$('#<%=chkSpecifyTime.ClientID%>').is(':checked')) {
                var selDate1 = $find("<%= dtDateStart2.ClientID %>");
                var selDate2 = $find("<%= dtDateEnd2.ClientID %>");

                var selDate1DT = selDate1.get_selectedDate();
                var selDate2DT = selDate2.get_selectedDate();

                var d = new Date();
                if (selDate1DT < d || selDate1DT < d) {
                    $('#pastdatewarning').show();
                } else {
                    $('#pastdatewarning').hide();
                }
            } else {
                var selDate1 = $find("<%= dtDateStart.ClientID %>");
                var selDate2 = $find("<%= dtDateEnd.ClientID %>");

                var selDate1DT = selDate1.get_selectedDate();
                var selDate2DT = selDate2.get_selectedDate();

                var d = new Date();
                if (selDate1DT < d || selDate1DT < d) {
                    $('#pastdatewarning').show();
                } else {
                    $('#pastdatewarning').hide();
                }
            }
        }
    function handleStartDate1(sender, eventArgs) {

        var newStart = eventArgs.get_newDate(); // Use this instead
        var oldStart = sender.get_selectedDate(); // Previous value

        if (!(newStart instanceof Date) || isNaN(newStart.getTime())) {
            return;
        }

        // Sync start date (for all-day date picker)
        var otherStart = $find("<%= dtDateStart2.ClientID %>");
    if (otherStart) {
        otherStart.set_selectedDate(newStart);
    }

    // Update end date if it's blank or equal to old start
        var endDate = $find("<%= dtDateEnd.ClientID %>");
        if (endDate) {
            var currentEnd = endDate.get_selectedDate();

            var shouldUpdateEnd =
                !currentEnd ||
                (currentEnd instanceof Date &&
                    oldStart instanceof Date &&
                    currentEnd.getTime() === oldStart.getTime());

            if (shouldUpdateEnd) {
                endDate.set_selectedDate(newStart);
            }
        }

        showHidePastDatesWarning();
    }

    function handleStartDate2(sender, eventArgs) {
        try {
            var newStart = eventArgs.get_newDate(); // Use this for RadDatePicker
            var oldStart = sender.get_selectedDate();

            if (!(newStart instanceof Date) || isNaN(newStart.getTime())) {
                return;
            }

            var otherStart = $find("<%= dtDateStart.ClientID %>");
        if (otherStart) {
            otherStart.set_selectedDate(newStart);
        }

            var endDate = $find("<%= dtDateEnd2.ClientID %>");
            if (endDate) {
                var currentEnd = endDate.get_selectedDate();

                var shouldUpdateEnd =
                    !currentEnd ||
                    (currentEnd instanceof Date &&
                        oldStart instanceof Date &&
                        currentEnd.getTime() === oldStart.getTime());

                if (shouldUpdateEnd) {
                    endDate.set_selectedDate(newStart);
                }
            }

        } catch (err) {
        }

        showHidePastDatesWarning();
    }



 function handleEndDate1(sender, eventArgs) {
     try {
         //CHANGE CORRESPONDING DATE. 
         var otherDate = $find("<%= dtDateEnd2.ClientID %>");
         var todaysDate = eventArgs.get_newValue();
         otherDate.set_selectedDate(eventArgs.get_newDate());
     }
     catch (err) { }
     showHidePastDatesWarning();
 }
 function handleEndDate2(sender, eventArgs) {
     try {
         //AUTO-SET THE END DATE WHEN YOU SELECT THE START DATE
         var otherDate = $find("<%= dtDateEnd.ClientID %>");
         var todaysDate = eventArgs.get_newValue();
         otherDate.set_selectedDate(eventArgs.get_newDate());
     }
     catch (err) { }
     showHidePastDatesWarning();
 }


 function changeEndDate(sender, eventArgs) {
     try {
         //AUTO-SET THE END DATE WHEN YOU SELECT THE START DATE
         var endDate = $find("<%= dtDateEnd.ClientID %>");
                var todaysDate = eventArgs.get_newValue();
                endDate.set_selectedDate(eventArgs.get_newDate());
            }
            catch (err) { }
        }
</script>


                
                <h3>Blackout Date</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
               

    
<div class="row" id="row_with_time">
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label" for="<%=dtDateStart.ClientID %>">Starts</label><br />
            <telerik:RadDateTimePicker ID="dtDateStart" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap" TimeView-Caption="" Calendar-CalendarCaption="" Width="100%">
                <TimePopupButton ImageUrl="" HoverImageUrl=""></TimePopupButton>
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
                <TimeView runat="server" CellSpacing="-1" Interval="00:30:00"></TimeView>
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
                <ClientEvents OnDateSelected="handleStartDate1" />
            </telerik:RadDateTimePicker>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label" for="<%=dtDateEnd.ClientID %>">Ends</label><br />
            <telerik:RadDateTimePicker ID="dtDateEnd" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap" TimeView-Caption="" Calendar-CalendarCaption="" Width="100%">
                <TimePopupButton ImageUrl="" HoverImageUrl=""></TimePopupButton>
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
                <TimeView runat="server" CellSpacing="-1" Interval="00:30:00"></TimeView>
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
                 <ClientEvents OnDateSelected="handleEndDate1" />
            </telerik:RadDateTimePicker>
        </div>
    </div>
</div>


<div class="row" id="row_all_day" style="display:block;">
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label" for="<%=dtDateStart2.ClientID %>">Starts</label><br />
            <telerik:RadDatePicker ID="dtDateStart2" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
               
                <DateInput CssClass="form-control"   LabelWidth="40%">
                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                    <FocusedStyle Resize="None"></FocusedStyle>
                    <DisabledStyle Resize="None"></DisabledStyle>
                    <InvalidStyle Resize="None"></InvalidStyle>
                    <HoveredStyle Resize="None"></HoveredStyle>
                    <EnabledStyle Resize="None"></EnabledStyle>
                </DateInput>
                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                <ClientEvents OnDateSelected="handleStartDate2" />
            </telerik:RadDatePicker>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label" for="<%=dtDateEnd2.ClientID %>">Ends</label><br />
            <telerik:RadDatePicker ID="dtDateEnd2" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap" Calendar-CalendarCaption="" Width="100%">
              
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
              
                <DateInput CssClass="form-control"   LabelWidth="40%">
                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                    <FocusedStyle Resize="None"></FocusedStyle>
                    <DisabledStyle Resize="None"></DisabledStyle>
                    <InvalidStyle Resize="None"></InvalidStyle>
                    <HoveredStyle Resize="None"></HoveredStyle>
                    <EnabledStyle Resize="None"></EnabledStyle>
                </DateInput>
                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                <ClientEvents OnDateSelected="handleEndDate2" />
            </telerik:RadDatePicker>
        </div>
    </div>
</div>

<div id="pastdatewarning" class="WPERR_Warning" style="display:none;">
    Warning: The selected date has already passed. 
</div>

<div class="form-group">
    <asp:CheckBox ID="chkSpecifyTime" runat="server" />
    Specify a Time
</div>

           
               
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />

            


</asp:Content>
