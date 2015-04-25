# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

->
	Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
	donation.setUpForm()

donation =
	setUpForm: ->
		$('#new_donation').submit ->
			$('input[type=submit]').attr('disabled', true)
			donation.processCard()
			false

	processCard: ->
		card = 
			number: $('#card_number').val()
			cvc: $('#card_code').val()
			expMonth: $('#card_month').val()
			expYear: $('#card_year').val()
		Stripe.createToken(card, donation.handleStripeResponse)

	handleStripeResponse: (status, response) ->
		if status == 200
			alert(response.id)
		else
			alert(response.error.message)