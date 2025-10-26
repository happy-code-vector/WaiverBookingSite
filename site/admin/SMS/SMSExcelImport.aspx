<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSExcelImport.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SMSExcelImport" %>


    <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
  <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>

    <asp:Panel runat="server" id="pnlMain">

        
    <script type="text/javascript">
        $(function () {
           
            $('#btnCheckAllLists').click(function () {
                $('#<%=cblLists.ClientID%> input[type=checkbox]').each(function () {
                     $(this).prop('checked', true);
                 });
            });
            $('#btnCheckNoLists').click(function () {
                $('#<%=cblLists.ClientID%> input[type=checkbox]').each(function () {
                    $(this).prop('checked', false);
                });
            });
        });
    </script>



    <h3>SMS Mobile Number Import</h3>
     
  
    
 
  
  <% if (_complete)
     { %><div style="display:none;"> <%} %>

<telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="Bootstrap"
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

    <div><label>Select file</label><asp:FileUpload ID="FileUpload1" runat="server" /></div>
    <div><asp:CheckBox ID="chkHasHeaderRow" runat="server" /> My file includes a header 
        row <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="When checked, indicates that the first row in your file contains column names."/></p>
    <asp:PlaceHolder ID="phPendingFiles" runat="server"></asp:PlaceHolder>
        </div>
    <hr />



        
         <div class="form-group">
        <label>Add to Lists (optional) <small>(<a href="javascript:void(0);" id="btnCheckAllLists">Check All</a> | <a href="javascript:void(0);" id="btnCheckNoLists">Check None</a>)</small></label>
    </div>
    <div class="form-group">
     <div class="checkboxlist">
        <asp:CheckBoxList ID="cblLists" runat="server" CssClass="entrycheckbox"></asp:CheckBoxList>
     </div>
        </div>
                    <div>
                        
                         <p class="help-block"><asp:CheckBox runat="server" ID="chkSMSOptIn" /> I have permission to send SMS text messages to all uploaded numbers. (<a href="https://www.waiverfile.com/Policies/Messaging-Policy.aspx" target="_blank">Messaging policy <i class="fa fa-external-link"></i></a>)
                    </p>
                     </div>

          <div id="divErrSMS" style="color:red; display:none; ">Please check the box indicating you have permission to send SMS messages to these numbers</div>
            





<div><asp:Button ID="btnNext1" runat="server" Text="Next Step" CssClass="btn" 
        onclick="btnNext1_Click" /></div>
    </telerik:RadPageView>
    <telerik:RadPageView ID="RadPageView2" runat="server">
        
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

        </asp:Panel>
   

    <div style="display:none;color:red;" id="errordetail">
        <asp:PlaceHolder runat="server" ID="phErrDetail"></asp:PlaceHolder>
    </div>



</asp:Content>

