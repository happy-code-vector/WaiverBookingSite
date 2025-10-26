<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inbox.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.Inbox" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

 <div class="widget">
    <h3>Inbox</h3>
    <div class="widgetcontentgrid">
    
   

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnItemCommand="RadGrid1_ItemCommand" OnDeleteCommand="RadGrid1_DeleteCommand" OnItemDataBound="RadGrid1_ItemDataBound" >
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        <Columns>
            <telerik:GridBoundColumn DataField="IsRead" UniqueName="IsRead" SortExpression="IsRead" HeaderText="Read"></telerik:GridBoundColumn>
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="SMSConvo.aspx?id={0}&bc=ibx" DataTextField="DisplayName" FilterControlAltText="Filter From column" HeaderText="Display Name" SortExpression="DisplayName" UniqueName="fromCol">
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="Sent" FilterControlAltText="Filter Sent column" HeaderText="Date" SortExpression="Sent" UniqueName="Sent" DataType="System.DateTime">
            </telerik:GridBoundColumn>
            <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="SMSConvo.aspx?id={0}&bc=ibx" DataTextField="Message" FilterControlAltText="Filter Message column" HeaderText="Message" SortExpression="Message" UniqueName="viewCol">
            </telerik:GridHyperLinkColumn>
            
            <telerik:GridButtonColumn CommandName="OPTOUT" ConfirmText="This person will be opted out of all texting lists. Continue?" FilterControlAltText="Filter column2 column" Text="Opt-Out" UniqueName="optout">
            </telerik:GridButtonColumn>
            <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="This entire conversation including all messages from this number will be permanently deleted. This cannot be undone. Continue?" FilterControlAltText="Filter column2 column" Text="Delete" UniqueName="column2">
            </telerik:GridButtonColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

</div></div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" SelectCommand="spWFSMSGetInbox" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
