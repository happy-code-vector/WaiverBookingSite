<%@ Page Language="C#" AutoEventWireup="true"  Inherits="System.Web.UI.Page" %>

<!DOCTYPE html>

<script runat="server">   
    long num = 0;
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        pnlLogin.Visible = false;
        pnlYay.Visible = true;
        lblNum.Text ="2,000,000 Waivers!!!";
        num = 2000000;
    //return; //DISABLE THIS FOR NOW. REUSE AT 2 MILLION PERHAPS

        if (Session["MIL"] == null || (string)Session["MIL"]!= "2483")
        {
            pnlLogin.Visible = true;
            pnlYay.Visible = false;
            return;
        }
        pnlLogin.Visible = false;
        pnlYay.Visible = true;

        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WaiverFileDB"].ConnectionString);
        conn.Open();

        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("spGetTotalWaivers", conn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        num = (long)dr["grandtotalwaivers"];
        dr.Close();
        conn.Close();

        if(num < 2000000)
        {
            lblNum.Text = (2000000 - num).ToString("#,##0") + " to go!";
        }
        else
        {
            lblNum.Text =num.ToString("#,##0") + "!!!";

        }

    }
    void Unnamed_Click(object sender, EventArgs e)
    {
        Session["MIL"] = txtPW.Text;
        Response.Redirect(Request.Url.AbsoluteUri);
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Countdown</title>

    <script type="text/javascript" src="/wp-content/Common/Scripts/jquery-1.9.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">

    <style type="text/css">
        body{ font-family: 'Montserrat', sans-serif;
              font-size: 35px; 
              font-weight:700;
              color: #ffffff;
              background:#0083ca; 
        }
.centerwrap{ 
 position: fixed; /* or absolute */
  top: 50%;
  left: 50%;
width: 330px; height:300px;
margin-left: -165px;
text-align:center; 
}
#lblNum {
text-align:center; 
width: 330px; height: 300px;

}

.center {
 
}


canvas {
  display: block;
  position: relative;
  zindex: 1;
  pointer-events: none;
}
    </style>

