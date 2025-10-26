
<%@ Page Title="Help" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="WaiverFile.site.admin.Help" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    
</asp:Content> 
<%@ Register Src="~/Controls/EmailFormEnsureLead.ascx" TagPrefix="uc1" TagName="EmailFormEnsureLead" %>

<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 

    <div class="main-content-max-width">
    <h1>WaiverFile Help</h1>

    <div class="row">
        <div class="col-sm-6">
            <div class="well">
                <h3>Documentation</h3>
                <p>How-to guides for using WaiverFile.</p>
                <a href="Documentation.aspx" class="btn btn-lg btn-primary"><i class="fa fa-info-circle"></i> View the Guide</a>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="well">
                <h3>Get Support</h3>
            
            
                    
<strong>Phone Support: </strong>Monday-Friday 10AM-6PM EST
<p><strong>Toll Free:<a href="tel:18777919984"> 1(877) 791-9984</a></strong></p>
<p>Email us: <a href="mailto:support@waiverfile.com">support@waiverfile.com</a></p>



<div style="padding:10px 0; display:inline-block;">
<a href="/Book-a-Demo.aspx" class="btn btn-primary" target="_blank"><em class="fa fa-comments"></em> Book a Demo</a>
</div>
<div style="padding:10px 0;margin-left: 20px; display:inline-block;">
<a href="#" onclick="LC_API.open_chat_window();return false;" class="btn btn-default"><em class="fa fa-comments"></em> Chat with Us</a>
</div>

                </div>

           
        </div>
    </div>
   





        </div>

    <hr />

    <h3>Quick Reference</h3>

     <div class="row">
        <div class="col-sm-4">
            
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-pencil-square-o pull-right"></i>
                            Share Your Waiver Link
                        </div>
                        <div class="panel-body">
                            <p>Customers can sign online from anywhere. Share your waiver link online to direct customers to sign. </p>
                            <p>
                                <strong>Your Waiver Link:</strong><br />
                                <asp:Label runat="server" ID="lbltest">

                                </asp:Label>
                                <asp:HyperLink runat="server" ID="hlMain" ClientIDMode="Static"></asp:HyperLink>
                                &nbsp; <a href="javascript:void(0);" id="btnCopyUrl" class="btn btn-primary btn-xs"><i class="fa fa-copy"></i> Copy</a>
                            </p>
                            <hr />
                            <p><strong>Embed On Your Website</strong><br />
                                Add a snippet of code to your website to embed the form. With this option, customers can sign directly on your site. 
                            </p>
                            <p><a href="Style/GetShareButtonCode.aspx?id=cf78dcc2-e4f9-4413-b9d9-3adee09312ee" class="btn btn-default btn-sm"><i class="fa fa-code"></i> Get the Embed Code</a></p>
                        </div>
                    </div>
        </div>
        <div class="col-sm-4">
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
          <div class="col-sm-4">
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

    </div>


</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 
    
 
</asp:Content> 
