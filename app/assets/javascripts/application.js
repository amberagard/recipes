// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  $('#add_form_line').click(function(){
    var clonedForm = $('#clone_template').clone();
    formatForm(clonedForm);
    var numItems = $('.form_clone').length;
    incrementIDs( clonedForm, numItems )
  });

  function formatForm(clonedForm) {
    clonedForm.removeAttr('id');
    clonedForm.appendTo('#form_partial_wrapper');
  }

  function incrementIDs(clonedForm, numItems) {
    clonedForm.find('select, input').each(function() {

      $(this).attr('name', incrementValue).attr('id', incrementValue);

      function incrementValue(i, val) {
        return val.replace(/\d+/, numItems);
      }
    });
  }

});
