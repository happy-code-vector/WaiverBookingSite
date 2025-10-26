<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForgotPasswordWF.ascx.cs" Inherits="WaiverFile.Controls.ForgotPasswordWF" %>


<script type="text/javascript">

    var minScore = <%= (int)MinScore %>;

    function getScore(password) {
        var score = 0;
        var detail = '';
        if (password.length < 1) {
            return 0;
        }
        if (password.length < 6) {
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
             $('#<%=btnSetPassword.ClientID %>').attr('disabled', 'disabled');
        } else {
            iconCode = '<i class="fa fa-check-circle"></i> ';
            $('#<%=btnSetPassword.ClientID %>').removeAttr('disabled');
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
        $('#<%=btnSetPassword.ClientID %>').attr('disabled', 'disabled');
        $('#<%=txtPassword.ClientID%>').keyup(function () { checkStrength(); });
        $('#<%=txtPassword.ClientID%>').change(function () { checkStrength(); });
    });

</script>

<%if(_mode==  ForgotPasswordModeEnum.FetchUsername){ %>


    <p class="login-box-msg">Fetch Username</p>
    
    <asp:PlaceHolder ID="phErrorUsername" runat="server"></asp:PlaceHolder> 
     <div class="form-group"><label>Email Address</label><asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox></div>
     <div class="form-group"><asp:Button runat="server" ID="btnFetchUsername" Text="Continue" CssClass="btn btn-primary btn-block btn-flat" onclick="btnFetchUsername_Click" /></div>
     <p class="help-block">You will be sent an email containing your username. <a href="/wp-admin/login.aspx">Continue.</a></p>
    

    <%}else if(_mode== ForgotPasswordModeEnum.ResetPassword){ %>

    <h2>Reset your password</h2>
 <div class="well">
     <asp:PlaceHolder ID="phVerifyResetError" runat="server"></asp:PlaceHolder> 

        <asp:Panel ID="pnlResetForm" runat="server">
    <%if(!_accountVerified){ %>
    <div class="form-group"><label><%=_loginLabel %></label><asp:TextBox ID="txtVerifyLogin" runat="server" CssClass="form-control"></asp:TextBox></div>
    <div class="form-group"><label>Verification Code</label><asp:TextBox ID="txtVerifyCode" runat="server" CssClass="form-control"></asp:TextBox></div>
    <div class="form-group"><asp:Button ID="btnVerify" CssClass="btn btn-primary btn-block btn-flat" Text="Verify" runat="server" 
            onclick="btnVerify_Click" /></div>
    <%}else{ %>

     <div class="form-group"><label>New Password</label><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
         <div id="pass_strength_wrap" style="display:none;">
            Password strength: <span id="pass_strength" style="font-weight:700;"></span><br />
            

        </div>
     <div class="form-group"><label>Confirm Password</label><asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
     <div class="form-group"><asp:Button ID="btnSetPassword" CssClass="btn btn-primary btn-block btn-flat" Text="Set Password" 
             runat="server" onclick="btnSetPassword_Click" /><asp:Button ID="btnCancel" 
             runat="server" Text="Cancel" CssClass="btn btn-default btn-block btn-flat" onclick="btnCancel_Click" /></div>
     <%} %>
     </asp:Panel>
     </div>

    

 

<%}else if(_mode== ForgotPasswordModeEnum.Success){ %>
  
     <h2>Reset your password</h2>
    
        <div class="WPERR_Success">Password changed successfully. <a href="<%=SuccessLinkUrl %>"><%=SuccessLinkText %></a></div>
    
<%}else{ %>
    
     <h2>Reset your password</h2>

 <div class="well">

    <asp:PlaceHolder ID="phError" runat="server"></asp:PlaceHolder> 

     <div class="form-group"><label><%=_loginLabel %></label><asp:TextBox ID="txtLogin" runat="server" CssClass="form-control"></asp:TextBox></div>
     <%if(_siteIsInUsernameMode){ %><p><a href="?mode=fetchusername">Forgot your username?</a></p><%} %>
     <div class="form-group"><asp:Button runat="server" ID="btnSubmit" onclick="btnSubmit_Click" Text="Continue" CssClass="btn btn-primary" /></div>
    <p class="help-block">You will be sent a link that will allow you to reset your password. </p>

     </div>
    <%} %>