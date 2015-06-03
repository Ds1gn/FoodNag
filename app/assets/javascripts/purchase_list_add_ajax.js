ready = function(){


  $('.add_food').on('click', function() {

    var foodName = $(this).data('food-name');
    var foodId = $(this).data('food-id');

    $.ajax({
      method: "POST",
      url: "/purchases.json",
      data: {
        purchase: { food_id: foodId }
      }
    }).success(function(data){
      console.log(data);

      var purchaseItemHtml = "<li><hr>" + foodName + ' <a class="fa fa-trash" rel="nofollow" data-method="delete" href="/purchases/'+data.purchase_id+'"></a></li>'
      var recipeData = "<li>" +  '<a href="'+data.recipe_url+'">' + data.recipe_title + '</a></li>'

      $('.purchase_list').prepend(purchaseItemHtml);
      // $('.recipe-column').append(recipeData);
      // $('#purchase').focus();
      // location.reload();
    }).error(function(error, response){
      console.log(error, response);
    });
  });
}

//   $('.add_food').on('click', function() {

//     var foodName = $(this).data('food-name');
//     var foodId = $(this).data('food-id');

//     $.ajax({
//       method: "POST",
//       url: "purchases.json",
//       data: {
//         purchase: { food_id: foodId }
//       }
//     }).success(function(data){

//       var purchaseItemHtml = "<li>" + foodName + ' <a rel="nofollow" data-method="delete" href="/purchases/'+data.id+'">delete</a></li>'

//       $('.purchase_list').append(purchaseItemHtml);
//       // $('#purchase').focus();
//       // location.reload();
//     });
//   })
// }




$(document).ready(ready);
$(document).on('page:load', ready);
