$(function(){

    // Date picker for timesheet date setter
    $(function() {
      $("#timesheet-datepicker").datepicker({altField: "#timesheet-date", altFormat: 'dd-mm-yy', dateFormat: 'mm/dd/yy'});
    });

 
    $('#language').click(function(){
        console.log($(this).val());
    });

});
