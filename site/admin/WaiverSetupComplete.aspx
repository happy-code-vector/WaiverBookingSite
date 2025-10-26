<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WaiverSetupComplete.aspx.cs" Inherits="WaiverFile.site.admin.WaiverSetupComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

   

    <asp:Panel runat="server" ID="pnlFirst">
        <h1>You're all set!</h1>
        

        <div class="row">
            <div class="col-sm-6"><h3>Waiver Form Link</h3>

                <p>
                <a href="<%=site.BaseUrlAbsolute %>" target="_blank"><%=site.BaseUrlAbsolute %></a>
                    </p>
                <p class="help-block"><em>Share this link with customers so they can sign your form online</em></p>

              
            </div>
          
            <div class="col-sm-6">

                <h3>Useful Links</h3>
                  <p>
                    <a href="Style/ShareButtons.aspx">More Ways to Share Your Form</a>
                </p>
                <p>
                    <a href="Settings/Waiver-Forms.aspx">Additional Form Settings</a>
                </p>
                <p>
                    <a href="Help.aspx">Support</a>
                </p>
            </div>
              
        </div>
        


    </asp:Panel>
    <asp:Panel runat="server" ID="pnlSecond">

    </asp:Panel>
</asp:Content>
