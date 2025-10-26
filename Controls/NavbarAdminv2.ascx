<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavbarAdminv2.ascx.cs" Inherits="WaiverFile.Controls.NavbarAdminv2" %>
<%@ Register TagPrefix="uc1" TagName="AdminSearhBox" Src="~/Controls/AdminSearchBox.ascx" %>



<ul class="nav" id="side-menu">
     <li class="sidebar-search-top">
        <uc1:AdminSearhBox runat="server"></uc1:AdminSearhBox>
    </li>
     <li class="sidebar-search-top" style="border-bottom: 2px solid #cecece;">
        <div class="advanced_search_link"><a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/<%=advancedSearchUrl %>">Advanced Search</a></div>
    </li>
    
     
        <li><a title="WaiverFile Admin" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/default.aspx"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
    

    <!-- BOOKINGS -->
      <li runat="server" id="li_bookings_wrap"><a title="Bookings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Bookings.aspx"><i class="fa fa-calendar-check-o fa-fw"></i> Bookings<span class="fa arrow"> </span></a>
               <ul class="nav nav-second-level collapse">
                   <li runat="server" id="li_bookings"><a title="Bookings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Bookings.aspx"><i class="fa fa-calendar fa-fw"></i> Bookings</a></li>
                   <li runat="server" id="li_customers"><a title="Customers" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Customers.aspx"><i class="fa fa-users fa-fw"></i> Customers</a></li>
                   <li runat="server" id="li_orders"><a title="Orders" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Orders.aspx"><i class="fa fa-shopping-cart fa-fw"></i> Orders</a></li>
                   <li runat="server" id="li_reportselect"><a title="Reports" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Reports/ReportSelect.aspx"><i class="fa fa-bar-chart fa-fw"></i> Reports</a></li>
                   
                   <li runat="server" id="li2"><a title="Payment Portal" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/ManageTaxRates.aspx"><i class="fa fa-percent fa-fw"></i> Manage Sales Tax</a></li>
                   <li runat="server" id="li_payment"><a title="Payment Portal" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/StripeRedirect.aspx" target="_blank"><i class="fa fa-external-link fa-fw"></i> Payment Portal</a></li>
               </ul>
          </li>


          <li runat="server" id="li_waivers_wrap"><a title="Waivers" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Bookings.aspx"><i class="fa fa-file-text fa-fw"></i> Waivers<span class="fa arrow"> </span></a>
               <ul class="nav nav-second-level collapse">
                   <li runat="server" id="li_events"><a title="Events" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Events.aspx"><i class="fa fa-calendar-o fa-fw"></i>Events</a></li>
                   <li runat="server" id="li_waiverforms"><a title="Waiver Forms" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Waiver-Forms.aspx"><i class="fa fa-file-text-o fa-fw"></i> Waiver Forms</a></li>
                   <li runat="server" id="li_workflows"><a title="Workflows" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Workflows/workflows.aspx"><i class="fa fa-random fa-fw"></i> Workflows</a> </li>
                   <li runat="server" id="li_reports"><a title="Reports" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Reports.aspx"><i class="fa fa-bar-chart-o fa-fw"></i>Reports</a></li>
                   <li runat="server" id="li_archive2"><a title="Bulk Download" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Export.aspx"><i class="fa fa-download fa-fw"></i> Bulk Download</a></li>
                   <li runat="server" id="li_restore_waivers"><a title="Restore Deleted Waivers" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/RestoreWaivers.aspx"><i class="fa fa-undo fa-fw"></i> Restore Deleted Waivers</a></li>
               </ul>
          </li>


    <li runat="server" id="li1"><a title="Items &amp; Scheduling" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/ListAdmissionItems.aspx"><i class="fa fa-cubes fa-fw"></i> Items &amp; Scheduling<span class="fa arrow"> </span></a>
 <ul class="nav nav-second-level collapse">
        <li runat="server" id="li_admissionitems"><a title="Admission Items" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/ListAdmissionItems.aspx"><i class="fa fa-ticket fa-fw"></i> Admission Items</a></li>
        <li runat="server" id="li_pricinggrids"><a title="Pricing Grids" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/ManagePricingGrids.aspx"><i class="fa fa-table fa-fw"></i> Pricing Grids</a></li>
        <li runat="server" id="li_availabilityschedules"><a title="Availability Schedules" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/ManageAvailabilitySchedules.aspx"><i class="fa fa-clock-o fa-fw"></i> Availability Schedules</a></li>
        <li runat="server" id="li_seasons"><a title="Manage Seasons" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/ManageSeasons.aspx"><i class="fa fa-leaf fa-fw"></i> Manage Seasons</a></li>
        <li runat="server" id="li_blackoutdates"><a title="Blackout Dates" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/ManageBlackoutDates.aspx"><i class="fa fa-ban fa-fw"></i> Manage Blackout Dates</a></li>
     </ul>
        </li>

    
