@Remetric ||= {}

@Remetric.dialog =

	events: ->
		$(document).on "click", "#dialog_overlay, .close_dialog", ->
			# if !$("#send_message:visible").length || confirm "You will lose your current changes. Are you sure you want to continue?"
			Remetric.dialog.close()
			false
		
		$(document).on "click", ".open_dialog", ->
			dialog = $(this).data("dialog")
			Remetric.dialog.open dialog
			false
	
	open: (dialog) ->
		$("#dialog_overlay, ##{dialog}").fadeIn 100
		Remetric.window()
		
	close: ->
		$("#dialog_overlay, .dialog").fadeOut 100