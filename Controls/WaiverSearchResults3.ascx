<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WaiverSearchResults3.ascx.cs" Inherits="WaiverFile.Controls.WaiverSearchResults3" %>
 <script type="text/javascript">

      String.prototype.replaceAll = function(search, replacement) {
      var target = this;
      return target.split(search).join(replacement);
      };

     $(document).ready(function () {

        $('.partlist_withcheckin').each(function () {
            var txt = $(this).data('names');

            var a = txt.split('|'),
                i;

            var txtOut = '';
            var currName = '';
            var currAgedOut = false;
            var currIsSignee = false;
            var isAlreadyCheckedIn = false;
            var partID = '';
            var checkInDate = '';
            var numUnchecked = 0;
            var partAge = '';
            var dob;
            
            for (i = 0; i < a.length; i++) {

               

                if (i % 8 == 0) {

                    currName = a[i];
                } else if (i % 8 == 1) {
                    dob = a[i];

                } else if (i % 8 == 2) {
                    currAgedOut = a[i] == '1';

                }
                else if (i % 8 == 3) {

                    partAge = a[i];

                    if (partAge == '0') { partAge = ''; } else {
                        var ageOut = ' (';
                        <%if (includePartAge)
                             {
         %>   ageOut += partAge;  <%
                             }
                          %>
                    <%if (includePartAge && includePartDOB)
                             {
         %>   ageOut += ', '; <%
                             }
                          %>
                    <%if (includePartDOB)
                             {
         %>    ageOut += a[i - 2]; <%
                             }
                          %>
                        ageOut += ')';
                        partAge = ageOut;

                        

                }
         } else if (i % 8 == 4) {
                    currIsSignee = a[i] == '1';

                } else if (i % 8 == 5) {
                    isAlreadyCheckedIn = a[i] == '1';
                } else if (i % 8 == 6) {
                    partID = a[i];
                }
                else if (i % 8 == 7) {
                    checkInDate = a[i];
                
                    var checkAdd = '';
                <% if (_includeCheckInStuff){ %>
                    if (isAlreadyCheckedIn) {
                        checkAdd = '';
                    } else {
                        var checkedCode = ' checked="checked"';
                        if (currAgedOut == true && currIsSignee != true) { checkedCode = ''; }
                        checkAdd = '<input type="checkbox" class="checkinselect" data-partid="' + partID + '" value="' + partID + '" ' + checkedCode + '/> ';
                        numUnchecked++;
                    }
                <%}%>

                    //last item. render it. 
                    txtOut += '<li>' + checkAdd;

                    if (currAgedOut == true && currIsSignee!=true) {
                        txtOut += '<span class="text-danger">' + currName + ' <br/><small>(Old enough to sign own waiver)</small></span>';
                    } else {
                        txtOut += currName;
                    }
                    txtOut += partAge;

                    if (isAlreadyCheckedIn) {
                        txtOut += '<br/><small class="text-muted">Checked in ' + checkInDate + '(<a href="javascript:void(0);" class="btnundocheckin" data-partid="' + partID + '">Undo</a>)</small>';
                    }
                    txtOut += '</li>';

                }

                $(this).html('<ul class="list-unstyled">' + txtOut + '</ul>');

            }
            if (numUnchecked == 0) {
                $(this).parent().parent().find('.btncheckin').addClass('disabled');
                $(this).parent().parent().find('.btncheckin').removeClass('btn-primary');
                $(this).parent().parent().find('.btncheckin').addClass('btn-muted');
            }

        });

          $('.show_part').click(function(){
          var recordnum = $(this).data('recordnum');

          var thediv = $(this).parent().find("[data-recordnum='" + recordnum + "']");
          $(this).parent().find(".part_num").hide();
          var txt = $(this).data('names');

          var a = txt.split('|'),
          i;

          var txtOut = '';
              var currName = '';
              var dob = '';
          var currAgedOut = false;
              var currIsSignee = false;
              var partAge = '';
          for (i = 0; i < a.length; i++) {
          if(i % 8 == 0){
              currName = a[i];
          } else if (i % 8 == 1) {
              dob = a[i];
          }else if(i % 8 == 2){
          currAgedOut = a[i]=='1';
          }
          else if (i % 8 == 3) {

              partAge = a[i];

              if (partAge == '0') { partAge = ''; } else {
                  var ageOut = ' (';
                        <%if (includePartAge)
                             {
         %>   ageOut += partAge;  <%
                             }
                          %>
                    <%if (includePartAge && includePartDOB)
                             {
         %>   ageOut += ', '; <%
                             }
                          %>
                    <%if (includePartDOB)
                             {
         %>    ageOut += a[i - 2]; <%
                             }
                          %>
                  ageOut += ')';
                  partAge = ageOut;

              }
          }else if (i % 8 == 4) {
          currIsSignee = a[i]=='1';
              

          if(currAgedOut==true && currIsSignee!=true){
          txtOut += '<span class="text-danger">' + currName + ' <br/><small>(Old enough to sign own waiver)</small></span>';
          }else{
          txtOut += currName;
              }
              txtOut += partAge;
          txtOut += '<br/>';
          }
          }


          thediv.html(txtOut);
          thediv.fadeIn();
          $(this).hide();
          });
         $('.btnundocheckin').click(function () {
             var partid = $(this).data('partid');
                 
                 $.ajax({
                     type: "POST",
                     url: "/Controls/MainHandler.ashx",
                     data: { siteid: '<%=site.ID%>', cmd: 'UNDO_CHECKIN', partid: partid },
                     success: function (dataRaw) {
                         if (dataRaw == "SUCCESS") {
                             //IT WORKED. REFRESH PAGE i GUESS
                             location.reload();
                         } else {
                             alert('Error: ' + dataRaw);
                         }
                     }


                 });


          
         });
         $('.btncheckin').click(function () {
             var waiverid = $(this).data('waiverid');
             var partIDListForCheckIn = '';

             //collect selected participant id's and initate a new checkin for each. 
             $('.partcell').each(function () {
                 if ($(this).data('waiverid') == waiverid) {
                     //GOT IT

                     $(this).find('input[type="checkbox"]').each(function () {
                         if ($(this).is(':checked')) {
                             if (partIDListForCheckIn != '') {
                                 partIDListForCheckIn += '|';
                             }
                             partIDListForCheckIn += $(this).data('partid');
                         }
                     });

                     return;
                 }
             });

          


             $.ajax({
                 type: "POST",
                 url: "/Controls/MainHandler.ashx",
                 data: { siteid: '<%=site.ID%>', cmd: 'NEW_CHECKIN_MULTIPLE', waiverid: waiverid, partIDList: partIDListForCheckIn },
                 success: function (dataRaw) {
                     if (dataRaw == "SUCCESS") {
                         //IT WORKED. REFRESH PAGE i GUESS
                         location.reload();
                     } else {
                         alert('Error: ' + dataRaw);
                     }
                  }
                  

             });


         });

      
     });
    </script>

<asp:PlaceHolder runat="server" ID="phMain"></asp:PlaceHolder>