<li runat="server" id="li_commuinication_wrap"><a title="Communication" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Export.aspx"><i class="fa fa-commenting fa-fw"></i> Communication <span class="fa arrow"> </span></a>
 <ul class="nav nav-second-level collapse">

     <li runat="server" id="li_emails"><a title="Email Templates" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/EmailTemplates.aspx"><i class="fa fa-envelope fa-fw"></i> Email Templates</a></li>
     <li runat="server" id="li_confirmpages"><a title="Confirmation Templates" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/ConfirmationPages.aspx"><i class="fa fa-check-square-o fa-fw"></i> Confirmation Templates</a></li>
     
     <li runat="server" id="li_wfsms_setup"><a title="Text Messaging" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/GetStarted.aspx"><i class="fa fa-mobile fa-fw"></i> Text Messaging</a></li>
     <li runat="server" id="li_wfsms_demo"><a title="Text Messaging" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSDemo.aspx"><i class="fa fa-mobile fa-fw"></i> Text Messaging <span class="badge" style="font-size:11px;">New!</span></a></li>

     <li runat="server" id="li_sms_scheduled"><a title="Automatic Messages" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/AutoSMSMessages.aspx"><i class="fa fa-clock-o fa-fw"></i> Automatic Messages</a></li>
     <li runat="server" id="li_sms_inbox"><a title="Inbox" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSInbox.aspx"><i class="fa fa-inbox fa-fw"></i> Inbox</a></li>
     <li runat="server" id="li_sms_queue"><a title="Message Queue" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSMessageQueue.aspx"><i class="fa fa-list fa-fw"></i> Message Queue</a></li>
     <li runat="server" id="li_campaigns"><a title="Campaigns" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/Campaigns.aspx"><i class="fa fa-bullhorn fa-fw"></i> Campaigns</a></li>
     <li runat="server" id="li_subscribers"><a title="Subscribers" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/Subscribers.aspx"><i class="fa fa-user-plus fa-fw"></i> Subscribers</a></li>
     <li runat="server" id="li_sms_settings"><a title="Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSSettings.aspx"><i class="fa fa-sliders fa-fw"></i> Settings</a></li>

     <li runat="server" id="li_sms_demo_CTA"><a title="Upgrade to Full Plan" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SetupProfile.aspx" class="featured"><i class="fa fa-arrow-circle-o-up fa-fw"></i> Upgrade to Full Plan</a></li>
     <li runat="server" id="li_sms_demo_status"><a title="SMS Application Status" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/SMS/SMSApplyStatus.aspx"><i class="fa fa-check-circle-o fa-fw"></i> SMS Application Status</a></li>

 </ul>
