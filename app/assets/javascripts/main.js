$(document).ready(function() {

	// hoverable tables
	$('tr').on("click", function() {
	  if($(this).data('href') !== undefined){
	  	$.ajax({
			   url: $(this).data('href')
			});
	  }
	});

	// autoNumeric
	initFields();

	// clear autoNumeric formatting from all fields on submit
	$('form').submit(function(){
		var form = $(this);
		$('input').each(function(i){
			var self = $(this);
			try{
				var v = self.autoNumeric('get');
				self.autoNumeric('destroy');
				self.val(v);
			}catch(err){
				console.log("Not an autonumeric field: " + self.attr("name"));
			}
		});
		return true;
	});
	
	// fade out notice
	$(".main-alert").delay(2500).fadeOut()

	$('[data-nav-drawer]').navDrawer();

	$('[data-nav-slideout]').navSlideout();

	$('.overflow-fade').scrollContent();

	$('[data-search-dropdown]').searchDropdown({
		search: function() {
			this.open();
		}
	});

	$('[data-toggle-list]').toggleList({
		onChange: function(val) {
			console.log('new toggle value: ' + val);
		}
	});

	$('[data-custom-select]').customSelect({
		onChange: function(val) {
			console.log('new value: ' + val);
		}
	});

});

function initFields() {
	$('.currency').autoNumeric('init', {aSign:'$ ', mDec: 0});
	$('.percentage').autoNumeric('init', {aSign:' %', pSign: 's', vMin: '-1000.00', vMax: '1000.00'});
}