<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BookingStandardPage.Master" AutoEventWireup="true" CodeBehind="OrderConfirmation.aspx.cs" Inherits="WaiverFile.sitebooking.OrderConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="container py-5">
  <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>


           <asp:Panel runat="server" ID="pnlCreatePassword" Visible="false">

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
               </script>

               <hr />
<div class="mb-4">
    <h5>Create Your Password</h5>
    <p class="text-muted">Set up a password to manage your booking and access your account later.</p>
</div>

<div class="mb-3">
    <label for="<%= txtPassword.ClientID %>" class="form-label">Password *</label>
    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"
        data-fv-noempty="true" data-fv-notempty-message="Password is required"></asp:TextBox>
</div>

<div id="pass_strength_wrap" class="mb-2" style="display:none;">
    <span class="form-text">Password strength: <span id="pass_strength" class="fw-bold"></span></span>
</div>

<div class="mb-3">
    <label for="<%= txtPassword2.ClientID %>" class="form-label">Confirm Password *</label>
    <asp:TextBox ID="txtPassword2" runat="server" CssClass="form-control" TextMode="Password"
        data-fv-noempty="true" data-fv-notempty-message="Password confirmation is required"></asp:TextBox>
</div>

<div class="mb-4">
    <asp:Button ID="btnSubmit2" runat="server" Text="Create Account" CssClass="btn btn-primary"
        OnClientClick="return preventMultipleSubmissions('.btn-primary');"
        OnClick="btnSubmit2_Click" />
</div>


           </asp:Panel>

  <asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>
       </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
