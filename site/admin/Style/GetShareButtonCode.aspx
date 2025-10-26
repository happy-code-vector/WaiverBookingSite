
<%@ Page Title="Get Share Button Code" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="GetShareButtonCode.aspx.cs" Inherits="WaiverFile.site.admin.Style.GetShareButtonCode" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content> 
<%@ register src="~/Controls/ViewShareButton.ascx" tagprefix="uc1" tagname="ViewShareButton" %> 
<asp:Content ID="ContentPH0" ContentPlaceHolderID="ph0" runat="server"> 

    <div class="pull-right"><a href="ShareButtons.aspx" class="btn btn-default">Back to Share Buttons</a></div>

<uc1:ViewShareButton runat ="server" id="ViewShareButton1" /> 
</asp:Content> 
<asp:Content ID="ContentPH1" ContentPlaceHolderID="ph1" runat="server"> 

    <div class="col-xs-12">
        <h4>Need Help?</h4>
We can help you get your WaiverFile site linked on your website. <a href="../Help.aspx">Contact us</a> for assistance anytime! We're here to help.&nbsp;

    </div>

    
</asp:Content> 