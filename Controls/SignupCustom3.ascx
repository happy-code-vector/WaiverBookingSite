<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignupCustom3.ascx.cs" Inherits="WaiverFile.Controls.SignupCustom3" %>

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
    var passwordOK = false;

    function checkStrength() {
        
        var password = $('#<%=txtPassword.ClientID%>').val();
        if (password == "") {
            return true;
        }
        var score = getScore(password);
        var minScore = 4;
        //
      
        var iconCode = '<i class="fa fa-times-circle"></i> ';

        if (score < minScore) {
            cssClass = 'text-danger';
            //$('#<%=btnSubmit.ClientID %>').attr('disabled', 'disabled');
            passwordOK = false;
        } else {
            cssClass = 'text-success';
            iconCode = '<i class="fa fa-check-circle"></i> ';
            passwordOK = true;
            //$('#<%=btnSubmit.ClientID %>').removeAttr('disabled');
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

        return true;
    }

    $(document).ready(function () {
        
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




<asp:Panel runat="server" ID="pnlStep1" DefaultButton="btnSubmit">
    
    <h2>Collect this form online with WaiverFile:</h2>

    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>


    <!--
<ul class="list-unstyled">
    <li><span class="fa fa-check-circle green-check"> </span> <strong>Customize the form</strong></li>
    <li><span class="fa fa-check-circle green-check"> </span> <strong>Share the link</strong></li>
    <li><span class="fa fa-check-circle green-check"> </span> <strong>Sign on any device</strong></li>
    <li><span class="fa fa-check-circle green-check"> </span> <strong>Waivers stored securely</strong></li>
</ul>
    <hr />-->

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
        <asp:TextBox id="txtEmail" runat="server" CssClass="form-control" data-fv-noempty="true" data-fv-notempty-message="Email is required"></asp:TextBox>
    </div>
 <div class="form-group">
        <label for="<%=txtPassword.ClientID %>">Create a Password *</label>
        <asp:TextBox id="txtPassword" runat="server" CssClass="form-control" TextMode="Password" data-fv-noempty="true" data-fv-notempty-message="Password is required" AutoCompleteType="Disabled"></asp:TextBox>
    </div>
        <div id="pass_strength_wrap" style="display:none;">
            Password strength: <span id="pass_strength" style="font-weight:700;"></span><br />
            

        </div>
        <h3><small><span style="font-size: 12px;"><strong>Disclaimer</strong></span></small></h3>
        <span style="font-size: 12px;">
            Use of WaiverFile is subject to our <a href="/Policies/Terms-of-Use.aspx" target="_blank">Terms of Use <i class="fa fa-external-link"></i></a>. The content on this site is not legal advice. No attorney-client relationship is established. To ensure your online waiver form is legally binding based on your location, industry, and specific circumstances, consult a legal professional in your area.
            </span>
        <p>
            <small style="font-weight:700">
                <asp:CheckBox runat="server" ID="chkAgree" /> I agree
                    
            </small>
        </p>
        


<div class="form-group">
<asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary trial-submit-btn" OnClientClick="return preventMultipleSubmissions('.trial-submit-btn');" OnClick="btnSubmit_Click" />

    </div>

</div>
</asp:Panel>



