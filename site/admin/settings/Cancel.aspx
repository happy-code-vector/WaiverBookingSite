<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Cancel.aspx.cs" Inherits="WaiverFile.site.admin.settings.Cancel_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <asp:PlaceHolder id="phErr" runat="server"></asp:PlaceHolder>

    <asp:Panel runat="server" ID="pnlMain">

        <script type="text/javascript">

            
            $(document).ready(function () {
                $("input[type='checkbox']").each(function () {
                    $(this).change(function () {
                        if ($(this).val() == "bdb67385-ffa7-4488-9b37-2be819431101") {
                            $("#closingMessage").show();
                        }
                    });
                });

            });

        </script>

        <h1>Cancel your Subscription</h1>
        <p>We're sorry to see you go! You can use the button below to cancel your account. Before doing so, we recommend downloading a copy of all the waivers you may have collected and retaining them for your records. You can <a href="../Export.aspx">download archives here</a>. </p>

        <div id="closingMessage" style="display: none;" class="WPERR_Warning">
            Did you know we have seasonal options? We have an off-season plans as well as annual plans that will keep your account active during the off season. This keeps your data secure and also makes setup easier next season! <a href="/Contact.aspx">Contact us to learn more</a>
        </div>

         <div class="form-group">
             <label>Why are you cancelling? (Check all that apply)</label>
        </div>
        <div class="form-group">
             <div class="checkboxlist">
                 <asp:CheckBoxList runat="server" ID="cblReasons" RepeatLayout="UnorderedList" CssClass="list-unstyled">
                    
                 </asp:CheckBoxList>
             </div>
        </div>
         <div class="form-group">
             <label>Please provide any additional comments, feedback or suggestions. Any feedback you may have is greatly appreciated!</label>
         </div>
        <div class="form-group">
             <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>

       
        <hr />


        <div class="form-group">
            <asp:CheckBox runat="server" id="chkConfirmDownloaded"></asp:CheckBox>
            I have downloaded all the waiver data that I need. Please permanently delete my account and data. <span class="text-danger">*</span>
        </div>

        <div class="form-group">
             <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-primary" Text="Submit" OnClick="BtnCancel_Click" />
            </div>

    </asp:Panel>
</asp:Content>
