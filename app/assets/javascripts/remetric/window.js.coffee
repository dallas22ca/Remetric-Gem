@Remetric ||= {}

@Remetric.window = ->
	if $("#new_message:visible").length
		window_height = $(window).height()
		top_margin = 100
		bottom_margin = 100
		to_height = 43
		subject_height = 43
		h1_height = 52
		new_height = window_height - top_margin - bottom_margin - to_height - subject_height - h1_height
		$("#message_body").css "height", new_height