<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormAventriConn.ascx.cs" Inherits="WaiverFile.Connectors.Controls.FormAventriConn" %>

<script type="text/javascript">

    function showHideSpecificForms() {

        if ($('#<%=chkRequireForAllForms.ClientID%>').is(':checked')) {
            $('#divSpecificForms').hide();
        } else {
            $('#divSpecificForms').show();
        }

    }
    $(function () {
        showHideSpecificForms();
        $('#<%=chkRequireForAllForms.ClientID%>').change(function () { showHideSpecificForms(); })
        $('.btncheckall').click(function () {
            $('#formselections input[type="checkbox"]').each(function () {
                $(this).prop('checked', true);
            });
        });
        $('.btnchecknone').click(function () {
            $('#formselections input[type="checkbox"]').each(function () {
                $(this).prop('checked', false);
            });
        });


    });
</script>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Aventri Settings</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
         <div class="form-group">
            <label>Status</label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="cboStatus"></asp:DropDownList>
        </div>
        


        <div class="form-group">
            <label>Account ID</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtAccountID"></asp:TextBox>
        </div>

      

        <div class="form-group">
            <label>API Key</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtAPIKey"></asp:TextBox>
            <p class="help-block">To get your API Key and Merchant ID, please contact your Aventri account manager or email <a href="mailto:support@aventri.com">support@aventri.com</a>.</p>
        </div>

        <div class="form-group">
            <asp:CheckBox runat="server" ID="chkRequireForAllForms" Text="Require attendee parameters for all forms" />
            <p class="help-block">When checked, attendee ID and event ID must be present in order to sign any waiver form.</p>
        </div>

        
      

           <div id="divSpecificForms" class="well">
               
           <div class="form-group">
           <label>Require attendee parameters for specific forms</label>
           </div>

                            <div><a href="javascript:void(0);" class="btn btn-sm btn-default btncheckall">Check All</a> <a href="javascript:void(0);" class="btn btn-sm  btn-default btnchecknone">Check None</a></div>
                        <div class="checkboxlist"  id="formselections">
                        <asp:CheckBoxList runat="server" ID="cblForms"></asp:CheckBoxList>
                             </div>
                            </div>

           <div class="form-group">
            <label>Link Expiration Page Heading</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtExpiredHeading"></asp:TextBox>
        </div>
           <div class="form-group">
            <label>Link Expiration Page Message</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtExpiredMessage"></asp:TextBox>
        </div>
        
       <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
        
       
        
    </div><!-- /.box-body -->
    <div class="box-footer">
    </div>
</div>



<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Aventri link reference
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        <p>In aventri, use the following links in your automated emails to pass along the required ID's:</p>

        <p>
        In the HTML content box, include a link using this code: <br />

        <pre>
            &lt;a href="https://www.waiverfile.com/b/<%=site.Url %>?wfi_evtid=*/eventid/*&wfi_attid=*/referencenumber/*"&gt;click here&lt;/a&gt;
        </pre>
            <br />
In the text content box, include the link like this: <br />
https://www.waiverfile.com/b/<%=site.Url %>?wfi_evtid=*/eventid/*&wfi_attid=*/referencenumber/*
    </p>

<p>These links will automatically direct the user to your page and pass in the ID's needed to tie that signature back to their registration record in Aventri. </p>
    <p>For more information, see: <a href="https://www.waiverfile.com/Resources/Help/Export-and-Integrations/Integrations/Aventri.aspx" target="_blank">Aventri integration help</a></p>

    </div><!-- /.box-body -->
   
</div>


