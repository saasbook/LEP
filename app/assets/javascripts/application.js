// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(function(){

    //Hide div with the following ids
    $("#fluent_language_other").hide("fast");
		$("#group_language_other").hide();
		$("#first_lang_preference_other").hide();
		$("#second_lang_preference_other").hide();

    $('#fluent_language').click (function(){
      console.log($(this).val());
      console.log($(this).is(":checked"));
      if ($(this).is(":checked")) {
      	console.log("showing fluent_language_other");
      	$("#fluent_language_other").show("fast");
      } else {
      	console.log("hiding fluent_language_other");
        $("#fluent_language_other").hide("fast");
      }
    });

    $('#group_language').click(function(){
      console.log($(this).val());
      if ($(this).val()=="other") {
      	$("#group_language_other").show("fast");
      } else {
        $("#group_language_other").hide("fast");
      }
    });

    $('#first_lang_preference').click(function(){
      console.log($(this).val());
      if ($(this).val()=="other") {
      	$("#first_lang_preference_other").show("fast");
      } else {
        $("#first_lang_preference_other").hide("fast");
      }
    });

    $('#second_lang_preference').click(function(){
      console.log($(this).val());
      if ($(this).val()=="other") {
      	$("#second_lang_preference_other").show("fast");
      } else {
        $("#second_lang_preference_other").hide("fast");
      }
    });
});