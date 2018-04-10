
var loadCategoryChildren = function(url, selector) {
  $.ajax({
    type: 'GET',
    url: url,
    success: function(data) {
      updateSelectWithOptions(selector, data);
    }
  });
};

var constructUrl = function(url, id) {
  if (id && id !== '' && url && url != '') {
    return url.replace(/:.+_id/, id);
  }
};

var clearAndHideSelect = function(selector) {
  $(selector)
    .html('<option></option>')
    .prop('disabled', true)
    .trigger('change');
};

var updateSelectWithOptions = function (selector, options_data) {
  select = $(selector);
  select.prop('disabled', false);
  $.each(options_data, function(index, el) {
    select
      .append($('<option></option>')
                  .val(el.id)
                  .text(el.name));
  });
};

$(document).ready( function(e) {

  $("#first_category_id, #second_category_id").on('change', function() {
    var promptOptionSelected = this.value === '';

    clearAndHideSelect(this.dataset.target);
    if (!promptOptionSelected) {
      var url = constructUrl(this.dataset.url, this.value);
      loadCategoryChildren(url, this.dataset.target);
    }
  });

});
