<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListWaiverForms2.ascx.cs" Inherits="WaiverFile.Controls.ListWaiverForms2" %>

<script type="text/javascript">
    $(document).ready(function () {
        $('#show_deleted').click(function () {
            $(this).hide();
            $('#deleted_waiver_forms').show();
        });
    });
        
      </script>

<asp:PlaceHolder runat="server" ID="ph0"></asp:PlaceHolder>