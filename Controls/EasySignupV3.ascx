<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EasySignupV3.ascx.cs" Inherits="WaiverFile.Controls.EasySignupV3" %>

<style type="text/css">
    .rbl label{ margin-right: 15px; margin-left: 5px;}
</style>


<script type="text/javascript">

    
    function getScore(password) {
        var score = 0;
        var detail = '';
        if (password.length < 1) {
            return 0;
        }
        if (password.length < 4) {
            return 1;
        }

        if (password.length >= 8) {
            detail += 'len > 8 ';
            score++;
        }
        if (password.length >= 12) {
            detail += 'len > 12 ';
            score++;
        }
        
        if (RegExp(/\d+/).test(password)) {
            detail += ' decimal ';
            score++;
        }
        if (RegExp( '[a-z]').test(password) &&
            RegExp('[A-Z]').test(password)) {
            detail += 'upperlower ';
            score++;
        }
        if (RegExp('.[!,@,#,$,%,^,&,*,?,_,~,-,£,(,)]').test(password)) {
            detail += 'char ';
            score++;
        }
        return score;
    }

    function checkStrength() {
        
       
        var minScore = 3;
        var isSecureMode = false;
        
        if ($('#<%=rblMedicalInfo.ClientID%> input:checked').val() == 'YES') {
            isSecureMode = true;
            minScore = 4;
        } else {
            isSecureMode = false;
        }
        if ($('#<%=rblMedicalInfo.ClientID%> input:checked').val() == 'NOTSURE') {
            $('#hipnote').show();
        } else {
            $('#hipnote').hide();
        }
        //


            <%if (pnlCreatePassword.Visible) { %>
        
            var password = $('#<%=txtPassword.ClientID%>').val();
        var score = getScore(password);
        var cssClass='text-success';
        if (score < minScore) {
            cssClass='text-danger';
        } else {
            cssClass='text-success';
        }
        var iconCode = '<i class="fa fa-times-circle"></i> ';

        if (score < minScore) {
             $('#<%=btnSubmit2.ClientID %>').attr('disabled', 'disabled');
        } else {
            iconCode = '<i class="fa fa-check-circle"></i> ';
            $('#<%=btnSubmit2.ClientID %>').removeAttr('disabled');
        }
       
        var scoreName = 'Blank';
        switch (score) {
             case 0:
                scoreName = 'Very Weak'; //UNDER 4 CHARS DOES THIS, SO DON'T CALL IT BLANK
                break;
            case 1:
                scoreName = 'Very Weak';
                break;
            case 2:
                scoreName = 'Weak';
                break;
            case 3:
                scoreName = 'Medium';
                break;
            case 4:
                scoreName = 'Strong';
                break;
            default:
                scoreName = 'Very Strong';
                break;
        }
        
        if (password.length == 0) {
            $('#pass_strength_wrap').hide();
        } else {
            $('#pass_strength_wrap').show();
        }
        $('#pass_strength').attr('class', cssClass);
        $('#pass_strength').html(iconCode + scoreName);
        <%  }
            else
            {%>
        $('#<%=btnSubmit2.ClientID %>').removeAttr('disabled');
            <%}%>
        
    }

    $(document).ready(function () {
        $('#<%=btnSubmit2.ClientID %>').attr('disabled', 'disabled');
        $('#<%=txtPassword.ClientID%>').keyup(function () { checkStrength(); });
        $('#<%=txtPassword.ClientID%>').change(function () { checkStrength(); });
        $('input[type=radio]').change(function () { checkStrength(); });
    });


      //PREVENT DOUBLE SUBMIT
    var isSubmitted = false;
    var originalText = '';

    function preventMultipleSubmissions(selClass) {
        if (originalText == '') {
            originalText = $(selClass).val();
        }
        //RESET AFTER 5 SECONDS
        setTimeout(() => {
            isSubmitted = false;
            $(selClass).val(originalText);

        }, 5000);

      if (!isSubmitted) {
      $(selClass).val('Submitting...');
      isSubmitted = true;
      return true;
      }
      else {
      return false;
      }
      }

</script>


<asp:Panel runat="server" ID="pnlStep1">
   
    
 <h3>30‑Day Free Trial</h3>
<p>Jumpstart your switch to digital waivers. For 30 days, enjoy full access—waiver templates, real-time signatures, secure storage, and more—completely free. No payment details required. </p>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <div class="form"> 
    <div class="form-group">
        <label for="<%=txtName.ClientID %>">Your Name *</label>
        <asp:TextBox id="txtName" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Name is required"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="<%=txtCompany.ClientID %>">Company Name *</label>
        <asp:TextBox id="txtCompany" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Company is required"></asp:TextBox>
    </div>
    
<div class="form-group">
        <label for="<%=txtEmail.ClientID %>">Email *</label>
        <asp:TextBox id="txtEmail" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Email is required" AutoCompleteType="Email" ClientIDMode="Static"></asp:TextBox>
    </div>

      <p class="help-block">
          By signing up you agree to the <a href="https://www.waiverfile.com/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use <i class="fa fa-external-link"></i></a>.
      </p>
        <asp:PlaceHolder runat="server" ID="phAdditionalTerms"></asp:PlaceHolder>

<div class="form-group">
<asp:Button ID="btnSubmit" runat="server" Text="Start Your Free Trial" CssClass="btn btn-primary trial-submit-btn" OnClientClick="return preventMultipleSubmissions('.trial-submit-btn');" OnClick="btnSubmit_Click" />

    </div>

