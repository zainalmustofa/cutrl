// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require clipboard
//= require typed
//= require nprogress
//= require nprogress-turbolinks
//= require js-routes
//= require waitMe.min
//= require_tree .


NProgress.configure({
  easing: 'linear',
  positionUsing: '',
  speed: 350,
  trickle: true,
  trickleSpeed: 250,
  showSpinner: true,
  barSelector: '[role="bar"]',
  spinnerSelector: '[role="spinner"]'
});

var ready;
  ready = function() {
    var clip = new Clipboard('#copy_url');
    var clipboard = new Clipboard('.btn');
    clipboard.on('success', function(e) {
        console.info('Action:', e.action);
        console.info('Text:', e.text);
        $('#copy_button').tooltip();
        
        e.clearSelection();
    });
  };



$(document).ready(ready);
$(document).on('page:load', ready);


$(function() {
  $(document)  
    .ajaxStart(function() {
      $('.panel-body').waitMe({
        effect: "stretch",
        text: 'Please wait...',
        bg: 'rgba(255,255,255,0.7)',
        color: '#000'
      });
    })
    .ajaxStop(function() {
      $('.panel-body').waitMe("hide");
  });
});

