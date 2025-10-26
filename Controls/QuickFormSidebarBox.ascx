<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickFormSidebarBox.ascx.cs" Inherits="WaiverFile.Controls.QuickFormSidebarBox" %>
 
<script type="text/javascript">
    function handleQuickForm() {
        if ($('#rbSendForm').is(':checked')) { $('#divSendForm').show(); } else { $('#divSendForm').hide(); }
        if ($('#rbWebDemo').is(':checked')) { $('#divWebDemo').show(); } else { $('#divWebDemo').hide(); }
        if ($('#rbCallMe').is(':checked')) { $('#divCallMe').show(); } else { $('#divCallMe').hide(); }
        if ($('#rbEmail').is(':checked')) { $('#divEmail').show(); } else { $('#divEmail').hide(); }
    }

    $(document).ready(function () {
        handleQuickForm();
        $('#rbSendForm').click(function () { handleQuickForm(); });
        $('#rbWebDemo').click(function () { handleQuickForm(); });
        $('#rbCallMe').click(function () { handleQuickForm(); });
        $('#rbEmail').click(function () { handleQuickForm(); });
        

    });
</script>

<asp:PlaceHolder ID="phSidebarErr" runat="server"></asp:PlaceHolder>

<asp:Panel ID="pnlSupport" runat="server">
<div class="well">
            <h4>Need Help?</h4>
            <p>We can help you get your form set up. </p>
            
            
    <div id="divOptions">
    <p>
        <input type="radio" id="rbSendForm" name="rbSupportOption" />I'd like to send you my form
    </p>
    <p>
        <input type="radio" id="rbWebDemo"  name="rbSupportOption"/>I'm interested in a Web Demo
    </p>
    <p>
        <input type="radio" id="rbCallMe" name="rbSupportOption" />I'd like someone to call me
    </p>
    <p>
        <input type="radio" id="rbEmail"  name="rbSupportOption"/>I'd like to email you
    </p>
   </div>

    <div id="divSendForm">
         <hr />
        <h4>Send us your form</h4>
        <p>We can help configure your form. Use the browse button below to upload a copy of your waiver, ideally in Word or PDF format. We'll work on configuring it and send you a notice once it is ready for review.</p>
        <p>
            <label>Upload your Waiver</label>
        </p>
        <p>
            <asp:FileUpload ID="fileWaiver" runat="server" />
        </p>
        <p>
            <label>Comments/Questions</label>
        </p>
        <p>
            <asp:TextBox runat="server" ID="txtUploadComments" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </p>
        <p>
            <asp:Button runat="server" ID="btnUploadWaiver" CssClass="btn btn-primary btn-sm" Text="Submit" OnClick="btnUploadWaiver_Click" />
        </p>
    </div>

    <div id="divWebDemo">
         <hr />
        <h4>Schedule a Web Demo</h4>
        <p>Let us know some times that work for you and we'll follow up to schedule a web demo with you!</p>
        <p>
            <asp:TextBox runat="server" ID="txtWebDemoTimes" placeholder="Sometimes that work for me..." CssClass="form-control"></asp:TextBox>
        </p>
        <p>
            <asp:Button runat="server" ID="btnScheduleWebDemo" CssClass="btn btn-primary btn-sm" Text="Upload" OnClick="btnScheduleWebDemo_Click" />
        </p>
    </div>
    <div id="divCallMe">
         <hr />
         <h4>Request a Callback</h4>
        <p>Let us know what number to reach you at and we'll get in touch as soon as we can!</p>
        <p>
            <asp:TextBox runat="server" ID="txtPhone" placeholder="Phone Number" CssClass="form-control"></asp:TextBox>
        </p>
        <p>
            <asp:Button runat="server" ID="btnRequestCallback" CssClass="btn btn-primary btn-sm" Text="Submit" OnClick="btnRequestCallback_Click" />
        </p>
    </div>
    <div id="divEmail">
         <hr />
        <h4>Submit request</h4>
        <p>Let us know any questions you have in the box below and we'll follow up as soon as we can!</p>
        <p>
            <asp:TextBox runat="server" ID="txtEmailComments" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </p>
        <p>
            <asp:Button runat="server" ID="btnSubmitEmail" CssClass="btn btn-primary btn-sm" Text="Submit" OnClientClick="return HandleSave()" OnClick="btnSubmitEmail_Click" />

          

        </p>
    </div>


        </div></asp:Panel>


