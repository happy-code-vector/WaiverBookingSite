<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListParticipants.ascx.cs" Inherits="WaiverFile.Controls.ListParticipants" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<div class="form-group form-inline" style="margin-top: 20px;">

    
    <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/Reports.aspx?evtid=<%=waivereventid %>&mode=evt" class="btn btn-default pull-right" style="margin-left:5px;"><i class="fa fa-line-chart"></i> Reports</a>&nbsp;

<a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/PrintEvent.aspx?id=<%=waivereventid %>" target="_blank" class="btn btn-default pull-right" style="margin-left:5px;"><i class="fa fa-print"></i> Print Names</a>&nbsp;
    <a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/EventParticipants.aspx?id=<%=waivereventid %>" class="btn btn-muted active pull-right" style="border-top-left-radius:0; border-bottom-left-radius:0;"><i class="fa fa-users"></i> Participants</a>
<a href="<%=((WaiverFile.MasterPages.WFMasterPage)Page.Master).WaiverSite.BasePathRelative %>/admin/EventSignatures.aspx?id=<%=waivereventid %>" class="btn btn-muted pull-right" style="border-top-right-radius:0; border-bottom-right-radius:0; "><i class="fa fa-list"></i> Waivers</a>
     


 
     <h3 style="display:inline; margin-right: 20px;"><asp:PlaceHolder ID="phHeaderText" runat="server"></asp:PlaceHolder></h3>
  </div>

<hr />

       
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <asp:LinkButton runat="server" ID="btnExportExcel" CssClass="btn btn-default btn-sm pull-right" OnClick="btnExportExcel_Click"><i class="fa fa-download" ></i> Export to Excel</asp:LinkButton> 
<h3 style="display:inline-block;margin-top:0;">Participants</h3>

    

<telerik:RadGrid ID="RadGrid1" runat="server" OnInfrastructureExporting="RadGrid_InfrastructureExporting" AutoGenerateColumns="False"  OnDeleteCommand="RadGrid1_DeleteCommand" OnItemDataBound="RadGrid1_ItemDataBound"
    CellSpacing="0" DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="True" 
            AllowSorting="True">
<MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource1">
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>  <telerik:GridBoundColumn DataField="ParticipantNameFirst" 
            FilterControlAltText="Filter First column" HeaderText="First" 
            SortExpression="ParticipantNameFirst" UniqueName="ParticipantNameFirst">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="ParticipantName" 
            FilterControlAltText="Filter Last column" HeaderText="Last" 
            SortExpression="ParticipantName" UniqueName="ParticipantName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="signedNameFirst" 
            FilterControlAltText="Filter Signed By column" HeaderText="Signed By" 
            SortExpression="signedname" UniqueName="signedname">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="signedName" 
            FilterControlAltText="Filter signedName column" HeaderText="Signed By" 
            SortExpression="signedName" UniqueName="signedName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateSigned" DataType="System.DateTime" 
            FilterControlAltText="Filter DateSigned column" HeaderText="Date" 
            SortExpression="DateSigned" UniqueName="DateSigned">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Address" 
            FilterControlAltText="Filter Address column" HeaderText="Address" 
            SortExpression="Address" UniqueName="Address">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="City" 
            FilterControlAltText="Filter City column" HeaderText="City" 
            SortExpression="City" UniqueName="City">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="State" 
            FilterControlAltText="Filter State column" HeaderText="State" 
            SortExpression="State" UniqueName="State">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Zip" 
            FilterControlAltText="Filter Zip column" HeaderText="Zip" SortExpression="Zip" 
            UniqueName="Zip">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Phone" 
            FilterControlAltText="Filter Phone column" HeaderText="Phone" 
            SortExpression="Phone" UniqueName="Phone">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DOB" 
            FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" 
            UniqueName="DOB">
        </telerik:GridBoundColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="Email" 
            DataNavigateUrlFormatString="mailto:{0}" DataTextField="Email" 
            FilterControlAltText="Filter EmailCol column" HeaderText="Email" 
            UniqueName="EmailCol">
        </telerik:GridHyperLinkColumn>
      
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="WaiverID" 
            DataNavigateUrlFormatString="/admin/ViewWaiver.aspx?id={0}" 
            FilterControlAltText="Filter column column" HeaderText="View" Text="View" 
            UniqueName="viewCol">
        </telerik:GridHyperLinkColumn>
        <telerik:GridButtonColumn CommandName="DELETE" 
            FilterControlAltText="Filter column1 column" HeaderText="Remove" Text="Remove" 
            UniqueName="column1">
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
    SelectCommand="SELECT id, w.waiverid, 
       w.waivereventid, 
       w.waivertextid, 
       w.datesigned, 
       w.address, 
       w.city, 
       w.state, 
       w.zip, 
       w.phone, 
       p.dob, 
       w.email, 
       signedname + case when SignedNameFirst='' then '' else ', ' end + SignedNameFirst as signedname,
	   p.ParticipantName, p.ParticipantNameFirst
	   ,wpe.IsCheckedIn
       
