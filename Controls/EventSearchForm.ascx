<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventSearchForm.ascx.cs" Inherits="WaiverFile.Controls.EventSearchForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

 
 <div class="pull-right" style="margin-top:20px;">
            <a href="Events.aspx" class="btn btn-default" ><i class="fa fa-arrow-left"></i> Back to Event List</a>
            <%if(!_disableEditAdd){ %>
                <a href="EventCategories.aspx" class="btn btn-default" ><i class="fa fa-cog"></i> Edit Categories</a>
                <a href="EditWaiverEvent.aspx" class="btn btn-primary" ><i class="fa fa-plus-circle"></i> New Event</a>
            <%} %>
        </div>
<h3 style="display:inline-block;">Event Search</h3>


<div class="row">
    <div class="col-sm-6">
    
     <div class="form-group">
     <label for="<%=txtTerms.ClientID %>">Event Name</label> 
         
        <asp:TextBox ID="txtTerms" runat="server" CssClass="form-control"></asp:TextBox>
     </div>
     </div>
     <div class="col-sm-6">
         
               <div class="form-group hidecbocat">
     <label for="<%=cboCategory.ClientID %>">Category: </label>
         <asp:DropDownList ID="cboCategory" 
            runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="cboCategory_SelectedIndexChanged">
        </asp:DropDownList>
                 </div>
         </div>
    <div class="col-md-6">
       
    </div>
</div>

<div class="row" style="display:block;">
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label" for="<%=dtDateStart.ClientID %>">Date Range: Begin</label><br />
            <telerik:RadDatePicker ID="dtDateStart" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
               
                <DateInput CssClass="form-control"   LabelWidth="40%">
                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                    <FocusedStyle Resize="None"></FocusedStyle>
                    <DisabledStyle Resize="None"></DisabledStyle>
                    <InvalidStyle Resize="None"></InvalidStyle>
                    <HoveredStyle Resize="None"></HoveredStyle>
                    <EnabledStyle Resize="None"></EnabledStyle>
                </DateInput>
                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                
            </telerik:RadDatePicker>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label" for="<%=dtDateEnd.ClientID %>">Date Range: End</label><br />
            <telerik:RadDatePicker ID="dtDateEnd" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap" Calendar-CalendarCaption="" Width="100%">
              
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
              
                <DateInput CssClass="form-control"   LabelWidth="40%">
                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                    <FocusedStyle Resize="None"></FocusedStyle>
                    <DisabledStyle Resize="None"></DisabledStyle>
                    <InvalidStyle Resize="None"></InvalidStyle>
                    <HoveredStyle Resize="None"></HoveredStyle>
                    <EnabledStyle Resize="None"></EnabledStyle>
                </DateInput>
                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                
            </telerik:RadDatePicker>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
    </div>
</div>

<% if (_hideCboCat)
    { %>
<style type="text/css">
    .hidecbocat{ display:none; }
</style>
<%} %>

    <telerik:RadScriptBlock runat="server">
<script type="text/javascript">
    function handleDelete(index)
    {
        
       var row = $find('<%= RadGrid1.ClientID %>').get_masterTableView().get_dataItems()[index];
        var recurID = row.getDataKeyValue("WaiverEventRecurringID");
        var id = row.getDataKeyValue("WaiverEventID");

        $('#<%=hfDeleteEvtID.ClientID%>').val(id);
        $('#<%=hfDeleteEvtRecurID.ClientID%>').val(recurID);

        if (recurID == '00000000-0000-0000-0000-000000000000') {
            $('.delete_single').show();
            $('.delete_recurring').hide();
        } else {
            $('.delete_single').hide();
            $('.delete_recurring').show();
        }
        $('#deleteModal').modal('show');
        
        return false;
    }

    function OnCommand(sender, args)
     {
       var value = sender.get_masterTableView().get_dataItems()[args.get_commandArgument()].getDataKeyValue("ID");
       alert(value);
    }
</script>
        </telerik:RadScriptBlock>

