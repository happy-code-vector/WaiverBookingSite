 function updateDOB(senderID, revalidate) {
       /* var y = $('#' + senderID).find('[class="wfdp_year"]').val(),
            m = $('#' + senderID).find('[class="wfdp_month"]').val(),
            d = $('#' + senderID).find('[class="wfdp_day"]').val();*/
     var y = $('#' + senderID + ' .wfdp_year').val(),
         m = $('#' + senderID + ' .wfdp_month').val(),
         d = $('#' + senderID + ' .wfdp_day').val();

     if (isNumericWF(y) && y.length == 2) {
            //2 DIGIT YEAR. 
            y = fixYear(y);
        }

        // Set the dob field value
        $('#' + senderID).find('[type="hidden"]').val(y === '' || m === '' || d === '' ? '' : [y, m, d].join('.'));

        if (revalidate) {
            // Revalidate it
            $('#Form1').formValidation('revalidateField', $('#' + senderID).find('[type="hidden"]').attr('name'));
        }


    }


 function fixYear(strYear) {
     if (isNumericWF(strYear) && strYear.length == 2) {
         var intYear = parseInt(strYear, 10);
         if (intYear > new Date().getFullYear().toString().substr(-2))  // this number controls how far back to go in the 20th century
             strYear = '19' + strYear;
         else
             strYear = '20' + strYear;
     }
     return strYear
 }


 function isNumericWF(val) {
     var nums = '0123456789';


     for (var i = 0; i < val.length; i++) {
         if (nums.indexOf(val.charAt(i)) == -1)
             return false;
     }


     return true;
 }