@Remetric ||= {}

@Remetric.search =
	
	events: ->
		$(document).on "submit", "#quick_search", ->
			$(this).find(".no_loading").hide()
			$(this).find(".loading").show()