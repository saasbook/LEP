$(function(){

    // Date picker for timesheet date setter
    $(function() {
      $(".datepicker").datepicker();
    });

    //Hide div with the following ids
		$("#practiced_language_other").hide();

    $('#practiced_language').click(function(){
      console.log($(this).val());
      if ($(this).val()=="other") {
      	$("#practiced_language_other").show("fast");
      } else {
        $("#practiced_language_other").hide("fast");
      }
    });
});
