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
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


ready = function(){
	
	// setInterval(function(){
	// 	getTasks();
	// }, 5000);

	// $('body').on('ajax:complete', '#new_purchase', function(xhr, obj){
	// 	console.dir(arguments);
	// 	console.log(obj.responseText);
	// 	$('body').html(obj.responseText);
	// 	$('#task_goal').focus()
	// });

	$('.add_food').on('click', function() {
		var foodId = $(this).data('food-id');

		$.ajax({
			method: "POST",
			url: "purchases.json",
			data: {
				purchase: { food_id: foodId }
			}
		}).success(function(data){
			console.log('wtf')
		});
	})
}

$(document).ready(ready);
$(document).on('page:load', ready);