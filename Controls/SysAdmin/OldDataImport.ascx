<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OldDataImport.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.OldDataImport" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>

<script type="text/javascript">
     function OnClientItemsRequesting(sender, eventArgs) {
         var context = eventArgs.get_context();
         context["FilterString"] = eventArgs.get_text();
    }

   

</script>
 <div class="widget">
    <h3>Import Waiver Data From Another System</h3>
     <h3 class="text-danger">don't use this right now. it doesn't import WPE records so nothing comes back in search. before using again, add code to create the WPE records. </h3>
    <div class="widgetcontent">
    
        <p>
            Use this to import old data from another waiver system. <strong>* First create a waiver form that has an agreement text that just says where the import came from.</strong>        </p>
    <asp:PlaceHolder ID="phErr" runat="server" />
  
  <% if (_complete)
     { %><div style="display:none;"> <%} %>

<telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" 
            SelectedIndex="0">
    <Tabs>
        <telerik:RadTab runat="server" Text="Source and Destination" Selected="True">
        </telerik:RadTab>
        <telerik:RadTab runat="server" Text="Prepare Import" Enabled="false">
        </telerik:RadTab>
        <telerik:RadTab runat="server" Text="Preview" Enabled="false">
        </telerik:RadTab>
        <telerik:RadTab runat="server" Text="Complete" Enabled="false">
        </telerik:RadTab>
    </Tabs>
</telerik:RadTabStrip>
<telerik:RadMultiPage ID="RadMultiPage1" Runat="server" CssClass="multipage" 
            SelectedIndex="0">
    <telerik:RadPageView ID="RadPageView1" runat="server">

   
<p><label>Target Waiver Site</label><telerik:RadComboBox ID="cboSite" runat="server" EnableLoadOnDemand="true" OnClientItemsRequesting="OnClientItemsRequesting" AutoPostBack="true" OnSelectedIndexChanged="cboSite_SelectedIndexChanged">
          <WebServiceSettings Method="SearchWaiverSitesForRadCombo" Path="/Controls/SysAdmin/WFSiteSearch.asmx" />
          </telerik:RadComboBox></p>
<p><label>Select Waiver Form (make one that says where data came from and delete it for this!)</label><asp:DropDownList ID="cboWaiverForm" runat="server"></asp:DropDownList></p>

        <hr />

         <p><label>Select file</label><asp:FileUpload ID="FileUpload1" runat="server" /></p>
    <p><asp:CheckBox ID="chkHasHeaderRow" runat="server" Checked="true" OnCheckedChanged="chkHasHeaderRow_CheckedChanged" /> My file includes a header 
        row <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="When checked, indicates that the first row in your file contains column names."/></p>
    <asp:PlaceHolder ID="phPendingFiles" runat="server"></asp:PlaceHolder>
    

<p><asp:Button ID="btnNext1" runat="server" Text="Next Step" CssClass="btn" 
        onclick="btnNext1_Click" /></p>
    </telerik:RadPageView>
    <telerik:RadPageView ID="RadPageView2" runat="server">
        <small>* you must specify a Waiver ID column to handle multiple participants per waiver </small>
   <asp:PlaceHolder ID="phPrepareImport" runat="server"></asp:PlaceHolder>
   <asp:Button ID="btnNext2" runat="server" Text="Next Step" CssClass="btn" onclick="btnNext2_Click" 
         />
    </telerik:RadPageView>
    <telerik:RadPageView ID="RadPageView3" runat="server">
    <h4>Import Preview</h4>
    <asp:PlaceHolder ID="phPreview" runat="server"></asp:PlaceHolder>
    <asp:Button ID="btnComplete" runat="server" Text="Complete Import" CssClass="btn" 
            onclick="btnComplete_Click"/>
    </telerik:RadPageView>
    <telerik:RadPageView ID="RadPageView4" runat="server">
    Process Completed. 
    </telerik:RadPageView>
</telerik:RadMultiPage>


  <% if (_complete)
     { %></div> <%} %>

</div></div>
