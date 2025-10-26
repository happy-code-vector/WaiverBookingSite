var sessionWarningTimer = null;
var redirectToWelcomePageTimer = null;
var timeOnPageLoad = new Date();

$(document).ready(function () {

});

function setupSessionWarning(sessionTimeout, loginRedirectUrl) {

    var sessionTimeoutWarning = sessionTimeout - 5; //5 min warning ** change this back to 5!!!!! ***

    sessionWarningTimer = setTimeout(function () { SessionWarning(sessionTimeout, sessionTimeoutWarning, loginRedirectUrl); }, sessionTimeoutWarning * 60 * 1000);
    redirectToWelcomePageTimer = setTimeout(function () { RedirectToWelcomePage(loginRedirectUrl); }, sessionTimeout * 60 * 1000);

    $('#btnContinueToLogin').attr('href', loginRedirectUrl);

    $('#btnLogOut').click(function () { window.location = loginRedirectUrl + "&action=logout" });
    $('#btnKeepWorking').click(function () {
        var img = new Image(1, 1);
        img.src = '/Controls/KeepAlive.aspx?date=' + escape(new Date());

        //Clear the RedirectToWelcomePage method
        if (redirectToWelcomePageTimer != null) {
            clearTimeout(redirectToWelcomePageTimer);
        }
        timeOnPageLoad = new Date();

        sessionWarningTimer = setTimeout(function () { SessionWarning(sessionTimeout, sessionTimeoutWarning, loginRedirectUrl); }, sessionTimeoutWarning * 60 * 1000);
        redirectToWelcomePageTimer = setTimeout(function () { RedirectToWelcomePage(loginRedirectUrl); }, sessionTimeout * 60 * 1000);

        $('#alertSessionWarning').modal('hide');
    });

}

function SessionWarning(sessionTimeout, sessionTimeoutWarning, loginRedirectUrl) {
    var minutesForExpiry = (sessionTimeout - sessionTimeoutWarning);
    var message = "Your session will expire in " + minutesForExpiry + " mins. Do you want to extend the session?";

    $('#txtSessionExpiring').html(message);
    $('#alertSessionWarning').modal('show');


    //*************************
    //Even after clicking ok(extending session) or cancel button,
    //if the session time is over. Then exit the session.
    var currentTime = new Date();
    //time for expiry
    var timeForExpiry = timeOnPageLoad.setMinutes(timeOnPageLoad.getMinutes() + sessionTimeout);

    //Current time is greater than the expiry time
    if (Date.parse(currentTime) > timeForExpiry) {
        RedirectToWelcomePage(loginRedirectUrl);
    }
    //**************************
}

//Session timeout
function RedirectToWelcomePage(loginRedirectUrl) {
    $('#alertSessionWarning').modal('hide');
    $('#alertSessionRedirecting').modal('show');
    window.location = loginRedirectUrl;
}
