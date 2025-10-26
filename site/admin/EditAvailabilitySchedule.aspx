<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditAvailabilitySchedule.aspx.cs" Inherits="WaiverFile.site.admin.EditAvailabilitySchedule" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    
             

            <div class="form-horizontal" role="form">
                <h3>Availability Schedule</h3>
                <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
               
                <asp:Panel runat="server" ID="pnlMain">
               
                 <div class="form-group">
                      <label for="<%=txtName.ClientID %>">Name</label><asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
               
                <div class="form-group">
                     <label for="<%=cboMode.ClientID %>">Mode</label><asp:DropDownList ID="cboMode" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboMode_SelectedIndexChanged"></asp:DropDownList>
                </div>
               
                   

                 <div class="form-group">
                     <label for="<%=txtMaxPartsPerDay.ClientID %>">Max Participants Per Day</label><asp:TextBox ID="txtMaxPartsPerDay" CssClass="form-control" runat="server" style="width: 100px;" ></asp:TextBox>
                </div>

              
                <asp:Panel runat="server" ID="pnlManualOnlyFields">
                     <div class="form-group">
                         <label for="<%=txtMaxPartsPerSlot.ClientID %>">Max Participants Per Slot</label><asp:TextBox ID="txtMaxPartsPerSlot" CssClass="form-control" runat="server" style="width: 100px;" ></asp:TextBox>
                    </div>


                    <div class="form-group"><h4>Availability Slots <asp:Button runat="server" ID="btnAddSlot" CssClass="btn btn-default btn-sm" OnClick="btnAddSlot_Click" Text="Add" /> </h4></div>
                    <div class="form-group">
<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap"  AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCommand="RadGrid1_ItemCommand" OnDeleteCommand="RadGrid1_DeleteCommand" DataSourceID="SqlDataSource1" AllowFilteringByColumn="false" AllowPaging="false" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                    <telerik:GridTemplateColumn HeaderText="Start Time" UniqueName="startTime">
    <ItemTemplate>
        <%# DateTime.Today.Add((TimeSpan)Eval("startTime")).ToString("hh:mm tt") %>
    </ItemTemplate>
</telerik:GridTemplateColumn>

<telerik:GridTemplateColumn HeaderText="End Time" UniqueName="endTime">
    <ItemTemplate>
        <%# DateTime.Today.Add((TimeSpan)Eval("endTime")).ToString("hh:mm tt") %>
    </ItemTemplate>
</telerik:GridTemplateColumn>
    

                         <telerik:GridBoundColumn DataField="AvailableDaysSummary" FilterControlAltText="Filter Days column" HeaderText="Days" SortExpression="Days" UniqueName="Days"></telerik:GridBoundColumn>
             
              <telerik:GridTemplateColumn HeaderText="Max Participants" UniqueName="maxParts">
    <ItemTemplate>
        <%# Convert.ToInt32(Eval("maxParts")) == -1 ? "" : Eval("maxParts").ToString() %>
    </ItemTemplate>
</telerik:GridTemplateColumn>

                         
                         
                        
                        <telerik:GridButtonColumn CommandName="EDIT" FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol"></telerik:GridButtonColumn> 
                        <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

</div>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="SELECT *,
     CASE
        WHEN Monday = 1 AND Tuesday = 1 AND Wednesday = 1 AND Thursday = 1 AND Friday = 1 AND Saturday = 1 AND Sunday = 1 THEN 'All Days'
        WHEN Monday = 1 AND Tuesday = 1 AND Wednesday = 1 AND Thursday = 1 AND Friday = 1 AND Saturday = 0 AND Sunday = 0 THEN 'Weekdays'
        WHEN Monday = 0 AND Tuesday = 0 AND Wednesday = 0 AND Thursday = 0 AND Friday = 0 AND Saturday = 1 AND Sunday = 1 THEN 'Weekends'
        ELSE
            STUFF( 
                CONCAT(
                    CASE WHEN Monday = 1 THEN ', Monday' ELSE '' END,
                    CASE WHEN Tuesday = 1 THEN ', Tuesday' ELSE '' END,
                    CASE WHEN Wednesday = 1 THEN ', Wednesday' ELSE '' END,
                    CASE WHEN Thursday = 1 THEN ', Thursday' ELSE '' END,
                    CASE WHEN Friday = 1 THEN ', Friday' ELSE '' END,
                    CASE WHEN Saturday = 1 THEN ', Saturday' ELSE '' END,
                    CASE WHEN Sunday = 1 THEN ', Sunday' ELSE '' END
                ),
                1, 2, '' 
            )
    END AS AvailableDaysSummary
FROM tblWFAvailabilitySlot where scheduleID=@scheduleID ">
                  </asp:SqlDataSource>
                         




                </asp:Panel>

                    

                <asp:Panel runat="server" ID="pnlAllDayFields">
                    <!-- only show these fields when in all-day mode -->
                    
                  <div class="form-group" style="margin-bottom:0;">  <label>Days of the Week</label></div>

             <div class="form-group">
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkMonday" runat="server" /> Monday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkTuesday" runat="server" /> Tuesday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkWednesday" runat="server" /> Wednesday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkThursday" runat="server" /> Thursday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkFriday" runat="server" /> Friday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkSaturday" runat="server" /> Saturday
        </label>
    </div>
    <div class="checkbox-inline">
        <label>
            <asp:CheckBox ID="chkSunday" runat="server" /> Sunday
        </label>
    </div>
</div>


                </asp:Panel>


                    <div class="form-group"><h4>Blackout Dates <asp:Button runat="server" ID="btnAddBlackoutDate" CssClass="btn btn-default btn-sm" OnClick="btnAddBlackoutDate_Click" Text="Add" /> </h4></div>
  <div class="form-group">
<telerik:RadGrid ID="RadGrid2" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid2_ItemDataBound" OnItemCommand="RadGrid2_ItemCommand" OnDeleteCommand="RadGrid2_DeleteCommand" DataSourceID="SqlDataSource2" AllowFilteringByColumn="false" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource2" DataKeyNames="ID">
        
        <Columns>

                         <telerik:GridBoundColumn DataField="startDate" FilterControlAltText="Filter StartDate column" HeaderText="Start" SortExpression="startDate" UniqueName="startDate"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="endDate" FilterControlAltText="Filter EndDate column" HeaderText="End" SortExpression="endDate" UniqueName="endDate"></telerik:GridBoundColumn>

                         
                         
                        <telerik:GridButtonColumn CommandName="EDIT"  FilterControlAltText="Filter column1 column" HeaderText="Edit" Text="Edit" UniqueName="editcol"></telerik:GridButtonColumn>
                         <telerik:GridButtonColumn CommandName="DELETE" ConfirmText="Are you sure you wish to delete this item?" FilterControlAltText="Filter column1 column" HeaderText="Delete" Text="Delete" UniqueName="column1"></telerik:GridButtonColumn>
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

      </div>


<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from tblWFBlackoutDate b inner join tblWFBlackoutDateAvailabilitySchedule s on s.blackoutID=b.id where scheduleid=@scheduleid and status=@activeStatus">
                  </asp:SqlDataSource>
                         
                
                <div class="form-group"> 
               <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />
                    </div>
                    </asp:Panel>

            </div>

            

</asp:Content>
