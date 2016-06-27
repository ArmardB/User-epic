/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/
var ready;
ready = function(){
    // call sortable on our div with the sortable class
    $('.sortable').sortable();
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);