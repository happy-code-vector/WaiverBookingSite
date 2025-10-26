<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SubscribersViewList.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SubscribersViewList" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- mobile number format -->
     <link rel="stylesheet" href="/site/includes/intlTelInput.css">
      <script src="/site/includes/intlTelInput.min.js"></script>
    <script src="/site/includes/jquery.mask.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    
    <script type="text/javascript">
        $(function () {
            $('#<%=btnFindContact.ClientID%>').click(function () {
                $('#modalFindContact').modal('show');
            });
            $('#<%=btnNewContact.ClientID%>').click(function () {
                $('#modalNewContact').modal('show');
            });

            $('#btnCheckAllLists').click(function () {
                $('#<%=cblLists.ClientID%> input[type=checkbox]').each(function () {
                     $(this).prop('checked', true);
                 });
            });
            $('#btnCheckNoLists').click(function () {
                $('#<%=cblLists.ClientID%> input[type=checkbox]').each(function () {
                     $(this).prop('checked', false);
                 });
             });

            var phoneInputID = "#txtMobileNum";
            var input = document.querySelector("#txtMobileNum");
            var iti = window.intlTelInput(input, {
                formatOnDisplay: true,
                hiddenInput: "rawNum",
                initialCountry: "<%=_defaultCountryCode.ToLower()%>",
                onlyCountries: ['us', 'ca'], //FOR NOW
                //preferredCountries: ['us', 'ca'],
                utilsScript: "/site/includes/utils.js",
            });
            $(phoneInputID).on('countrychange', function (e) {
                $('#<%=hfCountry.ClientID%>').val(iti.getSelectedCountryData().iso2);
                var selectedCountryData = iti.getSelectedCountryData();
                newPlaceholder = intlTelInputUtils.getExampleNumber(selectedCountryData.iso2, true, intlTelInputUtils.numberFormat.INTERNATIONAL),
                    mask = newPlaceholder.replace(/[1-9]/g, "0");
                $(this).mask(mask);
            });

            $('#modalFindContact').on('shown.bs.modal', function () {
                $('#txtAddPartSearchText').focus();
            });
            $('#btnSearchPart').click(function () {
                MobileNumSearch($('#txtAddPartSearchText').val(), $('#txtAddPartSearchMobileNum').val());
            });

            $("#txtAddPartSearchText").keyup(function (event) {
                if (event.keyCode === 13) {
                    $('#btnSearchPart').click();
                }
            });


            $("#txtAddPartSearchMobileNum").keyup(function (event) {
                if (event.keyCode === 13) {
                    $('#btnSearchPart').click();
                }
            });

            iti.promise.then(function () {
                $(phoneInputID).trigger("countrychange");
            });


        });

        function btnSaveNewContact_onclientclick() {
            if (!$('#<%=chkSMSOptIn.ClientID%>').is(':checked')) {
                $('#divErrSMS').show();
                return false;
            }
            return true;
        }
        function btnAddSelected_clientClick() {


            $('#modalFindContactAddErr').html('');
            
            //GET ALL SELECTED ITEMS popupSelectedEventID  popupSelectedSection
            var idsChecked = '';
            $('.chk_add_part:checked').each(function () {
                if(idsChecked != '') { idsChecked += ','; }
                idsChecked += $(this).val();

            });

            var targetSelector = 'table.GENADM';

            $('#<%=hfContactIdsToAdd.ClientID%>').val(idsChecked);

             //leaving off here
             //need to go through the selected items and push the data
             //i think get the id's and push to a hidden field, then post back.

            if (idsChecked == '') {
                $('#modalFindContactAddErr').html('No contacts selected.');
                return false;
            } else {
                return true;
            }







        }

        function MobileNumSearch(name, mobilenum) {
            $('#findPartResults').html('Loading...');


            $.ajax({
                type: "POST",
                url: "/Controls/MainHandler.ashx",
                data: { cmd: "MOBILENUM_SEARCH", siteid: '<%=site.ID%>', currentListID: '<%=listID%>', name: name, mobilenum: mobilenum },
                success: function (data) {
                    //render!
                    if (data.length == 0) {
                        $('#findPartResults').html('No results found.');
                    } else {
                        var tbl = '<table class="table table-condensed"><thead><tr>'
                            + '<th>Select</th>'
                            + '<th>Name</th>'
                            + '<th>Mobile Number</th>'
                            + '</tr></thead><tbody>';
                        for (id in data) {
                            for (var currRow in data[id]) {
                                tbl += '<tr><td><input type="checkbox" class="chk_add_part" value="' + data[id][currRow]['ID'] + '"/></td>';
                                tbl += '<td>' + data[id][currRow]['FirstName'] + ' ' + data[id][currRow]['LastName'] + '</td > ';
                                tbl += '<td>' + data[id][currRow]['MobileNumber'] + '</td>';
                                tbl += '</tr>';
                            }
                        }
                        tbl += '</tbody></table>';
                        $('#findPartResults').html(tbl);
                    }
                },
                complete: function () {

                }
            });

        }

    </script>



       <style type="text/css">
        .buttonwrap{
            padding-top:15px;text-align:right;
        }
        @media (max-width:640px){
            .buttonwrap{ text-align:center; padding-top:0;padding-bottom:10px; }
        }
    </style>


    <div class="row">
        <div class="col-lg-5"><h3><asp:Label runat="server" ID="lblHeading"></asp:Label></h3></div>
        <div class="col-lg-7">
            <div class="buttonwrap">
           
           <a href="javascript:void(0);" id="btnNewContact"  runat="server" class="btn btn-default" ><i class="fa fa-plus-circle"></i> Create Contact</a>
            <a href="javascript:void(0);" id="btnFindContact" runat="server" class="btn btn-default"><i class="fa fa-search"></i> Add Contacts</a>
                
            <a href="SMSExcelImport.aspx" class="btn btn-default"><i class="fa fa-upload"></i> Import Contacts</a>

    </div></div>
    </div>

    <nav aria-label="breadcrumb" xmlns:cc1="remove"><ol class="breadcrumb">
    <li><a href="Subscribers.aspx">Subscribers</a></li>
    <li class="breadcrumb-item active" aria-current="page"><asp:Label runat="server" ID="lblBreadcrumbCurr"></asp:Label></li>
  </ol></nav>

    
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>






