<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWaiversDeleted.ascx.cs" Inherits="WaiverFile.Controls.ListWaiversDeleted" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


         
 
    <h3>Deleted Waivers</h3>
             

 <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False"  OnDeleteCommand="RadGrid1_DeleteCommand" OnItemDataBound="RadGrid1_ItemDataBound"
    CellSpacing="0" DataSourceID="SqlDataSource1" GridLines="None" AllowPaging="True" 
            AllowSorting="True">
<MasterTableView DataKeyNames="WaiverID" DataSourceID="SqlDataSource1">
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="signedNameFirst" 
            FilterControlAltText="Filter signedNameFirst column" HeaderText="First" 
            SortExpression="signedNameFirst" UniqueName="signedNameFirst">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="signedName" 
            FilterControlAltText="Filter signedName column" HeaderText="Last" 
            SortExpression="signedName" UniqueName="signedName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="DateSigned" DataType="System.DateTime" 
            FilterControlAltText="Filter DateSigned column" HeaderText="Date" 
            SortExpression="DateSigned" UniqueName="DateSigned">
        </telerik:GridBoundColumn>
        

        <telerik:GridBoundColumn DataField="eventname" 
            FilterControlAltText="Filter Event column" HeaderText="eventname" 
            SortExpression="eventname" UniqueName="eventname">
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
        <telerik:GridBoundColumn DataField="numparticipants" DataType="System.Int32" 
            FilterControlAltText="Filter numparticipants column" HeaderText="Participants" 
            ReadOnly="True" SortExpression="numparticipants" UniqueName="numparticipants">
        </telerik:GridBoundColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFields="WaiverID" 
            DataNavigateUrlFormatString="/admin/ViewWaiver.aspx?id={0}" 
            FilterControlAltText="Filter column column" HeaderText="View" Text="View" 
            UniqueName="viewCol">
        </telerik:GridHyperLinkColumn>
        <telerik:GridButtonColumn CommandName="DELETE" 
            
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
    SelectCommand="select w.WaiverID, w.WaiverEventID, evt.Name as eventname, w.WaiverTextID, w.DateSigned, w.Address, w.City, w.State, w.Zip, w.Phone, w.DOB, w.Email,signedName, signedNameFirst, COUNT(p.WaiverParticipantID) as numparticipants
 from tblWaiver w left join tblWaiverParticipant p on w.WaiverID=p.WaiverID
      left join tblWaiverEvent evt on evt.WaiverEventID=w.waivereventid
where w.siteID=@siteID and w.WaiverIsDeleted=1
group by w.WaiverID, w.WaiverEventID,evt.Name,w.WaiverTextID, w.DateSigned, w.Address, w.City, w.State, w.Zip, w.Phone, w.DOB, w.Email,signedName, signedNameFirst
order by datesigned desc"></asp:SqlDataSource>
