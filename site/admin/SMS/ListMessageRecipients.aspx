<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ListMessageRecipients.aspx.cs" Inherits="WaiverFile.site.admin.SMS.ListMessageRecipients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

                <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

    <h3>Recipients</h3>
    <nav aria-label="breadcrumb" xmlns:cc1="remove"><ol class="breadcrumb">
    <li><a href="SMSMessageQueue.aspx">Message Queue</a></li>
    <li class="breadcrumb-item active" aria-current="page">Recipient List</li>
  </ol></nav>

    
   
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" AllowFilteringByColumn="False" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         <telerik:GridBoundColumn DataField="firstName" FilterControlAltText="Filter FirstName column" HeaderText="First Name" SortExpression="firstName" UniqueName="firstName"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="lastName" FilterControlAltText="Filter LastName column" HeaderText="Last Name" SortExpression="lastName" UniqueName="lastName"></telerik:GridBoundColumn>

            
                      
                 <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataTextField="MobileNumber" DataNavigateUrlFormatString="" FilterControlAltText="Filter column1 column" HeaderText="Mobile Number" UniqueName="viewCol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
            

            
                         <telerik:GridBoundColumn DataField="isGlobalOptOut" FilterControlAltText="Filter IsGlobalOptOut column" HeaderText="Opted Out" SortExpression="isGlobalOptOut" UniqueName="isGlobalOptOut"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="globalOptOutDate" FilterControlAltText="Filter GlobalOptOutDate column" HeaderText="Opt Out Date" SortExpression="globalOptOutDate" UniqueName="GlobalOptOutDate"></telerik:GridBoundColumn>

                         
                      
             <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="WaiverID" DataNavigateUrlFormatString="" FilterControlAltText="Filter column1 column" HeaderText="View Waiver" Text="View Waiver" UniqueName="viewWaiverCol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

   

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFSMSMobileNum where siteid=@siteid and ID in (select MobileNumID from tblWFSMSMessageMobileNum where MessageID=@messageid and @messageid<>'00000000-0000-0000-0000-000000000000') order by lastname, firstname ">
                  </asp:SqlDataSource>
       <asp:PlaceHolder runat="server" ID="phMessageDetails"/>                   

</asp:Content>
