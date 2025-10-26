<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFXMLTemplate.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.FormWFXMLTemplate"  %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">

    function preSave() {
        $('.allow_html textarea').each(function (idx, item) {
            $($(this).parent()).find('input[type="hidden"]').val(escape($(this).val()));
            $(this).val('');
        });
    }
    $(function () {

        //on load, unescape 
        $('.allow_html textarea').each(function (idx, item) {
            var value = $($(item).parent()).find('input[type="hidden"]').val();
            $(item).val(unescape(value));
        });

        $('.allow_html textarea').blur(function () {
            $($(this).parent()).find('input[type="hidden"]').val(escape($(this).val()));
        });

        
       
    });
    // The event to escape the data and store in our HiddenField
   


</script>            

                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">XSLTemplate</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtBaseFilename.ClientID %>">BaseFilename</label><asp:TextBox ID="txtBaseFilename" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <asp:CheckBox ID="chkEnabled" CssClass="form-control" runat="server" Text="Enabled"></asp:CheckBox>
                </div>
                    <p><label>Notes</label><asp:TextBox ID="txtNotes" runat="server"></asp:TextBox></p>

                  <p><label>XSLContent</label></p>

                <div class="allow_html">
                    <asp:TextBox ID="txtXSLContent" runat="server" CssClass="form-control" TextMode="MultiLine" Height="500"></asp:TextBox>
                    <asp:HiddenField runat="server" ID="hfTXTxslContent" />
                </div>
                


               
                  


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" OnClientClick="preSave()" />
    </div>
</div>



            