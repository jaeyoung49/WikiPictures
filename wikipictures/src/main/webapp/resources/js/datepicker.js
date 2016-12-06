$(document).ready(function(){
    var date_input=$('#date');
    
    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
    date_input.datepicker({
    	language:'kr',
<<<<<<< HEAD
        format: 'yyyy-mm-dd',
=======
        format: 'yyyy/mm/dd',
>>>>>>> branch 'master' of https://github.com/jaeyoung49/WikiPictures
        container: container,
        todayHighlight: true,
        autoclose: true,
    })
})