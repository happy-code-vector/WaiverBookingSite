<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverMonitorWithCheckin.ascx.cs" Inherits="WaiverFile.Controls.WaiverMonitorWithCheckin" %>

<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jquery-ui.min.js"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jquery.layout-latest.js"></script>

<script type="text/javascript">

    var checkinSelection = '<%=Session["DASH_CHECKIN_SELECTION"]%>';
    var reloadInterval;
    var reloadRate = 15000;

    $(document).ready(function () {
        var headerheight = $('.navbar-default').height();
        var w = $(window).height() - headerheight - 1;
        $("#monitormain").css('height', w);
        $(window).resize(function () {
            var w = $(window).height() - headerheight - 1;
            $("#monitormain").css('height', w);
        });

        ReloadData();
        reloadInterval = window.setInterval(ReloadData, reloadRate);


    });
    var pauseSync = 0;
    function stuckWarning() {
        if (pauseSync > 0) {
            var r = confirm("The dashboard is takign too long to refresh data. Do you want to reload the page?");
            if (r) {
                location.reload();
            }
        }
    }
   
    var alreadyBumped=false;
    function BumpReloadData() {
        if(alreadyBumped==false){
            alreadyBumped= true;
            window.setTimeout(function(){alreadyBumped=false;  }, 2000);
            window.clearInterval(reloadInterval);
            reloadInterval = window.setInterval(ReloadData, 2000);
            
        }
    }


    var reloadRunning = false;

    function ReloadData() {
       window.clearInterval(reloadInterval);
        reloadInterval = window.setInterval(ReloadData, reloadRate);
        
        if (reloadRunning == false) {
            reloadRunning = true;
            if (pauseSync == 0) {
                var genAdmGrouped = $('#<%=Get_chkGenAdmGroupedClientID()%>').is(':checked') ? 'true' : 'false';
                var evtsGrouped = $('#<%=Get_chkEventsGroupedClientID()%>').is(':checked') ? 'true' : 'false';
                var advanceGrouped = $('#<%=Get_chkAdvanceGroupedClientID()%>').is(':checked') ? 'true' : 'false';
                var genAdmView = $('#<%=Get_cboShowClientID()%>').val();
                var genAdmSort = 0;
                var evtsSort = '';//csv, id, sort, id sort...
                var advanceSort = 0;

                $('.sortactive[data-sortsect="EVT"]').each(function () {
                    var sortnum = 0;
                    if ($(this).hasClass('sortasc')) {
                        sortnum = $(this).data('sortasc');
                    } else if ($(this).hasClass('sortdesc')) {
                        sortnum = $(this).data('sortdesc');
                    }
                    if (evtsSort != '') { evtsSort += ','; }
                    evtsSort += $(this).data('eventid') + ',' + sortnum;
                });

                $('.sortactive[data-sortsect="GENADM"]').each(function () {
                    if ($(this).hasClass('sortasc')) {
                        genAdmSort = $(this).data('sortasc');
                    } else if ($(this).hasClass('sortdesc')) {
                        genAdmSort = $(this).data('sortdesc');
                    }
                });

                $('.sortactive[data-sortsect="ADVANCE"]').each(function () {
                    if ($(this).hasClass('sortasc')) {
                        advanceSort = $(this).data('sortasc');
                    } else if ($(this).hasClass('sortdesc')) {
                        advanceSort = $(this).data('sortdesc');
                    }
                });




                $.ajax({
                    type: "POST",
                    url: "/Controls/GetWaiverNames2.ashx",
                    data: { genAdmGrouped: genAdmGrouped, evtsGrouped: evtsGrouped, advanceGrouped: advanceGrouped, evtsSort: evtsSort, genAdmSort: genAdmSort, advanceSort: advanceSort, genAdmView: genAdmView },
                    success: function (dataRaw) {
                        if (dataRaw == 'ACCESS_DENIED') {
                            //USER LIKELY TIMED OUT. REDIRECT TO LOGIN PAGE.
                            window.location.replace("/Login.aspx?Source=/admin");
                        } else {
                            var data = $.parseJSON(dataRaw);

                            //GENADM
                            var newBody = '';
                            var hideExtra = false;
                            for (i = 0; i < data["GenAdm"].length; i++) {

                                var trClass = '';
                                var curr = data["GenAdm"][i]["ID"];
                                var prev = ''; var nextRow = '';
                                if (i != 0) { prev = data["GenAdm"][i - 1]["ID"]; }
                                if (i < data["GenAdm"].length - 1) { nextRow = data["GenAdm"][i + 1]["ID"]; }

                                if ($('#<%=Get_chkGenAdmGroupedClientID() %>').is(':checked')) {
                                    if (prev != curr && curr == nextRow) { trClass = "group-start"; }
                                    else if (curr != nextRow && curr == prev) { hideExtra = true; trClass = 'group-end'; }
                                    else if (curr == prev) { hideExtra = true; trClass = 'group'; }
                                    else { hideExtra = false; }
                                }



                                newBody += '<tr class="' + trClass + '"><td>';

                                //CHECKIN
                                newBody += '<input type="checkbox" class="checkin" value="' + data['GenAdm'][i]["PID"] + '" ';
                                if (data['GenAdm'][i]["IsCheckedIn"] == true) { newBody += ' checked="checked"'; }
                                newBody += " /></td><td>";

                                if (!hideExtra) { newBody += '<a href="/admin/ViewWaiver.aspx?id=' + data['GenAdm'][i]["ID"] + '">'; }
                                newBody += RenderName(data['GenAdm'][i]);
                                if (!hideExtra) { newBody += '</a>'; }
                                newBody += '</td><td class="text-center">' + (data['GenAdm'][i]['Age'] == 0 ? '' : data['GenAdm'][i]['Age']) + '</td>';
                                newBody += '<td class="text-center">';
                                if (!hideExtra) { newBody += timeSince(data['GenAdm'][i]['MinsElapsed']); }
                                newBody += '</td></tr>';

                                if (curr != nextRow && curr == prev) { hideExtra = false; }
                            }
                            $('#GENADM tbody').html(newBody);

                            //TOTAL LINE
                            var totalLine = '<div class="col-xs-4">Checked In: <strong>' + data["GenAdmCheckedIn"] + '</strong></div><div class="col-xs-4">Not Checked-In: <strong>' + (data["GenAdmTotal"] - data["GenAdmCheckedIn"]) + '</strong></div><div class="col-xs-4">Total: <strong>' + data["GenAdmTotal"] + '</strong></div>';
                            $('#GENADM tfoot tr td.totalcell').html(totalLine);
                            $('#GENADM tfoot tr').removeClass('sending');


                            //EVENTS

                            for (j = 0; j < data["Events"].length; j++) {
                                newBody = '';
                                for (i = 0; i < data["Events"][j]["WaiverLines"].length; i++) {

                                    var trClass = '';
                                    var curr = data["Events"][j]["WaiverLines"][i]["ID"];
                                    var prev = ''; var next = '';
                                    if (i != 0) { prev = data["Events"][j]["WaiverLines"][i - 1]["ID"]; }
                                    if (i < data["Events"][j]["WaiverLines"].length - 1) { next = data["Events"][j]["WaiverLines"][i + 1]["ID"]; }

                                    if ($('#<%= Get_chkEventsGroupedClientID() %>').is(':checked')) {
                                        if (prev != curr && curr == next) { trClass = "group-start"; }
                                        else if (curr != next && curr == prev) { hideExtra = true; trClass = 'group-end'; }
                                        else if (curr == prev) { hideExtra = true; trClass = 'group'; }
                                        else { hideExtra = false; }
                                    }


                                    newBody += '<tr class="' + trClass + '"><td>';

                                    //CHECKIN
                                    newBody += '<input type="checkbox" class="checkin" value="' + data["Events"][j]["WaiverLines"][i]["PID"] + '" ';
                                    if (data["Events"][j]["WaiverLines"][i]["IsCheckedIn"] == true) { newBody += ' checked="checked"'; }
                                    newBody += " /></td><td>";


                                    if (!hideExtra) { newBody += '<a href="/admin/ViewWaiver.aspx?id=' + data["Events"][j]["WaiverLines"][i]["ID"] + '">'; }
                                    newBody += RenderName(data["Events"][j]["WaiverLines"][i]);
                                    if (!hideExtra) { newBody += '</a>'; }
                                    newBody += '</td><td class="text-center">' + (data["Events"][j]["WaiverLines"][i]['Age'] == 0 ? '' : data["Events"][j]["WaiverLines"][i]['Age']) + '</td>';
                                    newBody += '<td class="text-center">';
                                    if (!hideExtra) { newBody += timeSince(data["Events"][j]["WaiverLines"][i]['MinsElapsed']); }
                                    newBody += '</td></tr>';

                                    if (curr != nextRow && curr == prev) { hideExtra = false; }
                                }
                                $('#' + data["Events"][j]["STRID"] + ' tbody').html(newBody);

                                //TOTAL LINE
                                var totalLine = '<div class="col-xs-4">Checked In: <strong>' + data["Events"][j]["CheckedIn"] + '</strong></div><div class="col-xs-4">Not Checked-In: <strong>' + (data["Events"][j]["Total"] - data["Events"][j]["CheckedIn"]) + '</strong></div><div class="col-xs-4">Total: <strong>' + data["Events"][j]["Total"] + '</strong></div>';
                                $('#' + data["Events"][j]["STRID"] + ' tfoot tr td.totalcell').html(totalLine);
                                $('#' + data["Events"][j]["STRID"] + ' tfoot tr').removeClass('sending');


                            }

                            //ADVANCE
                            newBody = '';
                            for (i = 0; i < data["Advance"].length; i++) {

                                var trClass = '';
                                var curr = data["Advance"][i]["ID"];
                                var prev = ''; var next = '';
                                if (i != 0) { prev = data["Advance"][i - 1]["ID"]; }

                                if (i < data["Advance"].length - 1) { next = data["Advance"][i + 1]["ID"]; }

                                if ($('#<%=Get_chkAdvanceGroupedClientID() %>').is(':checked')) {
                                    if (prev != curr && curr == next) { trClass = "group-start"; }
                                    else if (curr != next && curr == prev) { hideExtra = true; trClass = 'group-end'; }
                                    else if (curr == prev) { hideExtra = true; trClass = 'group'; }
                                    else { hideExtra = false; }
                                }


                                newBody += '<tr class="' + trClass + '"><td>';

                                //CHECKIN
                                newBody += '<input type="checkbox" class="checkin" value="' + data['Advance'][i]["PID"] + '" ';
                                if (data['Advance'][i]["IsCheckedIn"] == true) { newBody += ' checked="checked"'; }
                                newBody += " /></td><td>";

                                if (!hideExtra) { newBody += '<a href="/admin/ViewWaiver.aspx?id=' + data['Advance'][i]["ID"] + '">'; }
                                newBody += RenderName(data['Advance'][i]);
                                if (!hideExtra) { newBody += '</a>'; }
                                newBody += '</td><td class="text-center">' + (data['Advance'][i]['Age'] == 0 ? '' : data['Advance'][i]['Age']) + '</td>';
                                newBody += '<td class="text-center">';
                                if (!hideExtra) { newBody += timeSince(data['Advance'][i]['MinsElapsed']); }
                                newBody += '</td></tr>';

                                if (curr != nextRow && curr == prev) { hideExtra = false; }
                            }
                            $('#ADVANCE tbody').html(newBody);

                            //TOTAL LINE
                            var totalLine = '<div class="col-xs-4">Checked In: <strong>' + data["AdvanceCheckedIn"] + '</strong></div><div class="col-xs-4">Not Checked-In: <strong>' + (data["AdvanceTotal"] - data["AdvanceCheckedIn"]) + '</strong></div><div class="col-xs-4">Total: <strong>' + data["AdvanceTotal"] + '</strong></div>';
                            $('#ADVANCE tfoot tr td.totalcell').html(totalLine);
                            $('#ADVANCE tfoot tr').removeClass('sending');


                            //wire checkin boxes
                            $('.checkin').click(function () {
                                pauseSync++;
                                var stuck = window.setInterval(stuckWarning, 60000);
                                var tr = $(this).closest('tr');
                                tr.addClass('sending');

                                var tfoot = $(this).closest('table').find('tfoot tr').addClass('sending');

                                $.ajax({
                                    type: "POST",
                                    url: "/Controls/SetCheckin.ashx",
                                    data: { checked: $(this).is(":checked"), id: $(this).attr('value') },
                                    success: function (dataRaw) {
                                    },
                                    complete: function () {
                                        tr.removeClass('sending');
                                        pauseSync--;
                                        window.clearInterval(stuck);
                                        BumpReloadData();
                                    }

                                });




                            });
                        }
                    }


                });

            }
            reloadRunning = false;
        }
    }
    function RenderName(obj) {
        if (obj["First"] == '') {
            return obj["Last"];
        } else {
            return obj["Last"] + ', ' + obj["First"];
        }
    }


    function timeSince(minutes) {

        var seconds = minutes * 60;

        var interval = Math.floor(seconds / 31536000);

        if (interval > 1) {
            return interval + " year" + (interval==1 ? '' : 's') + " ago";
        }
        interval = Math.floor(seconds / 2592000);
        if (interval > 1) {
            return interval + " month" + (interval == 1 ? '' : 's') + " ago";
        }
        interval = Math.floor(seconds / 86400);
        if (interval > 1) {
            return interval + " day" + (interval == 1 ? '' : 's') + " ago";
        }
        interval = Math.floor(seconds / 3600);
        if (interval > 1) {
            return interval + " hour" + (interval == 1 ? '' : 's') + " ago";
        }
        interval = Math.floor(seconds / 60);
        if (interval > 1) {
            return interval + " minute" + (interval == 1 ? '' : 's') + " ago";
        }
        return "Just now";
    }



</script>

<asp:PlaceHolder ID="phWarnings" runat="server"></asp:PlaceHolder>

<asp:PlaceHolder ID="phMain" runat="server"></asp:PlaceHolder>

<asp:HiddenField ID="hfEventList" runat="server" />


