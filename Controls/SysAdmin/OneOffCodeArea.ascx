<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OneOffCodeArea.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.OneOffCodeArea" %>



One-Off code
<br /><br />


<asp:Button runat="server" ID="btnTEMPDeleteAllSitePAges" Text="DELETE ALL PAGES EXCEPT LOGIN (CLEANUP FOR INSTANCES)" OnClick="btnTEMPDeleteAllSitePAges_Click" />

<asp:Button runat="server" ID="btnCalcUsageDatatest" Text="Calculate usage data test" OnClick="btnCalculateUsageData_Click" />

<asp:Button runat="server" ID="btnStoreAFile" Text="Store a file" OnClick="btnStoreAFile_Click" /><br />

<asp:Button runat="server" ID="btnRouteTest" Text="Route Test" OnClick="btnRouteTest_Click" />
<asp:Button runat="server" ID="btnAuthNetChange" Text="Send authorize.net payment system change notification" OnClick="btnAuthNetChange_Click" />
<br /><br />

Subscription:
<asp:DropDownList runat="server" ID="cboSubscriptions"></asp:DropDownList>

Mailing:
<asp:DropDownList runat="server" ID="cboMailings" ></asp:DropDownList>

<asp:Button runat="server" ID="btnSendMail" Text="Send" OnClick="btnSendMail_Click" /><br />
 
<br /><br />
DON'T RUN THIS IN PRODUCTION<br />
Account: <asp:DropDownList runat="server" ID="cboSites"></asp:DropDownList>
Max waivers per day: <asp:TextBox runat="server" ID="txtMaxWaiversPerDay" Text="10"></asp:TextBox><br />
Min waivers per day: <asp:TextBox runat="server" ID="txtMinWaiversPerDay" Text="10"></asp:TextBox><br />
How many Days back: <asp:TextBox runat="server" ID="txtDaysBack" Text="10"></asp:TextBox><br />
How many events per day: <asp:TextBox runat="server" ID="txtNumberOfEvents" Text="7"></asp:TextBox><br />
<asp:Button runat="server" ID="btnGeneratePhonyData" Text="Send" OnClick="btnGeneratePhonyData_Click" /><br />

<br />
<br />


<asp:Button runat="server" ID="btnProcessEmailExport" Text="Process Weekly Email Export" OnClick="btnRunEmailExport_Click" /><br />
<asp:Button runat="server" ID="btnProcessWeeklyExport" Text="Process Weekly Waiver Export" OnClick="btnRunWeeklyExport_Click" /><br />




<asp:PlaceHolder runat="server" ID="phResult" />
