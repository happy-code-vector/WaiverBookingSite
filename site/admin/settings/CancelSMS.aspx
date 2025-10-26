<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="CancelSMS.aspx.cs" Inherits="WaiverFile.site.admin.settings.CancelSMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
        <asp:PlaceHolder id="phErr" runat="server"></asp:PlaceHolder>

    <asp:Panel runat="server" ID="pnlMain">


    <h2>Cancel SMS Text Messaging Service</h2>
    <p>If you no longer wish to use your SMS texting service, you can cancel below. </p>

      <div class="form-group">
             <label>Can we ask why you're cancelling? (Optional)</label>
        </div>
        <div class="form-group">
             <div class="checkboxlist">
                 <asp:CheckBoxList runat="server" ID="cblReasons" RepeatLayout="UnorderedList" CssClass="list-unstyled">
                     <asp:ListItem>I need additional features (let us know what they are below)</asp:ListItem>
                     <asp:ListItem>Pricing</asp:ListItem>
                     <asp:ListItem>Difficulty using system</asp:ListItem>
                     <asp:ListItem>Business closing</asp:ListItem>
                     <asp:ListItem>Using another solution</asp:ListItem>
                     <asp:ListItem>Something else (describe in comments)</asp:ListItem>
                 </asp:CheckBoxList>
             </div>
        </div>
         <div class="form-group">
             <label>Comments/Suggestions</label>
         </div>
        <div class="form-group">
             <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>

       
        <hr />

        <p>The following sending number(s) will be removed:</p>
        <asp:PlaceHolder runat="server" ID="phSendingNums"></asp:PlaceHolder>
        <div class="form-group">
            <asp:CheckBox runat="server" id="chkConfirmUnderstand"></asp:CheckBox>
            I understand the sending phone number(s) assigned to my account will be removed and cannot be recovered. <span class="text-danger">*</span>
        </div>

        <div class="form-group">
             <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-primary" Text="Submit" OnClick="BtnCancel_Click" />
            </div>
        </asp:Panel>
</asp:Content>
