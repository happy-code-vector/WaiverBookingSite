<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Queue.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.Queue" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


 <div class="widget">
    <h3>Message Queue</h3>
    <div class="widgetcontentgrid">
    
   

<telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnItemDataBound="RadGrid1_ItemDataBound" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" >
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        <Columns>

             
                         <telerik:GridBoundColumn DataField="sendDate" FilterControlAltText="Filter SendDate column" HeaderText="Send Date" SortExpression="sendDate" UniqueName="sendDate"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="messageText" FilterControlAltText="Filter MessageText column" HeaderText="Message Text" SortExpression="messageText" UniqueName="messageText"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
            
                         
                         <telerik:GridBoundColumn DataField="numRecipients" FilterControlAltText="Filter NumRecipients column" HeaderText="Recipients" SortExpression="numRecipients" UniqueName="numRecipients"></telerik:GridBoundColumn>

                         
                         
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

</div></div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" SelectCommand="select top 1000 * from tblWFSMSMessage where SiteID=@siteID and status<>@deletedStatus order by senddate desc"></asp:SqlDataSource>



