<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EasySignup_WestBend.ascx.cs" Inherits="WaiverFile.Controls.EasySignup_WestBend" %>


<script type="text/javascript">

    var minScore = <%= (int)Waypoint.Security.PasswordAdvisor.GetRequiredPasswordScore() %>;

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
        
        var password = $('#<%=txtPassword.ClientID%>').val();
        var score = getScore(password);

        var cssClass='text-success';
        if (score < minScore) {
            cssClass='text-danger';
        }
        else if (score == minScore && minScore != 5) {
            cssClass='text-warning';
        } else {
            cssClass='text-success';
        }
         var iconCode = '<i class="fa fa-times-circle"></i> ';
        if (score < minScore) {
             $('#<%=btnSubmit.ClientID %>').attr('disabled', 'disabled');
        } else {
            iconCode = '<i class="fa fa-check-circle"></i> ';
            $('#<%=btnSubmit.ClientID %>').removeAttr('disabled');
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
        $('#pass_strength_wrap').show();
        $('#pass_strength').attr('class', cssClass);
        $('#pass_strength').html(iconCode + scoreName);

        
    }

    $(document).ready(function () {
        $('#<%=btnSubmit.ClientID %>').attr('disabled', 'disabled');
        $('#<%=txtPassword.ClientID%>').keyup(function () { checkStrength(); });
        $('#<%=txtPassword.ClientID%>').change(function () { checkStrength(); });
    });


      //PREVENT DOUBLE SUBMIT
      var isSubmitted = false;
      function preventMultipleSubmissions(selClass) {
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
<h2>West Bend Customer Signup</h2>
<p>To get started .</p>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
  <div id="messages"></div>
<div class="form"> 
    <div class="form-group">
        <label>Name *</label>
        <asp:TextBox id="txtName" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Name is required"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Company / Organization</label>
        <asp:TextBox id="txtCompany" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Company is required"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>West Bend Policy #</label>
        <asp:TextBox id="txtWestBendPolicyNum" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Policy number is required"></asp:TextBox>
    </div>
<div class="form-group">
        <label>Email *</label>
        <asp:TextBox id="txtEmail" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Email is required"></asp:TextBox>
    </div>
<div class="form-group">
        <label>Create a Password *</label>
        <asp:TextBox id="txtPassword" runat="server" CssClass="form-control" TextMode="Password" data-fv-noempty="true" data-fv-notempty-message="Password is required"></asp:TextBox>
    </div>
     <div id="pass_strength_wrap" style="display:none;">
            Password strength: <span id="pass_strength" style="font-weight:700;"></span><br />
            

        </div>

      <p class="help-block">
          By signing up you agree to the <a href="/Terms-of-Use-West-Bend.aspx" target="_blank">Terms of Use <i class="fa fa-external-link"></i></a>.
      </p>
    
    <!--<div class="form-group">
        
        <asp:CheckBox id="chkAgree" runat="server"></asp:CheckBox> I have read and agree to the <a href="/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use</a>
    </div>-->

<div class="form-group">
<asp:Button ID="btnSubmit" runat="server" Text="Start Your Free Trial" CssClass="btn btn-primary trial-submit-btn" OnClientClick="return preventMultipleSubmissions('.trial-submit-btn');" OnClick="btnSubmit_Click" />

    </div>

</div>