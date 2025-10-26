<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConversionTrackingScripts.ascx.cs" Inherits="WaiverFile.CRM.Controls.ConversionTrackingScripts" %>
        <!-- capterra conversion tracking -->
    <script type="text/javascript">
      var capterra_vkey = '1a9ac41f42e100f3ed8bd1f2328deb8f',
      capterra_vid = '2111037',
      capterra_prefix = (('https:' == document.location.protocol) ? 'https://ct.capterra.com' : 'http://ct.capterra.com');

      (function() {
        var ct = document.createElement('script'); ct.type = 'text/javascript'; ct.async = true;
        ct.src = capterra_prefix + '/capterra_tracker.js?vid=' + capterra_vid + '&vkey=' + capterra_vkey;
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ct, s);
      })();
    </script>
      




