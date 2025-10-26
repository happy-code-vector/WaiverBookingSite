<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditSeason.aspx.cs" Inherits="WaiverFile.site.admin.EditSeason" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

  
<script>
    function validateSeasonDates() {
        const startMonth = parseInt($('#<%= cboStartMonth.ClientID %>').val());
        const startDay = parseInt($('#<%= cboStartDay.ClientID %>').val()) || 1;
        const endMonth = parseInt($('#<%= cboEndMonth.ClientID %>').val());
        const endDay = parseInt($('#<%= cboEndDay.ClientID %>').val()) || 1;

        const startDate = new Date(1900, startMonth - 1, startDay);
        const endDate = new Date(1900, endMonth - 1, endDay);

        if (endDate < startDate) {
            $('#seasonWarning').show();
        } else {
            $('#seasonWarning').hide();
        }
    }

    $(function () {
        $('#<%= cboStartMonth.ClientID %>, #<%= cboStartDay.ClientID %>, #<%= cboEndMonth.ClientID %>, #<%= cboEndDay.ClientID %>').on('change', validateSeasonDates);
    });
</script>



                
                <h3>Season</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                 <div class="form-group">
                     <label for="<%=cboStatus.ClientID %>">Status</label>
                     <asp:DropDownList ID="cboStatus" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
               
      <label for="<%=cboStartMonth.ClientID %>">Start Date: </label>
                 <div class="form-group form-inline">
                       <asp:DropDownList ID="cboStartMonth" CssClass="form-control" runat="server">
                             <asp:ListItem Value="1">1 - January</asp:ListItem>
                             <asp:ListItem Value="2">2 - February</asp:ListItem>
                             <asp:ListItem Value="3">3 - March</asp:ListItem>
                             <asp:ListItem Value="4">4 - April</asp:ListItem>
                             <asp:ListItem Value="5">5 - May</asp:ListItem>
                             <asp:ListItem Value="6">6 - June</asp:ListItem>
                             <asp:ListItem Value="7">7 - July</asp:ListItem>
                             <asp:ListItem Value="8">8 - August</asp:ListItem>
                             <asp:ListItem Value="9">9 - September</asp:ListItem>
                             <asp:ListItem Value="10">10 - October</asp:ListItem>
                             <asp:ListItem Value="11">11 - November</asp:ListItem>
                             <asp:ListItem Value="12">12 - December</asp:ListItem>
                      </asp:DropDownList>
                     <asp:DropDownList ID="cboStartDay" CssClass="form-control" runat="server">
                       
                     </asp:DropDownList>
                   
                     
                </div>
               
                    <label for="<%=cboEndMonth.ClientID %>">End Date</label>
               <div class="form-group form-inline">
                     
                        <asp:DropDownList ID="cboEndMonth" CssClass="form-control" runat="server">
                             <asp:ListItem Value="1">1 - January</asp:ListItem>
                             <asp:ListItem Value="2">2 - February</asp:ListItem>
                             <asp:ListItem Value="3">3 - March</asp:ListItem>
                             <asp:ListItem Value="4">4 - April</asp:ListItem>
                             <asp:ListItem Value="5">5 - May</asp:ListItem>
                             <asp:ListItem Value="6">6 - June</asp:ListItem>
                             <asp:ListItem Value="7">7 - July</asp:ListItem>
                             <asp:ListItem Value="8">8 - August</asp:ListItem>
                             <asp:ListItem Value="9">9 - September</asp:ListItem>
                             <asp:ListItem Value="10">10 - October</asp:ListItem>
                             <asp:ListItem Value="11">11 - November</asp:ListItem>
                             <asp:ListItem Value="12">12 - December</asp:ListItem>
                        </asp:DropDownList>
                  <asp:DropDownList ID="cboEndDay" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

    
               <div id="seasonWarning" class="WPERR_Information" style="display:none;">
                   Your end date is earlier than your start date, suggesting a season that continues into the next year. Please ensure this is correct before saving.
            </div>

               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />
    
            


</asp:Content>
