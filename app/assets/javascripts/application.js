// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require users
//= require bootstrap

$(document).ready(function() {
  console.log("I'm Listening!");
  $('#all-jobs-button').on("click", function(event){
    event.preventDefault();
    var element = this;
    console.log("You clicked me!");
    console.log(element)
    $.ajax({
      url: "tasks#show",
      method: "GET"
    }).done(function(response){
      console.log(response);
    });
  });
});
