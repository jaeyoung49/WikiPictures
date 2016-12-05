$(document).ready(function(){
    var date_input=$('#date');
    
    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
    date_input.datepicker({
    	language:'kr',
        format: 'yy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
    })
})