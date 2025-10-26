<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditTimeRule.aspx.cs" Inherits="WaiverFile.site.admin.EditTimeRule" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
 .checkbox-list {
    list-style-type: none;
    padding: 0; 
    margin: 0; 
    display: flex; 
    flex-wrap: wrap; 
    gap: 10px; 
}

.checkbox-list li {
    display: inline-flex;
    align-items: center; 
    margin: 0 2px;    
}

.checkbox-list input[type="checkbox"] {
    margin-right: 5px; 
    margin-bottom: 10px; 
}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    
    <script type="text/javascript">

        function showHideTimeLimitDivs() {
            if ($('#<%=chkLimitByDayOfYear.ClientID%>').is(':checked')) {
                $('#limitByDayOfYear').show();
            } else {
                $('#limitByDayOfYear').hide();
            }

            if ($('#<%=chkLimitByTimeOfDay.ClientID%>').is(':checked')) {
                $('#limitByTimeOfDay').show();
            } else {
                $('#limitByTimeOfDay').hide();
            }
        }
        function showHideCutoffValue() {
            if ($('#<%=cboSaleCutoffMode.ClientID%>').val() == 'Never') {
                $('#<%=txtSaleCutoffValue.ClientID%>').hide();
            } else {
                $('#<%=txtSaleCutoffValue.ClientID%>').show();
            }
        }
        $(function () {

            showHideTimeLimitDivs();
            showHideCutoffValue();

            $('#<%=chkLimitByDayOfYear.ClientID%>').click(showHideTimeLimitDivs);
            $('#<%=chkLimitByTimeOfDay.ClientID%>').click(showHideTimeLimitDivs);

            $('#<%=cboSaleCutoffMode.ClientID%>').change(showHideCutoffValue);

        });
    </script>
           
            <div class="form-horizontal" role="form">
                <h3>Time Rule</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Days of the Week</label>
               
                   <asp:CheckBoxList runat="server" ID="cblDaysOfWeek" RepeatLayout="UnorderedList"  CssClass="checkbox-list">
                       <asp:ListItem Value="Monday">Monday</asp:ListItem>
                       <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                       <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                       <asp:ListItem Value="Thursday">Thursday</asp:ListItem>
                       <asp:ListItem Value="Friday">Friday</asp:ListItem>
                       <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                       <asp:ListItem Value="Sunday">Sunday</asp:ListItem>
                   </asp:CheckBoxList>
                </div>
                <div class="form-group">
                    <label>Sale Cut-off Mode</label>
                    <div class="form-inline">
                        
                        <asp:DropDownList runat="server" CssClass="form-control" ID="cboSaleCutoffMode"></asp:DropDownList>
                        <asp:TextBox runat="server" ID="txtSaleCutoffValue" CssClass="form-control" placeholder="How many?" Width="120"></asp:TextBox>
                        </div>
                </div>
                   <div class="form-group">
                      <label for="<%=txtMaxHeadcount.ClientID %>">Max Headcount</label>
                       <div class="form-inline">
                       <asp:TextBox ID="txtMaxHeadcount" CssClass="form-control" runat="server"></asp:TextBox>
                           </div>
                </div>
                <hr />
                 <h4><asp:CheckBox runat="server" id="chkLimitByTimeOfDay" /> Limit by Time of Day</h4>
                
                <div id="limitByTimeOfDay" style="display:none;">
                 <div style="float: left;margin-right:20px;">
                   <div class="">
                        <label for="TimePicker">Start</label>
                        <div class="form-inline">
                        <telerik:RadTimePicker ID="tpStart" runat="server" Width="150px" SelectedTime="00:00:00" Skin="Bootstrap">
                        </telerik:RadTimePicker>
                            </div>
                    </div>
                     </div>

                 <div style="float: left;">
                <div class="">
                 <label for="TimePicker">End</label>
                     <div class="form-inline">
                 <telerik:RadTimePicker ID="tpEnd" runat="server" Width="150px" SelectedTime="00:00:00" Skin="Bootstrap">
                 </telerik:RadTimePicker>
                         </div>
                    </div>
                     </div>


             </div>
                <div style="clear:both; "></div>
                <hr />
                <h4><asp:CheckBox runat="server" id="chkLimitByDayOfYear" /> Limit by Day of Year</h4>

                <div id="limitByDayOfYear" style="display:none; ">
                <div style="float: left;margin-right:20px;">
                  
                        <div class="">
                            <label for="<%=cboStartDay.ClientID %>">Start Day</label>
                            <div class="form-inline">
                                <asp:DropDownList runat="server" ID="cboStartMonth" CssClass="form-control"></asp:DropDownList>
                                <asp:DropDownList runat="server" ID="cboStartDay" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                    
                </div>
                  <div style="float: left;">
                
                    <div class="">
                        <label for="<%=cboStartDay.ClientID %>">End Day</label>
                        <div class="form-inline">
                            <asp:DropDownList runat="server" ID="cboEndMonth" CssClass="form-control"></asp:DropDownList>
                            <asp:DropDownList runat="server" ID="cboEndDay" CssClass="form-control"></asp:DropDownList>

                        </div>
                    </div>
                </div>
                    </div>


               <div style="clear:both; "></div>
 <hr />



                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default" Text="Save" onclick="btnSave_Click" />
            </div>

    
  



</asp:Content>
