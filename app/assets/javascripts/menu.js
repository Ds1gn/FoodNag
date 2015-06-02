ready = function(){



	$('.button').click(function(){
		$('section').toggleClass('open');
	});


}

$(document).ready(ready);
$(document).on('page:load', ready);