<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnPreRender="RadGrid1_PreRender" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                        
            
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="/" FilterControlAltText="Filter column1 column" HeaderText="Mobile Number" DataTextField="mobileNumber" UniqueName="mobileNumberCol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         
                         <telerik:GridBoundColumn DataField="firstName" FilterControlAltText="Filter FirstName column" HeaderText="First Name" SortExpression="firstName" UniqueName="firstName"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="lastName" FilterControlAltText="Filter LastName column" HeaderText="Last Name" SortExpression="lastName" UniqueName="lastName"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="Email" SortExpression="email" UniqueName="email"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="createdDate" FilterControlAltText="Filter Added column" HeaderText="Added" SortExpression="createdDate" UniqueName="createdDate"></telerik:GridBoundColumn>
                         

                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="WaiverID" DataNavigateUrlFormatString="/" FilterControlAltText="Filter column1 column" HeaderText="View Waiver" Text="View Waiver" UniqueName="editcol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>                         
            
                        
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="This will remove this subscriber from the list. Continue?" FilterControlAltText="Filter column1 column" HeaderText="Remove" Text="Remove" UniqueName="deletecol"></telerik:GridButtonColumn>
                         <telerik:GridButtonColumn CommandName="DELETE_ALL" ConfirmText="This will unsubscribe the subscriber from ALL lists. Continue?" FilterControlAltText="Filter column1 column" HeaderText="Unsubscribe All" Text="Unsubscribe All" UniqueName="unsubcol"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>



<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFSMSMobileNum n inner join tblWFSMSListMobileNum b on b.MobileNumID=n.ID left join tblWaiver w on w.waiverid=n.waiverid where b.ListID=@listID and n.siteID=@siteID and n.IsGlobalOptOut=0 order by createddate desc">
                  </asp:SqlDataSource>
                  
    

     <asp:HiddenField runat="server" ID="hfContactIdsToAdd" />

    
