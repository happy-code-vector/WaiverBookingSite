<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecentImageReview.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.RecentImageReview" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Malicious Use Check
</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>
        <div class="form-group">
            <label>Cutoff Date</label>
             <telerik:RadDatePicker ID="dtDateStart" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
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
        <asp:Button runat="server" ID="btnUpdate" Text="Update" />
     
        <asp:PlaceHolder ID="phOut0" runat="server"></asp:PlaceHolder>

        <asp:PlaceHolder ID="phOut" runat="server"></asp:PlaceHolder>

    </div><!-- /.box-body -->
    <div class="box-footer">
     
    </div>
</div>
