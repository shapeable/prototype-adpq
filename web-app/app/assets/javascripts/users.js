//Form conditional inputs
$(document).on('click', '.js-toggle-required', function() {
  var currentInput = $(this).parent('.custom-checkbox').siblings('.custom-text-input')
  var requiredMark=currentInput.children('input').siblings('.required-field')
  currentInput.toggle(100)
  requiredMark.toggle(100)
});

function validateEmail($email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( $email );
}
