<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFSubscription.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.FormWFSubscription" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
$(document).ready(function(){
    $('#changestatus').hide();

$('#<%=cboStatus.ClientID %>').change(function(){  $('#changestatus').show(); } );
    });
    </script>

                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Edit Subscription</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
                <div class="form-group"><strong>
                    <asp:Label ID="lblServiceType" runat="server"></asp:Label>
                                        </strong>
                    <hr style="margin:10px 0;" />

                  <div class="form-group">
                     <label for="<%=cboPlan.ClientID %>">Plan</label><asp:DropDownList ID="cboPlan" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                 <div class="form-group">
                     <label for="<%=dtStartDate.ClientID %>">StartDate</label>
                       <telerik:RadDatePicker ID="dtStartDate" runat="server"></telerik:RadDatePicker>
                </div>
               
                 <div class="form-group">
                     <label for="<%=dtExpirationDate.ClientID %>">ExpirationDate</label>
                       <telerik:RadDatePicker ID="dtExpirationDate" runat="server"></telerik:RadDatePicker>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label><asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               
                 <div class="form-group" id="changestatus">
                     <label>Update all Waiver Sites with change in status</label> <asp:CheckBox runat="server" ID="chkChangeStatus" />
                     <p class="help-block">When checked, all waiver sites associated with this subscription will have their statuses updated to match the status of the subscription. Use this for suspending sites. Note that expired statuses will keep sites active. Use suspended status to torn a site off.</p>
                 </div>
                  <div class="form-group">
                     <label for="<%=cboAutomaticPayments.ClientID %>">Automatic Payments</label><asp:DropDownList ID="cboAutomaticPayments" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               

                
               


                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            