<% if (num >= 2000000 || Request.QueryString["test"]=="1"){ %>
    <script type="text/javascript">
        (function () {
            // globals
            var canvas;
            var ctx;
            var W;
            var H;
            var mp = 150; //max particles
            var particles = [];
            var angle = 0;
            var tiltAngle = 0;
            var confettiActive = true;
            var animationComplete = true;
            var deactivationTimerHandler;
            var reactivationTimerHandler;
            var animationHandler;

            // objects

            var particleColors = {
                colorOptions: ["DodgerBlue", "OliveDrab", "Gold", "pink", "SlateBlue", "lightblue", "Violet", "PaleGreen", "SteelBlue", "SandyBrown", "Chocolate", "Crimson"],
                colorIndex: 0,
                colorIncrementer: 0,
                colorThreshold: 10,
                getColor: function () {
                    if (this.colorIncrementer >= 10) {
                        this.colorIncrementer = 0;
                        this.colorIndex++;
                        if (this.colorIndex >= this.colorOptions.length) {
                            this.colorIndex = 0;
                        }
                    }
                    this.colorIncrementer++;
                    return this.colorOptions[this.colorIndex];
                }
            }

            function confettiParticle(color) {
                this.x = Math.random() * W; // x-coordinate
                this.y = (Math.random() * H) - H; //y-coordinate
                this.r = RandomFromTo(10, 30); //radius;
                this.d = (Math.random() * mp) + 10; //density;
                this.color = color;
                this.tilt = Math.floor(Math.random() * 10) - 10;
                this.tiltAngleIncremental = (Math.random() * 0.07) + .05;
                this.tiltAngle = 0;

                this.draw = function () {
                    ctx.beginPath();
                    ctx.lineWidth = this.r / 2;
                    ctx.strokeStyle = this.color;
                    ctx.moveTo(this.x + this.tilt + (this.r / 4), this.y);
                    ctx.lineTo(this.x + this.tilt, this.y + this.tilt + (this.r / 4));
                    return ctx.stroke();
                }
            }

            $(document).ready(function () {
                SetGlobals();
                InitializeButton();
                InitializeConfetti();

                $(window).resize(function () {
                    W = window.innerWidth;
                    H = window.innerHeight;
                    canvas.width = W;
                    canvas.height = H;
                });

            });

            function InitializeButton() {
                $('#stopButton').click(DeactivateConfetti);
                $('#startButton').click(RestartConfetti);
            }

            function SetGlobals() {
                canvas = document.getElementById("canvas");
                ctx = canvas.getContext("2d");
                W = window.innerWidth;
                H = window.innerHeight;
                canvas.width = W;
                canvas.height = H;
            }

            function InitializeConfetti() {
                particles = [];
                animationComplete = false;
                for (var i = 0; i < mp; i++) {
                    var particleColor = particleColors.getColor();
                    particles.push(new confettiParticle(particleColor));
                }
                StartConfetti();
            }

            function Draw() {
                ctx.clearRect(0, 0, W, H);
                var results = [];
                for (var i = 0; i < mp; i++) {
                    (function (j) {
                        results.push(particles[j].draw());
                    })(i);
                }
                Update();

                return results;
            }

            function RandomFromTo(from, to) {
                return Math.floor(Math.random() * (to - from + 1) + from);
            }


            function Update() {
                var remainingFlakes = 0;
                var particle;
                angle += 0.01;
                tiltAngle += 0.1;

                for (var i = 0; i < mp; i++) {
                    particle = particles[i];
                    if (animationComplete) return;

                    if (!confettiActive && particle.y < -15) {
                        particle.y = H + 100;
                        continue;
                    }

                    stepParticle(particle, i);

                    if (particle.y <= H) {
                        remainingFlakes++;
                    }
                    CheckForReposition(particle, i);
                }

                if (remainingFlakes === 0) {
                    StopConfetti();
                }
            }

            function CheckForReposition(particle, index) {
                if ((particle.x > W + 20 || particle.x < -20 || particle.y > H) && confettiActive) {
                    if (index % 5 > 0 || index % 2 == 0) //66.67% of the flakes
                    {
                        repositionParticle(particle, Math.random() * W, -10, Math.floor(Math.random() * 10) - 20);
                    } else {
                        if (Math.sin(angle) > 0) {
                            //Enter from the left
                            repositionParticle(particle, -20, Math.random() * H, Math.floor(Math.random() * 10) - 20);
                        } else {
                            //Enter from the right
                            repositionParticle(particle, W + 20, Math.random() * H, Math.floor(Math.random() * 10) - 20);
                        }
                    }
                }
            }
            function stepParticle(particle, particleIndex) {
                particle.tiltAngle += particle.tiltAngleIncremental;
                particle.y += (Math.cos(angle + particle.d) + 3 + particle.r / 2) / 2;
                particle.x += Math.sin(angle);
                particle.tilt = (Math.sin(particle.tiltAngle - (particleIndex / 3))) * 15;
            }

            function repositionParticle(particle, xCoordinate, yCoordinate, tilt) {
                particle.x = xCoordinate;
                particle.y = yCoordinate;
                particle.tilt = tilt;
            }

            function StartConfetti() {
                W = window.innerWidth;
                H = window.innerHeight;
                canvas.width = W;
                canvas.height = H;
                (function animloop() {
                    if (animationComplete) return null;
                    animationHandler = requestAnimFrame(animloop);
                    return Draw();
                })();
            }

            function ClearTimers() {
                clearTimeout(reactivationTimerHandler);
                clearTimeout(animationHandler);
            }

            function DeactivateConfetti() {
                confettiActive = false;
                ClearTimers();
            }

            function StopConfetti() {
                animationComplete = true;
                if (ctx == undefined) return;
                ctx.clearRect(0, 0, W, H);
            }

            function RestartConfetti() {
                ClearTimers();
                StopConfetti();
                reactivationTimerHandler = setTimeout(function () {
                    confettiActive = true;
                    animationComplete = false;
                    InitializeConfetti();
                }, 100);

            }

            window.requestAnimFrame = (function () {
                return window.requestAnimationFrame ||
                    window.webkitRequestAnimationFrame ||
                    window.mozRequestAnimationFrame ||
                    window.oRequestAnimationFrame ||
                    window.msRequestAnimationFrame ||
                    function (callback) {
                        return window.setTimeout(callback, 1000 / 60);
                    };
            })();
        })();

    </script>
<%}%>
         <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <meta http-equiv="refresh" content="30">
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Panel runat="server" ID="pnlLogin">
                <table border="0" width="100%" height="100%">
                      <tr>
                          <td valign="top" style="text-align:center;">
                              <asp:TextBox runat="server" TextMode="Password" ID="txtPW"></asp:TextBox>
                                <asp:Button runat="server" OnClick="Unnamed_Click" Text="Go" />
                          </td>
                      </tr>
                  </table>

                
            </asp:Panel>
              <asp:Panel runat="server" ID="pnlYay" CssClass="content">
                  <div class="centerwrap">
                              <asp:Label ID="lblNum" runat="server"></asp:Label>
                  </div>
            <canvas id="canvas"></canvas>
                  </asp:Panel>
        </div>

    </form>
</body>
</html>
