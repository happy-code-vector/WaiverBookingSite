<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverEvent.ascx.cs" Inherits="WaiverFile.Controls.FormWaiverEvent" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

   <link rel="stylesheet" href="/site/includes/intlTelInput.css">
  <script src="/site/includes/intlTelInput.min.js"></script>
    <script src="/site/includes/jquery.mask.min.js"></script>


<script type="text/javascript"> 
    function OnClientPasteHtml(sender, args) {
        var commandName = args.get_commandName();
        var value = args.get_value(); //this is the pasted content 
        if (commandName == "Paste") {
            if (value.indexOf('___') != -1) {
                $('#alertFields').fadeIn();
            } else {
                $('#alertFields').fadeOut('close');
            }
        }
    } 

    function OnClientCommandExecuting(editor, args) {
        var name = args.get_name();
        var val = args.get_value();

        if (name == "CODES") {
            editor.pasteHtml(val);
            //Cancel the further execution of the command as such a command does not exist in the editor command list        
            args.set_cancel(true);

            $('#aboutwaivertools').fadeIn();
        }

    }

    Telerik.Web.UI.Editor.CommandList["WaiverFileImage"] = function (commandName, editor, args) {
        var elem = editor.getSelectedElement(); //returns the selected element.
        var myCallbackFunction = function (sender, args) {
            editor.pasteHtml(String.format('<img src="{0}" class="waiverimage" alt="Image" />', args))
        }
        editor.showExternalDialog('/b/<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.Url%>/admin/Dialogs/ImageSelect.aspx', "", 585, 328, myCallbackFunction, null, 'Insert Image', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move, false, true);

         //leaving off here
         //make the handler
         //then look at some styles to control sizing

     };
</script> 

  <style type="text/css">
.reToolbar .WaiverFileImage
{
  background-image: url(/wp-content/Common/images/WaypointImage.gif) !important;
}
.reToolbar .WaypointFile
{
  background-image: url(/wp-content/Common/images/WaypointFile.gif) !important;
}
</style>


