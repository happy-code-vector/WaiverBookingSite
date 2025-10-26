<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.ascx.cs" Inherits="WaiverFile.Controls.ThankYou" %>

<script type="text/javascript">

    //KILL SESSION BEFORE LEAVING PAGE
    $(window).bind('beforeunload', function () {
        var magicInput = document.getElementById('__EVENTTARGET');

        if (magicInput && magicInput.value) {
            //POSTBACK - DON'T KILL SESSION, WE'LL HANDLE ON SERVER SIDE IF NEEDED
        }
        else {
            
            $.ajax({
                type: "GET",
                url: "/Controls/KillSession.ashx?siteid=<%=site.ID%>",
                success: function () { },
                complete: function () {
                }
            });

        }
      });

</script>
<asp:PlaceHolder ID="phErr" runat="server"/>

<asp:Panel ID="pnlMain" runat="server">
    
        <h1><%=strHeading %></h1>
        <%if(strSubHeading!=""){ %>
        <h3><%=strSubHeading %></h3>
        <%} %>
        <br />
        <div class="row">
            <div class="col-sm-3 hidden-xs"></div>
            <div class="col-sm-6 text-center"><%=strBody %>    </div>
            <div class="col-sm-3 hidden-xs"></div>

        </div>


        <br />
        <br />

        <div class="ipa_small_button2">
            <%if(_showPrintButton){ %> <a href="/Controls/PrintWaiverEndUser.aspx?addr=<%=site.Url %>" class="btn btn-default" target="_blank"><%=strPrintButton %></a>  <% } %>
            <%if (_showEmailButton)
              { %> <asp:Button runat="server" CssClass="btn btn-default" ID="btnEmailCopy" Text="Email me a Copy" OnClick="btnEmailCopy_Click" />  <% } %>
            <asp:Button runat="server" ID="btnContinue" Text="Continue" CssClass="btn btn-default" OnClick="btnContinue_Click" />
        </div>
    <asp:PlaceHolder runat="server" ID="phQRTicket"></asp:PlaceHolder>
</asp:Panel>
<asp:PlaceHolder ID="phCustomOut" runat="server" />


<asp:Panel runat="server" ID="pnlAutoPrint">
    <iframe src="/Controls/PrintWaiverEndUser.aspx?mode=kioskreceipt&addr=<%=site.Url %>" width="1" height="1"></iframe>
</asp:Panel>