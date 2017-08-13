//= partials/jquery.magnific-popup.min.js



$(document).ready(function($) {
	

	$('.js-search').click(function(e) {
		e.preventDefault()
		console.log("asdasdas");
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