<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="CustomizeSite.aspx.cs" Inherits="WaiverFile.site.admin.CMS.CustomizeSite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            // Add hover effect for desktop only (not needed on touch devices)
            if (!('ontouchstart' in window)) {
                $('.panel-body').hover(
                    function () {
                        $(this).find('.theme-overlay').css('opacity', '1');
                    },
                    function () {
                        $(this).find('.theme-overlay').css('opacity', '0');
                    }
                );
            }

            // Toggle description display
            $('.toggle-description').click(function (e) {
                e.preventDefault();
                var $this = $(this);
                var $description = $this.closest('.panel-body').find('.theme-description');

                if ($description.is(':visible')) {
                    $description.slideUp(200);
                    $this.html('<i class="fa fa-info-circle"></i> Show Details');
                } else {
                    $description.slideDown(200);
                    $this.html('<i class="fa fa-info-circle"></i> Hide Details');
                }
            });
        });
    </script>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="phMain"></asp:PlaceHolder>

</asp:Content>
