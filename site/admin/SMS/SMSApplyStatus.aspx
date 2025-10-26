<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SMSApplyStatus.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SMSApplyStatus" %>

<%@ Register Src="/wp-content/Plugins/WPCommerce/Controls/Receipt.ascx" TagPrefix="uc1" TagName="Receipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <h3>SMS Application Status</h3>
    <p>
        <label>Current Status: </label>
        <asp:PlaceHolder runat="server" ID="phResults"></asp:PlaceHolder>
    </p>
    <asp:Panel runat="server" ID="pnlUnderReview" CssClass="WPERR_Information">
       Your business verification is under review, and may take several weeks to complete. The WaiverFile team will reach out to you via email if there's anything wrong with your application. Otherwise, you may check back on your registration status by visiting this page. 
    </asp:Panel>
    
    <uc1:Receipt runat="server" ID="FormSMSSettingIndividual" TemplateValue="/wp-content/Templates/WPCommerce/Receipt/Receipt.xslt" />
</asp:Content>