</li>

    <li runat="server" id="li_website_wrap"><a title="Website" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/CMS/PageManager.aspx"><i class="fa fa-globe fa-fw"></i> Website<span class="fa arrow"> </span></a>
 <ul class="nav nav-second-level collapse">
      <li runat="server" id="li_page_manager"><a title="Page Manager" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/CMS/PageManager.aspx"><i class="fa fa-files-o fa-fw"></i> Page Manager</a></li>
      <li runat="server" id="li_galleries"><a title="Galleries" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/CMS/Galleries.aspx"><i class="fa fa-picture-o fa-fw"></i> Galleries</a></li>
      <li runat="server" id="li_customizeSite"><a title="Customize Site" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/CMS/CustomizeSite.aspx"><i class="fa fa-paint-brush fa-fw"></i> Customize Site</a></li>
     <li runat="server" id="li_website_settings"><a title="Customize Site" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/CMS/SiteSettings.aspx"><i class="fa fa-cog fa-fw"></i> Webite Settings</a></li>
</ul>
</li>

    
    <li runat="server" id="li_waiver_kiosk_wrap"><a title="Waiver Kiosk" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/Images.aspx"><i class="fa fa-cloud-download fa-fw"></i> Waiver Kiosk<span class="fa arrow"> </span></a>
 <ul class="nav nav-second-level collapse">
      
     <li runat="server" id="li_images"><a title="Images" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/Images.aspx">Images</a></li>
<li runat="server" id="li_labels"><a title="Labels" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/Labels.aspx">Labels</a></li>
<li runat="server" id="li_sitestyles"><a title="Style" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/Style.aspx">Styles</a></li>
<li runat="server" id="li_sitestyles_adv"><a title="Advanced Styles" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/StyleAdvanced.aspx">Advanced Styles</a></li>
<li runat="server" id="li_sitecustomcontent"><a title="Custom Content" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/CustomContent.aspx">Header/Footer</a></li>
<li runat="server" id="li_share"><a title="Share Buttons" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Style/ShareButtons.aspx">Share Buttons</a></li>
  </ul>
    </li>
    
    
    <li runat="server" id="li_settings"><a title="Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings.aspx"><i class="fa fa-cog fa-fw"></i> Settings<span class="fa arrow"> </span></a>
        <ul class="nav nav-second-level collapse">
            
            <li runat="server" id="li_sitesettings"><a title="General Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/General-Settings.aspx">General Settings</a></li>
            <li runat="server" id="li_bookingsettings"><a title="Booking Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/BookingSettings.aspx">Booking Settings</a></li>
            <li runat="server" id="li_eventsettings"><a title="Event Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Event-Settings.aspx">Event Settings</a></li>
            <li runat="server" id="li_manageadmins"><a title="Manage Admin Access" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Manage-Admin-Access.aspx">Manage Admin Access</a></li>
            <li runat="server" id="li_scannersettings"><a title="Scanner Check-In Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Scanner-Settings.aspx">Scanner Check-In Settings</a></li>
            <li runat="server" id="li_searchsettings"><a title="Search Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/settings/SearchResultSettings.aspx">Search Settings</a></li>
          <li><a title="QR Codes" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/GenerateQR.aspx">QR Code Generator</a></li>
            <li runat="server" id="li_managephotosteps"><a title="Photo Capture Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/PhotoSettings.aspx">Photo Capture</a></li>
            <li runat="server" id="li_attachmentsettings"><a title="Attachment Settings" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/AttachmentSettings.aspx">Attachments</a></li>
            <li runat="server" id="li_subscription"><a title="Subscription" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Subscription.aspx">Subscription</a></li>
            <li runat="server" id="li_connectors"><a title="Integrations" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Connectors.aspx">Integrations</a></li>
            <li runat="server" id="li_apikeys"><a title="API Keys" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/API-Keys.aspx">API</a></li>
            <li runat="server" id="li_flags"><a title="Flags" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/ManageWaiverFlags.aspx">Flags</a></li>
            <li runat="server" id="li_dash"><a title="Dashboard Layout" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Settings/Dashboard-Layout.aspx">Dashboard Layout</a></li>
            
            
        </ul>
    </li>
    <li><a title="Help" href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Help.aspx"><i class="fa fa-question-circle fa-fw"></i> Help</a></li>
   
</ul>
 


