$(document).ready( function(e) {

  $('.new_user #user_id').on('change', function() {
    promptOptionSelected = this.value.replace(/\s/g,"") == "";
    $userEmailField = $('.new_user #user_email');
    if (promptOptionSelected) {
      $userEmailField.show();
      $userEmailField.prop('required', true);
    }
    else {
      $userEmailField.hide();
      $userEmailField.val('');
      $userEmailField.prop('required', false);
    }
  });

});
