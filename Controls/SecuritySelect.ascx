<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecuritySelect.ascx.cs" Inherits="WaiverFile.Controls.SecuritySelect" %>

<asp:PlaceHolder ID="phMessages" runat="server"></asp:PlaceHolder>
<%if(_showModal){ %>

<!-- Button trigger modal -->

<style type="text/css">
    .rbl label{ padding-left:3px; padding-right: 10px;}
</style>

<script type="text/javascript">

     var isSubmitted = false;
      function preventMultipleSubmissionsSecSelect(selClass) {
      if (!isSubmitted) {
      $(selClass).val('Processing...');
          isSubmitted = true;
          if ($('#<%=rblMedicalInfo.ClientID%> input:first-child').is(':checked')) {
              //CONVERTING TO HIGH SECURITY. MESSAGE TO WAIT A MOMENT. 
              $('#waitmsg').show();
          }
      return true;
      }
      else {
      return false;
      }
      }



    $(document).ready(function () {
        $('#securityModeModal').modal('show');
       
    });

 
</script>

<!-- Modal -->
<div class="modal fade" id="securityModeModal" tabindex="-1" role="dialog" aria-labelledby="securityModeModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
          
          <h3>Protected Health Information Settings</h3>
          <p>We are taking steps to upgrade our systems in regards to PHI (Protected Health Information). </p>

          
          <h4>What is PHI?</h4>
          
               <p>"Protected Health Information" (PHI) under the US law is any information about health status, provision of health care, or payment for health care that is created or collected by a Covered Entity (or a Business Associate of a Covered Entity), and can be linked to a specific individual.</p>

           <p>"Privacy Rule" means the Standards for Privacy of Individually Identifiable Health Information at 45 C.F.R. Part 160 and Part 164, Subparts A and E.  </p>
            
          <p>"Security Rule" will mean the Security Standards at 45 C. F.R. Part 160 and Part 164, Subparts A and C. </p>


           <div class="form-group">
                <label for="<%=rblMedicalInfo.ClientID %>">Will you be requesting, capturing and/or storing PHI (Protected Health Information) that must comply with the HIPAA Privacy Rule or HIPAA Security Rule?</label><br />
            </div>


              <div class="form-group rbl">
            <asp:RadioButtonList runat="server" ID="rblMedicalInfo" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <asp:ListItem Value="YES" >Yes</asp:ListItem>
                <asp:ListItem Value="NO" >No</asp:ListItem>
                </asp:RadioButtonList>
                  </div>
          
        

          <div id="waitmsg" class="WPERR_Information" style="display:none;"><img src="/wp-content/images/loading.gif" alt="Processing Icon" /> Please wait while we make those changes. This can take several minutes, do not close this window or click the button again.</div>

           <div class="form-group">
<asp:Button ID="btnSubmit" runat="server" Text="Continue" CssClass="btn btn-primary securityselectbutton" OnClick="btnSubmit_Click" OnClientClick="return preventMultipleSubmissionsSecSelect('.securityselectbutton');" />

    </div>
          
      </div>
    </div>
  </div>
</div>


<% } %>