FROM   tblWaiverParticipantEvent wpe
inner join tblWaiverParticipant p on p.WaiverParticipantID=wpe.WaiverParticipantID
inner join tblWaiver w on w.WaiverID=p.WaiverID
WHERE  wpe.waivereventid = @WaiverEventID 
    AND (w.IsWorkflowSessionPrimary is null or w.IsWorkflowSessionPrimary=1) 
       AND w.siteid = @siteID 
       AND w.waiverisdeleted = 0 
       AND wpe.iscurrent = 1 
       AND wpe.isincluded = 1 
ORDER  BY p.ParticipantName, p.ParticipantNameFirst option(recompile)
"></asp:SqlDataSource>



<asp:Panel ID="pnlDeletedWaivers" runat="server">
    
         <div class="form-group" style="margin-top: 20px;">
             
 
    <h3>Removed Participants</h3>
             <asp:LinkButton runat="server" ID="btnExportToExcel2" CssClass="btn btn-default btn-sm pull-right" OnClick="btnExportToExcel2_Click"><i class="fa fa-download" ></i> Export to Excel</asp:LinkButton>
             <p>The following waivers were part of this event but have been removed.</p>
             </div>

 
<telerik:RadGrid OnInfrastructureExporting="RadGrid_InfrastructureExporting" ID="RadGrid2" runat="server" AutoGenerateColumns="False"  OnItemDataBound="RadGrid2_ItemDataBound" OnItemCommand="RadGrid2_ItemCommand"
    CellSpacing="0" DataSourceID="SqlDataSource2" GridLines="None" AllowPaging="True" 
            AllowSorting="True">
<MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource2">
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="ParticipantNameFirst" 
            FilterControlAltText="Filter First column" HeaderText="First" 
            SortExpression="ParticipantNameFirst" UniqueName="ParticipantNameFirst">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="ParticipantName" 
            FilterControlAltText="Filter Last column" HeaderText="Last" 
            SortExpression="ParticipantName" UniqueName="ParticipantName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="signedNameFirst" 
            FilterControlAltText="Filter Signed By column" HeaderText="Signed By" 
            SortExpression="signedname" UniqueName="signedname">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="signedName" 
            FilterControlAltText="Filter signedName column" HeaderText="Signed By" 
            SortExpression="signedName" UniqueName="signedName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateSigned" DataType="System.DateTime" 
            FilterControlAltText="Filter DateSigned column" HeaderText="Date" 
            SortExpression="DateSigned" UniqueName="DateSigned">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Address" 
            FilterControlAltText="Filter Address column" HeaderText="Address" 
            SortExpression="Address" UniqueName="Address">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="City" 
            FilterControlAltText="Filter City column" HeaderText="City" 
            SortExpression="City" UniqueName="City">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="State" 
            FilterControlAltText="Filter State column" HeaderText="State" 
            SortExpression="State" UniqueName="State">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Zip" 
            FilterControlAltText="Filter Zip column" HeaderText="Zip" SortExpression="Zip" 
            UniqueName="Zip">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Phone" 
            FilterControlAltText="Filter Phone column" HeaderText="Phone" 
            SortExpression="Phone" UniqueName="Phone">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DOB" 
            FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" 
            UniqueName="DOB">
        </telerik:GridBoundColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="Email" 
            DataNavigateUrlFormatString="mailto:{0}" DataTextField="Email" 
            FilterControlAltText="Filter EmailCol column" HeaderText="Email" 
            UniqueName="EmailCol">
        </telerik:GridHyperLinkColumn>
      
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="WaiverID" 
            DataNavigateUrlFormatString="/admin/ViewWaiver.aspx?id={0}" 
            FilterControlAltText="Filter column column" HeaderText="View" Text="View" 
            UniqueName="viewCol">
        </telerik:GridHyperLinkColumn>
        <telerik:GridButtonColumn CommandName="RESTORE" 
            FilterControlAltText="Filter column1 column" HeaderText="Restore" Text="Restore" 
            UniqueName="column1">
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
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
    SelectCommand="SELECT wpe.id, w.waiverid, 
       w.waivereventid, 
       w.waivertextid, 
       w.datesigned, 
       w.address, 
       w.city, 
       w.state, 
       w.zip, 
       w.phone, 
       p.dob, 
       w.email, 
       signedname + case when SignedNameFirst='' then '' else ', ' end + SignedNameFirst as signedname,
	   p.ParticipantName, p.ParticipantNameFirst
	   ,wpe.IsCheckedIn
       
FROM   tblWaiverParticipantEvent wpe
inner join tblWaiverParticipant p on p.WaiverParticipantID=wpe.WaiverParticipantID
inner join tblWaiver w on w.WaiverID=p.WaiverID
WHERE  wpe.waivereventid = @WaiverEventID 
       AND w.siteid = @siteID 
       AND w.waiverisdeleted = 0 
       AND wpe.iscurrent = 1 
       AND wpe.isincluded = 0 
ORDER  BY p.ParticipantName, p.ParticipantNameFirst option(recompile)"></asp:SqlDataSource>


</asp:Panel>


