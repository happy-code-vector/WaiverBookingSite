<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverMonitor.ascx.cs" Inherits="WaiverFile.Controls.WaiverMonitor" %>



<script type="text/javascript">

    $(document).ready(function () {

        $('.waiver_event_box').each(function () {
            if ($(this).attr('id') != '') {
                LoadBoxContent('EVENT',$(this).attr('id'));
            }
        });
        LoadBoxContent('ADVANCE', '');
        LoadBoxContent('GENADM','');

        window.setInterval(ReloadData, 15000);



    });

    function ReloadData() {
        $('.waiver_event_box').each(function () {
            if ($(this).attr('id') != '') {
                LoadBoxContent('EVENT', $(this).attr('id'));
            }
        });
        LoadBoxContent('ADVANCE', '');
        LoadBoxContent('GENADM', '');
     }

    function LoadBoxContent(cmd, id) {
        $.ajax({
            type: "POST",
            url: "/Controls/GetWaiverNames.ashx",
            data: { cmd: cmd, evtid: id },
            success: function (data) {
                if (data == 'ACCESS_DENIED') {
                    //USER LIKELY TIMED OUT. REDIRECT TO LOGIN PAGE.
                    window.location.replace("<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/LoginAdmin.aspx?Source=<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin");
                } else {
                    var items = data.split('\n');
                    var newString = '';
                    var count = 0;
                    var heading = '';
                    for (i = 0; i < items.length; i++) {
                        if (items[i] != '') {
                            var subItems = items[i].split('|');
                            if (subItems.length > 2) {
                                if (heading != subItems[2]) {
                                    heading = subItems[2];
                                    newString += "<li><h4>" + heading + "</h4></li>";
                                }
                            }
                            newString += '<li><a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/ViewWaiver.aspx?id=' + subItems[0] + '">' + subItems[1] + '</a></li>';
                            count++;
                            
                        }
                    }
                    //CALCULATE TOTAL
                    newString += '<li class="total">Total: ' + count + '</li>';

                    if (cmd == 'GENADM') { id = 'GENADM'; }
                    else if (cmd == 'ADVANCE') { id = 'ADVANCE'; }
                    
                    $('#' + id + ' div div.waiver_event_box_list').html('<ul>' + newString + '</ul>');
                }
            }
        });
    }

    //<div class=\"waiver_event_box\" id=\"{2}\"><h3>{0} - {1}</h3><div class=\"waiver_event_box_list\"><img src=\"/wp-content/images/loading.gif\" alt=\"Loading\"/></div></div>
</script>

<div class="clear" style="padding-top: 10px;"></div>
<asp:PlaceHolder ID="phWarnings" runat="server"></asp:PlaceHolder>
<div class="col-xs-12 col-sm-4" id="GENADM">
    <div class="panel panel-green">
        <div class="panel-heading">
            <h4><%=site.GetLabel("GENERAL_ADMISSION",Page) %></h4>
        </div>
       <div class="waiver_event_box_list"><img src="/wp-content/images/loading.gif" alt="Loading"/></div>
    </div>
 </div>

<div class="col-xs-12 col-sm-4 waiver_advance_box" id="ADVANCE">
    <div class="panel panel-orange">
        <div class="panel-heading">
            <h4>Signed in Advance</h4>
        </div>
       <div class="waiver_event_box_list"><img src="/wp-content/images/loading.gif" alt="Loading"/></div>
    </div>
 </div>


<asp:PlaceHolder ID="phEventListings" runat="server"></asp:PlaceHolder>

<asp:PlaceHolder ID="phKey" runat="server"></asp:PlaceHolder>

