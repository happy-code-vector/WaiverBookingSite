<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SubscribersViewSegment.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SubscribersViewSegment" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
   

  <h3><asp:Label runat="server" ID="lblHeading"></asp:Label></h3>
  <nav aria-label="breadcrumb" xmlns:cc1="remove"><ol class="breadcrumb">
    <li><a href="Subscribers.aspx?view=segments">Subscribers</a></li>
    <li class="breadcrumb-item active" aria-current="page"><asp:Label runat="server" ID="lblBreadcrumbCurr"></asp:Label></li>
  </ol></nav>
    
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>



    

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False"  OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                        
                         
                           <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/" FilterControlAltText="Filter column1 column" HeaderText="Mobile Number" DataTextField="mobileNumber" UniqueName="mobileNumberCol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
            
                         <telerik:GridBoundColumn DataField="firstName" FilterControlAltText="Filter FirstName column" HeaderText="First Name" SortExpression="firstName" UniqueName="firstName"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="lastName" FilterControlAltText="Filter LastName column" HeaderText="Last Name" SortExpression="lastName" UniqueName="lastName"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="Email" SortExpression="email" UniqueName="email"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="createdDate" FilterControlAltText="Filter Added column" HeaderText="Added" SortExpression="createdDate" UniqueName="createdDate"></telerik:GridBoundColumn>
                         

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="WaiverID" DataNavigateUrlFormatString="/" FilterControlAltText="Filter column1 column" HeaderText="View Waiver" Text="View Waiver" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         
                         <telerik:GridButtonColumn CommandName="DELETE_ALL" ConfirmText="This will unsubscribe the subscriber from ALL lists. Continue?" FilterControlAltText="Filter column1 column" HeaderText="Unsubscribe All" Text="Unsubscribe All" UniqueName="unsubcol"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>



<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFSMSMobileNum n inner join tblWFSMSSegmentMobileNum b on b.MobileNumID=n.ID left join tblWaiver w on w.waiverid=n.waiverid where b.segmentID=@segmentID and n.siteID=@siteID and n.IsGlobalOptOut=0">
                  </asp:SqlDataSource>


</asp:Content>
