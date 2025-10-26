<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Blank.Master" AutoEventWireup="true" CodeBehind="Suspended.aspx.cs" Inherits="WaiverFile.site.admin.Suspended" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Account Suspended</title>

    
    <link rel="stylesheet" type="text/css" href="/wp-content/Plugins/WaiverFile/Docs/ExportPkgFiles/bootstrap.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style type="text/css">
        html {
        }

        body {
            margin: 0;
            padding: 0;
            background: #e7ecf0;
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            margin: 0;
            padding: 0;
        }

        p {
            font-size: 12px;
            color: #373737;
            font-family: Arial, Helvetica, sans-serif;
            line-height: 18px;
        }

            p a {
                color: #218bdc;
                font-size: 12px;
                text-decoration: none;
            }

        a {
            outline: none;
        }

        .f-left {
            float: left;
        }

        .f-right {
            float: right;
        }

        .clear {
            clear: both;
            overflow: hidden;
        }

        #block_error {
            width: 90%;
            max-width: 845px;
            min-height: 384px;
            border: 1px solid #cccccc;
            margin: 72px auto 0;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            background: #fff url(/wp-content/Plugins/WaiverFile/Docs/media/block.gif) no-repeat 0 51px;
        }

            #block_error div {
                padding: 100px 40px 0 186px;
            }

                #block_error div h2 {
                    color: #218bdc;
                    font-size: 24px;
                    display: block;
                    padding: 0 0 14px 0;
                    border-bottom: 1px solid #cccccc;
                    margin-bottom: 12px;
                    font-weight: normal;
                }

        @media(max-width:500px) {
            #block_error {
                background-image: none;
            }

                #block_error div {
                    padding: 30px 20px;
                }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div id="block_error">
        <div>

            <h2>WaiverFile Account Suspended</h2>
            <p>
                Your account has been suspended. To reactivate, click below to update your payment information.  <br />
            </p>
            <p>
                <a href="Settings/Renew.aspx?id=<%=subid %>" class="btn btn-primary">Reactivate Account</a>
            </p>
            <p>
                If you have questions or need assistance, please contact us at <a href="mailto:info@waiverfile.com">info@waiverfile.com</a> or visit <a href="http://www.waiverfile.com/Contact.aspx">http://www.waiverfile.com/Contact.aspx</a> for more contact options.
            </p>
            
        </div>
    </div>





</asp:Content>
