<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/SignupWide.Master" AutoEventWireup="true" CodeBehind="FreeTrial.aspx.cs" Inherits="WaiverFile.FreeTrial" %>

<%@ Register Src="/Controls/EasySignupV3.ascx" TagPrefix="uc1" TagName="EasySignupV3" %>


    
<asp:Content ID="Content4" ContentPlaceHolderID="ContentFullWidth" runat="server">

 
    <div class="row">
        <div class="col-sm-6"> <uc1:easysignupv3 runat="server" id="EasySignupV3" /></div>
        <div class="col-sm-6">
    <h2>Intro Video</h2>
<iframe width="100%" height="315" src="https://www.youtube.com/embed/N2rIf9DeALA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
    </div>

    

    


    </asp:Content>

<asp:Content runat="server" ID="content2" ContentPlaceHolderID="ContentFullWidthGreyBG">
    
    
    <div class="row">
        <div class="col-xs-12">
            
    <p>&nbsp;</p>
<h3>Free Trial FAQ</h3>
<p><strong>How long is the free trial?&nbsp;</strong></p>
<p><strong>&nbsp;</strong>The trial will expire after 30 days or 100 waivers collected, whichever happens first.&nbsp;</p>
<p>&nbsp;</p>
<p><strong>What features are included in the trial?</strong></p>
<p>All features are enabled so you can fully test the solution.&nbsp;</p>
<p>&nbsp;</p>
<p><strong>How many waiver forms can I have?&nbsp;</strong></p>
<p>You can have as many waiver form as you like. When it comes to the 100 waivers in the trial and the numbers of waivers referenced in our plans, those are counted based on the number of signed waivers you collect, regardless of how many different forms there are. Also note that we count based on signed waivers, not headcount, so if you have multiple children on a form, it just counts as one form.&nbsp;</p>
<p>&nbsp;</p>
<p><strong>What happens when my trial expires?&nbsp;</strong></p>
<p>Waivers will continue to collect initially so that service is not interrupted. A dashboard alert will appear instructing you how to select a plan.&nbsp;</p>
<p>&nbsp;</p>
<p><strong>Can I keep my signed waivers from the trial?&nbsp;</strong></p>
<p>Yes. Any waivers and any data you collect on the trial is yours to keep, even if you do not choose to continue with a plan. You can export all data and complete signed waivers for your records.&nbsp;</p>
<p>&nbsp;</p>
<p><em>Have more questions? <a href="/Contact.aspx">Contact us</a> for support!&nbsp;</em></p>

        </div>
        
    </div>
</asp:Content>

