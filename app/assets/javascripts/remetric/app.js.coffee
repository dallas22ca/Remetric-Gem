@Remetric ||= {}

@Remetric.unload = ->
	$("#loading").show()

@Remetric.load = ->
	Remetric.dialog.init()
	$(window).resize()

$ ->
	$(window).resize ->
		Remetric.window()

document.addEventListener "page:fetch", Remetric.unload
document.addEventListener "page:change", Remetric.load