</div>
</asp:Panel>




<!-- panel 2 -->
<asp:Panel runat="server" ID="pnlStep2">

    <h2>Thanks!</h2>
    <h3>Let's get your account set up...</h3>

    

    <asp:PlaceHolder ID="phErr2" runat="server"></asp:PlaceHolder>
    <asp:Panel runat="server" ID="pnlHipaa">
    <div class="form-group">
        <label for="<%=rblMedicalInfo.ClientID %>">Do you require HIPAA Compliance?</label><br />
        <small>Will you be requesting PHI (Protected Health Information) that must comply with the HIPAA Privacy Rule or HIPAA Security Rule? <a href="javascript:void(0);" data-toggle="modal" data-target="#myModal">More info <i class="fa fa-external-link"></i></a>
            </small>
    </div>
      <div class="form-group rbl">
    <asp:RadioButtonList runat="server" ID="rblMedicalInfo" RepeatLayout="Flow" RepeatDirection="Horizontal">
        <asp:ListItem Value="YES" >Yes</asp:ListItem>
        <asp:ListItem Value="NO" >No</asp:ListItem>
        <asp:ListItem Value="NOTSURE" >I'm not sure</asp:ListItem>
        </asp:RadioButtonList>
          </div>
    <div class="WPERR_Information" id="hipnote" style="display:none;">
        That's OK. We'll start you out with a regular account. If you find that you need a HIPAA-Compliant solution, just let us know and we can upgrade your account anytime. 
    </div>
    <!-- display the email so browsers can save the login info more easily -->
   </asp:Panel>

    
    <asp:Panel runat="server" ID="pnlCreatePassword">
         <div class="form-group">
        <label for="<%=txtEmail2.ClientID %>">Email *</label>
        <asp:TextBox id="txtEmail2" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="<%=txtPassword.ClientID %>">Create a Password *</label>
        <asp:TextBox id="txtPassword" runat="server" CssClass="form-control" TextMode="Password" data-fv-noempty="true" data-fv-notempty-message="Password is required"></asp:TextBox>
    </div>
     
    <div class="form-group">
        <label for="<%=txtPassword2.ClientID %>">Confirm your Password *</label>
        <asp:TextBox id="txtPassword2" runat="server" CssClass="form-control" TextMode="Password" data-fv-noempty="true" data-fv-notempty-message="Password confirmation 
            is required"></asp:TextBox>
    </div>
    <div id="pass_strength_wrap" style="display:none;">
      <div class="form-group">
       Password strength: <span id="pass_strength" style="font-weight:700;"></span><br />
       </div>

   </div>

        </asp:Panel>



    <div class="form-group">
<asp:Button ID="btnSubmit2" runat="server" Text="Continue" CssClass="btn btn-primary trial-submit-btn2" OnClientClick="return preventMultipleSubmissions('.trial-submit-btn2');" OnClick="btnSubmit2_Click" />

    </div>
</asp:Panel>

<asp:Panel runat="server" ID="pnlLogin">
    
 <h2>Log In</h2>
<p>Please log in to continue. <asp:LinkButton runat="server" ID="btnGoBack" OnClick="btnGoBack_Click">Go back</asp:LinkButton>.</p>

    <asp:PlaceHolder runat="server" ID="phErrLogin"></asp:PlaceHolder>
    <div class="WPERR_Information">You already have a login with us. Please log in below to continue.</div>

    <div class="form-group">
        <label for="<%=txtLoginEmail.ClientID %>">Email</label>
        <asp:TextBox id="txtLoginEmail" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
    </div>
      <div class="form-group">
        <label for="<%=txtLoginEmail.ClientID %>">Password</label>
        <asp:TextBox id="txtLoginPassword" runat="server"  TextMode="Password" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
    </div>

     <a href="<%=ForgotPasswordUrl %>" class="pull-right">Forgot Password?</a>
    <asp:Button runat="server" ID="btnLogin" Text="Log In" CssClass="btn btn-primary" OnClick="btnLogin_Click" />



</asp:Panel>

<!-- logged in, sub exists -->
<asp:Panel runat="server" ID="pnlAlreadyGotSub">
    <h2>Subscription Exists</h2>
     <div class="WPERR_Information">You already have a WaiverFile subscription.</div>

    <p class="text-center">
        <a href="/MyAccount" class="btn btn-primary">Go to My Account</a>
    </p>
    <p>
        <a href="/Contact.aspx">Contact us</a> if you wish to setup a new subscription or sub-account.
    </p>
    <div class="WPERR_Information" runat="server" id="divOfferButExistingAccount">The linked offer is for new customer accounts only. Please <a href="/Contact.aspx">Contact us</a> with any questions.</div>
</asp:Panel>






<!-- Modal -->
<div id="myModal" class="modal fade model-lg" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">About PHI</h4>
      </div>
      <div class="modal-body">

          <p>"Protected Health Information" (PHI) under the US law is any information about health status, provision of health care, or payment for health care that is created or collected by a Covered Entity (or a Business Associate of a Covered Entity), and can be linked to a specific individual.</p>

           <p>"Privacy Rule" means the Standards for Privacy of Individually Identifiable Health Information at 45 C.F.R. Part 160 and Part 164, Subparts A and E.  </p>
            
          <p>"Security Rule" will mean the Security Standards at 45 C. F.R. Part 160 and Part 164, Subparts A and C. </p>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
