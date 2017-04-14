(function($){  
 $.fn.limita = function(options) {  
 
 	var defaults = {
		limit: 200,
		id_result: false,
		alertClass: false
	}
 
 	var options = $.extend(defaults, options);
 
    return this.each(function() {  
 
	var	caratteri = options.limit;
	
	if(options.id_result != false)
	{
		$("#"+options.id_result).append("Bạn có <strong>"+ caratteri+"</strong> ký tự");
	}
	
	$(this).keyup(function(){
		if($(this).val().length > caratteri){
		$(this).val($(this).val().substr(0, caratteri));
		}
		
		if(options.id_result != false)
		{
		
			var restanti = caratteri - $(this).val().length;
			$("#"+options.id_result).html("Bạn còn <strong>"+ restanti+"</strong> ký tự");
		
			if(restanti <= 10)
			{
				$("#"+options.id_result).addClass(options.alertClass);
			}
			else
			{
				$("#"+options.id_result).removeClass(options.alertClass);
			}
		}
	});
 
});  
 };  
})(jQuery);