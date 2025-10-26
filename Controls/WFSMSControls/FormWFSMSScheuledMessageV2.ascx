<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWFSMSScheuledMessageV2.ascx.cs" Inherits="WaiverFile.Controls.WFSMSControls.FormWFSMSScheuledMessageV2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Waypoint" Namespace="Waypoint.Forms" TagPrefix="cc1" %>

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
           font-size: 1.1em;
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

   
        <script type="text/javascript">
            var urlRegex = /((?<=^|\s)(?:(?:[A-Za-z]{3,9}:(?:\/\/))(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9-]+\.[A-Za-z0-9-.]+)(?:(?:\/[\+~%\/.\w\-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/gi;

            function urlDetected(text) {
                var reg = new RegExp(urlRegex);//this regex is very slow with a long string passed in. 
                return reg.test(text);
                return text.indexOf('://') != -1;

            }
            function makeShortUrls(text) {
                return text.replace(urlRegex, '{{SHORTURL:$1}}');
            }

            function makeShortUrls_old(text) {
                return text.replace(urlRegex, function (url, offset, input_string) {
                    if (input_string.substring(offset - 1, offset) != ":") {
                        return '{{SHORTURL:' + url + '}}';
                    }
                    return url;
                });
            }
            var maxLength = 160;
            function splitIntoLines(input, len) {
                var i;
                var output = [];
                var lineSoFar = "";
                var temp;
                var words = input.split(' ');
                for (i = 0; i < words.length;) {
                    // check if adding this word would exceed the len
                    temp = addWordOntoLine(lineSoFar, words[i]);
                    if (temp.length > len) {
                        if (lineSoFar.length == 0) {
                            lineSoFar = temp;
                            i++;
                        }
                        output.push(lineSoFar);
                        lineSoFar = "";
                    } else {
                        lineSoFar = temp;
                        i++;
                    }
                }
                if (lineSoFar.length > 0) {
                    output.push(lineSoFar);
                }
                return (output);
            }

            function addWordOntoLine(line, word) {
                if (line.length != 0) {
                    line += " ";
                }
                return (line += word);
            }

            function calcSMSLen() {

                if (urlDetected($('#<%=txtMessage.ClientID%>').val())) {
                    $('#btnShortenLinks').show();
                } else {
                    $('#btnShortenLinks').hide();
                }

                var tempMsg = $('#<%=txtMessage.ClientID%>').val();
                var tempMsg2 = tempMsg;
                var previewText = tempMsg2;
                var regextemp = new RegExp('{{SHORTURL:.*}}');

                tempMsg = tempMsg.replace(regextemp, function (url) {
                    return "12345678901234567890";//20 chars placeholder just for length of what the url will likely be
                });

                var length = tempMsg.length;

                if (length > 0) {
                    $('#smspreview').show();

                    var regExBracketSearch = /\{\{(.+?(?=\}\}))\}\}/g; //GET EVERYTHING INSIDE {{ }}
                    var matches;
                    var counter = 0;
                    while (counter < 100 && (matches = regExBracketSearch.exec(tempMsg2)) !== null) {
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
                                //replaceCode = '<a href="#" onclick="alert(\'This is a mockup link. The real short link will be created when you save\');">http://wfl.ink/****</a>';
                                replaceCode = 'http://wfl.ink/****';
                            }

                            previewText = previewText.replace(outer, replaceCode);
                        }
                    }
                } else {
                    $('#smspreview').hide();
                }

                $('#msgPreview').html('');
                var chunks = previewText.split(' ');
                var currMsg = '';
                var numMessages = 1;
                for (var i = 0; i < chunks.length; i++) {

                    if (chunks[i].length + currMsg.length > 160) {
                        //break
                        addMsg(currMsg);
                        currMsg = chunks[i] + ' ';
                        numMessages++;
                    } else {
                        currMsg += chunks[i] + ' ';
                    }
                }
                if (currMsg != '') {
                    addMsg(currMsg);
                }

                var charsRemaining = maxLength - previewText.length;

                if (charsRemaining < 0 || numMessages > 1) {
                    $('#chars').hide();
                    $('#charwarning').show();
                } else {
                    $('#chars').show();
                    $('#charwarning').hide();
                    $('#chars').text(charsRemaining + ' remaining.');
                }

                if ($('#<%=txtMessage.ClientID%>').val().indexOf('{') != -1 && $('#<%=txtMessage.ClientID%>').val().indexOf('}') != -1) {
                    $('#charcodewarning').show();
                }
                else {
                    $('#charcodewarning').hide();
                }
            }

            //debounce the keyup on the sms length calculator
            var lastClick = 0;
            var delay = 20;

            function calcSMSLenDebounced() {
                if (lastClick >= (Date.now() - delay))
                    return;
                lastClick = Date.now();

                calcSMSLen();
            }

                $(function () {

                    $('#btnShortenLinks').click(function () {
                        $('#<%=txtMessage.ClientID%>').val(makeShortUrls($('#<%=txtMessage.ClientID %>').val()));
                        calcSMSLen();
                    });

                    calcSMSLen();
                    $('#<%=txtMessage.ClientID%>').keyup(function () {
                        calcSMSLenDebounced();

                    });

                    $('.btnAddMsg').each(function () {
                        $(this).click(function () {
                            var addonText = $(this).data('msg');
                            insertAtCaret('<%=txtMessage.ClientID%>', addonText);
                            calcSMSLen();
                        });
                    });
                });


            function addMsg(c) {
                var target = replaceAll(c, 'http://wfl.ink/****', '<a href="#" onclick="alert(\'This is a mockup link. The real short link will be created when you save\');">http://wfl.ink/****</a>');
                $('#msgPreview').append('<div class="row"><div class="message message-in pull-left"><span>' + target + "</span></div></div>");
            }
            function insertAtCaret(areaId, text) {
                var txtarea = document.getElementById(areaId);
                if (!txtarea) {
                    return;
                }

                var scrollPos = txtarea.scrollTop;
                var strPos = 0;
                var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ?
                    "ff" : (document.selection ? "ie" : false));
                if (br == "ie") {
                    txtarea.focus();
                    var range = document.selection.createRange();
                    range.moveStart('character', -txtarea.value.length);
                    strPos = range.text.length;
                } else if (br == "ff") {
                    strPos = txtarea.selectionStart;
                }

                var front = (txtarea.value).substring(0, strPos);
                var back = (txtarea.value).substring(strPos, txtarea.value.length);
                txtarea.value = front + text + back;
                strPos = strPos + text.length;
                if (br == "ie") {
                    txtarea.focus();
                    var ieRange = document.selection.createRange();
                    ieRange.moveStart('character', -txtarea.value.length);
                    ieRange.moveStart('character', strPos);
                    ieRange.moveEnd('character', 0);
                    ieRange.select();
                } else if (br == "ff") {
                    txtarea.selectionStart = strPos;
                    txtarea.selectionEnd = strPos;
                    txtarea.focus();
                }

                txtarea.scrollTop = scrollPos;
            }
        </script>


            <script type="text/javascript">

                var allFieldsJSON = <%=allFieldsJSON%>;
                function overrideFieldsByType() {
                    //leaving off here
                    //on load or when a field is selected in each tree dropdown...
                    //check the type from the json list above. if its bool, make it say checked or not checked... 
                    //bind changes to that control to update the textbox behind the scenes. 
                    //might need to render hidden fields along with it. 

                    $('.filterrow').each(function () {
                        //FIND THE DROPDOWNTREE
                        var ddt = $(this).find('.RadDropDownTree');
                        var tree = $find($(ddt).attr('id'));
                        var selectedVal = tree.get_embeddedTree().get_selectedNode().get_value();


                        for (var i = 0; i < allFieldsJSON.length; i++) {
                            for (var j = 0; j < allFieldsJSON[i]["Items"].length; j++) {

                                //CHECK FOR A BOOLEAN TYPE, AND IF FOUND, SWAP THE END USER CONTROLS 
                                if (allFieldsJSON[i]["Items"][j]["FieldName"] == selectedVal) {
                                    if (allFieldsJSON[i]["Items"][j]["DataType"] == 3) {
                                        $(this).find('.filter_str').each(function () {
                                            $(this).hide();
                                        });
                                        $(this).find('.filter_bool').each(function () {
                                            $(this).show();
                                        });
                                    } else {
                                        $(this).find('.filter_str').each(function () {
                                            $(this).show();
                                        });
                                        $(this).find('.filter_bool').each(function () {
                                            $(this).hide();
                                        });
                                    }
                                    i = allFieldsJSON.length;
                                    break;
                                }
                                /*
                                str = 0,
                                dateTime,
                                number,
                                boolean*/
                            }
                        }


                    });

                }

                function OnClientNodeClicked(sender, args) {
                    if (args.get_node().get_level() != 0) {
                        overrideFieldsByType();
                    }
                }
                function OnClientNodeClicking(sender, args) {
                    //root items, toggle, but don't select
                    if (args.get_node().get_level() == 0) {
                        var node = args.get_node();
                        node.toggle();
                        args.set_cancel(true);
                    }
                }
                function deleteItem() {
                    if (listBox.get_items().get_count() < 1) {
                        alert("The listBox is empty.");
                        return false;
                    }

                    var selectedItem = listBox.get_selectedItem();
                    if (!selectedItem) {
                        alert("You need to select a item first.");
                        return false;
                    }

                    if (listBox.get_items().get_count().length == 1) {
                        if (!confirm("This is the last item in the listBox. Are you sure you want to delete it?"))
                            return false;
                    }

                    listBox.deleteItem(selectedItem);
                    return false;
                }

                function ClientNodeClicked(sender, eventArgs) {
                    var node = eventArgs.get_node();
                    node.toggle();
                }



                function addIfNotExists(listItems, index, listBoxItem) {
                    var found = false;
                    for (var i = 0; i < listItems.get_count(); i++) {
                        if (listItems.getItem(i).get_value() == listBoxItem.get_value()) {
                            found = true;
                            break;
                        }
                    }
                    if (found != true) {
                        if (index < 0) {
                            index = listItems.get_count();//ADD AT THE END
                        }
                        listItems.insert(index, listBoxItem);
                    }
                }

              

            </script>
  <h3>Automatic Message</h3>

