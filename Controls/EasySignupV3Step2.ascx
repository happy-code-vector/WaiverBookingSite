<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EasySignupV3Step2.ascx.cs" Inherits="WaiverFile.Controls.EasySignupV3Step2" %>

<style type="text/css">
    .rbl label{ margin-right: 15px; margin-left: 5px;}
</style>

 <script runat="server">

      protected override void OnInit(EventArgs e)
      {


Page.MaintainScrollPositionOnPostBack = true; 
base.OnInit(e);
}
</script>


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
        if (RegExp('[a-z]').test(password) &&
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
        if (hipnote)

            var cssClass = 'text-success';
        if (score < minScore) {
            cssClass = 'text-danger';
        } else {
            cssClass = 'text-success';
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


    }

    $(document).ready(function () {
        $('#<%=btnSubmit2.ClientID %>').attr('disabled', 'disabled');
        $('#<%=txtPassword.ClientID%>').keyup(function () { checkStrength(); });
        $('#<%=txtPassword.ClientID%>').change(function () { checkStrength(); });
        $('input[type=radio]').change(function () { checkStrength(); });
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

<div class="logo-signupstep2-page">
    <img src="/wp-content/images/waiverfile-logo-lg.png" alt="Waiver logo"  height="26" width="150" >
</div>
<div class="signupstep2-box">
    <h2>Thanks!</h2>

    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="phErr2" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label for="<%=rblMedicalInfo.ClientID %>">Will you be requesting PHI (Protected Health Information) that must comply with the HIPAA Privacy Rule or HIPAA Security Rule?</label><br />
            <small><a href="javascript:void(0);" data-toggle="modal" data-target="#myModal">What's this? <i class="fa fa-external-link"></i></a></small>
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
     <div class="form-group">
        <label for="<%=txtEmail2.ClientID %>">Email *</label>
        <asp:TextBox id="txtEmail2" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
    </div>
        <div class="form-group">
            <label for="<%=txtPassword.ClientID %>">Create a Password *</label>
            <asp:TextBox id="txtPassword" runat="server" CssClass="form-control" TextMode="Password" data-fv-noempty="true" data-fv-notempty-message="Password is required"></asp:TextBox>
        </div>
        <div id="pass_strength_wrap" style="display:none;">
             <div class="form-group">
                Password strength: <span id="pass_strength" style="font-weight:700;"></span>
                 </div>
            </div>
        <div class="form-group">
            <label for="<%=txtPassword2.ClientID %>">Confirm your Password *</label>
            <asp:TextBox id="txtPassword2" runat="server" CssClass="form-control" TextMode="Password" data-fv-noempty="true" data-fv-notempty-message="Password confirmation 
                is required"></asp:TextBox>
        </div>
    
        <div class="form-group">
    <asp:Button ID="btnSubmit2" runat="server" Text="Continue" CssClass="btn btn-primary trial-submit-btn2" OnClientClick="return preventMultipleSubmissions('.trial-submit-btn2');" OnClick="btnSubmit2_Click" />
    </div>
    </div>