<script type="text/javascript">


    function ShowHideAllDay() {
        if ($('#<%=chkAllDayEvent.ClientID%>').is(':checked')) {
            $('#row_with_time').hide();
            $('#row_all_day').show();
        } else {
            $('#row_with_time').show();
            $('#row_all_day').hide();
        }
    }
    function ShowHideRecurrence() {
            <%if (pnlRecurExisting.Visible)
    {%>

            if ($('#<%=rbFuture.ClientID%>').is(':checked')) {
                $('.recurrencearea').each(function () { $(this).show(); });
            } else {
                $('.recurrencearea').each(function () { $(this).hide(); });
            }

            <%}
    else
    {%>

            if ($('#<%=chkThisTaskRecurs.ClientID%>').is(':checked')) {
                $('.recurrencearea').each(function () { $(this).show(); });
            } else {
                $('.recurrencearea').each(function () { $(this).hide(); });
            }

            <%}%>
    }
    function setHFForTab() {
        var target = '';
        target = $('#recurtabs li.active a').data('tabval');
        //var target = $(e.target).data("tabval") 
            $('#<%=hfTabSelect.ClientID%>').val(target);
    }

    function showManagerModal() {
        $('#modalAddSingle').modal('show');
        $('#modalAddSingle').on('hidden.bs.modal', function () {
            //GOT ANY ??? 
            
            if ($('#hfNewManagers').val() == '') {
                //$('#div_chk_invite').show();
                //$('#<%=chkInviteManagers.ClientID%>').prop('checked', false);
            } else {
                $('#div_chk_invite').hide();
            }


        })
    }

    $(function () {
        //BEGIN - MOBILE NUMS

        var phoneInputID = "#txtMobileNum";
        var input = document.querySelector("#txtMobileNum");
        var iti = window.intlTelInput(input, {
            formatOnDisplay: true,
            hiddenInput: "rawNum",
            initialCountry: "us",
            onlyCountries: ['us', 'ca'], //FOR NOW
            //preferredCountries: ['us', 'ca'],
            utilsScript: "/site/includes/utils.js",
        });
        $(phoneInputID).on('countrychange', function (e) {
            $('#<%=hfCountry.ClientID%>').val(iti.getSelectedCountryData().iso2);
            var selectedCountryData = iti.getSelectedCountryData();
            newPlaceholder = intlTelInputUtils.getExampleNumber(selectedCountryData.iso2, true, intlTelInputUtils.numberFormat.INTERNATIONAL),
                mask = newPlaceholder.replace(/[1-9]/g, "0");
            $(this).mask(mask);
        });
        iti.promise.then(function () {
            $(phoneInputID).trigger("countrychange");
        });
            //END - MOBILE 

            showHideInvite(true);
            $('#<%=chkInviteManagers.ClientID%>').click(function () { showHideInvite(false); });
            ShowHideRecurrence();
            $('#<%=chkThisTaskRecurs.ClientID%>').click(function () { ShowHideRecurrence(); });
            $('#<%=rbFuture.ClientID%>').click(function () { ShowHideRecurrence(); });
            $('#<%=rbThisInstance.ClientID%>').click(function () { ShowHideRecurrence(); });

            ShowHideAllDay();
            $('#<%=chkAllDayEvent.ClientID%>').click(function () { ShowHideAllDay(); });

            setHFForTab();
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                setHFForTab();
            });

        $('#btnPopAddManager').click(function () {
                //$('#modalAddSingle').modal('show');
            showManagerModal();
            });


        <% if (isExistingRecurrence) {  %>

            $('#<%=rngRBnoEnd.ClientID%>').click(function () { $('#range_alert').show(); });
            $('#<%=rngRBEndBy .ClientID%>').click(function () { $('#range_alert').show(); });
            $('#<%=rngRBEndAfter.ClientID%>').click(function () { $('#range_alert').show(); });
            $('#<%=rngTXTEndAfter_N.ClientID%>').keyup(function () { $('#range_alert').show(); });
            $('#<%=rngTXTEndAfter_N.ClientID%>').change(function () { $('#range_alert').show(); });

        <%}%>

            $('#btnAddManagerSingle').click(function () {
                $('#divErrAddManagerSingle').hide();

                var email = $('#txtAddMgrEmail').val().replace(/\|/g, '');

                if (email == '') {
                    //REQUIRED
                    $('#divErrAddManagerSingle').show();
                    $('#divErrAddManagerSingle').html('An email address is required');
                    return;
                }
                if (!isEmail(email)) {
                    $('#divErrAddManagerSingle').show();
                    $('#divErrAddManagerSingle').html('Invalid email address entered');
                    return;
                }

                var first = $('#txtAddMgrFirst').val().replace(/\|/g, '');
                var last = $('#txtAddMgrLast').val().replace(/\|/g, '');
                var phone = $('#txtMobileNum').val().replace(/\|/g, '');

                var combinedLine = first + '|' + last + '|' + phone + '|' + email + '|';

                $('#hfNewManagers').val($('#hfNewManagers').val() + combinedLine);

                $('#modalAddSingle').modal('hide');

                RenderNewManagerTable();

                //RESET FORM
                $('#txtAddMgrFirst').val('');
                $('#txtAddMgrLast').val('');
                $('#txtMobileNum').val('');
                $('#txtAddMgrEmail').val('');

            });
        
        <%=hfNewManagersPostbackHandle%>
        });

        function RenderNewManagerTable() {
            var splits = $('#hfNewManagers').val().split('|');
            for (let i = 0; i < splits.length; i += 4) {

                var first = splits[i];
                var last = splits[i + 1];
                var phone = splits[i + 2];
                var email = splits[i + 3];

                if (first != null && email != null && email!='' && email!='undefined') {
                    
                    var emailFound = false;
                    //does this row already exist? 
                    $("#tbodyNewUsers tr").each(function () {

                        var emailCell = $(this).find('td:eq(1)').html();

                        if (emailCell == email) {
                            emailFound = true;
                            //OVERWRITE OTHER STUFF IF NEEDED
                            $(this).find('td:eq(0)').html(first + ' ' + last);
                            $(this).find('td:eq(1)').html(email);
                            $(this).find('td:eq(2)').html(phone);
                            return;
                        }

                    });
                    if (!emailFound) {
                        $('#tbodyNewUsers').append('<tr><td>' + first + ' ' + last + '</td><td>' + email + '</td><td>' + phone + '</td><td> </td><td> </td><td><a href="javascript:void(0);" data-email="' + email + '" class="btnRemoveNewInvite">Remove</a></td></tr>');
                        wireRemoveButtons();
                    }
                }

            }


        }

        function wireRemoveButtons() {
            $('.btnRemoveNewInvite').click(function () {
                var emailToRemove = $(this).data('email');
                $("#tbodyNewUsers tr").each(function () {

                    var emailCell = $(this).find('td:eq(1)').html();
                    if (emailCell == emailToRemove) {
                        $(this).remove();
                    }
                });

                //REMOVE AND REBUILD THE SPLIT LIST
                var newcombinedVal = '';
                var splits = $('#hfNewManagers').val().split('|');
                    for (let i = 0; i < splits.length; i += 4) {
                        var email = splits[i + 3];
                        if (email != emailToRemove) {
                            var first = splits[i];
                            var last = splits[i + 1];
                            var phone = splits[i + 2];

                            newcombinedVal += first + '|' + last + '|' + phone + '|' + email + '|';
                        }
                    }
                $('#hfNewManagers').val(newcombinedVal);

            });
        }

        function isEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }

    var isFirstShowInvite = true;
        function showHideInvite(isOnload) {
            if (isOnload != true) {
                if (isFirstShowInvite) {
                    //isFirstShowInvite = false; //always true is ok now
                    //pop once
                    showManagerModal();
                    //$('#modalAddSingle').modal('show');

                   
                }
            }
            //div_chk_invite
            //div_invite
            if ($('#<%=chkInviteManagers.ClientID%>').is(':checked')) {
                $('#div_invite').show();
                $('#div_chk_invite').hide();
            } else {
                $('#div_chk_invite').show();
                $('#div_invite').hide();
            }
        }

        function showHidePastDatesWarning() {
            if ($('#<%=chkAllDayEvent.ClientID%>').is(':checked')) {
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
            try {
                //CHANGE CORRESPONDING DATE. 
                var otherDate = $find("<%= dtDateStart2.ClientID %>");
                var todaysDate = eventArgs.get_newValue();
                otherDate.set_selectedDate(eventArgs.get_newDate());

                //SET END DATE
                var endDate = $find("<%= dtDateEnd.ClientID %>");
                var todaysDate = eventArgs.get_newValue();
                endDate.set_selectedDate(eventArgs.get_newDate());
            }
            catch (err) { }
            showHidePastDatesWarning();
        }
        function handleStartDate2(sender, eventArgs) {
            try {
                //CHANGE CORRESPONDING DATE. 
                var otherDate = $find("<%= dtDateStart.ClientID %>");
                var todaysDate = eventArgs.get_newValue();
                otherDate.set_selectedDate(eventArgs.get_newDate());

                //SET END DATE
                var endDate = $find("<%= dtDateEnd2.ClientID %>");
                var todaysDate = eventArgs.get_newValue();
                endDate.set_selectedDate(eventArgs.get_newDate());
            }
            catch (err) { }
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

<asp:HiddenField ID="hfTabSelect" runat="server" />

<h3>Event</h3>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>


<div class="form-group">
    <label class="control-label" for="<%=txtName.ClientID %>">Event Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
</div>
<asp:Panel runat="server" ID="pnlLocation" CssClass="form-group">
    <label class="control-label" for="<%=txtLocation.ClientID %>">Location</label><asp:TextBox ID="txtLocation" CssClass="form-control" runat="server"></asp:TextBox>
</asp:Panel>

<asp:Panel runat="server" ID="pnlDescription" CssClass="form-group">

    <div class="form-group">
    <label>Description Page</label>
    <p class="help-block">This will appear as a separate page before the waiver is shown.</p>
        </div>

     <telerik:RadEditor id="reDescription"  OnClientPasteHtml="OnClientPasteHtml"
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True" OnClientCommandExecuting="OnClientCommandExecuting" 
             toolsfile="/wp-content/Plugins/WaiverFile/Docs/WaiverFileToolsNonWaiver.xml"
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />
        </telerik:RadEditor>

</asp:Panel>

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
    <asp:CheckBox ID="chkAllDayEvent" runat="server" />
    All Day Event
</div>

<div class="row">
<asp:Panel runat="server" ID="pnlCutoffDate" CssClass="col-sm-6">
    <div class="form-group">
    <label class="control-label" for="<%=dtCutoff.ClientID %>">Cutoff Date</label>
    <telerik:RadDateTimePicker ID="dtCutoff" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap" TimeView-Caption="" Calendar-CalendarCaption="" Width="100%">
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
                 
            </telerik:RadDateTimePicker>
    <p class="help-block">No more waivers will be collected after the cutoff time is reached.</p>
        </div>
</asp:Panel>


<asp:Panel runat="server" ID="pnlMaxParticipants" CssClass="col-sm-6">
    <div class="form-group">
    <label class="control-label" for="<%=txtMaxParticipants.ClientID %>">Maximum Participants</label><asp:TextBox ID="txtMaxParticipants" CssClass="form-control" runat="server"></asp:TextBox>
    <p class="help-block">Signing will be cut off when the maximum participant count is reached. <strong>* Note that the mobile app may allow additional signatures when operating offline</strong></p>
        </div>
</asp:Panel>
</div>



<div class="row">
    <div class="col-sm-6">
<div class="form-group">
    <label>Select Waivers:</label><br />

    <asp:CheckBoxList runat="server" ID="cblWaiverForms" RepeatLayout="UnorderedList" CssClass="list-unstyled">
    </asp:CheckBoxList>

</div>
       
        </div>
    
    <asp:Panel ID="pnlWorkflows" runat="server" CssClass="col-sm-6">
         <div class="form-group">
    <label>Select Workflows:</label><br />

    <asp:CheckBoxList runat="server" ID="cblWorkflows" RepeatLayout="UnorderedList" CssClass="list-unstyled">
    </asp:CheckBoxList>

</div>
    </asp:Panel>
    
    <div class="col-sm-6">

<asp:Panel CssClass="form-group"  ID="cboCatWrap" runat="server">
    <label for="<%=cboCategory.ClientID %>">Category</label>
    <asp:DropDownList runat="server" CssClass="form-control" ID="cboCategory"></asp:DropDownList>
</asp:Panel>
            </div>
    </div>




<div class="form-group" id="div_chk_invite">
    <asp:CheckBox runat="server" ID="chkInviteManagers" Text="Invite Managers" />
</div>
<div id="div_invite" class="well">
    <%if (phManagers.Controls.Count > 0)
    { %>
<div class="form-group">
    <div class="pull-right">
    <a href="javascript:void(0);" class="btn btn-primary btn-sm" id="btnPopAddManager"><i class="fa fa-plus-circle"></i> Add</a>
       </div>
    <h4>Invited Users</h4>
</div>
<% } %>

    <div class="form-group">
        <asp:PlaceHolder ID="phManagers" runat="server"></asp:PlaceHolder>
    </div>
   
      <div class="form-group">
        <label>Message:</label>
        <p class="help-block">Optional message to include in the invitation email.</p>
        <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="txtManagerMessage"></asp:TextBox>
    </div>
    
</div>









<asp:Panel ID="pnlRecurNew" runat="server">
    <div class="form-group">
        <asp:CheckBox ID="chkThisTaskRecurs" runat="server" Text="Make this a recurring event" />
        
    </div>


    

</asp:Panel>

<asp:Panel ID="pnlRecurExisting" runat="server">
    <div class="form-group">
        <label>This event is part of a recurring series.</label><br />

        <asp:RadioButton runat="server" ID="rbThisInstance" Checked="true" GroupName="EDIT_RECURRING" />
        Update only this instance<br />
        <asp:RadioButton runat="server" ID="rbFuture" GroupName="EDIT_RECURRING" />
        Update all upcoming events in this series
            
    </div>
</asp:Panel>


<div class="recurrencearea" style="display: none;">
    <asp:Panel ID="pnlTabs" runat="server">
    <div class="panel with-nav-tabs panel-default">
        <div class="panel-heading">
            <ul class="nav nav-tabs" id="recurtabs">
                <li class="<%if(recurrence.Frequency == WFCommon.WaiverEventRecurringBase.FrequencyEnum.Daily){  %> active<%} %>"><a data-toggle="tab" data-tabval="DAILY" href="#tab_daily">Daily</a></li>
                <li class="<%if(recurrence.Frequency == WFCommon.WaiverEventRecurringBase.FrequencyEnum.Weekly){  %> active<%} %>"><a data-toggle="tab" data-tabval="WEEKLY" href="#tab_weekly">Weekly</a></li>
                <li class="<%if(recurrence.Frequency == WFCommon.WaiverEventRecurringBase.FrequencyEnum.Monthly){  %> active<%} %>"><a data-toggle="tab" data-tabval="MONTHLY" href="#tab_monthly">Monthly</a></li>
                <li class="<%if(recurrence.Frequency == WFCommon.WaiverEventRecurringBase.FrequencyEnum.Yearly){  %> active<%} %>"><a data-toggle="tab" data-tabval="YEARLY" href="#tab_yearly">Yearly</a></li>
            </ul>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div id="tab_daily" class="tab-pane fade in <%if(recurrence.Frequency == WFCommon.WaiverEventRecurringBase.FrequencyEnum.Daily){  %> active<%} %>">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group form-inline">
                                <asp:RadioButton ID="dlyRBEveryNthDay" runat="server" GroupName="daily" Checked="True"></asp:RadioButton>&nbsp;Every
                <asp:TextBox ID="dlyTXT_N" runat="server" CssClass="form-control"  Width="54px"></asp:TextBox>&nbsp;day(s)</div><div class="form-group">
                                <asp:RadioButton ID="dlyRBEveryWeekday" runat="server" GroupName="daily"></asp:RadioButton>&nbsp;Every weekday
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab_weekly" class="tab-pane fade in <%if(recurrence.Frequency == WFCommon.WaiverEventRecurringBase.FrequencyEnum.Weekly){  %> active<%} %>">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group form-inline">
                                Recur every
                <asp:TextBox ID="wkyTXT_N" runat="server" CssClass="form-control"  Width="54px"></asp:TextBox>&nbsp;week(s) on:</div><div class="form-group">
                                <asp:CheckBoxList ID="wkyCBLdays" runat="server" RepeatLayout="UnorderedList" CssClass="list-inline">
                                    <asp:ListItem>Sunday</asp:ListItem>
                                    <asp:ListItem>Monday</asp:ListItem>
                                    <asp:ListItem>Tuesday</asp:ListItem>
                                    <asp:ListItem>Wednesday</asp:ListItem>
                                    <asp:ListItem>Thursday</asp:ListItem>
                                    <asp:ListItem>Friday</asp:ListItem>
                                    <asp:ListItem>Saturday</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab_monthly" class="tab-pane fade in <%if(recurrence.Frequency == WFCommon.WaiverEventRecurringBase.FrequencyEnum.Monthly){  %> active<%} %>">
                    <div class="row">
                        <div class="col-xs-12 form-inline">
                            <div class="form-group ">
                                <asp:RadioButton ID="mthRBdayofmonth" runat="server" GroupName="monthly" Checked="True"></asp:RadioButton>&nbsp;Day
                <asp:TextBox ID="mthTXT_Nday" runat="server"  CssClass="form-control"  Width="54px"></asp:TextBox>&nbsp;of every
                <asp:TextBox ID="mthTXT_Nmonth" runat="server"  CssClass="form-control"  Width="54px"></asp:TextBox>&nbsp;month(s)</div><div class="form-group">
                                <asp:RadioButton ID="mthRBNthDayOfMonth" runat="server" GroupName="monthly"></asp:RadioButton>&nbsp;The
                <asp:DropDownList ID="mthCBO_nthday" runat="server" CssClass="form-control">
                    <asp:ListItem>first</asp:ListItem>
                    <asp:ListItem>second</asp:ListItem>
                    <asp:ListItem>third</asp:ListItem>
                    <asp:ListItem>fourth</asp:ListItem>
                    <asp:ListItem>last</asp:ListItem>
                </asp:DropDownList>&nbsp;<asp:DropDownList ID="mthCBOdaytype" runat="server" CssClass="form-control">
                    <asp:ListItem>day</asp:ListItem>
                    <asp:ListItem>weekday</asp:ListItem>
                    <asp:ListItem>weekend day</asp:ListItem>
                    <asp:ListItem>Sunday</asp:ListItem>
                    <asp:ListItem>Monday</asp:ListItem>
                    <asp:ListItem>Tuesday</asp:ListItem>
                    <asp:ListItem>Wednesday</asp:ListItem>
                    <asp:ListItem>Thursday</asp:ListItem>
                    <asp:ListItem>Friday</asp:ListItem>
                    <asp:ListItem>Saturday</asp:ListItem>
                </asp:DropDownList>&nbsp;of every
                <asp:TextBox ID="mthTXT_Nmonth2" runat="server" Width="54px" CssClass="form-control"></asp:TextBox>&nbsp;month(s)
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab_yearly" class="tab-pane fade in <%if(recurrence.Frequency == WFCommon.WaiverEventRecurringBase.FrequencyEnum.Yearly){  %> active<%} %>">
                    <div class="row">
                        <div class="col-xs-12 form-inline">
                            <div class="form-group">
                                <asp:RadioButton ID="yrlRBOneDay" runat="server" GroupName="yearly" Checked="True"></asp:RadioButton>&nbsp;Every&nbsp;<asp:DropDownList ID="yrlCBOmonth" runat="server" CssClass="form-control">
                                    <asp:ListItem>January</asp:ListItem>
                                    <asp:ListItem>February</asp:ListItem>
                                    <asp:ListItem>March</asp:ListItem>
                                    <asp:ListItem>April</asp:ListItem>
                                    <asp:ListItem>May</asp:ListItem>
                                    <asp:ListItem>June</asp:ListItem>
                                    <asp:ListItem>July</asp:ListItem>
                                    <asp:ListItem>August</asp:ListItem>
                                    <asp:ListItem>September</asp:ListItem>
                                    <asp:ListItem>October</asp:ListItem>
                                    <asp:ListItem>November</asp:ListItem>
                                    <asp:ListItem>December</asp:ListItem>
                                </asp:DropDownList>&nbsp;<asp:TextBox ID="yrlTXT_Nday" runat="server" CssClass="form-control" Width="54px"></asp:TextBox></div><div class="form-group">
                                <asp:RadioButton ID="yrlRBNthDayOfMonth" runat="server" GroupName="yearly"></asp:RadioButton>&nbsp;The&nbsp;<asp:DropDownList ID="yrlCBO_nthday" runat="server" CssClass="form-control">
                                    <asp:ListItem>first</asp:ListItem>
                                    <asp:ListItem>second</asp:ListItem>
                                    <asp:ListItem>third</asp:ListItem>
                                    <asp:ListItem>fourth</asp:ListItem>
                                    <asp:ListItem>last</asp:ListItem>
                                </asp:DropDownList>&nbsp;<asp:DropDownList ID="yrlCBOdaytype" runat="server" CssClass="form-control">
                                    <asp:ListItem>day</asp:ListItem>
                                    <asp:ListItem>weekday</asp:ListItem>
                                    <asp:ListItem>weekend day</asp:ListItem>
                                    <asp:ListItem>Sunday</asp:ListItem>
                                    <asp:ListItem>Monday</asp:ListItem>
                                    <asp:ListItem>Tuesday</asp:ListItem>
                                    <asp:ListItem>Wednesday</asp:ListItem>
                                    <asp:ListItem>Thursday</asp:ListItem>
                                    <asp:ListItem>Friday</asp:ListItem>
                                    <asp:ListItem>Saturday</asp:ListItem>
                                </asp:DropDownList>&nbsp;of&nbsp;<asp:DropDownList ID="yrlCBOmonth2" runat="server" CssClass="form-control">
                                    <asp:ListItem>January</asp:ListItem>
                                    <asp:ListItem>February</asp:ListItem>
                                    <asp:ListItem>March</asp:ListItem>
                                    <asp:ListItem>April</asp:ListItem>
                                    <asp:ListItem>May</asp:ListItem>
                                    <asp:ListItem>June</asp:ListItem>
                                    <asp:ListItem>July</asp:ListItem>
                                    <asp:ListItem>August</asp:ListItem>
                                    <asp:ListItem>September</asp:ListItem>
                                    <asp:ListItem>October</asp:ListItem>
                                    <asp:ListItem>November</asp:ListItem>
                                    <asp:ListItem>December</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    </asp:Panel>




        <div class="form-group">
            <label>Range of recurrence</label>
            
            
        </div>
    <div id="range_alert" class="alert alert-info" role="alert" style="display:none;">
        Changing the range may add or remove upcoming events. Any events that have signed waivers will be left in place. 
    </div>
        <div class="form-group form-inline">
            <asp:RadioButton ID="rngRBnoEnd" runat="server" GroupName="range" Checked="True" /> No end date
         </div> <div class="form-group form-inline">
             <asp:RadioButton ID="rngRBEndAfter" runat="server" GroupName="range" /> End after: 
            <asp:TextBox ID="rngTXTEndAfter_N" runat="server"  Width="54px" CssClass="form-control"></asp:TextBox>  occurrences
        </div> <div class="form-group form-inline">
             <asp:RadioButton ID="rngRBEndBy" runat="server" GroupName="range" />  End by:
             <telerik:RadDatePicker ID="dtRecurringEndBy" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="">
              
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
               
                <DateInput CssClass="form-control" DisplayDateFormat="M/d/yy" DateFormat="M/d/yy" LabelWidth="40%">
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



<div class="form-group">

    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
</div>



<asp:HiddenField runat="server" ID="hfNewManagers" ClientIDMode="Static" />

<!-- Modal - add single manager -->
<div class="modal fade" id="modalAddSingle" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Manager</h4>
      </div>
      <div class="modal-body">
        
          <div id="divErrAddManagerSingle" class="text-danger"></div>
          <div class="form-group">
              <label>First Name</label>
              <input type="text" class="form-control" id="txtAddMgrFirst" />
          </div>
          <div class="form-group">
              <label>Last Name</label>
              <input type="text" class="form-control" id="txtAddMgrLast" />
          </div>
          <div class="form-group">
              <label>Email Address <span class="text-danger">*</span></label>
              <input type="email" class="form-control" id="txtAddMgrEmail" />
          </div>

          <div class="form-group">
                <label for="txtMobileNum" class="control-label">Mobile Number
                </label>
                    <div style="">
                        <input type="tel" class="form-control" id="txtMobileNum" />
                    <asp:HiddenField runat="server" ID="hfCountry" />
                    
                        </div>
              </div>
          <p class="help-block">By adding a mobile number, you agree that you have permission to send SMS messages to this number and agree to our <a href="https://www.waiverfile.com/Policies/Messaging-Policy.aspx" target="_blank">Messaging policy <i class="fa fa-external-link"></i></a>. </p>
          
      </div>
      <div class="modal-footer">
          <a href="javascript:void(0);" id="btnAddManagerSingle" class="btn btn-primary">Add</a>
      </div>
    </div>
  </div>
</div>



<!-- Modal - add single manager -->
<div class="modal fade" id="modalAddMultiple" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="deleteModalLabel">Add Manager</h4>
      </div>
      <div class="modal-body">
       

      </div>
      <div class="modal-footer">
          <a href="javascript:void(0);" id="btnAddManagerMultiple" class="btn btn-primary">Add</a>
      </div>
    </div>
  </div>
</div>