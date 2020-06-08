// Javascript required to show calendar popup for publishdate
$(document).ready(function() {
  $('[data-behaviour~=datepicker]').datepicker();
  $('#calendarbtn').click(function() {
    $('#resource_publishdate').datepicker().focus();
  });
});