(function($){
	$.fn.dragNdrop_position = function(options) {
		var defaults = {
			php_token : '',
			page : '0',
			limit : '0',
			routes : ['catalog/category', 'catalog/product', 'catalog/product/update', 'catalog/product/edit', 'catalog/attribute_group', 'catalog/attribute', 'catalog/option', 'catalog/manufacturer', 'catalog/information', 'extension/shipping', 'extension/payment', 'extension/total', 'sale/customer_group', 'design/banner/update', 'design/banner/edit', 'localisation/language'],
			actions : [['category', true, 'category_id', 4], ['product', true, 'product_id', false], ['product_update', false, false, false], ['product_update', false, false, false], ['attribute_group', true, 'attribute_group_id', 4], ['attribute', true, 'attribute_id', 5], ['option', true, 'option_id', 4], ['manufacturer', true, 'manufacturer_id', 4], ['information', true, 'information_id', 4], ['shipping', true, 'extension', 4], ['payment', true, 'extension', 5], ['total', true, 'extension', 4], ['customer_group', true, 'customer_group_id', 4], ['banner_update', false, false, false], ['banner_update', false, false, false], ['language', true, 'language_id', 5]]
		}

		Array.prototype.indexOf = function(obj, start) {
			for (var i = (start || 0), j = this.length; i < j; i++) {
				if (this[i] === obj) { return i; }
			}

			return -1;
		}

		var getParmFromUrl = function(parm, url) {
			var re = new RegExp(".*[?&]" + parm + "=([^&']+)(&|$|')");

			if (typeof url == 'undefined') url = window.location.href;
			
			var match = url.match(re);

			return (match ? match[1] : '');
		}

		var createCss = function() {
			var css = document.createElement('style');
			css.type = 'text/css';

			var styles = '\
				img.ddp_drag { cursor: move; }\
				.ui-sortable-placeholder td {\
					border: 1px dashed #aaa !important;\
					height: 45px;\
					width: 344px;\
					background: #999 !important; }\
				.ui-sortable-helper { border: 1px dashed #aaa !important; }\
				tbody.ui-sortable-placeholder { height: 130px; display: table-row; }\
				#tab-attribute tbody.ui-sortable-placeholder { height: 120px; }\
				#tab-option tbody.ui-sortable-placeholder { height: 60px }\
				#tab-image tbody.ui-sortable-placeholder { height: 130px; }';

			if (css.styleSheet) css.styleSheet.cssText = styles;
			else css.appendChild(document.createTextNode(styles));

			document.getElementsByTagName("head")[0].appendChild(css);
		}

		function Plugin(element, options) {
			this.options = $.extend(defaults, options);

			this.obj = $(element);

			this.init();
		}

		Plugin.prototype.init = function () {
			var obj = this.obj,
				token = this.options.php_token;

			route = getParmFromUrl('route');

			if (!$.inArray(route, this.routes))
				return;

			key = this.options.routes.indexOf(route);

			if (key == -1)
				return;

			action = this.options.actions[key];
			start = this.options.page == 0 || this.options.page == 1 ? 0 : (this.options.page * this.options.limit);

			if (route == 'catalog/product/update' || route == 'design/banner/update') item = 'tbody';
			else item = '> tr:has(td)';

			$(obj).sortable({
				items: item,
				connectWith: 'tbody',
				handle: '.ddp_drag',
				placeholder: 'ui-sortable-placeholder',
				cursor: 'move',
				axis: 'y',
				disable: true,
				forcePlaceholderSize: true,
				helper: function(e, ui) {
					if (item == 'tbody') {
						ui.children().children().each(function() {
							$(this).width($(this).width());
						});
					} else {
						ui.children().each(function() {
							$(this).width($(this).width());
						});
					}

					//Quick Product Edit
					if ($('tr[id*="quick"]').length) {
						$('tr[id*="quick"]').remove();
					}
					
					return ui;
				},
				stop: function(event, ui) {
					order = {};

					if (item == 'tbody' || route == 'catalog/product/edit') {
						$('input[name$="[sort_order]"]', $(obj)).each(function(i) {
							$(this).val(i);
						});
					} else {
						$(this).find('tr').map(function(index, obj) {
							id = getParmFromUrl(action[2], $(this).find('a').last().attr('href'));

							if (id == '') {
								id = getParmFromUrl(action[2], $('a:nth-last-child(2)', $(this)).attr('href'));

								if (id == '') {
									id = getParmFromUrl(action[2], $('a:nth-last-child(2)', $(this)).attr('onclick'));
								}
							}

							if (action[3]) $(this).find('td:nth-child(' + action[3] + ')').text(start + index);

							if (id) {
								return order[id] = (start + index);
							}
						});
						
					}

					if (order && action[1]) {
						$.ajax({
							url: 'index.php?route=module/dragndrop_position/position&token=' + token,
							type: 'post',
							dataType: 'json',
							data: { module: action[0], order: order },
							beforeSend: function() {
								$('.ddp').remove();
							},
							success: function(data) {
								if (data['error']) {
									if ($('div.content').length) {
										$('div.content').first().prepend('<div class="ddp warning">' + data['error'] + '</div>');
									} else {
										$('div.container-fluid').first().prepend('<div class="ddp alert alert-danger">' + data['error'] + '</div>');
									}
								}

								if (data['success']) {
									if ($('div.content').length) {
										$('div.content').first().prepend('<div class="ddp success">' + data['success'] + '</div>');
									} else {
										$('div.container-fluid').first().prepend('<div class="ddp alert alert-success">' + data['success'] + '</div>');
									}
								}
							}
						});
					}	
				}
			});
		};

		createCss();

		return this.each(function () {
            new Plugin(this, options);
        });
	};
})(jQuery);