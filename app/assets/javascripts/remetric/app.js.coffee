@Remetric ||= {}

@Remetric.unload = ->
	$("#loading").show()

@Remetric.load = ->
	$(window).resize()
	
	$(".table").on "click", "td", (e) ->
		unless $(e.target).is("input[type='checkbox']")
			checkbox = $(this).find("input[type='checkbox']")
			checkbox.prop "checked", !checkbox.prop("checked")
	
$ ->
	Remetric.dialog.events()
	Remetric.messages.events()
	Remetric.search.events()

	$(window).resize ->
		Remetric.window()

document.addEventListener "page:fetch", Remetric.unload
document.addEventListener "page:change", Remetric.load