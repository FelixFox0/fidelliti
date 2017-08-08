(function($) {
		$.fn.animated = function(inEffect, outEffect) {
				$(this).css("opacity", "0").addClass("animated").waypoint(function(dir) {
						if (dir === "down") {
								$(this).removeClass(outEffect).addClass(inEffect).css("opacity", "1");
						} else {
								
						};
				}, {
						offset: "90%"
				}).waypoint(function(dir) {
						if (dir === "down") {
								$(this).css("opacity", "1");
						} else {
								$(this).css("opacity", "1");
						};
				}, {
						offset: -$(window).height()
				});
		};
})(jQuery);