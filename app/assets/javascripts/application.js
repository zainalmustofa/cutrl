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

$(document).ready(function(){  
  var clip = new Clipboard('#copy_url');
  var clipboard = new Clipboard('.btn');
  clipboard.on('success', function(e) {
      console.info('Action:', e.action);
      console.info('Text:', e.text);
      $('#copy_button').tooltip();
      
      e.clearSelection();
  });
});
