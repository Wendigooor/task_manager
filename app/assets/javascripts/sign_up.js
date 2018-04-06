$(document).ready( function(e) {

  // $('#user_role_admin').change(function() {
  //   console.log('change')
  //   if (this.value == 'admin') {
  //     console.log('show family')
  //   }
  //   else {
  //     console.log('hide family')
  //   }
  // });

  // $('[name="user[role]"]').on("change", function() { 
  //   if (this.value == 'admin') {

  //   }
  //   else {

  //   }
  // });

  $('#family_id').on('change', function() {
    promptOptionSelected = this.value.replace(/\s/g,"") == "";
    $familyNameField = $('#family_name');
    if (promptOptionSelected) {
      $familyNameField.show();
      $familyNameField.prop('required', true);
    }
    else {
      $familyNameField.hide();
      $familyNameField.val('');
      $familyNameField.prop('required', false);
    }
  });



});
