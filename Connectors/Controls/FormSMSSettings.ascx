<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormSMSSettings.ascx.cs" Inherits="WaiverFile.Connectors.Controls.FormSMSSettings" %>


<script>

    
    function beforeClick() {
        $('.htmlenabled').each(function () {
            $(this).val(window.escape($(this).val()));
        });
        return true;
    }

    $(document).ready(function () {
        $('.htmlenabled').each(function () {
            $(this).val(window.unescape($(this).val()));
        });
        


    });

  
    </script>


<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>



<asp:PlaceHolder ID="phAssignedNumbers" runat="server"></asp:PlaceHolder>


<asp:PlaceHolder ID="phForms" runat="server"></asp:PlaceHolder>
 
<div class="form-group">
<asp:Button runat="server" ID="btnSave" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" OnClientClick="return beforeClick();" />
     </div>