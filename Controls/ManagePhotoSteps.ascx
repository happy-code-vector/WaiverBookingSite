<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManagePhotoSteps.ascx.cs" Inherits="WaiverFile.Controls.ManagePhotoSteps" %>
<h3>Photo Capture Settings</h3>
<p>The WaiverFile mobile app allows for capturing photos while collecting waivers. Use the settings below to add photo steps to the process.</p>
<p><strong>* Additional storage fees apply. <a href="StoragePricing.aspx">View Pricing</a></strong></p>

<asp:Panel runat="server" Visible="false">
    <%/* DISABLING THE PHOTO STEPS FOR NOW. WE WILL USE THE MANUAL STEPS ONLY.  */ %>
<h4>Photo Capture Mode</h4>
<div class="row">
    <div class="col-sm-4">
        <div class="well">
        <strong>
            <asp:RadioButton runat="server" ID="rbDisable" GroupName="photomode" Text="Disable" AutoPostBack="true" OnCheckedChanged="rbDisable_CheckedChanged" /> <br />
        </strong>
        <small>Don't capture photos.</small>
            </div>
    </div>
    <div class="col-sm-4">
        <div class="well">
        <strong>
            <asp:RadioButton runat="server" ID="rbStep" GroupName="photomode" Text="Prompt for Photo" AutoPostBack="true" OnCheckedChanged="rbStep_CheckedChanged"/> <br />
        </strong>
        <small>Adds a step to take a photo after reading the agreement.</small>
            </div>
    </div>
    <div class="col-sm-4">
        <div class="well">
        <strong>
            <asp:RadioButton runat="server" ID="rbAuto" GroupName="photomode" Text="Automatic Photos" AutoPostBack="true" OnCheckedChanged="rbAuto_CheckedChanged" /> <br />
        </strong>
        <small>Takes a series of photos throughout the signing process. No preview is shown to the signee. <br /><em>* If using this option, please be sure it is in line with your privacy policies.</em></small>
            </div>
    </div>
    
</div>
</asp:Panel> 





<asp:PlaceHolder ID="phSteps" runat="server"></asp:PlaceHolder>
