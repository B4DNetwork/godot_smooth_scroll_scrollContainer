extends Panel

var one_btn
var scroll_container
var verticalBox
var is_scrolling
var max_scroll = -1

func _ready():
	one_btn = load("res://Button.tscn")
	scroll_container = $ScrollContainer
	verticalBox = $ScrollContainer/VBoxContainer

func _process(delta):
	if is_scrolling:
		if scroll_container.scroll_vertical != max_scroll: 
			max_scroll = scroll_container.scroll_vertical
			scroll_container.scroll_vertical += 4 #smooth scrolling speed

	#Testing 
	"""print(is_scrolling)
	print("scroll :")
	print(scroll_container.scroll_vertical)
	print("max")
	print(max_scroll)"""

func _on_Button_pressed():
	var child = one_btn.instance()
	verticalBox.add_child(child)
	is_scrolling = true 
	max_scroll = -1

#when user try to manually scroll stop smooth scrolling
func _on_ScrollContainer_scroll_ended():
	is_scrolling = false


func _on_ScrollContainer_scroll_started():
	is_scrolling = false

