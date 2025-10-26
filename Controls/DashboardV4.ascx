<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashboardV4.ascx.cs" Inherits="WaiverFile.Controls.DashboardV4" %>

<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jquery-ui.min.js"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jquery.layout-latest.js"></script>
<script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/jquery.blockUI.js"></script>
<asp:PlaceHolder ID="phStyles" runat="server"></asp:PlaceHolder>
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

    var popupSelectedSection = '';
    var popupSelectedEventID = '';

    /* CHECK-IN AND FLAGGING QUEUES */
    function CheckIn(isCheckedIn, id, waivereventid) {
        this.isCheckedIn= isCheckedIn;
        this.id = id;
        this.waivereventid = waivereventid;
    }
    function WFFlag(flagID, isChecked, id, eventid) {
        this.flagID= flagID;
        this.isChecked = isChecked;
        this.id = id;
        this.eventid = eventid;
    }

    var reloadInterval;
    var reloadRate = 20000;
    var initData = <%=strInitData%>;
    var flagList = <%=strFlagList%>;
    var isInitialLoad = true;
    var pushFlagInterval;
    var checkinQueue = [];
    var flagQueue = [];
    var flagQueueProcessing = false;
    var flagQueueProcessStarted;
    var idToRemove = '';
    var idToRemoveRow = '';
    var idToMove = '';

    

    var isDirty = function () {
        return flagQueue.length > 0 || checkinQueue.length > 0;
    }
    window.onload = function () {
             window.addEventListener("beforeunload", function (e) {
            if (!isDirty()) {
                return undefined;
            }

            var confirmationMessage = 'Your checkin or flag changes are still being saved. If you leave now, your changes may be lost. Continue?';

            (e || window.event).returnValue = confirmationMessage; //Gecko + IE
            return confirmationMessage; //Gecko + Webkit, Safari, Chrome etc.
        });
    };

    function disableSomeGroupedSorting() {
        <%if(site.SecurityMode >= WFCommon.WaiverSiteBase.WaiverSiteSecurityModeEnum.High){%>

        $('a[data-customcol="true"]').each(function () {
            //disable if the box is grouped
            if ($('table.dashboxhead[data-dashboxid="' + $(this).parents('table').data('dashboxid') + '"] input[type=checkbox]').is(':checked')) {
                $(this).data('disabled', 'true');
                $(this).removeClass('dashsort');
                $(this).removeClass('sort');
                $(this).removeClass('sortactive');
                $(this).removeClass('sortdesc');
                $(this).removeClass('sortasc');
                $(this).attr('title', 'Cannot sort this column while grouping enabled');
            } else {
                $(this).data('disabled', 'false');
                
                $(this).attr('title', $(this).text());
                if ($(this).attr('class') == '') {
                    $(this).addClass('dashsort');
                    $(this).addClass('sort');
                }
               
            }
        });

        <%}%>
    }

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
        pushFlagInterval = window.setInterval(QueueProcess, 3000);
        LoadEvents();

        BindSortClick();
        BindGroupedClick();
        BindShowChange();
        BindMoveRemove();

        $('#pop_add').on('shown.bs.modal', function () {
            $('#txtAddPartSearchText').focus();
        })  

        $('.btnAddParts').each(function () {
            $(this).click(function () {
                popupSelectedEventID = $(this).data('eventid');
                popupSelectedSection = $(this).data('section');
                $('#pop_add').modal('show');
                
            });
        });

        $('#txtAddPartSearchText').on("keypress", function(e) {
        if (e.keyCode == 13) {
            PartSearch($('#txtAddPartSearchText').val());
            return false; // prevent the button click from happening
        }
        });

        $('#btnSearchPart').click(function () {
            PartSearch($('#txtAddPartSearchText').val());
        });
        $('#btnAddSelected').click(function () {
            //GET ALL SELECTED ITEMS popupSelectedEventID  popupSelectedSection
            var idsChecked = '';
            $('.chk_add_part:checked').each(function () {
                if (idsChecked != '') { idsChecked += ','; }
                idsChecked += $(this).val();
            });

            var targetSelector = 'table.GENADM';
            if (popupSelectedSection == 'events') {
                targetSelector = 'table.EVENTS';
            }
             $(targetSelector).closest('.ui-layout-pane').block({
             message: '<h4>Loading...</h4>',
                css: {}
            });
           
             $.ajax({
                    type: "POST",
                    url: "/Controls/DashboardV4Util.ashx",
                 data: { cmd: "ADD_PARTS", dashid: '<%=dash.ID%>', popupSelectedSection: popupSelectedSection, popupSelectedEventID: popupSelectedEventID, idsChecked: idsChecked, isCheckedIn: $('#chkCheckInNewPart').is(':checked') },
                    success: function (data) 
                    {
                        //$('#pop_add').modal('hide');//CLOSE MODAL
                        //BumpReloadData(true, '', '');//REFRESH DATA
                    },
                    complete: function () {
                          $('#pop_add').modal('hide');//CLOSE MODAL
                        //ReloadData(true, '', '');
                        if (popupSelectedSection == 'events') {
                            BumpReloadData(true, '', '');
                        } else {
                            BumpReloadData(true, '', '');
                        }
                    }
                });
        });
         $('#btnRemoveParticipant').click(function () {
            //todo: remove
               $.ajax({
                    type: "POST",
                    url: "/Controls/DashboardV4Util.ashx",
                 data: { cmd: "REMOVE_PART", dashid: '<%=dash.ID%>', idToRemove: idToRemove },
                    success: function (data) 
                    {
                        //$('#pop_add').modal('hide');//CLOSE MODAL
                        //BumpReloadData(true, '', '');//REFRESH DATA
                    },
                    complete: function () {
                          $('#pop_remove').modal('hide');//CLOSE MODAL
                        //ReloadData(true, '', '');
                        //REMOVE THE ORIGINAL ROW SINCE IT'S DELETED NOW
                          $('tr[data-wpid="' + idToRemoveRow + '"]').remove();
                    }
                });
        });
        $('#btnMovePart').click(function () {

            //MARK TARGET AS LOADING
            $('#move_part_dest_validation').hide();
            var targetEvtID = $('#<%=cboUpcomingEvents.ClientID%>').val();
            if (targetEvtID == '') {
                $('#move_part_dest_validation').show();
                return;
            }

             $('table[data-eventid="' + $('#<%=cboUpcomingEvents.ClientID%>').val() + '"]').closest('.ui-layout-pane').block({
                message: '<h4>Loading...</h4>',
                css: {}
            });

              $.ajax({
                    type: "POST",
                    url: "/Controls/DashboardV4Util.ashx",
                 data: { cmd: "MOVE_PART", dashid: '<%=dash.ID%>', idToMove: idToMove, targetEventID: targetEvtID},
                    success: function (data) 
                    {
                        //$('#pop_add').modal('hide');//CLOSE MODAL
                        //BumpReloadData(true, '', '');//REFRESH DATA
                    },
                    complete: function () {
                          $('#pop_move').modal('hide');//CLOSE MODAL
                        //ReloadData(true, '', '');
                        //REMOVE THE ORIGINAL ROW SINCE IT'S DELETED NOW
                        $('tr[data-wpid="' + idToRemoveRow + '"]').remove();
                        if (targetEvtID == '00000000-0000-0000-0000-000000000000') {
                            BumpReloadData(true, '', '');
                        } else {
                            BumpReloadData(true, '', targetEvtID);
                        }
                        
                    }
                });
        });

        //REFRESH AT MIDNIGHT SO THE DROPDOWNS WILL UPDATE
        var numSeconds = moment("24:00:00", "hh:mm:ss").diff(moment(), 'seconds');
        if (numSeconds > 0) {
            setTimeout(midnightTask, numSeconds * 1000);
        }
        
    });

    function midnightTask() {
        location.reload();
    }

    function PartSearch(terms) {
        $('#findPartResults').html('Loading...');

      
                $.ajax({
                    type: "POST",
                    url: "/Controls/DashboardV4Util.ashx",
                    data: { cmd: "PART_SEARCH", dashid: '<%=dash.ID%>', popupSelectedSection: popupSelectedSection, popupSelectedEventID:popupSelectedEventID, terms: terms },
                    success: function (data) {
                        //render!
                        if (data.length == 0) {
                            $('#findPartResults').html('No results found.');
                        } else {
                            var tbl = '<table class="table table-condensed"><thead><tr>'
                                + '<th>Select</th>'
                                + '<th>Participant</th>'
                                + '<th>Signed By</th>'
                                + '<th>Date Signed</th>' //<th>View</th>
                                + '</tr></thead><tbody>';
                            for (id in data) { 
                                for (var currRow in data[id]) {
                                    tbl += '<tr><td><input type="checkbox" class="chk_add_part" value="' + data[id][currRow]['p.WaiverParticipantID'] + '"/></td>';
                                    tbl += '<td>' + data[id][currRow]['ParticipantNameFirst'] + ' ' + data[id][currRow]['ParticipantName'] + '</td > ';
                                    tbl += '<td>' + data[id][currRow]['signednamefirst'] + ' ' + data[id][currRow]['signedname'] + '</td>';
                                    tbl += '<td>' + formatDate(data[id][currRow]['DateSigned']);
                                    if (data[id][currRow]['IsExpired'] == true) {
                                        tbl += ' <span class="text-danger">Expired</span>';
                                    }
                                    if (data[id][currRow]['agedOut'] == true) {
                                        tbl += ' <span class="text-danger">Participant old enough to sign own waiver</span>';
                                    }
                                    tbl += '</td>';
                                    //tbl += '<td><a href="javascript:void(0);">View</a></td>';
                                    tbl += '</tr>';
                                }
                            }
                            tbl += '</tbody></table>';
                            $('#findPartResults').html(tbl);
                        }
                    },
                    complete: function () {
                         
                    }
                });

    }

    function BindShowChange() {
        $('.cboShow').change(function () {
            $(this).closest('.ui-layout-pane').block({
                message: '<h4>Loading...</h4>',
                css: {}
            });
            SetShow(boxid = $(this).parents('.dashbox').data('dashboxid'), $(this).val());
        });

        $('.cboEventCategory').change(function () {
            $(this).closest('.ui-layout-pane').block({
                message: '<h4>Loading...</h4>',
                css: {}
            });

            //leaving off here
            //add the dropdown choice to the params sent in to filter
            //


            //SetShow(boxid = $(this).parents('.dashbox').data('dashboxid'), $(this).val());
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

    function BindMoveRemove() {
        $('.btnMove').each(function () {
            $(this).unbind('click');
            $(this).click(function () {
                 idToMove = $(this).data('wpe');
                idToRemoveRow = $(this).data('wpid');
                $('#pop_move').modal('show');
                //TODO: PASS PATICIPANT DETAILS
            });
        });
        $('.btnRemove').each(function () {
            $(this).unbind('click');
            $(this).click(function () {
                idToRemove = $(this).data('wpe');
                idToRemoveRow = $(this).data('wpid');
                $('#pop_remove').modal('show');
               



            });
        });
    }
    
    function BindSortClick() {
        $('.dashsort').unbind('click'); //PREVENT MULTIPLE BINDINGS
        $('.dashsort').click(function () {
            if ($(this).data('disabled') == 'true') { return; } //DISABLE SORTING WHEN GROUPED
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
        
        $('.dashboxeventhead th').each(function () {
            var colspanAttr = $(this).attr('colspan');
            if (colspanAttr > 0) {
                colCount += colspanAttr;
            } else {
                colCount++;
            }
        });

       
        var newHtml = '';
        for (var i = 0; i < initData["EVENTS"].length; i++) {
            newHtml += '<tr><td colspan="' + colCount + '" style="padding:0;"><table width="100%" class="table table-condensed dasheventinner" data-eventid="' + initData["EVENTS"][i]["WaiverEventID"] + '"><thead>';
            newHtml += '<tr data-eventid="' + initData["EVENTS"][i]["WaiverEventID"] + '"><th colspan="' + colCount + '" class="dashboxeventsubhead">'
                + '<div class="pull-right dashboxevtbuttons"><a href="javascript:void(0);" class="btnAddParts" data-section="events" data-eventid="' + initData["EVENTS"][i]["WaiverEventID"] + '"><i class="fa fa-plus-circle"></i> Add</a>  <a href="<%=site.BasePathRelative%>/admin/EditWaiverEvent.aspx?id=' + initData["EVENTS"][i]["WaiverEventID"] + '"><i class="fa fa-pencil"> </i> Edit</a> '
                + '<a href="<%=site.BasePathRelative%>/admin/PrintEvent.aspx?id=' + initData["EVENTS"][i]["WaiverEventID"] + '"><i class="fa fa-print"> </i> Print</a></div>'
                + '<a href="<%=site.BasePathRelative%>/admin/EventSignatures.aspx?id=' + initData["EVENTS"][i]["WaiverEventID"] + '">' + initData["EVENTS"][i]["name"] + ' - ' + initData["EVENTS"][i]["DisplayDate"]
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


    function QueueProcess() {
        if (flagQueueProcessing == true) {
            var timeDiff = endTime - startTime; //in ms
            if (timeDiff / 1000 > 60) { flagQueueProcessing = false }; //timeout, restart after 1 min
        }

        if (flagQueueProcessing == false) {
            //BEGIN PROCESSING
            flagQueueProcessStarted = new Date();
            if (checkinQueue.length > 0) {

                //pull all the items to a temporary queue
                var batch = [];
                while(checkinQueue.length > 0) {
                    batch.push(checkinQueue.shift());
                }
                
                var stuck = window.setInterval(stuckWarning, 60000);

                 $.ajax({
                    type: "POST",
                    url: "/Controls/DashboardV4Util.ashx",
                    data: { cmd: "SET_CHECKINS", dashid: '<%=dash.ID%>', siteid: '<%=site.ID%>', rows: JSON.stringify(batch) },
                    success: function (dataRaw) {
                        window.clearInterval(stuck);
                       
                    },
                    complete: function () {
                        window.clearInterval(stuck);
                        pauseSync = 0;
                        BumpReloadData(false, '', '');
                    }
                });

            }
            if (flagQueue.length > 0) {
                 //pull all the items to a temporary queue
                var batch = [];
                while(flagQueue.length > 0) {
                    batch.push(flagQueue.shift());
                }

                var stuck = window.setInterval(stuckWarning, 60000);

                $.ajax({
                    type: "POST",
                    url: "/Controls/DashboardV4Util.ashx",
                    data: { cmd: "SET_FLAGS", dashid: '<%=dash.ID%>', siteid: '<%=site.ID%>', rows: JSON.stringify(batch) },
                    success: function (dataRaw) {
                        window.clearInterval(stuck);
                        pauseSync = 0;
                        BumpReloadData(false, '', '');
                    },
                    complete: function () {
                        window.clearInterval(stuck);
                       
                    }
                });
                
            }

        }

    }



    function HandleDataResult(data, boxes) {
        $('.sending').each(function () { $(this).removeClass('sending');})
        $('.removeme').each(function () { $(this).remove(); });
        
        for (id in data) {
            if (data.length == 0) {
            }
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

        //$('.checkin').each(function () {
        //    $(this).removeAttr('disabled');
        //    $(this).parents('tr').removeClass('text-muted');
        //});
        BindSortClick();
        BindMoveRemove();
        


        $('.checkin').unbind('click'); //PREVENT MULTIPLE BINDINGS
        $('.checkin').click(function () {
            //$(this).attr('disabled', 'true');
            //$(this).parents('tr').addClass('text-muted');
            pauseSync++;

            var evtid = $(this).parents('table').data('eventid');
            if (!evtid) {
                evtid = '00000000-0000-0000-0000-000000000000';
            }
            var currCheckIn = new CheckIn($(this).is(":checked"), $(this).attr('value'), evtid);
            //ALREADY IN THE LIST?
            var replaced = false;
            for (var i = 0; i < checkinQueue.length; i++) {
                if (checkinQueue[i].id == currCheckIn.id) {
                    checkinQueue[i] = currCheckIn;
                    replaced = true;
                    break;
                }
            }
            if (!replaced) {
                checkinQueue.push(currCheckIn);
            }
            
            var parentBox = $(this).parents('.dashbox');
            if (parentBox.hasClass('EVENTS')) {
                parentBox.find('.dashboxfooter').addClass('sending');
            } else {
                parentBox.parent().parent().find('.dashboxfooter').addClass('sending');
            }
            
        });

        
        $('.wfflag').unbind('click'); //PREVENT MULTIPLE BINDINGS
        $('.wfflag').click(function () {
            //$(this).attr('disabled', 'true');
            //$(this).parents('tr').addClass('text-muted');
            pauseSync++;
            
           

            var evtid = $(this).parents('table').data('eventid');
            if (!evtid) {
                evtid = '00000000-0000-0000-0000-000000000000';
            }
            var flagID = $(this).data('flagid');

            var currFlag = new WFFlag(flagID, $(this).is(":checked"), $(this).attr('value'), evtid);
            //ALREADY IN THE LIST?
            var replaced = false;
            for (var i = 0; i < flagQueue.length; i++) {
                if (flagQueue[i].id == currFlag.id && flagQueue[i].flagID == currFlag.flagID) {
                    flagQueue[i] = currFlag;
                    replaced = true;
                    break;
                }
            }
            if (!replaced) {
                flagQueue.push(currFlag);
            }
            
        });
       
    }

    function SetSort(dashBoxId, eventID, direction, fieldName) {

        $.ajax({
            type: "POST",
            url: "/Controls/DashboardV4Util.ashx",
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
            url: "/Controls/DashboardV4Util.ashx",
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
            url: "/Controls/DashboardV4Util.ashx",
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
    function formatDate(strDate) {
      var monthNames = [
        "Jan", "Feb", "Mar",
        "Apr", "May", "June", "July",
        "Aug", "Sept", "Oct",
        "Nov", "Dec"
      ];
        var date = new Date(strDate);
      var day = date.getDate();
      var monthIndex = date.getMonth();
      var year = date.getFullYear();

      return monthNames[monthIndex] + ' ' + day + ' ' + year;
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
                newBlock += '<tr data-wfid="' + data[i]["waiverid"] + '" data-wpid="' + data[i]["WaiverParticipantID"] + '" class="' + trClass + '">';

                if (theBox.data('includecheckin') == 'True' || theBox.data('includecheckin') == 'true') {
                    //var cbid = 'checkin' + boxid.replace(/-/g, '_') + data[i]["WaiverParticipantID"].replace(/-/g, '_') + data[i]["WaiverEventID"].replace(/-/g, '_');
                    var cbid = 'checkin' + data[i]["WaiverParticipantEventID"].replace(/-/g, '_');
                    var cb = '<td><input type="checkbox" class="checkin" id="' + cbid + '" value="' + data[i]["WaiverParticipantEventID"] + '" ';
                    if (data[i]["IsCheckedIn"] == true) { cb += ' checked="checked"'; }
                    cb += ' /><label for="' + cbid + '"></label></td>';
                    newBlock += cb;
                }

                //load columns of flag statuses
                for (col in data[i]) {
                    if (col.indexOf('_WFFLAG_') != -1) {
                         var flagIdx = parseInt(col.substring(8));
                        //iterate flagList to get it
                        var flagID = flagList[flagIdx]["ID"];
                        //var cbid = 'wfflag' + boxid.replace(/-/g, '_')  + data[i]["WaiverParticipantID"].replace(/-/g, '_') + data[i]["WaiverEventID"].replace(/-/g, '_');
                        var cbid = 'wfflag' +data[i]["WaiverParticipantEventID"].replace(/-/g, '_') + "_" + flagIdx;
                        var cb2 = '<input type="checkbox" data-flagid="' + flagID + '" value="' + data[i]["WaiverParticipantEventID"] + '" class="wfflag wfflag' + col.substring(8) + '" id="' + cbid + '"';
                        
                         if (data[i][col] == true) { cb2 += ' checked="checked"'; }
                        cb2 += '>';
                        newBlock += '<td>' + cb2 + '<label for="' + cbid + '"></label></td>';
                    }
                }


                for (col in data[i]) {
                    
                    if (col.indexOf('_WFFLAG_') != -1 || col.indexOf('__DT_FORMATTED') != -1 || col == 'RowNum' || col == "waiverid" || col == "WaiverParticipantID" || col == "IsCheckedIn" || col == 'WaiverParticipantEventID') {
                        //DON'T DISPLAY THESE
                    } else if (col == 'waiverLink') {
                        includeViewLink = true;
                    } else if (col == 'minutesSinceSigning') {
                        newBlock += '<td>';
                        newBlock += timeSince(data[i][col]);
                        newBlock += ' </td>';

                    }
                    else if (col == 'emailverified') {
                        newBlock += '<td>';

                        if (data[i][col] == true) {
                            newBlock += '<i class="fa fa-check"></i>';
                        } else {
                            newBlock += '';
                        }

                        newBlock += ' </td>';
                    }
                    else if (col == 'hasphotos') {
                        newBlock += '<td>';
                     
                        if (data[i][col] == true) {
                            newBlock += '<i class="fa fa-picture-o"></i>';
                        } else {
                            newBlock += '';
                        }
                        
                        newBlock += ' </td>';
                    } else if (col == 'hasattachments') {
                        newBlock += '<td>';
                        
                        if (data[i][col] == true) {
                            newBlock += '<i class="fa fa-paperclip"></i>';
                        } else {
                            newBlock += '';
                        }

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
                
                newBlock += '<td><a href="javascript:void(0);" class="btnMove" title="Move" data-wpe="' + data[i]["WaiverParticipantEventID"] + '" data-wpid="' + data[i]["WaiverParticipantID"] + '"><i class="fa fa-arrows"></i></a></td>';
                 newBlock += '<td><a href="javascript:void(0);" class="btnRemove" title="Remove"  data-wpe="' + data[i]["WaiverParticipantEventID"] + '" data-wpid="' + data[i]["WaiverParticipantID"] + '"><i class="fa fa-trash"></i></a></td>';

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
                    url: "/Controls/GetDashDataV4.ashx",
                    dataType: "json",
                    data: strRequest,
                    success: function (data) {
                        HandleDataResult(data, boxes);
                    }
                });
                
            }
            reloadRunning = false;
        }

        disableSomeGroupedSorting();
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

<!-- Modal -->
<div class="modal fade" id="pop_add" tabindex="-1" role="dialog" aria-labelledby="lblPopAdd">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblPopAdd">Add Participants</h4>
      </div>
      <div class="modal-body">
        <div class="form-inline">
          <div class="form-group">
              <div class="row">
                  <div class="col-sm-4"><label>Search</label></div>
                  <div class="col-sm-6"><input type="text" id="txtAddPartSearchText" name="txtAddPartSearchText" class="form-control" placeholder="Search" /></div>
                  <div class="col-sm-2"><input type="button" id="btnSearchPart" name="btnSearchPart" class="btn btn-primary" value="Search" /></div>
              </div>
                </div>
            </div>
          <hr />

          <div id="findPartResults"></div>

      </div>
      <div class="modal-footer">
          <div class="pull-left">
              <input type="checkbox" id="chkCheckInNewPart" name="chkCheckInNewPart" checked="checked" /> <label for="chkCheckInNewPart">Mark as Checked In</label>
          </div>
          <a href="javascript:void(0);" class="btn btn-primary" id="btnAddSelected">Add Selected</a>
           <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelAdd" data-dismiss="modal">Cancel</a>
           
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="pop_remove" tabindex="-1" role="dialog" aria-labelledby="lblPopRemove">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblPopRemove">Remove Participants</h4>
      </div>
      <div class="modal-body">
        Are you sure you wish to remove this participant?
      </div>
      <div class="modal-footer">
           <a href="javascript:void(0);" class="btn btn-primary" id="btnRemoveParticipant">Remove</a>
          <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelRemove" data-dismiss="modal">Cancel</a>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="pop_move" tabindex="-1" role="dialog" aria-labelledby="lblPopMove">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblPopMove">Move Participants</h4>
      </div>
      <div class="modal-body">

          <div class="form-group">
              <label for="<%=cboUpcomingEvents.ClientID %>">Select a Destination</label>
              <asp:DropDownList runat="server" ID="cboUpcomingEvents" CssClass="form-control"></asp:DropDownList>
          </div>
          

      </div>
      <div class="modal-footer">

          <span id="move_part_dest_validation" class="text-danger" style="display:none;">Please select a destination</span>
           
           <a href="javascript:void(0);" class="btn btn-primary" id="btnMovePart">Move</a>
          <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelMove" data-dismiss="modal">Cancel</a>
      </div>
    </div>
  </div>
</div>


<asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>


