$(function(){

    // Date picker for admin deadline setter
    $(function() {
      $(".datepicker").datepicker();
    });

    //Hide div with the following ids
    $("#fluent_languages_other").hide("fast");
		$("#group_language_other").hide();
		$("#first_lang_preference_other").hide();
		$("#second_lang_preference_other").hide();

    $('#fluent_languages').click (function(){
      console.log($(this).val());
      console.log($(this).is(":checked"));
      if ($(this).is(":checked")) {
      	console.log("showing fluent_language_other");
      	var other = $(".fluent_languages_other").show("fast");
      } else {
      	console.log("hiding fluent_language_other");
        $(".fluent_languages_other").hide("fast");
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
