<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SetupReady.aspx.cs" Inherits="WaiverFile.site.admin.SetupReady" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    
    <style type="text/css">
        .panel-heading .fa{ font-size: 1.5em; opacity: 0.85;}
        .panel-heading { font-size: 1.2em; font-weight: 700; }
    </style>
    
    <script type="text/javascript">

        const fallbackCopyTextToClipboard = function (text) {
            const textArea = document.createElement("textarea");
            textArea.value = text;
            document.body.appendChild(textArea);
            textArea.focus();
            textArea.select();

            try {
                document.execCommand("copy");
                console.log("Fallback: Text copied to clipboard.");
            } catch (err) {
                console.error("Fallback: Unable to copy text to clipboard.", err);
            }

            document.body.removeChild(textArea);
        }; 

        const copyTextToClipboard = function (text) {
            if (!navigator.clipboard) {
                fallbackCopyTextToClipboard(text);
                return;
            }

            navigator.clipboard.writeText(text)
                .then(() => {
                    console.log("Text copied to clipboard.");
                })
                .catch((err) => {
                    console.error("Unable to copy text to clipboard.", err);
                    fallbackCopyTextToClipboard(text);
                });
        };

        $(function () {

            $('#btnCopyUrl').click(function () { copyTextToClipboard($('#hlMain').attr('href')); });

        });

    </script>

   <h3><asp:Label runat="server" ID="lblHeading">Congratulations! </asp:Label></h3>
    <p><asp:Label runat="server" ID="lblNextStep">You're ready to start collecting waivers! Read below to learn how to share your waiver online!</asp:Label></p>

    <asp:Panel runat="server" ID="pnlCustomizeTemplate">
        <div class="row">
        <div class="col-sm-6">
             <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-pencil pull-right"></i>
                            Customize Your Waiver
                        </div>
                        <div class="panel-body">
                            <p>Adjust the wording and questions on your waiver form to meet your needs. </p>
                            <p><a href="Setup.aspx?id=<%=Request.QueryString["formid"] %>" class="btn btn-primary">Edit your Waiver</a></p>
                        </div>
                    </div>
            </div>
        </div>
    </asp:Panel>

     <asp:Panel runat="server" ID="pnlUploadComplete">
        <div class="row">
        <div class="col-sm-6">
             <div class="panel panel-success">
                <div class="panel-heading">
                    <i class="fa fa-check-circle pull-right"></i>
                            Form Upload Successful
                        </div>
                        <div class="panel-body">
                            <p>Thanks for sending us your waiver. We will work on getting it configure and get back to you as soon as possible. </p>
                            <p>In the meantime, <a href="https://www.waiverfile.com/Resources/Help/Getting-Started/Quick-Start/Waiver-Form-Setup.aspx" target="_blank">learn more about WaiverFile here.</a></p>
                        </div>
                    </div>
            </div>
        </div>
    </asp:Panel>


    <div class="row">
        <div class="col-sm-6">
            
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-pencil-square-o pull-right"></i>
                            Share Your Waiver Link
                        </div>
                        <div class="panel-body">
                            <p>Customers can sign online from anywhere. Share your waiver link online to direct customers to sign. </p>
                            <p>
                                <strong>Your Waiver Link:</strong><br /><asp:HyperLink runat="server" ID="hlMain" ClientIDMode="Static" Target="_blank"></asp:HyperLink> &nbsp; <a href="javascript:void(0);" id="btnCopyUrl" class="btn btn-primary btn-xs"><i class="fa fa-copy"></i> Copy</a>
                            </p>
                            <hr />
                            <p><strong>Embed On Your Website</strong><br />
                                Add a snippet of code to your website to embed the form. With this option, customers can sign directly on your site. 
                            </p>
                            <p><a href="Style/GetShareButtonCode.aspx?id=cf78dcc2-e4f9-4413-b9d9-3adee09312ee" class="btn btn-default btn-sm"><i class="fa fa-code"></i> Get the Embed Code</a></p>
                        </div>
                    </div>
        </div>
        <div class="col-sm-6">
             <div class="panel panel-primary">
                <div class="panel-heading">  <i class="fa fa-tablet pull-right"></i>
                            Setup a Kiosk
                        </div>
                        <div class="panel-body">
                            
                            <div class="row">
                                <div class="col-sm-4">
                                    <p class="text-center">
                                    <img alt="WaiverFile App Icon" src="/GalleryContent/Normal/waiverfile-app-icon-border.png" style="width:110px; max-width:100%;  margin:0;">
                                        </p>
                                </div>
                                <div class="col-sm-8">
                                    <p>To help customer sign a waiver at your location, setup a kiosk with an iPad or Android tablet. Use the WaiverFile app to collect waivers even when offline!</p>
                                </div>
                            </div>
                            
                            <p style="text-align: center;">

