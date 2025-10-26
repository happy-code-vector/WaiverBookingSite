<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageCustomerOffers.ascx.cs" Inherits="WaiverFile.WFSubscriptions.Controls.ManageCustomerOffers" %>
            <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Waypoint" namespace="Waypoint.Forms" tagprefix="cc1" %>

<script type="text/javascript">

    function showHideEmail() {
        if ($('#<%=chkSendEmail.ClientID%>').is(':checked') || $('#<%=chkEmailMe.ClientID%>').is(':checked')) {
            $('#divEmail').show();
            $('#divSubject').show();
            $('#divSender').show();
            
        } else {
            $('#divEmail').hide();
            $('#divSubject').hide();
            $('#divSender').hide();
        }
        
    }
    $(function () {
        $('#btnAddOffer').click(function () {
            $('#btnAddOfferWrap').hide();
            $('#divAddOffer').show();
            showHideEmail(); 
        });
        $('#<%=chkSendEmail.ClientID%>').click(function () { showHideEmail(); });
        $('#<%=chkEmailMe.ClientID%>').click(function () { showHideEmail(); });
        


    });

</script>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Offers

</h3>
    </div><!-- /.box-header -->
   <div class="box-body no-padding">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Waypoint" EnableEmbeddedSkins="false" AutoGenerateColumns="False"  OnDeleteCommand="RadGrid1_DeleteCommand" OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1"  AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="OfferID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="displayName" FilterControlAltText="Filter OfferID column" HeaderText="Offer" SortExpression="displayName" UniqueName="displayName"></telerik:GridBoundColumn>

                         
                         

                         
                         <telerik:GridBoundColumn DataField="code" FilterControlAltText="Filter Code column" HeaderText="Code" SortExpression="code" UniqueName="code"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="expires" FilterControlAltText="Filter Expires column" HeaderText="Expires" SortExpression="expires" UniqueName="expires"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DateClaimed" FilterControlAltText="Filter DateClaimed column" HeaderText="Claimed" SortExpression="DateClaimed" UniqueName="DateClaimed"></telerik:GridBoundColumn>

                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/wp-admin/default.aspx?id={0}&amp;sc=WF_SUBS_EDIT_CUST_OFFER&amp;c=1" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="column1" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="This will permanently delete the offer. This cannot be undone. Continue?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
    </div><!-- /.box-body -->
    <div class="box-footer">


        <p class="text-center" id="btnAddOfferWrap">
        <a href="javascript:void(0);" id="btnAddOffer"><i class="fa fa-plus-circle"></i> Add Offer</a>
        </p>

        <div class="" id="divAddOffer" style="display:none;">



          
        
                <div class="form-group">
                    <asp:DropDownList runat="server" ID="cboOffers" CssClass="form-control"></asp:DropDownList>    
                </div>
            <div class="row">
                  <div class="col-sm-4"><div class="form-group">
                    <asp:CheckBox ID="chkEmailMe" runat="server" /> Email Me<br />
                </div></div>

                  <div class="col-sm-4"><div class="form-group">
                    <asp:CheckBox ID="chkSendEmail" runat="server" /> Email Customer<br />
                </div></div>
                <div class="col-sm-4"><div class="form-group">
                    <asp:CheckBox ID="chkAutoApply" runat="server" /> Auto Apply <cc1:WPHelpIcon ID="WPHelpIcon1" runat="server" HelpText="Automatically gives the customer the offer. No need to enter a code.">
                    </cc1:WPHelpIcon> <br />
                </div></div>
              
            </div>
                
                
                <div class="form-group" id="divSender">
                    <label>From</label>
                    <asp:DropDownList runat="server" ID="cboSender" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group" id="divSubject">
                    <label>Subject</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtSubject" Text="We've got a special offer for you!" ></asp:TextBox>
                </div>
                <div class="form-group" id="divEmail">
                    <label>Message Template</label>
                    <asp:DropDownList runat="server" ID="cboEmailTemplate" CssClass="form-control"></asp:DropDownList>
                </div>
                 
                <div class="form-group">
                    <label>Code (leave blank to auto generate)</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCode" placeholder="Code"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button runat="server" ID="btnOffer" Text="Add Offer" CssClass="btn btn-primary" OnClick="btnOffer_Click" />
                </div>

            
        </div>


    </div>
</div>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFOffer2 o inner join tblWFOffer2Customer c on c.OfferID=o.ID
where c.CustomerID=@customerID">
                  </asp:SqlDataSource>
     
