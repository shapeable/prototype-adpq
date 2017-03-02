//Form conditional inputs
$(document).on('click', '.js-toggle-required', function() {
    var currentInput = $(this).parent('.custom-checkbox').siblings('.custom-text-input').children('input')
        if(currentInput.is(':disabled')) {
        currentInput.prop('disabled', false)
        currentInput.siblings('.required-field').toggle(100)
        }else {
        currentInput.prop('disabled', true)
        currentInput.siblings('.required-field').toggle(100)
        }
});

function validateEmail($email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( $email );
}
