<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWaiverSiteEventSettings.ascx.cs" Inherits="WaiverFile.Controls.FormWaiverSiteEventSettings" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>     
<h3>Event Settings</h3>
 <asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<div class="row">
    <div class="col-sm-6">


          <div class="form-group">
                      <label class="control-label" for="<%=cboUpcomingEventsTemplate.ClientID %>">Upcoming Events View <cc1:WPHelpIcon  HelpText="The standard view groups events by day. Ungrouped just lists all items in order, ungrouped. Hide Events mode makes it so you have to have a direct link to an event in order to sign. Use this to keep your listing of events private." runat="server"></cc1:WPHelpIcon></label><asp:DropDownList ID="cboUpcomingEventsTemplate" CssClass="form-control" runat="server">
                          <asp:ListItem Value="Standard View.xslt">Standard View</asp:ListItem>
                          <asp:ListItem Value="Ungrouped.xslt">Ungrouped</asp:ListItem>
                          <asp:ListItem Value="Hide events - direct link only.xslt">Hide all events (direct link required to sign for events)</asp:ListItem>
                      </asp:DropDownList>
                </div>
                 <div class="form-group">
                      <label class="control-label" for="<%=cboEventCategoryMode.ClientID %>">Event Category Selection Page</label><asp:DropDownList ID="cboEventCategoryMode" CssClass="form-control" runat="server">
                          <asp:ListItem Value="FIRST">First Screen</asp:ListItem>
                          <asp:ListItem Value="SECOND">Separate Screen</asp:ListItem>
                      </asp:DropDownList>
                     <p class="help-block">Where to prompt for event categories. If you only have a few categories, the first page option works well. If you have a lot, a separate page to choose is recommended.</p>
                </div>


         <div class="form-group">
                      <label class="control-label" for="<%=cboEventCutoffMode.ClientID %>">Event Cutoff Mode</label>
                        <asp:DropDownList ID="cboEventCutoffMode" CssClass="form-control" runat="server">
                            <asp:ListItem Value="-24">24 Hours before start time</asp:ListItem>
                            <asp:ListItem Value="-12">12 Hours before start time</asp:ListItem>
                            <asp:ListItem Value="-6">6 Hours before start time</asp:ListItem>
                            <asp:ListItem Value="-1">2 Hours before start time</asp:ListItem>
                            <asp:ListItem Value="START">At start time</asp:ListItem>
                            <asp:ListItem Value="END">At end time</asp:ListItem>
                            <asp:ListItem Value="2">2 Hours after end time</asp:ListItem>
                            <asp:ListItem Value="3">4 hours after end time</asp:ListItem>
                            <asp:ListItem Value="6">6 hours after end time</asp:ListItem>
                            <asp:ListItem Value="12">12 hours after end time</asp:ListItem>
                            <asp:ListItem Value="24">24 hours after end time</asp:ListItem>
                            <asp:ListItem Value="NEVER">Never (Signing disabled when event is deleted)</asp:ListItem>
                      </asp:DropDownList>
                     <p class="help-block">Choose when signing for events should be stopped. Once the cutoff has been reached, no new waivers will be collected for that event, even when using a direct link. Override individual events by enabling the Manual Cutoff Date option.</p>
                </div>


                 <div class="form-group">
                      <label class="control-label" for="<%=txtHoursBack.ClientID %>">Event Hide Delay (Hours)</label><asp:TextBox ID="txtHoursBack" CssClass="form-control" runat="server"></asp:TextBox>
                     <p class="help-block">How long should events remain on the upcoming events screen after their end time?</p>
                </div>

                <div class="form-group">
                      <label class="control-label" for="<%=txtEventsMaxInitial.ClientID %>">Maximum events to load initially <cc1:WPHelpIcon runat="server" HelpText="The maximum number of events to be loaded before clicking the 'Show more events' button."></cc1:WPHelpIcon></label><asp:TextBox ID="txtEventsMaxInitial" CssClass="form-control" runat="server"></asp:TextBox>
                    <p class="help-block"></p>
                </div>
                <div class="form-group">
                      <label class="control-label" for="<%=txtEventsMaxTotal.ClientID %>">Maximum events to load total <cc1:WPHelpIcon runat="server" HelpText="The maximum number of events to load after clicking the 'Show More Events' button."></cc1:WPHelpIcon></label><asp:TextBox ID="txtEventsMaxTotal" CssClass="form-control" runat="server"></asp:TextBox>
                    <p class="help-block"></p>
                </div>
                <div class="form-group">
                      <label class="control-label" for="<%=txtEventsDaysInitial.ClientID %>">Maximum days ahead to load initially <cc1:WPHelpIcon runat="server" HelpText="When specified, hides any events this many days ahead of the current day (before clicking the Show More Events button)"></cc1:WPHelpIcon></label><asp:TextBox ID="txtEventsDaysInitial" CssClass="form-control" runat="server"></asp:TextBox>
                    <p class="help-block"></p>
                </div>
                <div class="form-group">
                      <label class="control-label" for="<%=txtEventsDaysTotal.ClientID %>">Maximum days ahead to load total <cc1:WPHelpIcon runat="server" HelpText="When specified, hides any events this many days ahead of the current day (after clicking the Shore More Events Button)"></cc1:WPHelpIcon></label><asp:TextBox ID="txtEventsDaysTotal" CssClass="form-control" runat="server"></asp:TextBox>
                    <p class="help-block"></p>
                </div>
                  
                



    </div>
    <div class="col-sm-6">

           <div class="form-group">
            <asp:Button runat="server" ID="btnEventManager" Text="Event Manager View Fields" CssClass="btn btn-default" OnClick="btnEventManager_Click" />
               <p class="help-block">Choose the fields that event managers can see.</p>
        </div>
        <hr />
        <h4>Event Fields</h4>
        <p>Add extra fields to use on each event</p>

       
        <div class="form-group">
            <asp:CheckBox runat="server" ID="chkFieldLocation" Text="Location" />
        </div>
         <div class="form-group">
            <asp:CheckBox runat="server" ID="chkDescriptionPage" Text="Description Page" />
        </div>
        <div class="form-group">
            <asp:CheckBox runat="server" ID="chkFieldCutoff" Text="Manual Cutoff Date" />
            <p class="help-block">When enabled, adds an option to specify a specific cutoff date and time for an event. No more waivers will be collected for an event once the cutoff time is reached.</p>
        </div>
       
                 <div class="form-group">
            <asp:CheckBox runat="server" ID="chkFieldMaxParticipants" Text="Maximum Participants" />

            </div>
        <div class="row">
            <div class="col-sm-6">
                 <div class="form-group">
                      <label class="control-label" for="<%=txtHoursBack.ClientID %>">Maximum Participants Default Value</label>
                    <asp:TextBox ID="txtMaxParticipantsDefaultValue" CssClass="form-control" runat="server"></asp:TextBox>
                     <p class="help-block">Optional. When specified, sets as default value for new events.</p>
                </div>
            </div>
        </div>
        
       

     <hr />
    <div class="form-group">
        <h4>New event default waiver/Workflow selection</h4>
    <label>Waiver Forms:</label><br />

    <asp:CheckBoxList runat="server" ID="cblWaiverForms" RepeatLayout="UnorderedList" CssClass="list-unstyled">
    </asp:CheckBoxList> 
        
        <br />
        <label>Workflows:</label><br />

        <asp:CheckBoxList runat="server" ID="cblWorkflows" RepeatLayout="UnorderedList" CssClass="list-unstyled">
    </asp:CheckBoxList>


        <p class="help-block">The selected forms/workflows will be checked by default when creating new events.</p>

</div>




    </div>
</div>

              



<asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btnSave_Click" />