<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<asp:Panel runat="server" ID="pnlBday" CssClass="form-inline" Visible="false">
<div class="form-group">
    <label>When to send</label>
    <asp:TextBox ID="txtBdayDays" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:DropDownList runat="server" ID="cboBdayBeforeAfter"  CssClass="form-control">
    </asp:DropDownList>
    <asp:DropDownList runat="server" ID="cboBdaySigneePart"  CssClass="form-control">
    </asp:DropDownList>
</div>
</asp:Panel>


<asp:Panel runat="server" ID="pnlSigningCheckin" CssClass="form-inline" Visible="false">
<div class="form-group">
    <label>When to send</label>
    <asp:TextBox ID="txtSignCheckinOffset" runat="server" CssClass="form-control"></asp:TextBox>
      <asp:DropDownList runat="server" ID="cboSignCheckinOffsetUnit"  CssClass="form-control">
    </asp:DropDownList>
    <asp:Label runat="server" ID="lblAfter"> after </asp:Label>
    <asp:Label runat="server" ID="lblAfterSigning"> after signing </asp:Label>
    
      <asp:DropDownList runat="server" ID="cboCheckInMode"  CssClass="form-control">
    </asp:DropDownList>
    
</div>
</asp:Panel>

<asp:Panel runat="server" ID="pnlEvent" CssClass="form-inline" Visible="false">
<div class="form-group">
   <label>When to send</label>
    <asp:TextBox ID="txtEventOffset" runat="server" CssClass="form-control"></asp:TextBox>
      <asp:DropDownList runat="server" ID="cboEventOffsetUnit"  CssClass="form-control">
    </asp:DropDownList>
     <asp:DropDownList runat="server" ID="cboEventOffsetMode"  CssClass="form-control">
    </asp:DropDownList>
