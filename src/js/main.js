//= partials/jquery.magnific-popup.min.js
//= partials/jquery.mmenu.all.js
 

 
$(document).ready(function($) { 

	$("#my-menu").mmenu();

	var API = $("#my-menu").data( "mmenu" );
      
      $(".trigger-menu").click(function(e) {
      	e.preventDefault();
         API.open();
      });
	

	$('.js-search').click(function(e) {
		e.preventDefault()
		$(".search-block").show()
	});


	$('.open-popup').magnificPopup({
	  	type:'inline'
	  });

	//countries 


	if($("div").is(".first-frame")) {
		$.magnificPopup.open({
		  items: {
		    src: '.first-frame'
		  },
		  type: 'inline',
		  modal: true
		});
	}



});

$(document).mouseup(function (e) {
    var container = $(".search-block");
    if (container.has(e.target).length === 0){
        container.hide();
    }
});