<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GenerateQRDialog.ascx.cs" Inherits="WaiverFile.Controls.GenerateQRDialog" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#btnShowAdvancedOptions').click(function () {
            $('#advanced_options').fadeIn();
            $(this).hide();
        });
    });
</script>

<h3>Generate QR Code</h3>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="phDetails" runat="server"></asp:PlaceHolder>
<p>
    <label>Target URL:</label>
<asp:TextBox runat="server" CssClass="form-control" ID="txtUrl"></asp:TextBox>
    </p>
<p>
    <label>Display URL: (for PDF flyer)</label>
<asp:TextBox runat="server" CssClass="form-control" ID="txtUrlDisplay"></asp:TextBox>
    </p>
<p class="help-block">Optionally use a shorter URL here for display rather than the full direct link that may be very long.</p>

            <h3>QR Code Options</h3>
            
<div class="form-group">
                <label>Image Type / Size</label>
                    <asp:DropDownList runat="server" ID="cboOutput" CssClass="form-control"></asp:DropDownList>
            </div>

<a href="javascript:void(0);" id="btnShowAdvancedOptions">Advanced Options<br /><br /></a>
<div style="display:none;" id="advanced_options">
            <div class="form-group">
                <label>Version <cc1:WPHelpIcon runat="server" HelpText="The version specified the overall size of the QR code (number of squares). The automatic option will select the smallest version that will hold the data provided."/></label>
                    <asp:DropDownList runat="server" ID="cboVersion" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Error Correction  <cc1:WPHelpIcon runat="server" HelpText="More error correction means that if a portion of the code is not legible, it can still be scanned. The percentage protection is listed under each option."/></label>
                    <asp:DropDownList runat="server" ID="cboErrorCorrection" CssClass="form-control">
                        <asp:ListItem Value="L">L (Approx 7%)</asp:ListItem>
                        <asp:ListItem Value="M" Selected="True">M (Approx 15%)</asp:ListItem>
                        <asp:ListItem Value="Q">Q (Approx 25%)</asp:ListItem>
                        <asp:ListItem Value="H">H (Approx 30%)</asp:ListItem>
                    </asp:DropDownList>
            </div>
            </div>

            
            <asp:Button runat="server" Text="Get QR Code" CssClass="btn btn-primary" ID="btnProcess" OnClick="btnProcess_Click" /> 
            <asp:hyperlink runat="server" CssClass="btn btn-default" id="btnBack">Back</asp:hyperlink>
