<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFOffer2.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormWFOffer2" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            
     
       <style type="text/css">
.reToolbar .WaypointImage
{
  background-image: url(/wp-content/Common/images/WaypointImage.gif) !important;
}
.reToolbar .WaypointFile
{
  background-image: url(/wp-content/Common/images/WaypointFile.gif) !important;
}
</style>


 <script type="text/javascript">

     Telerik.Web.UI.Editor.CommandList["WaypointImage"] = function (commandName, editor, args) {
         var elem = editor.getSelectedElement(); //returns the selected element.
         var myCallbackFunction = function (sender, args) {
             //editor.pasteHtml(String.format("<a href={0} target='{1}' class='{2}'>{3}</a> ", args.href, args.target, args.className, args.name))
             editor.pasteHtml(args);
         }
         editor.showExternalDialog('/wp-admin/Dialogs/GalleryItemSelect.aspx', "", 585, 328, myCallbackFunction, null, 'Insert Image From Gallery', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move, false, true);
     };
     Telerik.Web.UI.Editor.CommandList["WaypointFile"] = function (commandName, editor, args) {
         var elem = editor.getSelectedElement(); //returns the selected element.
         var myCallbackFunction = function (sender, args) {
             //editor.pasteHtml(String.format("<a href={0} target='{1}' class='{2}'>{3}</a> ", args.href, args.target, args.className, args.name))
             editor.pasteHtml(args);
         }
         editor.showExternalDialog('/wp-admin/Dialogs/FileLibraryItemSelect.aspx', "", 585, 328, myCallbackFunction, null, 'Insert File From File Library', true, Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move, false, true);
     };

 </script> 

<script type="text/javascript">

   
    $(function () {
        
        
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
                <h3 class="box-title">WaiverFile Offer</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label>
                     <asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                 <div class="form-group">
                      <label for="<%=txtDisplayName.ClientID %>">Display Name</label><asp:TextBox ID="txtDisplayName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                      <label for="<%=txtDetails.ClientID %>">Details</label><asp:TextBox ID="txtDetails" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                  <div class="form-group">
                      <label for="<%=RadEditor1.ClientID %>">Email Message</label>
                </div>
                  <div class="form-group">
                       <telerik:RadEditor id="RadEditor1" 
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"  
        toolsfile="/wp-content/Common/WPStandardTools.xml"
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />



        </telerik:RadEditor>
                </div>

               
                 <div class="form-group">
                     <label for="<%=txtAmount.ClientID %>">Amount</label><asp:TextBox ID="txtAmount" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboDiscountMode.ClientID %>">DiscountMode</label>
                     <asp:DropDownList ID="cboDiscountMode" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtExpireDaysAfterInvite.ClientID %>">Expire After Invite (days)</label><asp:TextBox ID="txtExpireDaysAfterInvite" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=txtMonthsValidForOnceClaimed.ClientID %>">Months Valid Once Claimed (include first month)</label><asp:TextBox ID="txtMonthsValidForOnceClaimed" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                  <div class="form-group">
           <label>Plan Groups</label>
           </div>

                 <div><a href="javascript:void(0);" class="btn btn-sm btn-default btncheckall">Check All</a> <a href="javascript:void(0);" class="btn btn-sm  btn-default btnchecknone">Check None</a></div>
                        <div class="checkboxlist"  id="formselections">
                        <asp:CheckBoxList runat="server" ID="cblPlanGroups"></asp:CheckBoxList>
                             </div>
                            </div>


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            