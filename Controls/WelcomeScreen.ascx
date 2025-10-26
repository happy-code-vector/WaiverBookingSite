<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WelcomeScreen.ascx.cs" Inherits="WaiverFile.Controls.WelcomeScreen" %>
<asp:PlaceHolder ID="phErr" runat="server"></asp:PlaceHolder>

<asp:PlaceHolder ID="phImg1" runat="server"/>
<h1><%=_site.GetLabel("WELCOME_H1", Page) %></h1>
<asp:PlaceHolder ID="phImg2" runat="server"/>
<h3><%=_site.GetLabel("WELCOME_H2", Page) %></h3>
<asp:PlaceHolder ID="phImg3" runat="server"/>

<asp:PlaceHolder ID="phButtons" runat="server"></asp:PlaceHolder>

<asp:PlaceHolder ID="phImg4" runat="server"/>

<asp:Panel runat="server" ID="pnlScreenSaver">
<!-- screen saver -->
<script type="text/javascript">
    var s_saver;

    function cycleImages() {
        if ($('#screensaver').is(':visible')) {
            var $active = $('#screensaver .ss_images .active');
            var $next = ($active.next().length > 0) ? $active.next() : $('#screensaver .ss_images img:first');
            $next.css('z-index', 2);//move the next image up the pile
            $active.fadeOut(1500, function () {//fade out the top image
                $active.css('z-index', 1).show().removeClass('active');//reset the z-index and unhide the image
                $next.css('z-index', 3).addClass('active');//make the next image the top one
            });
        }
    }

    function resetScreenSaver() {
         clearTimeout(s_saver);
                s_saver = setTimeout(function(){
                    $('#screensaver').fadeIn(900);
                }, <%=msScreenSaverTimeout%>);
                    $('#screensaver').fadeOut(100);
    }
    $(document).ready(function () {
        resetScreenSaver();
        $('body').mousemove(function () { resetScreenSaver(); });
        $('#screensaver').click(function () { resetScreenSaver(); });
        $(window).scroll(function() { resetScreenSaver(); });
        setInterval('cycleImages()', <%=msScreenSaverInterval%>);
    });


</script>
<div id="screensaver">
    <div class="ss_images">
    <asp:PlaceHolder ID="phScreenSaverImages" runat="server" />
        </div>
</div>

    </asp:Panel>
