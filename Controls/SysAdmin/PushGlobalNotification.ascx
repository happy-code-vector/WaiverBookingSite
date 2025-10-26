<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PushGlobalNotification.ascx.cs" Inherits="WaiverFile.Controls.SysAdmin.PushGlobalNotification" %>
        <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="box box-primary">
   
    <div class="box-body">

<p>Use this form to send a notification to the dashboard of all sites. </p>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<div class="form-group">
    <label>Sites</label>
    <asp:DropDownList ID="cboSites" runat="server" CssClass="form-control">
        <asp:ListItem Value=""> -- Select --</asp:ListItem>
        <asp:ListItem Value="ALL_ACTIVE">All Active Sites</asp:ListItem>
        <asp:ListItem Value="ALL">All Sites</asp:ListItem>
    </asp:DropDownList>
</div>

<div class="form-group">
    <label>Minimum Role</label>
    <asp:DropDownList ID="cboRole" runat="server" CssClass="form-control">

    </asp:DropDownList>
</div>

<div class="form-group">
    <label>Notification Type</label>
    <asp:DropDownList ID="cboNotificationType" runat="server" CssClass="form-control"></asp:DropDownList>
</div>

<div class="form-group">
    <asp:CheckBox runat="server" ID="chkSharedReadStatus" Text="Shared Read Status" />
    <p class="help-block">When checked, one user in a site marking it as read will mark it as read for all. If not checked, each person will track their read status individually.</p>
</div>

<div class="form-group">
    <label>Title</label>
    <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control"></asp:TextBox>
</div>

<div class="form-group">
    <label>URL</label>
    <asp:TextBox runat="server" ID="txtURL" CssClass="form-control"></asp:TextBox>
</div>

<div class="form-group">
    <label>Related ID</label>
    <asp:TextBox runat="server" ID="txtRelatedID" CssClass="form-control"></asp:TextBox>
    <p class="help-block">Guid format, leave blank if not applicable</p>
</div>

<div class="form-group">
    <label>Delete After</label>

  <telerik:RadDatePicker ID="dtDeleteAfter" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap"  Calendar-CalendarCaption="" Width="100%">
              
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


<div class="form-group">
    <label>Details</label>
</div>

<div class="form-group">
 <telerik:RadEditor id="RadEditor1" 
        width="100%" height="440px" runat="server" enableresize="True" allowscripts="True"  
        toolsfile="/wp-content/Common/WPStandardTools.xml"
        spellchecksettings-dictionarypath="/wp-content/Common/radspell/" 
        imagemanager-viewpaths="/images"  
        imagemanager-uploadpaths="/images">
        <documentmanager viewpaths="/documents" uploadpaths="/documents" deletepaths="/documents" />



        </telerik:RadEditor>
    </div>

<div class="form-group">
    <label>Type YES to proceed</label>
    <asp:TextBox runat="server" ID="txtYes" CssClass="form-control"></asp:TextBox>
    <p class="help-block">This sends out a lot of messages, so just to make sure you are very much ready, type the word YES in the box. </p>
</div>

<asp:Button runat="server" ID="btnSend" Text="Send" CssClass="btn btn-primary" OnClick="btnSend_Click" />
    </div><!-- /.box-body -->
    
</div>