</div>
    <div class="form-group">
        <asp:RadioButtonList ID="rblEventMode" runat="server" CssClass="radiobuttonlist">
        </asp:RadioButtonList>
    </div>
</asp:Panel>

<!-- filters -->

    <div class="form-inline" style="padding:20px 0 10px;">
    <h3 style="margin:0; display:inline-block;padding:0 15px 0 0;">Filters</h3><asp:DropDownList runat="server" CssClass="form-control input-sm" ID="cboFilterMatch">

        <asp:ListItem Value="All">Match All</asp:ListItem>
        <asp:ListItem Value="Any">Match Any</asp:ListItem>
                                                                     </asp:DropDownList>
        </div>
    <asp:PlaceHolder runat="server" ID="phFilters"></asp:PlaceHolder>
 
    <asp:Button runat="server" ID="btnAddFilter" CssClass="btn btn-default" Text="Add Filter" OnClick="btnAddFilter_Click"  />
   
    <br /><br />
  

    <div class="row">
        
        <div class="col-sm-6">
            <label for="<%=txtMessage.ClientID %>">Message</label>
            <div class="input-controls-container expand">
                <asp:TextBox ID="txtMessage" CssClass="form-control" runat="server" TextMode="MultiLine" Height="150"></asp:TextBox>
                

                <div class="input-controls">
                    

                    <div class="btngrouping">
                        
                        <span id="chars" class="pull-left small"></span>
                        
                        
                        <a href="javascript:void(0);" class="btn btn-primary btn-xs" id="btnShortenLinks">Shorten Links</a>
                       
                        <div class="dropdown">
                            <button class="btn btn-default btn-xs dropdown-toggle" type="button" data-toggle="dropdown">Add Custom Field
                                <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:void(0);" class="btnAddMsg" data-msg="{{FIRSTNAME}}">First Name (Signee)</a></li>
                                <li><a href="javascript:void(0);" class="btnAddMsg" data-msg="{{LASTNAME}}">Last Name (Signee)</a></li>
                                <li><a href="javascript:void(0);" class="btnAddMsg" data-msg="{{PARTICIPANT_FIRST}}">First Name (First child)</a></li>
                                <li><a href="javascript:void(0);" class="btnAddMsg" data-msg="{{PARTICIPANT_LAST}}">Last Name (First child)</a></li>
                                <li><a href="javascript:void(0);" class="btnAddMsg" data-msg="{{PARTICIPANT_NAMES}}">Child names (Separated by commas)</a></li>
                                <li><a href="javascript:void(0);" class="btnAddMsg" data-msg="{{EMAIL}}">Email Address</a></li>
                                <li><a href="javascript:void(0);" class="btnAddMsg" data-msg="{{MOBILENUM}}">Mobile Number</a></li>
                                <li><a href="javascript:void(0);" class="btnAddMsg" data-msg="Reply STOP to unsubscribe">Unsubscribe Line</a></li>
                            </ul>
                        </div>
                       
                        
                    </div>
                </div>
                
              
                   
                    
            
            </div>
            <p class="help-block">
            <span id="charwarning" style="display:none;color:red;">Messages greater than 160 characters will be split and send as multiple separate SMS messages.</span>
            </p>
            

            <p class="WPERR_Information" id="charcodewarning" style="display:none;">
                <em>When codes are used, text message length can vary. Messages more than 160 characters will be split into multiple SMS messages.</em>
            </p>
            
            <p class="help-block">
                <em>
                    * To ensure compliance with our <a href="https://www.waiverfile.com/Policies/Messaging-Policy.aspx" target="_blank">messaging policy</a>, consider adding opt-out and sender identification to your message.
                </em>
            </p>


        </div>
        <div class="col-sm-6">
            
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
                    <span id="msgPreview"></span>
                </div>
            </div>
            
        </div>
       
    </div>
    
   
    
</div>
            </div>
        </div>
     
 
<div>

</div>


<asp:LinkButton runat="server" ID="btnActivate" CssClass="btn btn-success" OnClick="btnActivate_Click" >Activate</asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnSave" CssClass="btn btn-primary" OnClick="btnSave_Click" >Save</asp:LinkButton>



