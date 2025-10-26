<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Conversation.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.Conversation" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<link type="text/css" href="/wp-content/Plugins/WaiverFile/Docs/WFSMS/wfsms.css" rel="stylesheet" />
<script type="text/javascript">
    $(document).ready(function () {
        CalcLen();
        CalcLenNew();
        $('#<%=txtMessage.ClientID%>').keyup(function () {
            CalcLen();
        });
        $('#<%=txtMessageNew.ClientID%>').keyup(function () {
            CalcLenNew();
        });
    });

   
</script>
 
<script type="text/javascript">
     function OnClientItemsRequesting(sender, eventArgs) {
         var context = eventArgs.get_context();
         context["FilterString"] = eventArgs.get_text();
         context["siteid"] = '<%=site.ID%>';
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

    function CalcLenNew() {
        var text_max = 160;
        var text_length = $('#<%=txtMessageNew.ClientID%>').val().length;
        if (text_length <= text_max) {
            var text_remaining = text_max - text_length;
            $('#textarea_feedback_new').html((text_max - text_length) + ' characters remaining');
        } else {
            $('#textarea_feedback_new').html('This message will be sent in ' + Math.ceil(text_length / text_max) + " parts.");
        }
    }

     <% if(_id!=Guid.Empty){ %>

     $(document).ready(function () {
         CalcLen();
         $('#<%=txtMessage.ClientID%>').keyup(function () {
             CalcLen();
         });

         setTimeout(refreshConvo, 8000);
     });

     function refreshConvo() {
         $.post("/wp-content/Plugins/WaiverFile/Controls/WFSMSControls/ConversationFeed.ashx", { id: '<%=_id.ToString()%>', siteid: '<%=site.ID.ToString()%>' },
              function (data) {
                  var lastID = '';
                  var lastStatus = '';
                  $(data).find('.smsmsg:last').each(function () {
                      lastID = $(this).data('smsid');
                      lastStatus = $(this).data('status');
                  });
                  var lastIDCurr = '';
                  var lastStatusCurr = '';
                  $('.conversation').find('.smsmsg:last').each(function () {
                      lastIDCurr = $(this).data('smsid');
                      lastStatusCurr = $(this).data('status');
                  });

                  if (lastID != lastIDCurr || lastStatus!=lastStatusCurr) {
                      //THIS WILL SCROLL THE TEXT, SO ONLY UPDATE IT IF IT CHANGES. 
                      $('#conversationbody').html(data);
                  }
              });
         setTimeout(refreshConvo, 8000);
     }

     <%}%>

</script>
<div id="divNewConvoForm" runat="server">
     <div class="widget">
    <h3>Start a New Converstaion</h3>
    <div class="widgetcontent">
    <asp:PlaceHolder ID="phErrNewConvo" runat="server"></asp:PlaceHolder>
    <p><label>To</label><telerik:RadComboBox ID="cboTo" runat="server" EnableLoadOnDemand="true" OnClientItemsRequesting="OnClientItemsRequesting">
  <WebServiceSettings Method="MobileNumberOrNameSearch" Path="/Controls/WFSMSControls/GetMN.asmx" />
  </telerik:RadComboBox></p>
        <p class="note">Enter a name or phone number.</p>
        <p><asp:TextBox ID="txtMessageNew" runat="server" TextMode="MultiLine"></asp:TextBox></p>
        <p class="note" id="textarea_feedback_new"></p>
        <p><asp:Button ID="btnStartConvo" runat="server" CssClass="btn" Text="Send" OnClick="btnStartConvo_Click" /></p>

</div></div>

</div>
<div id="divConvo" runat="server">
    <div class="widget">
    <h3>Conversation with <asp:PlaceHolder ID="phHeading" runat="server"></asp:PlaceHolder></h3>
    <div class="widgetcontentgrid">
    
        <div id="conversationbody">
   <asp:PlaceHolder ID="ph0" runat="server"></asp:PlaceHolder>
            </div>

</div></div>

<div class="widget">
    <div class="widgetcontent">
    
        <asp:Panel runat="server" ID="pnlSendMessage" DefaultButton="btnSend">
   <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
            <p class="note" id="textarea_feedback"></p>
        <asp:Button id="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />

            </asp:Panel>

</div></div>


</div>


