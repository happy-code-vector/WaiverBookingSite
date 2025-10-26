<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BarcodeCheckInReport.ascx.cs" Inherits="WaiverFile.Connectors.Controls.BarcodeCheckInReport" %>


<%@ Register Assembly="Telerik.Web.UI"
    Namespace="Telerik.Web.UI" TagPrefix="rad" %>

 <div class="pull-right" style="margin-top:20px;">
     <asp:LinkButton runat="server" ID="btnExport" CssClass="btn btn-primary" OnClick="btnExport_Click">Export to Excel</asp:LinkButton>
        </div>

<h3>Signing and Scanning Report</h3>

<rad:RadGrid  ID="RadGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <MasterTableView DataSourceID="SqlDataSource1">
        <Columns>
            <rad:GridBoundColumn DataField="DateSigned" HeaderText="Date" UniqueName="column">
            </rad:GridBoundColumn>

            <rad:GridBoundColumn DataField="waiversSigned" HeaderText="Signed Waivers" UniqueName="column1">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="participantsSigned" HeaderText="Participants" UniqueName="column2">
            </rad:GridBoundColumn>
              <rad:GridBoundColumn DataField="participantsScanned" HeaderText="Scanned Waivers" UniqueName="column3">
            </rad:GridBoundColumn>
            <rad:GridBoundColumn DataField="waiversScanned" HeaderText="Participants" UniqueName="column4">
            </rad:GridBoundColumn>
            
        </Columns>
        <ExpandCollapseColumn Resizable="False" Visible="False">
            <HeaderStyle Width="20px" />
        </ExpandCollapseColumn>
        <RowIndicatorColumn Visible="False">
            <HeaderStyle Width="20px" />
        </RowIndicatorColumn>
    </MasterTableView>
</rad:RadGrid>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="spReportWaiverSigningAndBarcodeScanningByDay" SelectCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>">
</asp:SqlDataSource>