<!-- Modal -->
<div class="modal fade" id="modalFindContact" tabindex="-1" role="dialog" aria-labelledby="lblFindContact">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblFindContact">Find Subscribers to Add</h4>
      </div>
      <div class="modal-body">

          <span id="modalFindContactAddErr" style="color:red;"></span>

        
            <asp:Panel runat="server">
          <div class="form-group">

              <div class="row">
                  <div class="col-sm-5">
                        <div class="form-group">
                      <label for="txtAddPartSearchText"  class="control-label">Name</label>
                      <input type="text" id="txtAddPartSearchText" name="txtAddPartSearchText" class="form-control" placeholder="Name" />
                            </div>
                  </div>
                  <div class="col-sm-5">
                       <div class="form-group">
                <label for="txtAddPartSearchMobileNum" class="control-label">Mobile Number
                </label>
                    <div style="">
                        <input id="txtAddPartSearchMobileNum" name="txtAddPartSearchMobileNum"  type="tel" class="form-control" />
                   
                    
                        </div>
              </div>

                  </div>
                
                  <div class="col-sm-2">
                      <input type="button" id="btnSearchPart" name="btnSearchPart" class="btn btn-primary" value="Search" />
                  </div>
              </div>
                

                </div>
                </asp:Panel>
         
          <hr />

          <div id="findPartResults"></div>

      </div>
      <div class="modal-footer">
         
          
          <asp:Button runat="server" ID="btnAddSelected" CssClass="btn btn-primary" Text="Add Selected" OnClick="btnAddSelected_Click" OnClientClick="if( btnAddSelected_clientClick()==false){ return false; }" />
           <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelAdd" data-dismiss="modal">Cancel</a>
           
      </div>
    </div>
  </div>
</div>
    


    
<!-- Modal -->
<div class="modal fade" id="modalNewContact" tabindex="-1" role="dialog" aria-labelledby="lblModalNewcontact">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="lblModalNewcontact">Create Contact</h4>
      </div>
      <div class="modal-body">
        
          <div class="form-group">
             <label for="<%=txtFirst.ClientID %>">First Name</label>
              <asp:TextBox runat="server" ID="txtFirst" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
             <label for="<%=txtLast.ClientID %>">Last Name</label>
              <asp:TextBox runat="server" ID="txtLast" CssClass="form-control"></asp:TextBox>
            </div>

             <div class="form-group">
                <label for="txtMobileNum" class="control-label">Mobile Number
                </label>
                    <div style="">
            <asp:TextBox runat="server" ID="txtMobileNum" CssClass="form-control" type="tel" ClientIDMode="Static"></asp:TextBox>
                    <asp:HiddenField runat="server" ID="hfCountry" />
                    
                        </div>
              </div>

         <div class="form-group">
        <label>Add to Lists <small>(<a href="javascript:void(0);" id="btnCheckAllLists">Check All</a> | <a href="javascript:void(0);" id="btnCheckNoLists">Check None</a>)</small></label>
    </div>
    <div class="form-group">
     <div class="checkboxlist">
        <asp:CheckBoxList ID="cblLists" runat="server" CssClass="entrycheckbox"></asp:CheckBoxList>
     </div>
        </div>
                    <div>
                        
                         <p class="help-block"><asp:CheckBox runat="server" ID="chkSMSOptIn" /> I have permission to send SMS text messages to this number. (<a href="https://www.waiverfile.com/Policies/Messaging-Policy.aspx" target="_blank">Messaging policy <i class="fa fa-external-link"></i></a>)
                   
                    </p>
                     </div>

          <div id="divErrSMS" style="color:red; display:none; ">Please check the box indicating you have permission to send SMS messages to this number</div>
             <asp:Panel runat="server" ID="pnlGetSMS">

                 <div class="WPERR_Validation">In order to send SMS text messages, you need to have a texting plan. <a href="../SMS/GetStarted.aspx" target="_blank">Learn More <i class="fa fa-external-link"></i></a></div>


             </asp:Panel>

          


      </div>
      <div class="modal-footer">
         <asp:Button runat="server" ID="btnSaveNewContact" CssClass="btn btn-primary" Text="Save" OnClick="btnSaveNewContact_Click" OnClientClick="if(btnSaveNewContact_onclientclick()==false){ return false; } " />
           <a href="javascript:void(0);" class="btn btn-muted" id="btnCancelAdd2" data-dismiss="modal">Cancel</a>
           
      </div>
    </div>
  </div>
</div>




</asp:Content>
