<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Labels.aspx.cs" Inherits="WaiverFile.site.admin.Style.Labels" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

 
   

<script type="text/javascript">
    $(document).ready(function () {
        $('.btnReset').click(function () {
            $('#' + $(this).data('btnid')).val($('#' + $(this).data('btnid')).data('default'));
        });

        $('.btnResetAll').click(function () {
            $('.btnReset').each(function () {
                $(this).click();
            });
        });
    });
</script>
 <div class="widget">
    <h3>Manage Labels</h3>
    <div class="widgetcontentgrid">
    
        <p>Use this screen to customize the wording on your WaiverFile site.</p>

        <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <asp:PlaceHolder ID="phMain" runat="server"></asp:PlaceHolder>

        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
        <a href="javascript:void(0);" class="btn btn-default btnResetAll" data-btnid="txt_{Code}">Reset All</a>
</div></div>



</asp:Content>
