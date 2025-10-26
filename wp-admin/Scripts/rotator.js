(function ($) {
    $(document).ready(function () {
        $('a').each(function () {
            if ($(this).attr('obf') == 'true') {
                $(this).html($.rotate($(this).html()));
                $(this).attr('href', $.rotate($(this).attr('href')));

            }
        });
    });

    $.rotate = function (s) {
        return $.rotate13($.rotate5(s));
    }

    $.rotate5 = function (s) {
        var b = [], c, i = s.length, a = '0'.charCodeAt(), z = a + 10;
        while (i--) {
            c = s.charCodeAt(i);
            if (s.charAt(i)!=':' && c >= a && c <= z) { b[i] = String.fromCharCode(((c - a + 5) % (10)) + a); }
            else { b[i] = s.charAt(i); }
        }
        return b.join('');
    };

    $.rotate13 = function (s) {
        var b = [], c, i = s.length, a = 'a'.charCodeAt(), z = a + 26, A = 'A'.charCodeAt(), Z = A + 26;
        while (i--) {
            c = s.charCodeAt(i);
            if (s.charAt(i)!=':' && c >= a && c <= z) { b[i] = String.fromCharCode(((c - a + 13) % (26)) + a); }
            else if (s.charAt(i) != ':' && c >= A && c <= Z) { b[i] = String.fromCharCode(((c - A + 13) % (26)) + A); }
            else { b[i] = s.charAt(i); }
        }
        return b.join('');
    };
})(jQuery)