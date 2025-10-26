<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Public.Master" AutoEventWireup="true" CodeBehind="SearchMan.aspx.cs" Inherits="WaiverFile.site.Manager.SearchMan" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph1" runat="server">

    <script type="text/javascript">
        function resetForm() {
            var inputs = document.getElementsByTagName('input');
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == 'text')
                    inputs[i].value = "";
            }
        }
        String.prototype.replaceAll = function (search, replacement) {
            var target = this;
            return target.split(search).join(replacement);
        };
        function showHideDates() {
            if ($('#<%=cboDateRange.ClientID%>').val() == 'Custom_range') {
                 $('.choosedates').each(function () { $(this).show(); });
             } else {
                 $('.choosedates').each(function () { $(this).hide(); });
             }
         }
        $(document).ready(function () {
            showHideDates();
            $('#<%=cboDateRange.ClientID%>').change(function () { showHideDates(); })
            $('.show_part').click(function () {
                var recordnum = $(this).data('recordnum');

                var thediv = $(this).parent().find("[data-recordnum='" + recordnum + "']");
                $(this).parent().find(".part_num").hide();
                var txt = $(this).data('names');

                var a = txt.split('|'),
                    i;

                var txtOut = '';
                var currName = '';
                var dob = '';
                var currAgedOut = false;
                var currIsSignee = false;
                var partAge = '';
                for (i = 0; i < a.length; i++) {
                    if (i % 8 == 0) {
                        currName = a[i];
                    } else if (i % 8 == 1) {
                        dob = a[i];
                    } else if (i % 8 == 2) {
                        currAgedOut = a[i] == '1';
                    }
                    else if (i % 8 == 3) {

                        partAge = a[i];

                        if (partAge == '0') { partAge = ''; } else {
                            var ageOut = ' (';
                        <%if (includePartAge)
                             {
         %>   ageOut += partAge;  <%
                             }
                          %>
                    <%if (includePartAge && includePartDOB)
                             {
         %>   ageOut += ', '; <%
                             }
                          %>
                    <%if (includePartDOB)
                             {
         %>    ageOut += a[i - 2]; <%
                             }
                          %>
                             ageOut += ')';
                             partAge = ageOut;

                         }
                     } else if (i % 8 == 4) {
                         currIsSignee = a[i] == '1';


                         if (currAgedOut == true && currIsSignee != true) {
                             txtOut += '<span class="text-danger">' + currName + ' <br/><small>(Old enough to sign own waiver)</small></span>';
                         } else {
                             txtOut += currName;
                         }
                         txtOut += partAge;
                         txtOut += '<br/>';
                     }
                 }


                 thediv.html(txtOut);
                 thediv.fadeIn();
                 $(this).hide();
             });
        });


    </script>
 
    <div class="pull-right">
        <a href="Default.aspx" class="btn btn-default">Back to List</a>
        &nbsp;
      <a href="/MyAccount/" target="_blank" class="btn btn-default">
      <i class="fa fa-cog"> </i> Account Settings</a>
    <asp:LinkButton runat="server" ID="btnLogOut" CssClass="btn btn-default" OnClick="btnLogOut_Click">
    <i class="fa fa-sign-out"> </i> Log Out
    </asp:LinkButton>
</div>
      
      <h1>Search</h1>
    <p><asp:Label runat="server" ID="lblEventOrStep" Font-Bold="true"></asp:Label></p>
    <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

    <div class="row">
     <div class="col-sm-6">
        <label for="<%=txtTerms.ClientID %>">Terms</label>
        <asp:TextBox runat="server" ID="txtTerms" CssClass="form-control"></asp:TextBox>
    </div>

  <div class="col-sm-6"><div class="form-group">
        <label>Date Range</label>
        <asp:DropDownList runat="server" ID="cboDateRange" CssClass="form-control">
        </asp:DropDownList>
    </div>

        
        <div class="row">
     <div class="col-sm-6">
            <div class="form-group choosedates">
                <label for="<%=dtStart.ClientID %>">Start Date</label><telerik:RadDatePicker ID="dtStart" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
                            <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
               
                            <DateInput CssClass="form-control"   LabelWidth="40%">
                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                <FocusedStyle Resize="None"></FocusedStyle>
                                <DisabledStyle Resize="None"></DisabledStyle>
                                <InvalidStyle Resize="None"></InvalidStyle>
                                <HoveredStyle Resize="None"></HoveredStyle>
                                <EnabledStyle Resize="None"></EnabledStyle>
                            </DateInput>
                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
               
                        </telerik:RadDatePicker>
            </div>
                 </div>
                 <div class="col-sm-6">
               <div class="form-group choosedates">
                   <label for="<%=dtEnd.ClientID %>">End Date</label><telerik:RadDatePicker ID="dtEnd" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
                            <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
               
                            <DateInput CssClass="form-control"   LabelWidth="40%">
                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                <FocusedStyle Resize="None"></FocusedStyle>
                                <DisabledStyle Resize="None"></DisabledStyle>
                                <InvalidStyle Resize="None"></InvalidStyle>
                                <HoveredStyle Resize="None"></HoveredStyle>
                                <EnabledStyle Resize="None"></EnabledStyle>
                            </DateInput>
                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
        
                        </telerik:RadDatePicker>
               </div>
                </div>
    </div>
            </div>
             </div>  




<div class="row">
    



   


</div>

    <div class="row">
         <div class="col-sm-6">
         <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
        <input type="reset" value="Clear" class="btn btn-default" onclick="resetForm();return false;" />
    </div>
    </div>



<asp:PlaceHolder ID="phResults" runat="server"></asp:PlaceHolder>


</asp:Content>
