<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WaiverViewLog.aspx.cs" Inherits="WaiverFile.site.admin.WaiverViewLog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

  <asp:PlaceHolder ID="phInfo" runat="server"></asp:PlaceHolder>

        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound">
            <MasterTableView DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="First_Name" FilterControlAltText="Filter First_Name column" HeaderText="First Name" SortExpression="First_Name" UniqueName="First_Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Last_Name" FilterControlAltText="Filter Last_Name column" HeaderText="Last Name" SortExpression="Last_Name" UniqueName="Last_Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Email_Address" FilterControlAltText="Filter Email_Address column" HeaderText="Email" SortExpression="Email_Address" UniqueName="Email_Address">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ViewType" FilterControlAltText="Filter View Type column" HeaderText="View Type" SortExpression="ViewType" UniqueName="ViewType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ViewTimestamp" FilterControlAltText="Filter Date column" HeaderText="View Date" SortExpression="ViewTimestamp" UniqueName="ViewTimestamp">
                    </telerik:GridBoundColumn>
                    
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>" 
    SelectCommand="select v.*, u.First_Name, u.Last_Name, u.Email_Address from tblWaiverView v
inner join tblwaiver w on w.WaiverID =v.WaiverID
    left join tblWPUser u on u.ID=v.UserID
where v.WaiverID=@WaiverID   and w.SiteID=@siteid
order by ViewTimestamp desc
 ">
    </asp:SqlDataSource>

</asp:Content>
