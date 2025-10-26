<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSMessageQueue.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SMSMessageQueue" %>

   <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">


    <h3>Message Queue</h3>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="sendDate" FilterControlAltText="Filter SendDate column" HeaderText="Send Date" SortExpression="sendDate" UniqueName="sendDate"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="messageText" FilterControlAltText="Filter MessageText column" HeaderText="Message Text" SortExpression="messageText" UniqueName="messageText"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataTextField="numRecipients" DataNavigateUrlFormatString="ViewSMS.aspx?id={0}" FilterControlAltText="Filter recipients column" HeaderText="Recipients"  UniqueName="viewCol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="    select m.ID, SendDate, m.status, MessageText, NumRecipients from tblWFSMSMessage m
where m.SiteID=@siteid
order by SendDate desc">
                  </asp:SqlDataSource>
                         


</asp:Content>
