@Remetric ||= {}

@Remetric.messages =
	
	events: ->
		$(document).on "click", ".open_send_message", ->
			trackable_ids = []
			$(".trackable_checkbox:checked").each ->
				trackable_ids.push this.value
			
			count = trackable_ids.length
			count_word = if count == 1 then "Contact" else "Contacts"
			
			if count == 0
				alert "Please choose at least 1 contact."
			else
				$("#message_trackable_ids").val trackable_ids.join()
				$("#to").val "#{count} #{count_word}"
				Remetric.dialog.open "send_message"
			
			false