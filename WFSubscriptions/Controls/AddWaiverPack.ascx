<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddWaiverPack.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.AddWaiverPack" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
           
<script type="text/javascript">
    function ShowHidePrice() {
        if ($('#<%=rbChargeCC.ClientID%>').is(':checked') || $('#<%=rbLeaveOutstanding.ClientID%>').is(':checked')) {
            $('#priceblock').show();
        } else {
            $('#priceblock').hide();
        }
    }

    $(document).ready(function () {
        ShowHidePrice();

        $("input[type='radio']").change(function (e) {
            ShowHidePrice();
        });
    });
</script>
 
                <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Addon Pack</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                
                 <div class="form-group">
                     <label>Apply to Period</label><asp:DropDownList ID="cboPeriod" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               
               
                 <div class="form-group">
                     <label for="<%=txtNumWaivers.ClientID %>">Number to Add</label><asp:TextBox ID="txtNumWaivers" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label>How to Apply</label>
                </div>
                
                <asp:RadioButton runat="server" ID="rbComplementary" GroupName="applyOption" Text="Complimentary" /><br />
                <asp:RadioButton runat="server" ID="rbAlreadyPaid" GroupName="applyOption" Text="Already Paid" /> <asp:DropDownList runat="server" ID="cboOrders"></asp:DropDownList><br />
                <asp:RadioButton runat="server" ID="rbLeaveOutstanding" GroupName="applyOption" Text="Leave as outstanding (create unpaid order)" /><br />
                <asp:RadioButton runat="server" ID="rbChargeCC" GroupName="applyOption" Text="Charge Credit Card" /> <asp:DropDownList runat="server" ID="cboCardsOnFile"></asp:DropDownList><br />

                 <div class="form-group" id="priceblock">
                     <label>Price</label>
                     <asp:TextBox runat="server" ID="txtAmount" CssClass="form-control"></asp:TextBox>
                </div>
                

                 </div><!-- /.box-body -->
    <div class="box-footer">
       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
    </div>
</div>



            