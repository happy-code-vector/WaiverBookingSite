function GalleryPop(url, alt, width, height) {
    $('#gp').css('display', 'block');
    $('#gp').css('width', width);
    $('#gp').css('height', height);
    $('#gp').css('margin-left', width / 2 * -1);
    $('#gp').css('margin-top', height / 2 * -1);
    $('#gpbox').html('<img src="' + url + '" alt="' + alt + '" />');
    $('.gpclose').click(function () {
        $('#gp').css('display', 'none');
    });
}
function GalleryPopWithText(url, alt, width, height, text) {
    $('#gp').css('display', 'block');
    $('#gp').css('width', width);
    $('#gp').css('height', height);
    $('#gp').css('margin-left', width / 2 * -1);
    $('#gp').css('margin-top', height / 2 * -1);
    $('#gpbox').html('<img src="' + url + '" alt="' + alt + '" /><br/>' + text);
    $('.gpclose').click(function () {
        $('#gp').css('display', 'none');
    });
} 