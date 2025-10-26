<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="EditCampaignSchedule.aspx.cs" Inherits="WaiverFile.site.admin.SMS.EditCampaignSchedule" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        /*BEGIN PREVIEW*/
        .panel{
            width: 100%;
            border: 1px #A0A0A0 solid;
        }
        #chars{ margin-top: 3px; margin-left: 3px; }
        .icon{
            height: 70px;
            padding-top:23px;
    
        }
        #contact{
            width: 50px;
            height: 50px;
            margin:auto;
            padding:7px 8px 7px 8px;
            background-color :#A4A4A4;
            border-radius: 25px 25px 25px 25px;
        }

        .glyphicon-info-sign, .glyphicon-chevron-left{
            font-size: 25px;
            color: #37A7FD;
        }
        .glyphicon-user{
            font-size: 35px;
            color: #FFFFFF;
        }

        .panel-body{
            height :250px;   
            overflow-y: scroll;
        }

        .date{
            color: #A4A4A4;
            text-align: center;
            margin-bottom: 5px;
        }

        .bold{
            font-weight: bold;
        }


        .message{
            font-size: 1.2em;
            width: auto;
           margin-right:10px;
            border-radius: 15px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .message-in {
            background-color: #E5E5EA;
            margin-left: 20px;

        }
        .message-out{
            background-color : #22D351;
            margin-right: 20px;margin-left: 20px;
            color: #FFFFFF;
        }

        .glyphicon-send, .glyphicon-camera{
            color: #ffffff;
        }
        /*END PREVIEW*/

         .input-controls-container {
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
            color: #555;
            display: block;
            font-size: 14px;
            padding: 0;
            transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
            width: 100%;
        }
         .input-controls-container .form-control {
            border: 0;
            height: 32px;
        }
         .input-controls-container.expand .form-control {
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
            height: auto;
        }
         .input-controls-container .input-controls {
            display: none;
            text-align: right;
            padding: 0;
            border-top: 1px solid #dfdfdf;
        }
         .input-controls-container.expand .input-controls {
            display: block;
        }
         .input-controls-container .input-controls .btn-link {
            padding: 2px 10px 0;
            color: #555;
            text-decoration: none;
        }
         .input-controls-container .input-controls .btn-link:hover {
            color: #111;
        }
         .input-controls .dropdown{ display: inline-block; }

         .input-controls .btngrouping{ width: 100%; padding: 5px; }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph0" runat="server">
    
<script type="text/javascript">



    function showHideCampaignDate() {
        if ($('#<%=rblDateModeDATE.ClientID%>').is(':checked')) {
            $('#divStartDate').show();
        } else {
            $('#divStartDate').hide();
        }
    }

    $(function () {
        showHideCampaignDate();
        //DATE
        $('.rblDateMode').change(function () {
            showHideCampaignDate();
        });

        //prepopulate message
        var previewText = '<%=msgTextEscaped %>';
        var regExBracketSearch = /\{\{(.+?(?=\}\}))\}\}/g; //GET EVERYTHING INSIDE {{ }}
        var matches;
        var counter = 0;
        while (counter < 100 && (matches = regExBracketSearch.exec(previewText)) !== null) {
            counter++;

            if (matches != null && matches.length > 1) {
                var inner = matches[1];
                var outer = matches[0];
                var replaceCode = '';
                switch (inner) {
                    case "FIRSTNAME":
                        replaceCode = 'John';
                        break;
                    case "LASTNAME":
                        replaceCode = 'Smith';
                        break;
                    case "PARTICIPANT_FIRST":
                        replaceCode = 'Jason';
                        break;
                    case "PARTICIPANT_LAST":
                        replaceCode = 'Smith';
                        break;
                    case "PARTICIPANT_NAMES":
                        replaceCode = 'Jason Smith, Jane Smith';
                        break;

                    case "EMAIL":
                        replaceCode = 'johnsmith@gmail.com';
                        break;
                    case "MOBILENUM":
                        replaceCode = '212-555-2368';
                        break;


                }
                if (inner.startsWith("SHORTURL:")) {
                    replaceCode = '<a href="#" onclick="alert(\'This is a mockup link. The real short link will be created when you save\');">http://wfl.ink/****</a>';
                }

                previewText = previewText.replace(outer, replaceCode);

            }
        }
        $('#msgPreview').html(previewText);

    });


</script>
    

    <asp:PlaceHolder runat="server" ID="phErr"></asp:PlaceHolder>
    
    <asp:Panel runat="server" id="pnlMain">
    <h3>Schedule to Send - <asp:Label runat="server" ID="lblName"></asp:Label></h3>
        
        <div class="row">
            <div class="col-md-4 col-sm-6">
                  
                <div id="smspreview">
                    <label>Preview</label>    
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="icon"><span class="glyphicon glyphicon-chevron-left"></span></div>
                                </div>
                                <div class="col-md-offset-3 col-md-2">
                                    <div id="contact"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                                    Preview
                                </div>
                                <div class="col-md-offset-3 col-md-2">
                                    <div class="icon"><span class="glyphicon glyphicon-info-sign"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="date">
                                <span class="bold">Today</span> <%=site.ConvertTimeFromUTC(DateTime.UtcNow).ToString("hh:mm") %>
                            </div>
                            <div class="row">
                                <div class="message message-in pull-left">
                                    <span id="msgPreview">
                                        
                                    </span>
                                </div>
                            </div>
            
                        </div>
       
                    </div>
    
   
    
                </div>
            </div>
        </div>
        
        <div class="row">

        <div class="col-xs-12">
        <asp:PlaceHolder runat="server" ID="phNumRecipients"></asp:PlaceHolder>
        </div>
        </div>

     <div class="row">
                    <div class="col-sm-6">
                         
                           <asp:Panel runat="server" ID="pnlGetSMS" Visible="false">
                             <div class="WPERR_Information">While using the SMS DEMO, we will send a single sample message to your test number so you can see how it works.</div>
                            </asp:Panel>
                    <div class="form-group">
                        <label>When to Send</label><br/>
                        <asp:RadioButton runat="server" GroupName="rblDateMode" ID="rblDateModeNOW" CssClass="rblDateMode" Text=" Now"/> &nbsp; 
                        <asp:RadioButton runat="server" GroupName="rblDateMode" ID="rblDateModeDATE" CssClass="rblDateMode" Text=" Select a Date"/>  &nbsp; 
                        <asp:RadioButton runat="server" GroupName="rblDateMode" ID="rblDateModeDRAFT" CssClass="rblDateMode" Text=" Save as Draft"/> 

                        
                    </div>

                     <div class="form-group" id="divStartDate">
                         
                           <div class="form-group">
                           
                            <telerik:RadDateTimePicker ID="dtSendDate" DateInput-CssClass="form-control" runat="server" Skin="Bootstrap" TimeView-Caption="" Calendar-CalendarCaption="" Width="100%">
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
                        </div>
                           
                    </div>
                    </div>
                    
                </div>
    
             
        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Next" OnClick="btnSave_OnClick" />


    </asp:Panel>

</asp:Content>