<asp:HiddenField ID="hfDeleteEvtID" runat="server" />
<asp:HiddenField ID="hfDeleteEvtRecurID" runat="server" />
<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="deleteModalLabel">Delete Event</h4>
      </div>
      <div class="modal-body">
        <div class="delete_single">
            Are you sure you want to delete this event?
        </div>
          <div class="delete_recurring">
              This event is part of a recurring series. Do you want to delete just this instance, or the entire series?
          </div>
      </div>
      <div class="modal-footer">

          <div class="delete_single">
            <asp:Button runat="server" ID="btnDeleteSingle" Text="Delete" CssClass="btn btn-danger" OnClick="btnDeleteSingle_Click" />
             <button type="button" class="btn btn-muted" data-dismiss="modal">Cancel</button>
        </div>
          <div class="delete_recurring">
             <asp:Button runat="server" ID="btnDeleteRecurInstance" Text="Delete This Instance" CssClass="btn btn-danger" OnClick="btnDeleteRecurInstance_Click" />
              <asp:Button runat="server" ID="btnDeleteRecurFullSeries" Text="Delete Entire Series" CssClass="btn btn-danger" OnClick="btnDeleteRecurFullSeries_Click" />
             <button type="button" class="btn btn-muted" data-dismiss="modal">Cancel</button>
          </div>

      
      </div>
    </div>
  </div>
</div>




<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound" AllowPaging="True" 
            AllowSorting="True">
<MasterTableView DataKeyNames="WaiverEventID,WaiverEventRecurringID" ClientDataKeyNames="WaiverEventID,WaiverEventRecurringID"><SortExpressions>
    <telerik:GridSortExpression FieldName="DateStart" />
                                                                     </SortExpressions>
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
        
        <telerik:GridBoundColumn DataField="Name" 
            FilterControlAltText="Filter Name column" HeaderText="Name" 
            SortExpression="Name" UniqueName="Name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateStart" DataType="System.DateTime"  
            FilterControlAltText="Filter DateStart column" HeaderText="Start" 
            SortExpression="DateStart" UniqueName="DateStart">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateEnd" DataType="System.DateTime" 
            FilterControlAltText="Filter DateEnd column" HeaderText="End" 
            SortExpression="DateEnd" UniqueName="DateEnd">
        </telerik:GridBoundColumn>
        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="WaiverEventID" DataNavigateUrlFormatString="/Waiver.aspx?id={0}&direct=true" FilterControlAltText="Filter column2 column" HeaderText="Event Link" Target="_blank" Text="Event Link" UniqueName="eventlinkcol">
        </telerik:GridHyperLinkColumn>
        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="WaiverEventID" DataNavigateUrlFormatString="/admin/GenerateQR.aspx?eventid={0}&Source=/admin/Events.aspx" FilterControlAltText="Filter column2 column" HeaderText="QR Code" Text="QR Code" UniqueName="qrcol">
        </telerik:GridHyperLinkColumn>

        <telerik:GridHyperLinkColumn DataNavigateUrlFields="WaiverEventID" 
            DataNavigateUrlFormatString="/admin/EventSignatures.aspx?id={0}" 
            DataTextField="NumSignedWaivers" DataTextFormatString="{0} (view)" 
            FilterControlAltText="Filter column3 column" HeaderText="Participants" 
            UniqueName="viewcol">
        </telerik:GridHyperLinkColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="WaiverEventID" 
            DataNavigateUrlFormatString="/admin/EditWaiverEvent.aspx?id={0}" 
            FilterControlAltText="Filter column column" HeaderText="Edit" Text="Edit" 
            UniqueName="editcol"> 
        </telerik:GridHyperLinkColumn>
        <telerik:GridButtonColumn CommandName="DELETE" 
           
            FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" 
            UniqueName="deletecol">
        </telerik:GridButtonColumn>
    </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
</MasterTableView>

<FilterMenu EnableImageSprites="False">
<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>
</FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>
</HeaderContextMenu>
</telerik:RadGrid>

