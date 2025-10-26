<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SendTrialExpiredMessages.aspx.cs" Inherits="WaiverFile.site.admin.SMS.SendTrialExpiredMessages" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">

    <script type="text/javascript">

        function showHideSendTime() {
            if ($('#<%=rbSendRecent.ClientID%>').is(':checked')) {
                $('#divCutoffDate').show();
            } else {
                $('#divCutoffDate').hide();
            }
        }
        $(function () {
            showHideSendTime();

            $('.rblSend').each(function () {
                $(this).click(function () { showHideSendTime(); });
                $(this).change(function () { showHideSendTime(); });
            });

        });

    </script>
    
    <h3>Send Paused Messages</h3>
    
    <p>The messages below have not been sent because your trial or subscription was expired. Choose which ones you wish to send now or cancel sending.</p>

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    <div class="form-group">
        <asp:RadioButton runat="server" GroupName="rblSend" ID="rbSendAll" Text="Send All" CssClass="rblSend" /> 
        <br />
        <asp:RadioButton runat="server" GroupName="rblSend" ID="rbCancelAll" Text="Cancel All" CssClass="rblSend" /> 
        <br />
        <asp:RadioButton runat="server" GroupName="rblSend" ID="rbSendRecent" Text="Send Recent" CssClass="rblSend" /> 
        <br />
    </div>

    <div class="form-group" id="divCutoffDate">
        <label>Cutoff Date</label>
         <telerik:RadDateTimePicker ID="dtCutoff" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap" TimeView-Caption="" Calendar-CalendarCaption="" Width="100%">
                <TimePopupButton ImageUrl="" HoverImageUrl=""></TimePopupButton>
                <Calendar runat="server" ShowRowHeaders="false" Skin="Bootstrap"></Calendar>
                <TimeView runat="server" CellSpacing="-1" Interval="00:30:00"></TimeView>
                <DateInput CssClass="form-control" LabelWidth="40%">
                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                    <FocusedStyle Resize="None"></FocusedStyle>
                    <DisabledStyle Resize="None"></DisabledStyle>
                    <InvalidStyle Resize="None"></InvalidStyle>
                    <HoveredStyle Resize="None"></HoveredStyle>
                    <EnabledStyle Resize="None"></EnabledStyle>
                </DateInput>
                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
              
            </telerik:RadDateTimePicker>
        <p class="help-block">Any messages scheduled to send on or after this date-time will be sent now. Older messages will be cancelled. Usage will be applied to your current billing period.</p>
    </div>
    <div class="form-group">
        <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
    </div>



<telerik:RadGrid ID="RadGrid1" runat="server" Skin="Bootstrap" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True">
    <groupingsettings casesensitive="False" />
    <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="ID">
        
        <Columns>

                         
                         <telerik:GridBoundColumn DataField="sendDate" FilterControlAltText="Filter SendDate column" HeaderText="Send Date" SortExpression="sendDate" UniqueName="sendDate"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="messageText" FilterControlAltText="Filter MessageText column" HeaderText="Message Text" SortExpression="messageText" UniqueName="messageText"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="status" UniqueName="status"></telerik:GridBoundColumn>

                         
                         <telerik:GridBoundColumn DataField="numRecipients" FilterControlAltText="Filter NumRecipients column" HeaderText="Recipients" SortExpression="numRecipients" UniqueName="numRecipients"></telerik:GridBoundColumn>

                         
                        <telerik:GridHyperLinkColumn AllowSorting="False" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="ViewSMS.aspx?id={0}" FilterControlAltText="Filter column1 column" HeaderText="View" Text="View" UniqueName="viewCol" AllowFiltering="False">
                        </telerik:GridHyperLinkColumn>
                         
            
        </Columns>
    </MasterTableView>
</telerik:RadGrid>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WaiverFileDB %>"  ProviderName="System.Data.SqlClient" SelectCommand="    select m.ID, SendDate, m.status, MessageText, NumRecipients from tblWFSMSMessage m
where m.SiteID=@siteid and m.status=97
order by SendDate desc">
                  </asp:SqlDataSource>



</asp:Content>
