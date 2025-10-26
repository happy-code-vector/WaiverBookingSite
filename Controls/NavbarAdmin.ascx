<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavbarAdmin.ascx.cs" Inherits="WaiverFile.Controls.NavbarAdmin" %>
<%@ Register TagPrefix="uc1" TagName="AdminSearhBox" Src="~/Controls/AdminSearchBox.ascx" %>


<asp:PlaceHolder runat="server" ID="phAdminv2">


</asp:PlaceHolder>

<asp:Panel runat="server" ID="pnlOGMenu">



<ul class="nav" id="side-menu">
     <li class="sidebar-search-top">
        <uc1:AdminSearhBox runat="server"></uc1:AdminSearhBox>
       


    </li>
     <li class="sidebar-search-top" style="border-bottom: 2px solid #cecece;">
        <div class="advanced_search_link"><a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/<%=advancedSearchUrl %>">Advanced Search</a></div>
    </li>
    <li><a title="WaiverFile Admin" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/default.aspx"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a></li>
    

  

    


     
    <li runat="server" id="li_sendwaiver"><a title="Send Waiver Link" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SendLink_Expedia.aspx"><i class="fa fa-paper-plane fa-fw"></i> Send Waiver Links</a></li>


    <li runat="server" id="li_events"><a title="Events" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Events.aspx"><i class="fa fa-calendar fa-fw"></i>Events</a></li>
    <li runat="server" id="li_reports"><a title="Reports" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Reports.aspx"><i class="fa fa-bar-chart-o fa-fw"></i>Reports</a></li>
    <li runat="server" id="li_archive"><a title="Archive" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Export.aspx"><i class="fa fa-cloud-download fa-fw"></i>Archive<span class="fa arrow"> </span></a>
     <ul class="nav nav-second-level collapse">
          <li runat="server" id="li_archive2"><a title="Download Archives" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Export.aspx">Download Archives</a></li>
            <li runat="server" id="li_restore"><a title="Restore Deleted Waivers" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/RestoreWaivers.aspx">Restore Deleted Waivers</a></li>
      </ul>
        </li>
    <li runat="server" id="li_waiverforms"><a title="Waiver Forms" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Waiver-Forms.aspx"><i class="fa fa-file-text fa-fw"></i> Waiver Forms</a></li>
    <li runat="server" id="li_workflows"><a title="Workflows" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Workflows/workflows.aspx"><i class="fa fa-sitemap fa-fw"></i> Workflows</a> </li>
    <li runat="server" id="li_wfsms_setup"><a title="Text Messaging" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/GetStarted.aspx"><i class="fa fa-mobile fa-fw"></i> Text Messaging  </a> </li>
    <li runat="server" id="li_wfsms_demo"><a title="Text Messaging" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSDemo.aspx"><i class="fa fa-mobile fa-fw"></i> Text Messaging  </a> </li>

    <li runat="server" id="li_wfsms"><a id="a_wfsms" runat="server" title="Text Messaging" ><i class="fa fa-mobile fa-fw"></i> Text Messaging <span runat="server" id="spnSMSDemo" class="badge">Demo</span> <span class="fa arrow"> </span></a>
        
          <ul class="nav nav-second-level collapse">
              
              
              <li runat="server" id="li_campaigns"><a title="Campaigns" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/Campaigns.aspx">Campaigns</a></li>
              <li runat="server" id="li_subscribers"><a title="Subscribers" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/Subscribers.aspx">Subscribers</a></li>
              <li runat="server" id="li_sms_scheduled"><a title="Automatic Messages" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/AutoSMSMessages.aspx">Automatic Messages</a></li>
              <li runat="server" id="li_sms_inbox"><a title="Inbox" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSInbox.aspx">Inbox</a></li>
              <li runat="server" id="li_sms_queue"><a title="Message Queue" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSMessageQueue.aspx">Message Queue</a></li>
              
              <li runat="server" id="li_sms_settings"><a title="Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSSettings.aspx">Settings</a></li>

              <li runat="server" id="li_sms_demo_CTA"><a title="Upgrade to Full Plan" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SetupProfile.aspx" class="featured"><i class="fa fa-arrow-circle-o-up fa-fw"></i> Upgrade to Full Plan</a></li>
              <li runat="server" id="li_sms_demo_status"><a title="SMS Application Status" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSApplyStatus.aspx"><i class="fa fa-check-circle-o fa-fw"></i> SMS Application Status</a></li>
          </ul>
    </li>
    
     
    <li runat="server" id="li_scannercheckin"><a title="Scanner Check-In" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/ScanSearch.aspx"><i class="fa fa-qrcode fa-fw"></i> Scanner Check-In</a>
    </li>
   
    <li runat="server" id="li_wfbarcode"><a title="QR Code Check-Ins" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/BarcodeSearch.aspx"><i class="fa fa-qrcode fa-fw"></i> QR Code Check-Ins<span class="fa arrow"> </span></a>
         <ul class="nav nav-second-level collapse">
            <li runat="server" id="li_wfbarcode2"><a title="QR Code Check-Ins" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/BarcodeSearch.aspx"><i class="fa fa-search fa-fw"></i> Search</a></li>
            <li runat="server" id="li_wfbarcode_report"><a title="QR Code Check-Ins" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/BarcodeReport.aspx"><i class="fa fa-th fa-fw"></i> Signing &amp; Scanning Report</a></li>
         </ul>
    </li>


   


    <li runat="server" id="li_customize"><a title="Customize" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/style/Images.aspx"><i class="fa fa-pencil-square-o fa-fw"></i>Customize<span class="fa arrow"> </span></a>
         <ul class="nav nav-second-level collapse">
             <li runat="server" id="li_images"><a title="Images" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/Images.aspx">Images</a></li>
             <li runat="server" id="li_labels"><a title="Labels" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/Labels.aspx">Labels</a></li>
             <li runat="server" id="li_sitestyles"><a title="Style" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/Style.aspx">Styles</a></li>
             <li runat="server" id="li_sitestyles_adv"><a title="Advanced Styles" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/StyleAdvanced.aspx">Advanced Styles</a></li>
             <li runat="server" id="li_sitecustomcontent"><a title="Custom Content" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/CustomContent.aspx">Header/Footer</a></li>
             <li runat="server" id="li_share"><a title="Share Buttons" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/ShareButtons.aspx">Share Buttons</a></li>
               <li runat="server" id="li_confirmpages"><a title="Confirmation Templates" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/ConfirmationPages.aspx">Confirmation Templates</a></li>
            <li runat="server" id="li_emails"><a title="Email Templates" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/EmailTemplates.aspx">Email Templates</a></li>

             <li><a title="QR Codes" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/GenerateQR.aspx">QR Code</a></li>
            </ul>
    </li>
    <li runat="server" id="li_settings"><a title="Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings.aspx"><i class="fa fa-cog fa-fw"></i>Settings<span class="fa arrow"> </span></a>
        <ul class="nav nav-second-level collapse">
            
            <li runat="server" id="li_sitesettings"><a title="General Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/General-Settings.aspx">General Settings</a></li>
            <li runat="server" id="li_eventsettings"><a title="Event Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Event-Settings.aspx">Event Settings</a></li>
            <li runat="server" id="li_manageadmins"><a title="Manage Admin Access" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Manage-Admin-Access.aspx">Manage Admin Access</a></li>
            <li runat="server" id="li_scannersettings"><a title="Scanner Check-In Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Scanner-Settings.aspx">Scanner Check-In Settings</a></li>
            <li runat="server" id="li_searchsettings"><a title="Search Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/settings/SearchResultSettings.aspx">Search Settings</a></li>
          
            <li runat="server" id="li_managephotosteps"><a title="Photo Capture Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/PhotoSettings.aspx">Photo Capture</a></li>
            <li runat="server" id="li_attachmentsettings"><a title="Attachment Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/AttachmentSettings.aspx">Attachments</a></li>
            <li runat="server" id="li_subscription"><a title="Subscription" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Subscription.aspx">Subscription</a></li>
            <li runat="server" id="li_payment"><a title="Payment Methods" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Payment-Methods.aspx">Payment Methods</a></li>
            <li runat="server" id="li_connectors"><a title="Integrations" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Connectors.aspx">Integrations</a></li>
            <li runat="server" id="li_apikeys"><a title="API Keys" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/API-Keys.aspx">API</a></li>
            <li runat="server" id="li_flags"><a title="Flags" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/ManageWaiverFlags.aspx">Flags</a></li>
            <li runat="server" id="li_dash"><a title="Dashboard Layout" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Dashboard-Layout.aspx">Dashboard Layout</a></li>
            
            
        </ul>
    </li>
    <li><a title="Help" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Help.aspx"><i class="fa fa-question-circle fa-fw"></i>Help</a></li>
   
    <li><a title="Upgrade to Online Booking" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/CMS/SetupBooking.aspx"><i class="fa fa-calendar-check-o fa-fw"></i>Upgrade to Online Booking <span class="badge" style="background-color: #F6871F; color: white; font-size:11px;">New!</span></a></li>

    

</ul>
 
</asp:Panel>