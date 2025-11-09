<%@ Control Language="C#" AutoEventWireup="true" Inherits="WaiverFile.Core.Booking.WFCustomContentControl" %>

<!-- Footer -->
<footer class="bg-dark py-5">
    <div class="container px-4 px-lg-5">
        <div class="small text-center text-white-50">
            Copyright &copy; <span id="currentYear"></span> - Your Company
        </div>
    </div>
</footer>

<script>
    document.getElementById('currentYear').textContent = new Date().getFullYear();
</script>
