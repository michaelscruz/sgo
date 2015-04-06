$(document).ready(function() {

	// hoverable tables
	$('tr').on("click", function() {
	  if($(this).data('href') !== undefined){
	  	$.ajax({
			   url: $(this).data('href')
			});
	  }
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

	// Sample usage of the tableAppend plugin. Should be used when data is returned
	// from the server via AJAX or something.
	$('.view-more-example').click(function(e) {
		e.preventDefault();
		$(this).parents('table').tableAppend([
		{
			name: 'Drew Loomer',
			source: 'Twitter',
			activity: 'Died a little inside.',
			date: '10/30/2014'
		},
		{
			name: 'Woody Hoban',
			source: 'Myspace',
			activity: 'Was a dog.',
			date: '1/23/2015'
		},
		{
			name: 'Drew Loomer',
			source: 'Twitter',
			activity: 'Died a little inside.',
			date: '10/30/2014'
		},
		{
			name: 'Woody Hoban',
			source: 'Myspace',
			activity: 'Was a dog.',
			date: '1/23/2015'
		},
		{
			name: 'Drew Loomer',
			source: 'Twitter',
			activity: 'Died a little inside.',
			date: '10/30/2014'
		},
		{
			name: 'Woody Hoban',
			source: 'Myspace',
			activity: 'Was a dog.',
			date: '1/23/2015'
		}
		]);
	});
});