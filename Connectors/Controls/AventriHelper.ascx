<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AventriHelper.ascx.cs" Inherits="WaiverFile.Connectors.Controls.AventriHelper" %>

<asp:Panel runat="server" ID="pnlSessionWarning" Visible="false">
    <asp
<!-- Modal -->
<div class="modal fade" id="alertSessionWarning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Session expiring soon</h4>
      </div>
      <div class="modal-body">
        <div id="txtSessionExpiring"></div>
      </div>
      <div class="modal-footer">

           <a href="javascript:void(0);" class="btn btn-default" id="btnLogOut">Log Out</a>
           <a href="javascript:void(0);" class="btn btn-primary" id="btnKeepWorking">Keep Working</a>
      </div>
    </div>
  </div>
</div>

    

<!-- Modal -->
<div class="modal fade" id="alertSessionRedirecting" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Session expired</h4>
      </div>
      <div class="modal-body">
       Your session has expired. You are being redirected to the login screen. 
      </div>
      <div class="modal-footer">
        <a href="#" class="btn btn-primary" id="btnContinueToLogin">Continue</a>
      </div>
    </div>
  </div>
</div>
  <script type="text/javascript" src="/wp-content/Plugins/WaiverFile/Docs/SessionWarn.js"></script>



    </asp:Panel>