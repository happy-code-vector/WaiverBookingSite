<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubscriptionAndUsageCheck.ascx.cs" Inherits="WaiverFile.Controls.SubscriptionAndUsageCheck" %>

<asp:PlaceHolder ID="phMessages" runat="server"></asp:PlaceHolder>
<%if(_showModal){ %>


<!-- Button trigger modal -->
<script type="text/javascript">
    var myTimer;

    function doModalShow() {
        <%      if (_hardLockoutModal) { %>
        $('#myModal').modal({ backdrop: 'static', keyboard: false })  
        <%}else{%>
        $('#myModal').modal('show');
        <%}%>
    }
    function showModal() {
        if (!(($("#myModal").data('bs.modal') || {}).isShown)) {
            doModalShow();
         }
    } 
    $(document).ready(function () {
        doModalShow();
       myTimer = setInterval(showModal, 300000); //5 mins
        $('#myModal').on('hidden.bs.modal', function () {
            //RESET TIMER TO 5 MINS
            clearInterval(myTimer);
            myTimer = setInterval(showModal, 300000); //5 mins
        });

    });

 
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <%=_modalMessage %>
      </div>
    </div>
  </div>
</div>


<% } %>