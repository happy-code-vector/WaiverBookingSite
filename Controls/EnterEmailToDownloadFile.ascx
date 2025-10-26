<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnterEmailToDownloadFile.ascx.cs" Inherits="WaiverFile.Controls.EnterEmailToDownloadFile" %>

<%if(AutoPopModal) {%>

<script type="text/javascript">
    $(function () {
        $('.<%=ClientID%>filemodal').modal('show');
    });
</script>

<%} %>

<%if(PopFile) {%>

<script type="text/javascript">
    $(function () {
        setTimeout(function () {
            window.open('<%=FilePath%>', '_blank');
        }, 1800);
    });
</script>

<%} %>
<script type="text/javascript">
    $(function () {
        $('.showthemodal').click(function () {
            var target = $(this).data('modaltarget');
            $(target).modal('show');
        });
    });
</script>


<asp:PlaceHolder runat="server" id="phErr"></asp:PlaceHolder>

<asp:PlaceHolder runat="server" id="ph0"></asp:PlaceHolder>