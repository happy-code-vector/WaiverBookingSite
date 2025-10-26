<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WFExcelImport.aspx.cs" Inherits="WaiverFile.site.admin.workflows.WFExcelImport" %>


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
    $(document).ready(function () {
        $('#<%=cboDestination.ClientID %>').change(function () {
            if ($(this).val() == '') {
                $('#newlistname').fadeIn();
            } else {
                $('#newlistname').fadeOut();
            }
        });
    });
    window.closeModal = function (eventid, eventdisplayname) {
        $('#iframeModal').modal('hide');
        eventButtonHandle(eventid, eventdisplayname);

    };

  

    function eventButtonHandle(eventid, eventdisplayname) {
        
        if (eventid == '00000000-0000-0000-0000-000000000000') {
        $('#eventselect').html('None');
    $('#btnClearEvent').hide();
        } else {
        $('#btnClearEvent').show();
    $('#eventselect').html(eventdisplayname);
        }
    $('#<%=hfEventID.ClientID%>').val(eventid);
    }
    function showModalFindEvent() {
        var wpe = $(this).data('wpe');
    $('#modaliframe').attr('src', '/b/<%=site.Url%>/admin/Dialogs/FindEvent.aspx');
        //show modal
        $('#iframeModal').modal('show');

    }
   

    $(document).ready(function () {
        $('#btnClearEvent').click(function () {
            $('#<%=hfEventID.ClientID%>').val('00000000-0000-0000-0000-000000000000');
            $('#eventselect').html('None');
            $('#btnClearEvent').hide();
        });
        $('#btnSetEvent').click(function () {
            showModalFindEvent();
        });
        eventButtonHandle('<%=eventID.ToString()%>', '<%=eventNameOnLoad%>');

    
    

});

</script>

        

<div id="iframeModal" class="modal fade modal-fullscreen  footer-to-bottom" tabindex="-1" role="dialog">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Select an Event</h4>
      </div>
      <div class="modal-body" >
         <iframe id="modaliframe" style="width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:10;"></iframe> 
      </div>
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




 <div class="widget">
    <h3>Workflow Step Import</h3>
     <p>
         <label>Workflow:</label>
         <asp:Label id="lblWorkflowName" runat="server"></asp:Label>
         (<asp:HyperLink runat="server" ID="hlBack" Text="Back to Workflow"></asp:HyperLink>)
     </p>
    <p class="widgetcontent">
    
 
  
  <% if (_complete)
     { %><p style="display:none;"> <%} %>

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

    <p><label>Select file</label><asp:FileUpload ID="FileUpload1" runat="server" /></p>
    <p><asp:CheckBox ID="chkHasHeaderRow" runat="server" /> My file includes a header 
        row <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="When checked, indicates that the first row in your file contains column names."/></p>
    <asp:PlaceHolder ID="phPendingFiles" runat="server"></asp:PlaceHolder>
    <hr />
<p><label>Target Step</label><asp:DropDownList ID="cboDestination" runat="server"></asp:DropDownList></p>

          <div runat="server" id="divEventOption">
               <asp:HiddenField runat="server" ID="hfEventID" />
              <label>Event <a href="javascript:void(0);" id="btnClearEvent" class="btn btn-default btn-xs">Clear</a>
              <a href="javascript:void(0);" id="btnSetEvent" class="btn btn-default btn-xs">Choose</a></label>
            
                <div id="eventselect" class="form-control"><%=eventNameOnLoad %></div>
         
         </div>




<p><asp:Button ID="btnNext1" runat="server" Text="Next Step" CssClass="btn" 
        onclick="btnNext1_Click" /></p>
    </telerik:RadPageView>
    <telerik:RadPageView ID="RadPageView2" runat="server">
   <asp:PlaceHolder ID="phPrepareImport" runat="server"></asp:PlaceHolder>

       
        <asp:Panel runat="server" id="pnlModeManagers">
            <div class="form-group">
                <label>Manager Invites</label>
                <asp:DropDownList runat="server" id="cboModeManagers" CssClass="form-control" >
                    <asp:ListItem Value="ADD">Add</asp:ListItem>
                    <asp:ListItem Value="REPLACE">Replace</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:CheckBox runat="server" ID="chkOneEmailPerPerson" Checked="true" Text="Combine invite emails. Only send one email per person if the same person is invited to more than one step." />
            </div>
        </asp:Panel>

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
     { %></p> <%} %>

        </asp:Panel>
   

    <div style="display:none;color:red;" id="errordetail">
        <asp:PlaceHolder runat="server" ID="phErrDetail"></asp:PlaceHolder>
    </div>



</asp:Content>
