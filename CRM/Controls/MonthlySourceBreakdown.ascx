<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MonthlySourceBreakdown.ascx.cs" Inherits="WaiverFile.CRM.Controls.MonthlySourceBreakdown" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<p>
    <label>Signup Codes</label>
</p>
<p>
<asp:CheckBoxList runat="server" ID="cblSignupCodes" CssClass="checkboxlist"></asp:CheckBoxList>
</p>
<p>
    <label>Sources</label>
</p>
<p>
<asp:CheckBoxList runat="server" ID="cblSources" CssClass="checkboxlist"></asp:CheckBoxList>
</p>

<asp:Button runat="server" ID="btnRun" CssClass="btn-primary" OnClick="btnRun_Click" Text="Run" />
<asp:Button runat="server" ID="btnDownloadExcel" CssClass="btn-primary" OnClick="btnDownloadExcel_Click" Text="Download to Excel" />

  <rad:RadGrid Skin="Waypoint" EnableEmbeddedSkins="False"  id="RadGrid1" runat="server" DataSourceID="sqlDataSource1" AutoGenerateColumns="True" >
        <mastertableview datasourceid="sqlDataSource1"><Columns>

        
</Columns>

<ExpandCollapseColumn Visible="False" Resizable="False">
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>

<RowIndicatorColumn Visible="False">
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<EditFormSettings>
<EditColumn InsertImageUrl="Update.gif" UpdateImageUrl="Update.gif" CancelImageUrl="Cancel.gif"></EditColumn>
</EditFormSettings>
</mastertableview>

<FilterMenu EnableEmbeddedSkins="False"></FilterMenu>

<HeaderContextMenu EnableEmbeddedSkins="False"></HeaderContextMenu>
    </rad:RadGrid>
 
         <asp:SqlDataSource ID="sqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"
        SelectCommand="" ProviderName="System.Data.SqlClient" >
        </asp:SqlDataSource>

