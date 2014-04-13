@Remetric ||= {}

@Remetric.dialog =

	init: ->
		Remetric.dialog.events()

	events: ->
		$(document).on "click", "#dialog_overlay, .close_dialog", ->
			Remetric.dialog.close()
			false
		
		$(document).on "click", ".open_dialog", ->
			Remetric.dialog.open()
			false
	
	open: ->
		$("#dialog_overlay, #dialog").fadeIn 100
		
	close: ->
		$("#dialog_overlay, #dialog").fadeOut 100