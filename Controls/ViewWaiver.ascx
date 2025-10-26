<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewWaiver.ascx.cs" Inherits="WaiverFile.Controls.ViewWaiver" %>

<div id="iframeModal" class="modal fade modal-fullscreen  footer-to-bottom" tabindex="-1" role="dialog">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">New Check-In</h4>
      </div>
      <div class="modal-body" >
         <iframe id="modaliframe" style="width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:10;"></iframe> 
      </div>
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<script type="text/javascript">
    window.closeModal = function(dorefresh){
        $('#iframeModal').modal('hide');
        if (dorefresh == true) {
            location.reload();
        }
    };
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
    var flagQueue = [];
    var flagQueueProcessing = false;
    var flagQueueProcessStarted;
    var pushFlagInterval;
      var checkinQueue = [];
     var isDirty = function () {
        return flagQueue.length > 0 || checkinQueue.length > 0;
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
                        //BumpReloadData(false, '', '');
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
                        //BumpReloadData(false, '', '');
                    },
                    complete: function () {
                        window.clearInterval(stuck);
                       
                    }
                });
                
            }

        }

    }

    $(document).ready(function () {

         pushFlagInterval = window.setInterval(QueueProcess, 3000);

        $('.btncheckin').click(function () {
            var wpe = $(this).data('wpe');
            $('#modaliframe').attr('src', '/b/<%=site.Url%>/admin/Dialogs/NewCheckIn.aspx?wid=<%=obj.WaiverID.ToString()%> + &wpe=' + wpe);
            //show modal
            $('#iframeModal').modal('show');
        });

        $('.checkin').unbind('click'); //PREVENT MULTIPLE BINDINGS
        $('.checkin').click(function () {
            //$(this).attr('disabled', 'true');
            //$(this).parents('tr').addClass('text-muted');
            pauseSync++;

            var evtid = $(this).data('eventid');
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
        $('.btnShowWorkflowStepHistory').click(function () {
            $('#modalWorkflowHistory').modal('show');
        });
    
    $('.wfflag').unbind('click'); //PREVENT MULTIPLE BINDINGS
        $('.wfflag').click(function () {
            //$(this).attr('disabled', 'true');
            //$(this).parents('tr').addClass('text-muted');
            pauseSync++;
            
           

            var evtid = $(this).data('eventid');
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

    });

</script>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="phOut" runat="server"></asp:PlaceHolder>

