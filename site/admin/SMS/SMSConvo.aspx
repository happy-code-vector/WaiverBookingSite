<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSConvo.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SMSConvo" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" href="/wp-content/Plugins/WaiverFile/Docs/WFSMS/wfsms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

   <style type="text/css">
        /*BEGIN PREVIEW*/
        .panel{
            width: 100%;
            border: 1px #A0A0A0 solid;
        }
        #chars{ margin-top: 3px; margin-left: 3px; }
        .icon{
            height: 70px;
            padding-top:23px;
    
        }
        .sentstatus{ font-size:.75em; color: #555;margin:-5px 30px 0 0;}
        #contact{
            width: 50px;
            height: 50px;
            margin:auto;
            padding:7px 8px 7px 8px;
            background-color :#A4A4A4;
            border-radius: 25px 25px 25px 25px;
        }

        .glyphicon-info-sign, .glyphicon-chevron-left{
            font-size: 25px;
            color: #37A7FD;
        }
        .glyphicon-user{
            font-size: 35px;
            color: #FFFFFF;
        }

        .panel-body{
            height :250px;   
            overflow-y: scroll;
        }

        .date{
            color: #A4A4A4;
            text-align: center;
            margin-bottom: 5px;
        }

        .bold{
            font-weight: bold;
        }


       .message{
            font-size: 1.1em;
            width: auto;
           margin-right:10px;
            border-radius: 15px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .message-in {
            background-color: #E5E5EA;
            margin-left: 20px;

        }
        .message-out{
            background-color : #22D351;
            margin-right: 20px;margin-left: 20px;
            color: #FFFFFF;
        }

        .glyphicon-send, .glyphicon-camera{
            color: #ffffff;
        }
        /*END PREVIEW*/

         .input-controls-container {
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
            color: #555;
            display: block;
            font-size: 14px;
            padding: 0;
            transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
            width: 100%;
        }
         .input-controls-container .form-control {
            border: 0;
            height: 32px;
        }
         .input-controls-container.expand .form-control {
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
            height: auto;
        }
         .input-controls-container .input-controls {
            display: none;
            text-align: right;
            padding: 0;
            border-top: 1px solid #dfdfdf;
        }
         .input-controls-container.expand .input-controls {
            display: block;
        }
         .input-controls-container .input-controls .btn-link {
            padding: 2px 10px 0;
            color: #555;
            text-decoration: none;
        }
         .input-controls-container .input-controls .btn-link:hover {
            color: #111;
        }
         .input-controls .dropdown{ display: inline-block; }

         .input-controls .btngrouping{ width: 100%; padding: 5px; }


    </style>

<script type="text/javascript">
    $(document).ready(function () {
      

        CalcLen();
        
        $('#<%=txtMessage.ClientID%>').keyup(function () {
            CalcLen();
        });
       
    });

   
</script>
 
<script type="text/javascript">
     function OnClientItemsRequesting(sender, eventArgs) {
         var context = eventArgs.get_context();
         context["siteid"] = '<%=_siteid%>';
         context["FilterString"] = eventArgs.get_text();
     }

     function CalcLen() {
         var text_max = 160;
         var text_length = $('#<%=txtMessage.ClientID%>').val().length;
        if (text_length <= text_max) {
            var text_remaining = text_max - text_length;
            $('#textarea_feedback').html((text_max - text_length) + ' characters remaining');
        } else {
            $('#textarea_feedback').html('This message will be sent in ' + Math.ceil(text_length / text_max) + " parts.");
        }
     }


     <% if(privateMessageID!=Guid.Empty || mobileNumberID!=Guid.Empty){ %>

     $(document).ready(function () {
         CalcLen();
         $('#<%=txtMessage.ClientID%>').keyup(function () {
             CalcLen();
         });

         scrollTopConvo();
         setTimeout(refreshConvo, 5000);
     });


    function scrollTopConvo() {
        var objDiv = document.getElementById("convoscroll");
        objDiv.scrollTop = objDiv.scrollHeight;
    }
    function refreshConvo() {
        <%if (!_DISABLE_FOR_DEMO)
    { %>
        $.post("/wp-content/Plugins/WaiverFile/Controls/WFSMSControls/ConversationFeedV2.ashx", { id: '<%=privateMessageID.ToString()%>', mobilenumid: '<%=mobileNumberID.ToString()%>', siteid: '<%=_siteid.ToString()%>' },
              function (data) {
                  var lastID = '';
                  var lastStatus = '';
                  
                  $(data).find('.smsmsg:last').each(function () {
                      lastID = $(this).data('smsid');
                      lastStatus = $(this).data('status');
                  });
                  var lastIDCurr = '';
                  var lastStatusCurr = '';
                  $('#convoscroll').find('.smsmsg:last').each(function () {
                      lastIDCurr = $(this).data('smsid');
                      lastStatusCurr = $(this).data('status');
                  });

                  if (lastID != lastIDCurr || lastStatus!=lastStatusCurr) {
                      //THIS WILL SCROLL THE TEXT, SO ONLY UPDATE IT IF IT CHANGES. 
                      $('#convoscroll').html(data);
                      scrollTopConvo();
                  }
              });
        setTimeout(refreshConvo, 5000);
         <%}%>
     }

     <%}%>

</script>
     <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>


<div id="divConvo" runat="server">
    <div class="widget">
    <h3>Conversation with <asp:PlaceHolder ID="phHeading" runat="server"></asp:PlaceHolder></h3>
    
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
           <asp:PlaceHolder ID="phBread" runat="server"></asp:PlaceHolder>
           <li class="breadcrumb-item active" aria-current="page"><asp:Label ID="lblBreadCurrPage" runat="server"></asp:Label></li>
      </ol>
  </nav>


        <div class="row">
            <div class="col-sm-6">
                
        <div id="conversationbody">

            
                <div id="smspreview">
    
                  <div class="panel panel-default">
                    <div class="panel-heading text-center">
                      <div class="row">
                        <div class="col-md-2">
                           
                        </div>
                        <div class="col-md-offset-3 col-md-2">
                          <div id="contact">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                          </div>
                          <xsl:value-of select="$title"/>
                        </div>
                        <div class="col-md-offset-3 col-md-2">
                           <!-- info button was here -->
                        </div>
                      </div>
                    </div>
                    <div class="panel-body" id="convoscroll">
               <asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>

                        <asp:Panel runat="server" ID="pnlSampleTexts">
                            
                                <div class="row" >
                                    <div class="message message-out pull-right smsmsg" data-smsid="" data-status="Delivered">This is a sample outgoing SMS text message!</div>
                                </div>
                                <div class="row">
                                    <div class="message message-in pull-left smsmsg" data-smsid="" data-status="Received">When customers answer, it will appear here!</div>
                                </div>

            

                        </asp:Panel>
            

                    </div>
                    <div class="panel-footer">
         
                              <asp:Panel runat="server" ID="pnlSendMessage" DefaultButton="btnSendMessage" CssClass="input-group">
                            <asp:TextBox runat="server" ID="txtMessage" CssClass="form-control" Placeholder="Message"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:LinkButton runat="server" ID="btnSendMessage" OnClick="btnSendMessage_Click" CssClass="btn btn-primary">
                                    <span class="glyphicon glyphicon-send"></span>
                                </asp:LinkButton>
                            </span>
                                   </asp:Panel>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-6">
                <h4>Recipient's Waiver</h4>
                <asp:PlaceHolder runat="server" ID="phWaiverInfo"></asp:PlaceHolder>

            
                <asp:Panel runat="server" ID="pnlSampleWaiver">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>
                                    <label>Name</label></td>
                                <td>John Smith</td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Email</label></td>
                                <td><a href="mailto:sample@gmail.com" obf="true">sample@gmail.com</a></td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Date Signed</label></td>
                                <td><%=DateTime.Now.ToLongDateString() %> </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <em>This section displays the related waiver for a customer who is texting with you.</em>
                                    </td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="javascript:alert('This is just a sample - when a conversation is linked to a signed waiver, this button will take you to that waiver');" class="btn btn-default">View Waiver</a>
                    </asp:Panel>
            


            </div>
        </div>


      
    
</div>
</div>




</asp:Content>
