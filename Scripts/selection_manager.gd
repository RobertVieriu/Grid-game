extends Node2D
class_name SelectionManager

signal selection_changed(selected: Array)

var selected: Array = []               # current selection
var drag_start_screen: Vector2 = Vector2.ZERO
var dragging: bool = false

@onready var selection_box: ColorRect = $"../UI/SelectionBox"

func _ready():
	selection_box.hide()
	selection_box.anchor_left = 0
	selection_box.anchor_top = 0
	selection_box.anchor_right = 0
	selection_box.anchor_bottom = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# start drag
				drag_start_screen = get_global_mouse_position()
				dragging = true
				selection_box.show()
				selection_box.position = drag_start_screen
				selection_box.size = Vector2.ZERO
			else:
				# release
				if dragging:
					_finish_drag_selection(event.shift_pressed)
				dragging = false
				selection_box.hide()

	elif event is InputEventMouseMotion and dragging:
		var current = get_global_mouse_position()
		var rect = Rect2(drag_start_screen, current - drag_start_screen).abs()
		selection_box.position = rect.position
		selection_box.size = rect.size

func _finish_drag_selection(additive: bool):
	var rect = Rect2(selection_box.position, selection_box.size)

	if not additive:
		_clear_selection()

	for obj in get_tree().get_nodes_in_group("selectable"):
		if rect.has_point(obj.global_position):
			_add_to_selection(obj)

	emit_signal("selection_changed", selected)

func select_single(obj, additive: bool):
	if not additive:
		_clear_selection()

	_add_to_selection(obj)
	emit_signal("selection_changed", selected)

# --- helpers ---
func _add_to_selection(obj):
	if obj not in selected:
		selected.append(obj)
		if obj.has_method("set_selected"):
			obj.set_selected(true)

func _clear_selection():
	for s in selected:
		if s.has_method("set_selected"):
			s.set_selected(false)
	selected.clear()
