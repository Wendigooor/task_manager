$(document).ready( function(e) {

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
