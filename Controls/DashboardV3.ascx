<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashboardV3.ascx.cs" Inherits="WaiverFile.Controls.DashboardV3" %>


<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jquery-ui.min.js"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jquery.layout-latest.js"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jquery.blockUI.js"></script>

<script type="text/javascript">

    var colsToHideAfterFirstInGroup = [
        'SigneeLast',
        'SigneeFirst',
        'MinsElapsed',
        'Age', 'SignedLastFirst__LINKED'
        , 'SignedFirstLast__LINKED'
        , 'SignedLastFirst'
        , 'SignedFirstLast'
        , 'SignedNameFirst'
        , 'SignedName'
        ,'minutesSinceSigning'
    ];
    var reloadInterval;
    var reloadRate = 20000;
    var initData = <%=strInitData%>;
    var isInitialLoad = true;

    $(document).ready(function () {
        var headerheight = $('.navbar-default').height();
        var w = $(window).height() - headerheight - 1;
        $("#dashmain").css('height', w);
        $(window).resize(function () {
            var w = $(window).height() - headerheight - 1;
            $("#dashmain").css('height', w);
        });
 
        ReloadData(true, '', '');
        //reloadInterval = window.setInterval(ReloadData, reloadRate);
        reloadInterval = window.setInterval(ReloadData, reloadRate);
        LoadEvents();

        BindSortClick();
        BindGroupedClick();
        BindShowChange();
    });
    function BindShowChange() {
        $('.cboShow').change(function () {
            $(this).closest('.ui-layout-pane').block({
                message: '<h4>Loading...</h4>',
                css: {}
            });
            SetShow(boxid = $(this).parents('.dashbox').data('dashboxid'), $(this).val());
        });
    }
    function BindGroupedClick() {
        $('.chkGrouped input').click(function () {
            $(this).closest('.ui-layout-pane').block({
                message: '<h4>Loading...</h4>',
                css: {}
            });
                SetGrouped(boxid = $(this).parents('.dashbox').data('dashboxid'), $(this).is(':checked'));
        });
    }
    function BindSortClick() {
        $('.dashsort').unbind('click'); //PREVENT MULTIPLE BINDINGS
        $('.dashsort').click(function () {
            var fieldName = $(this).data('fieldname');
            var sortDir = $(this).data('sortdirection');
            var boxid = $(this).parents('.dashbox').data('dashboxid');
            var evtid = $(this).parents('table').data('eventid');

            $(this).parents('.dashbox').block({
                message: '<h4>Loading...</h4>',
                css: {  }
            });

            //REMOVE ALL SORT CLASSES, THEN RE-ADD THE ONES JUST FOR THIS COL
            $(this).parents('table').find('.dashsort').each(function () {
                $(this).removeClass('sortasc');
                $(this).removeClass('sortdesc');
                $(this).removeClass('sortactive');
            });

            $(this).addClass('sortactive');
            if (sortDir == 'Ascending') {
                sortDir = 'Descending';
                $(this).addClass('sortdesc');

            } else {
                sortDir = 'Ascending';
                $(this).addClass('sortasc');
            }
            $(this).data('sortdirection', sortDir);

            SetSort(boxid, evtid, sortDir, fieldName);

        });
    }

    
    function LoadEvents() {
        var evtBox = $('#dashmain').find(".dashbox[data-dashboxtype='Events'] tbody");
        var evtHead = $('#dashmain').find(".dashbox[data-dashboxtype='Events'] thead");
        evtHead.hide();

        //GET NUMBER OF COLUMNS
        var colCount = 0;
        $(evtBox).parent().find('tr:nth-child(1) td').each(function () {
            if ($(this).attr('colspan')) {
                colCount += +$(this).attr('colspan');
            } else {
                colCount++;
            }
        });

        var newHtml = '';
        for (var i = 0; i < initData["EVENTS"].length; i++) {
            newHtml += '<tr><td colspan="' + colCount + '" style="padding:0;"><table width="100%" class="table table-condensed dasheventinner" data-eventid="' + initData["EVENTS"][i]["WaiverEventID"] + '"><thead>';
            newHtml += '<tr data-eventid="' + initData["EVENTS"][i]["WaiverEventID"] + '"><th colspan="' + colCount + '" class="dashboxeventhead">'
                + '<div class="pull-right dashboxevtbuttons"><a href="<%=site.BasePathRelative%>/admin/EditWaiverEvent.aspx?id=' + initData["EVENTS"][i]["WaiverEventID"] + '"><i class="fa fa-pencil"> </i> Edit</a>'
                + '<a href="<%=site.BasePathRelative%>/admin/PrintEvent.aspx?id=' + initData["EVENTS"][i]["WaiverEventID"] + '" target="_blank"><i class="fa fa-print"> </i> Print</a></div>'
                + '<h5><a href="<%=site.BasePathRelative%>/admin/EventSignatures.aspx?id=' + initData["EVENTS"][i]["WaiverEventID"] + '" target="_blank">' + initData["EVENTS"][i]["name"] + ' - ' + initData["EVENTS"][i]["DisplayDate"] + '</h5>'
                + '</th></tr>';
            newHtml += $(evtHead).html();
            newHtml += '</thead>'
            newHtml += '<tbody data-eventid="' + initData["EVENTS"][i]["WaiverEventID"] + '" class="dashboxbodyevt">'
            newHtml += '</tbody>'
            newHtml += '<tfoot>'
            newHtml += '<tr><td colspan="' + colCount + '" class="dashboxfooter EVENTS"></td></tr>';
            newHtml += '</tfoot></table></td></tr>';
        }
        if (initData["EVENTS"].length==0){
            newHtml += '<tr><td colspan="' + colCount + '" class="text-center"><em>You have no upcoming events</em></td></tr>';
        }
        evtBox.html(newHtml);
    }
    var pauseSync = 0;
    function stuckWarning() {
        if (pauseSync > 0) {
            var r = confirm("The dashboard is taking too long to refresh data. Do you want to reload the page?");
            if (r) {
                location.reload();
            }
        }
    }
   
    var alreadyBumped=false;
    function BumpReloadData(clearRowsFirst, boxid, evtid) {
        if(alreadyBumped==false){
            alreadyBumped = true;
            if (clearRowsFirst) {
                ClearRowsForRefresh(boxid, evtid);
                //LoadEvents();
            }
            window.setTimeout(function(){alreadyBumped=false;  }, 2000);
            window.clearInterval(reloadInterval);
            reloadInterval = window.setInterval(function () { ReloadData(clearRowsFirst, boxid, evtid); }, 2000);
            
        }
    }

    function ClearRowsForRefresh(boxid, evtid) {
        //clear all the rows so new data will reload again. do this whenever sorting

        var boxSelector = '';
        if (boxid != '') {
            boxSelector = '.dashboxmain[data-dashboxid="' + boxid + '"] ';
        }
        if (evtid != '' && evtid!=null) {
            boxSelector += ' tbody[data-eventid="' + evtid + '"] tr';
            ClearRowsForRefreshSelected(boxSelector);
        } else {
            ClearRowsForRefreshSelected(boxSelector + ' .dashboxbody tr');
            ClearRowsForRefreshSelected(boxSelector + ' .dashboxbodyevt tr');
        }
    }

    function ClearRowsForRefreshSelected(selector) {
        $(selector).each(function () {
            $(this).addClass('removeme');
            /*if (!$(this).hasClass('loadingrow')) {

                $(this).remove();
            } else {
                $(this).show();
            }*/
        });
    }

    function ChangeCheckinSelection(newChoice) {
        $('#main-content-area').block({
            message: '<h4>Loading...</h4>',
            css: {}
        });
        BumpReloadData(true, '', '');
    }

    var reloadRunning = false;

    function HandleDataResult(data, boxes) {
        $('.sending').each(function () { $(this).removeClass('sending');})
        $('.removeme').each(function () { $(this).remove(); });

        
        for (id in data) {
            if (id.substring(0, 4) == 'EVT_') {
                BuildBoxDataEvent(data[id], boxes, $('.dasheventinner[data-eventid="' + id.substring(4, 40) + '"]').parents('.dashbox').data('dashboxid')  , id.substring(4, 40));
            }
            else if (id.substring(0, 4) == 'meta') {
                ProcessMeta(data[id]);
            }
            else {
                BuildBoxData(data[id], boxes, id);
            }
        }
        
        $('.dashbox').each(function () { $(this).unblock(); });
        $('.ui-layout-pane').each(function () { $(this).unblock(); });
        $('#main-content-area').unblock();

        $('.checkin').each(function () {
            $(this).removeAttr('disabled');
            $(this).parents('tr').removeClass('text-muted');
        });
        BindSortClick();

        $('.checkin').unbind('click'); //PREVENT MULTIPLE BINDINGS
        $('.checkin').click(function () {
            $(this).attr('disabled', 'true');
            $(this).parents('tr').addClass('text-muted');
            pauseSync++;
            var stuck = window.setInterval(stuckWarning, 60000);

            var tfoot = $(this).parents('.ui-layout-content').siblings('.dashboxfooter');
            tfoot.addClass('sending');

            var thecheckbox = $(this);

            $.ajax({
                type: "POST",
                url: "/Controls/SetCheckin.ashx",
                data: { siteid:'<%=site.ID%>', checked: $(this).is(":checked"), id: $(this).attr('value') },
                success: function (dataRaw) {
                },
                complete: function () {
                    pauseSync--;
                    window.clearInterval(stuck);
                    BumpReloadData(false, '', '');

                    var checkinView = $('.cboCheckinSelection').val();

                    //REMOVE THE ROW IF IT SHOULD DISAPPEAR
                    if ((thecheckbox.is(':checked') && checkinView == 'NOT_CHECKED_IN')
                        || (!(thecheckbox.is(':checked')) && checkinView == 'CHECKED_IN')
                    ) {
                        //REMOVE THE ROW
                        thecheckbox.parent().parent().fadeOut();
                    }
                   
                }

            });

         


        });

       
    }

    function SetSort(dashBoxId, eventID, direction, fieldName) {

        $.ajax({
            type: "POST",
            url: "/Controls/DashboardV3Util.ashx",
            data: { cmd: "SET_SORT", dashid: '<%=dash.ID%>', dashboxid: dashBoxId, eventid:eventID, direction:direction, fieldname:fieldName },
                success: function (dataRaw) {
                    BumpReloadData(true, dashBoxId, eventID);
                },
                complete: function () {
                }
         });
    }
    function SetShow(dashBoxId, show) {
        
        $.ajax({
            type: "POST",
            url: "/Controls/DashboardV3Util.ashx",
            data: { cmd: "SET_SHOW", dashid: '<%=dash.ID%>', dashboxid: dashBoxId, show: show },
            success: function (dataRaw) {
                BumpReloadData(true, dashBoxId, '');
            },
            complete: function () {
            }
        });
     }
    function SetGrouped(dashBoxId, grouped) {
        $.ajax({
            type: "POST",
            url: "/Controls/DashboardV3Util.ashx",
            data: { cmd: "SET_GROUPED", dashid: '<%=dash.ID%>', dashboxid: dashBoxId, grouped: grouped },
            success: function (dataRaw) {
                BumpReloadData(true, dashBoxId, '');
            },
            complete: function () {
            }
         });
    }
    function ProcessMeta(data, boxid) {
        for (var i = 0; i < data.length; i++) {
            var theBoxFooter;
            if (data[i]["EventID"] == '00000000-0000-0000-0000-000000000000') {
                theBoxFooter = $('#dashmain').find(".dashboxfooter[data-dashboxid='" + data[i]["BoxID"] + "']");
            } else {
                theBoxFooter = $('#dashmain').find(".dashbox[data-dashboxid='" + data[i]["BoxID"] + "'] table[data-eventid='" + data[i]["EventID"] + "'] tfoot tr td.dashboxfooter");
            }
             
            //var eventID = $('#dashmain').find(".dashbox[data-dashboxid='" + data[i]["BoxID"] + "']");
            var totalLine = '<div class="col-xs-4">Checked In: <strong>' + data[i]["CheckedIn"] + '</strong></div><div class="col-xs-4">Not Checked-In: <strong>' + (data[i]["Total"] - data[i]["CheckedIn"]) + '</strong></div><div class="col-xs-4">Total: <strong>' + data[i]["Total"] + '</strong></div>';
            theBoxFooter.html(totalLine);
            theBoxFooter.removeClass('sending');
        }
    }

    function BuildBoxData(data, boxes, boxid) {
        var theBox = $('#dashmain').find(".dashbox[data-dashboxid='" + boxid + "']");
        var theBoxBody = theBox.find("tbody.dashboxbody");
        BuildBoxDataInner(data, boxes, boxid, theBox, theBoxBody);
        if (data.length == 0) {
            //theBoxBody.find('.norecordsrow').show(); //data is the wrong thing to look at now that we only get select items
        } else {
            theBoxBody.find('.norecordsrow').hide();
        }
    }
    function BuildBoxDataEvent(data, boxes, boxid, eventid) {
        var theBoxBody = $('#dashmain').find("tbody[data-eventid='" + eventid + "']");
        var theBox = theBoxBody.parents('.dashbox');
        BuildBoxDataInner(data, boxes, boxid, theBox, theBoxBody);


    }


    function BuildBoxDataInner(data, boxes, boxid, theBox, theBoxBody) {
        var newBlock = '';
        var hideExtra = false;

        var isGrouped = false;
        var currBox;
        for (var j = 0; j < boxes.length; j++) {
            if (boxes[j]['dashboxid'] == boxid) {
                currBox = boxes[j];
                isGrouped = (currBox["grouped"] == 'true');
                break;
            }
        }

        for (var i = 0; i < data.length; i++) {
            hideExtra = false;
            var trClass = '';
            var curr = data[i]["waiverid"];
            var prev = ''; var nextRow = '';
            if (i != 0) { prev = data[i - 1]["waiverid"]; }
            if (i < data.length - 1) { nextRow = data[i + 1]["waiverid"]; }

           
            
            if (isGrouped==true) {
                if (prev != curr && curr == nextRow) { trClass = "group-start"; }
                else if (curr != nextRow && curr == prev) { hideExtra = true; trClass = 'group-end'; }
                else if (curr == prev) { hideExtra = true; trClass = 'group'; }
                else { hideExtra = false; }
            } else {
                trClass = '';
            }
            


            var includeViewLink = false;

            if (theBoxBody.find("tr[data-wfid='" + data[i]["waiverid"] + "']").length) {
                //ROW EXISTED, UPDATE THE TIME SIGNED
            } else {
                newBlock += '<tr data-wfid="' + data[i]["waiverid"] + '" class="' + trClass + '">';
                if (theBox.data('includecheckin') == 'True' || theBox.data('includecheckin') == 'true') {
                    var cb = '<td><input type="checkbox" class="checkin" value="' + data[i]["WaiverParticipantID"] + '" ';
                    if (data[i]["IsCheckedIn"] == true) { cb += ' checked="checked"'; }
                    cb += " /></td>";
                    newBlock += cb;
                }
                for (col in data[i]) {

                    if (col.indexOf('__DT_FORMATTED') != -1 || col == 'RowNum' || col == "waiverid" || col == "WaiverParticipantID" || col == "IsCheckedIn") {
                        //DON'T DISPLAY THESE
                    } else if (col == 'waiverLink') {
                        includeViewLink = true;
                    } else if (col == 'minutesSinceSigning') {
                        newBlock += '<td>';
                        newBlock += timeSince(data[i][col]);
                        newBlock += ' </td>';

                    } else {
                        newBlock += '<td>';

                        if (data[i][col] != null && data[i][col] != '1753-01-01T00:00:00' && (!hideExtra || $.inArray(col, colsToHideAfterFirstInGroup)==-1)) {

                            if (col.indexOf('__LINKED') != -1 ) {
                                newBlock += '<a href="<%=site.BasePathRelative%>/admin/ViewWaiver.aspx?id=' + curr + '">' + data[i][col] + '</a>';
                            }
                            else if (data[i][col + '__DT_FORMATTED'] !== void 0) {
                                newBlock += data[i][col + '__DT_FORMATTED'];
                            } else {
                                newBlock += data[i][col];
                            }

                        }
                        newBlock += ' </td>';

                    }
                }
                if (includeViewLink) {
                    newBlock += '<td>';
                    if (!hideExtra) { newBlock += '<a href="<%=site.BasePathRelative%>/admin/ViewWaiver.aspx?id=' + curr + '"> View</a >';}
                    newBlock += '</td>';
                    
                }
                newBlock += '</tr>';
            }
        }

        //REMOVE ANY MISSING ROWS IF NOT VIEWING ALL
        if ($('.cboCheckinSelection').val() != 'VIEW_ALL') {
            $("#dashmain .dashbox[data-dashboxid='" + boxid + "'] .dashboxbody tr").each(function () {
                var found = false;
                for (var i = 0; i < data.length; i++) {
                    if ($(this).data('wfid') == data[i]["waiverid"]) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    $(this).fadeOut('fast', function () { $(this).remove(); });
                }
            });
        }



        theBoxBody.find('.loadingrow').hide();
        theBoxBody.append(newBlock);
    }

    //send empty strings for boxid or evtid to indicate all.
    function ReloadData(clearRowsFirst, boxid, evtid) {
       window.clearInterval(reloadInterval);
       reloadInterval = window.setInterval(function () { ReloadData(false, '', '') }, reloadRate);
        
        if (reloadRunning == false) {
            reloadRunning = true;
            if (pauseSync == 0) {
                var boxes = [];
                var boxSelector = '.dashboxmain';
                if (boxid != '') {
                    boxSelector += '[data-dashboxid="' + boxid + '"]';
                }


                //get each dashbox
                $(boxSelector).each(function () {
                    var dashboxid = $(this).data('dashboxid');
                    var dashboxtype = $(this).data('dashboxtype');
                    var grouped = $('.dashboxhead[data-dashboxid="' + dashboxid + '"]').find('.chkGrouped input').is(':checked') ? 'true' : 'false';
                    var show = $('.dashboxhead[data-dashboxid="' + dashboxid + '"]').find('.cboShow').val();
                    var pageidx = $(this).data('pageidx');
                    

                    if (dashboxtype == 'General_admission') {

                    } else if (dashboxtype == 'Events') {

                    } else if (dashboxtype == 'Signed_in_advance') {

                    }

                    var eventidlist = [];
                    for (var i = 0; i < initData["EVENTS"].length; i++) {
                        if (evtid == '' || evtid==null || evtid == initData["EVENTS"][i]["WaiverEventID"]) {
                            eventidlist.push(initData["EVENTS"][i]["WaiverEventID"]);
                        }
                    }

                    boxes.push({
                        'dashboxid': dashboxid,
                        'grouped': grouped,
                        'show': show,
                        'pageidx': pageidx,
                        'eventidlist' : eventidlist
                    });
                });

                var checkinView = $('.cboCheckinSelection').val();

                var minutesback = 5;
                if (isInitialLoad == true || clearRowsFirst==true) {
                    isInitialLoad = false;
                    minutesback = -1;
                }
                var request = {
                    'dashid': '<%=dash.ID%>',
                    'siteid': '<%=site.ID%>',
                    'checkinview': checkinView,
                    'boxes': boxes,
                    'lastModified': '<%=dash.LastModified.ToString()%>',
                    //'minutesback': -1
                    'minutesback': $('.cboCheckinSelection').val() == 'VIEW_ALL' ? minutesback : -1
                };

                var strRequest = JSON.stringify(request);


                $.ajax({
                    type: "POST",
                    url: "/Controls/GetDashDataV3.ashx",
                    dataType: "json",
                    data: strRequest,
                    success: function (data) {
                        HandleDataResult(data, boxes);
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

<asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>


