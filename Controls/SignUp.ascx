<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignUp.ascx.cs" Inherits="WaiverFile.Controls.SignUp" %>

<style type="text/css">
    #password_icon{ display:inline-block; }
    #password_reason{ clear:both;color: Red; font-weight:bold; }
    #password_icon img, #username_icon img{ width: 20px; vertical-align:middle;}

    #username_icon{ display:inline-block;}
    #username_reason{ clear:both;color: Red; font-weight:bold; }
</style>


<script type="text/javascript">
    function setPaymentMethod(pModID) {
        $('.payment_module_box').hide();
        //$('.payment_module_box').each(function(){ $(this).fadeOut(); });
        $('#pmod_' + pModID).fadeIn();
        $('#<%=btnSubmit.ClientID%>').show();

        if ($('#pmod_' + pModID).data('includerecurring') == 'True') {
            $('#recurringpaymentsbox').show();
        } else {
            $('#recurringpaymentsbox').hide();
        }
    }

    $(document).ready(function () {
        var tryNumber = 0;
        //prevent double submit
        $('.prevent_double_click').click(function (event) {
            var self = $(this);

            if (Page_ClientValidate()) {
                if (tryNumber > 0) {
                    tryNumber++;
                    //alert('Your form has been already submited. wait please');
                    return false;
                }
                else {
                    tryNumber++;
                }
            };
        });

        //HANDLE PAYMENT BOXES
        $('#<%=rblPaymentMethods.ClientID%> input').change(function () {
            setPaymentMethod($(this).attr('value'));
        });
        //SET THE FORM ON LOAD
        $('#<%=rblPaymentMethods.ClientID%> input').each(function () {
            if ($(this).is(':checked')) {
                setPaymentMethod($(this).attr('value'));
            }
        });

        //TIMER
        var typingTimer;
        var doneTypingInterval = 1500;

        //USERNAME
        $('#<%=txtUsername.ClientID %>').keyup(function () {
            typingTimer = setTimeout(checkUsername, doneTypingInterval);
            $('#username_icon').html('<img src="/wp-admin/images/loading.gif" alt="Checking Username" />');
        });
        $('#<%=txtUsername.ClientID %>').keydown(function () {
            clearTimeout(typingTimer);
        });
        //PASSWORD
        $('#<%=txtPassword.ClientID %>').keyup(function () {
            typingTimer = setTimeout(checkPassword, doneTypingInterval);
            $('#password_icon').html('<img src="/wp-admin/images/loading.gif" alt="Checking Password" />');
        });
        $('#<%=txtPassword.ClientID %>').keydown(function () {
            clearTimeout(typingTimer);
        });
    });


    //user is "finished typing," do something
    function checkPassword() {
        if ($('#<%=txtPassword.ClientID %>').val() == '') {
            $('#password_icon').html('');
            $('#password_reason').html('');
        } else {
            $.ajax({
                type: "POST",
                url: "/wp-content/Plugins/WPCommerce/Controls/UsernameCheck.ashx",
                data: { action: "checkpassword", password: $('#<%=txtPassword.ClientID %>').val() },
                success: function (data) {
                    if (data == 'OK') {
                        $('#password_icon').html('<img src="/wp-admin/images/ico-check.png" alt="Password OK" />');
                        $('#password_reason').html('');
                    } else if (data == 'SPACE') {
                        $('#password_icon').html('<img src="/wp-admin/images/ico-red-x.png" alt="Password error" />');
                        $('#password_reason').html('Passwords should not contain spaces.');
                    }
                    else if (data == 'LENGTH') {
                        $('#password_icon').html('<img src="/wp-admin/images/ico-red-x.png" alt="Password error" />');
                        $('#password_reason').html('Passwords must be at least 5 characters.');
                    }
                }
            });
        }
    }

    function checkUsername() {
        if ($('#<%=txtUsername.ClientID %>').val() == '') {
            $('#username_icon').html('');
            $('#username_reason').html('');
        } else {
            $.ajax({
                type: "POST",
                url: "/wp-content/Plugins/WPCommerce/Controls/UsernameCheck.ashx",
                data: { action: "checkusername", username: $('#<%=txtUsername.ClientID %>').val() },
                    success: function (data) {
                        if (data == 'AVAILABLE') {
                            $('#username_icon').html('<img src="/wp-admin/images/ico-check.png" alt="Username OK" />');
                            $('#username_reason').html('');
                        } else if (data == 'IN_USE') {
                            $('#username_icon').html('<img src="/wp-admin/images/ico-red-x.png" alt="Password error" />');
                            $('#username_reason').html('This name is already in use. Please choose another');
                        }
                        else if (data == 'LENGTH') {
                            $('#username_icon').html('<img src="/wp-admin/images/ico-red-x.png" alt="Password error" />');
                            $('#username_reason').html('Usernames must be at least 5 characters.');
                        }
                        else if (data == 'SPACES') {
                            $('#username_icon').html('<img src="/wp-admin/images/ico-red-x.png" alt="Password error" />');
                            $('#username_reason').html('Usernames cannot contain spaces.');
                        }
                    }
                });
            }
        }

</script>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<asp:PlaceHolder ID="phPrices" runat="server"></asp:PlaceHolder>

      <div class="row">
            
<asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnLogin">
    <div class="col-xs-12 col-sm-6">


<legend>Have an Account?</legend>
<div class="form-group"><label for="<%txtLoginEmail.ClientID %>"><%if(_includeUsernameField){ %>Username<%}else{ %>Email Address<% } %></label><asp:TextBox ID="txtLoginEmail" runat="server" CssClass="form-control"/> </div>
<div class="form-group"><label for="<%txtLoginPassword.ClientID %>">Password</label><asp:TextBox ID="txtLoginPassword" runat="server" CssClass="form-control" TextMode="Password"/> </div>
<div class="form-group"><asp:Button ID="btnLogin" runat="server" Text="Log In" onclick="btnLogin_Click" CausesValidation="false" ValidationGroup="disable" CssClass="btn btn-default" /></div>
<p class="note"><a href="<%=ForgotPasswordPage %>">Forgot your password?</a></p>

                </div>
         

</asp:Panel>

<asp:Panel ID="pnlCreateLogin" runat="server">
     <div class="col-xs-12 col-sm-6">

<legend>New Customers</legend>
<%if(_includeUsernameField){ %><div class="form-group"><label for="<%txtUsername.ClientID %>">Username</label><asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"/><span id="username_icon"></span><span id="username_reason"></span></div><%} %>
<div class="form-group"><label for="<%txtEmail.ClientID %>">Email Address</label><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"/> </div>
<div class="form-group"><label for="<%txtPassword.ClientID %>">Password</label><asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" /><span id="password_icon"></span><span id="password_reason"></span></div>
<div class="form-group"><label for="<%txtPassword2.ClientID %>">Confirm Password</label><asp:TextBox ID="txtPassword2" runat="server" CssClass="form-control" TextMode="Password"/> </div>
  <asp:CompareValidator ID="PasswordsSame" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="txtPassword2" ControlToValidate="txtPassword" CssClass="err"></asp:CompareValidator>
 </div>
</asp:Panel>
 </div>

<asp:Panel ID="pnlBasicInformation" runat="server">

    

<legend>Billing Information</legend>


      <div class="row">
            <div class="col-xs-12 col-sm-6">
                  <div class="form-group"><label for="<%txtFirst.ClientID %>">First Name</label><asp:TextBox ID="txtFirst" runat="server" CssClass="form-control"/></div>
                  <div class="form-group"><label for="<%txtLast.ClientID %>">Last Name</label><asp:TextBox ID="txtLast" runat="server" CssClass="form-control"/></div>
                <div class="form-group"><label for="<%txtCompany.ClientID %>">Company</label><asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"/></div>
                <div class="form-group"><label for="<%txtAddress.ClientID %>">Address</label><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"/></div>
                <div class="form-group"><label for="<%txtAddress2.ClientID %>">Address 2</label><asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control"/></div>
                <div class="form-group"><label for="<%txtAddress3.ClientID %>">Address 3</label><asp:TextBox ID="txtAddress3" runat="server" CssClass="form-control"/></div>
            </div>
            <div class="col-xs-12 col-sm-6">
                
                 <div class="form-group"><label for="<%txtCity.ClientID %>">City</label><asp:TextBox ID="txtCity" runat="server" CssClass="form-control"/></div>
                <%if(_supportInternationalAddresses){ %> 
                <div class="form-group"><label for="<%cboCountry.ClientID %>">Country</label><asp:DropDownList ID="cboCountry" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cboCountry_SelectedIndexChanged"/></div>
                <%} %>
                <div class="form-group"><label for="<%cboState.ClientID %>">State/Province</label><asp:DropDownList ID="cboState" runat="server" CssClass="form-control"/></div>
                 <div class="form-group"><label for="<%txtZip.ClientID %>">Zip</label><asp:TextBox ID="txtZip" runat="server" CssClass="form-control"/></div>
                 <div class="form-group"><label for="<%txtPhone.ClientID %>">Phone</label><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"/></div>
            </div>
        </div>

     
 

</asp:Panel>

<asp:PlaceHolder ID="phCustomFields" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlPaymentInformation" runat="server">


    <h4>Choose a payment method</h4>
    
    <div class="form-group">
        <asp:RadioButtonList ID="rblPaymentMethods" runat="server" RepeatLayout="Flow"></asp:RadioButtonList>
    </div>
     
    <div class="form-group"><div id="total" style="font-size:200%"></div><%if (Page is Waypoint.Core.WPAdminPage){ %>Price Override: <%} %><input type="<%if(Page is Waypoint.Core.WPAdminPage){ %>text<%}else{ %>hidden<%} %>" name="hidTotal" id="hidTotal" />
        <asp:PlaceHolder ID="phAdminPreviousPriceOverride" runat="server"></asp:PlaceHolder>
    </div>
    
      <div class="row">
          <div class="col-xs-12">
            <asp:PlaceHolder ID="phPaymentForms" runat="server"></asp:PlaceHolder>
          </div>
      </div>  

    <div class="form-group" id="recurringpaymentsbox" style="display:none;"><asp:CheckBox ID="chkRecurringPayments" runat="server" /> Automatically charge me at each billing cycle. </div>

    <div class="form-group"><asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-default" style="display:none;"
            onclick="btnSubmit_Click" /></div>

   
    
     
</asp:Panel>

