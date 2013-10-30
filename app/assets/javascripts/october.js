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
var edit,cancel;

edit = function(button){
    $(button).siblings(".comment-body").hide();
    $(button).siblings(".comment-edit").show();
    $(button).siblings(".cancel-btn,.update-btn").show();
};
cancel = function(button){
    $(button).siblings(".comment-body").show();
    $(button).siblings(".comment-edit").hide();
    $(button).siblings(".update-btn").hide();
    $(button).hide();
};
        