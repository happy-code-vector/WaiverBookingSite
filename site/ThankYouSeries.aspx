<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="ThankYouSeries.aspx.cs" Inherits="WaiverFile.site.ThankYouSeries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
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
     <asp:PlaceHolder runat="server" ID="phQRTicket"></asp:PlaceHolder>

</asp:Panel>
<asp:PlaceHolder ID="phCustomOut" runat="server" />
</asp:Content>