<a href="https://apps.apple.com/us/app/waiverfile/id1460722145?ls=1" target="_blank"><img alt="" src="/GalleryContent/Normal/apple-app-store-vert.gif" style="width:150px;margin:10px 0;"></a><br>
<a href="https://play.google.com/store/apps/details?id=com.waiverfile.mobile" target="_blank"><img alt="" src="/GalleryContent/Normal/google-play-vert.gif" style="width:150px;margin:10px 0;"></a><br>
<a href="https://www.amazon.com/dp/B09H8VTVHM" target="_blank"><img alt="" src="/GalleryContent/Normal/amazon-app-store-vert.jpg" style="width:150px;margin:10px 0;"></a></p>

                            <p></p>
                        </div>
                    </div>
        </div>
    </div>
     <div class="row">
        <div class="col-sm-6">
             <div class="panel panel-primary">
                <div class="panel-heading">  <i class="fa fa-qrcode pull-right"></i>
                            QR Code
                        </div>
                        <div class="panel-body">
                             <p>Print and display a QR code for customers to scan and sign using their smartphones. </p>

                        <p class="text-center"><img src="<%=QRSrcPath%>" alt="QR code" style="max-width:100%; width: 100px;" /></p>
                             <p class="text-center"><a href="GenerateQR.aspx" class="btn btn-default btn-sm"><i class="fa fa-qrcode"></i> Get QR Code</a></p>
                        </div>
                    </div>
        </div>
        <div class="col-sm-6">
            <asp:Panel runat="server" ID="pnlWaiverScan" Visible="false">
                 <div class="panel panel-primary">
                <div class="panel-heading">  <i class="fa fa-barcode pull-right"></i>
                            Fast Check-In with WaiverScan
                        </div>
                        <div class="panel-body">

                              <div class="row">
                                <div class="col-sm-4">
                                    <p class="text-center">
                                    <img alt="WaiverScan App Icon" src="/GalleryContent/Normal/waiverscan-app-icon-border.png" style="width:110px; max-width:100%;  margin:0;">
                                        </p>
                                </div>
                                <div class="col-sm-8">
                                     <p>After signing a waiver, your customers will receive a confirmation ticket on screen and in email. Use the <strong>WaiverScan app</strong> on iOS or Android to scan the code on this ticket and quickly confirm signed waivers.  </p>
                            
                                </div>
                            </div>

                            <p style="text-align: center;"><img src="/GalleryContent/Normal/waiverscan-and-receipt.jpg" alt="WaiverScan app" style="max-width:100%; width: 400px;" /></p>

                            <p style="text-align: center;">
<a href="https://apps.apple.com/us/app/waiverscan/id1586854391" target="_blank"><img alt="" src="/GalleryContent/Normal/apple-app-store-vert.gif" style="width:150px;margin:10px 0;"></a><br>
<a href="https://play.google.com/store/apps/details?id=com.waiverfile.waiverscan" target="_blank"><img alt="" src="/GalleryContent/Normal/google-play-vert.gif" style="width:150px;margin:10px 0;"></a></p>
                            
                        </div>
                    </div>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlDashboard" Visible="false">
                 <div class="panel panel-primary">
                <div class="panel-heading">  <i class="fa fa-table pull-right"></i>
                            Check-In Dashboard
                        </div>
                        <div class="panel-body">
                             <p>After signing waivers, names of participants will appear in the dashboard. Use the circle next to each name to mark each person as checked-in as they arrive.</p>
                            <p class="text-center">
                            <img src="/media/MJM/WaiverFile Check-In Dashboard.png" alt="WaiverFile check-in dashboard" style="width:400px; max-width:100%; border:2px solid #cecece;">
                                </p>
                             <p class="text-center">
                                <a href="default.aspx" class="btn btn-default">Go to Dashboard</a>
                            </p>
                        </div>
                    </div>
            </asp:Panel>


            <asp:Panel runat="server" ID="pnlEvents" Visible="false">
                 <div class="panel panel-primary">
                <div class="panel-heading">  <i class="fa fa-calendar pull-right"></i>
                            Events
                        </div>
                        <div class="panel-body">
                             <p>WaiverFile events help you manage groups, parties or other types of events. Setup an event with a name and a date and customers will select their event when they sign, making for an organized dashboard view and easy check-in process. </p>

                            <p>
                                <a href="Events.aspx" class="btn btn-primary" target="_blank"><i class="fa fa-calendar-check-o"></i> Setup Events </a>
                                &nbsp; 
                                <a href="/Resources/Help/Getting-Started/Parties-Events-and-Groups/Creating-Events.aspx" class="btn btn-default" target="_blank"><i class="fa fa-question-circle"></i> Learn More </a>
                            </p>
                        </div>
                    </div>
            </asp:Panel>
        </div>
    </div>

</asp:Content>
