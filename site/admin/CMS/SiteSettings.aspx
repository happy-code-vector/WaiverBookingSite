<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SiteSettings.aspx.cs" Inherits="WaiverFile.site.admin.CMS.SiteSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <script>
        $(function () {
            $('.secret-key').each(function () {
                if ($(this).val()) {
                    $(this).attr('type', 'password'); // start hidden
                }
            });

            $('.toggle-key').on('click', function () {
                var targetId = $(this).data('target');
                var $input = $('#' + targetId);
                var $icon = $(this).find('.glyphicon');

                if ($input.attr('type') === 'password') {
                    $input.attr('type', 'text');
                    $icon.removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
                } else {
                    $input.attr('type', 'password');
                    $icon.removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open');
                }
            });
        });

    </script>


    <h3>Website Settings</h3>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <h2>reCAPTCHA</h2>
<p>
    To use reCAPTCHA on a custom domain, enter your custom site and secret keys below. reCAPTCHA provides a more user-friendly experience compared to the default distorted-letter CAPTCHA. 
    <br />
    If no keys are provided, reCAPTCHA will be used automatically on WaiverFile.com domains. For custom domains without keys, the system will fall back to the default CAPTCHA.
</p>

<div class="form-group">
    <label for="<%= txtRecaptchaSiteKey.ClientID %>">reCAPTCHA Site Key</label>
    <div class="input-group">
        <asp:TextBox ID="txtRecaptchaSiteKey" runat="server" CssClass="form-control secret-key">
        </asp:TextBox>
        <span class="input-group-btn">
            <button type="button" class="btn btn-default toggle-key" data-target="<%= txtRecaptchaSiteKey.ClientID %>">
                <span class="glyphicon glyphicon-eye-open"></span>
            </button>
        </span>
    </div>
</div>

<div class="form-group">
    <label for="<%= txtRecaptchaSecretKey.ClientID %>">reCAPTCHA Secret Key</label>
    <div class="input-group">
        <asp:TextBox ID="txtRecaptchaSecretKey" runat="server" CssClass="form-control secret-key"></asp:TextBox>
        <span class="input-group-btn">
            <button type="button" class="btn btn-default toggle-key" data-target="<%= txtRecaptchaSecretKey.ClientID %>">
                <span class="glyphicon glyphicon-eye-open"></span>
            </button>
        </span>
    </div>
</div>


                
               
                <p><strong>What is reCAPTCHA?</strong></p>
                <p>reCAPTCHA is a free service that protects your website from spam and abuse. reCAPTCHA uses an advanced risk analysis engine and adaptive CAPTCHAs to keep automated software from engaging in abusive activities on your site. It does this while letting your valid users pass through with ease.<br>
                    <br>
                    <a href="https://www.google.com/recaptcha/" target="_blank">Learn more about reCAPTCHA</a>. To get a license key, <a href="https://www.google.com/recaptcha/admin" target="_blank">click here</a>.
                </p>
               

             
    <asp:Button runat="server" ID="btnSave" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                



</asp:Content>
