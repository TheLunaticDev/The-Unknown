extends ColorRect

const panelLocation = [Vector2(0,0), Vector2(94,0), Vector2(188,0), Vector2(281,0), Vector2(374,0), Vector2(467,0), Vector2(0,105), Vector2(94,105), Vector2(188, 105), Vector2(281, 105), Vector2(374,105), Vector2(467,105)]

var gridContainerPosition :Vector2
var tween :Tween
var items :Array
var hoveringPanel :int
var isSelected :bool
var distinctItem :int

@export var selectedPanelTexture :Texture2D
@export var hoveringPanelTexture :Texture2D
@export var animationSpeed :float
@export_dir var itemsDirectory
@export var default_name :String
@export_multiline var default_description :String

func _ready() -> void:
	gridContainerPosition = $GridContainer.position
	hoveringPanel = 0
	load_items()
	isSelected = false

func _process(delta: float) -> void:
	var selected_panel_position = get_target_position()
	render_items()
	move_selection_panel_towards(selected_panel_position)
	show_hovering_item_description()
	print(items[0].amount)
	if isSelected == false:
		$HBoxContainer.visible = false
	else:
		$HBoxContainer.visible = true
		manageButtons()
	print(isSelected)


func _input(event: InputEvent) -> void:
	if !isSelected:
		if event.is_action_pressed("ui_right"):
			hoveringPanel += 1
			if hoveringPanel > 11:
				hoveringPanel = 0
		if event.is_action_pressed("ui_left"):
			hoveringPanel -= 1
			if hoveringPanel < 0:
				hoveringPanel = 11
		if event.is_action_pressed("ui_up") || event.is_action_pressed("ui_down"):
			if hoveringPanel >= 0 and hoveringPanel <= 5:
				hoveringPanel += 6
			elif hoveringPanel >= 6 and hoveringPanel <= 11:
				hoveringPanel -= 6
	if event.is_action_pressed("ui_accept"):
		if isSelected:
			isSelected = false
			$Selected.texture = hoveringPanelTexture
		else:
			isSelected = true
			$Selected.texture = selectedPanelTexture

func get_target_position() -> Vector2:
	return gridContainerPosition + panelLocation[hoveringPanel]

func move_selection_panel_towards(target_position :Vector2) -> void:
	tween = get_tree().create_tween()
	tween.tween_property($Selected, "position", target_position, animationSpeed).set_ease(Tween.EASE_OUT)

func load_items() -> void:
	var contents = DirAccess.get_files_at(itemsDirectory)
	for i in range(contents.size()):
		items.append(load(itemsDirectory + "/" + contents[i]))

func render_items() -> void:
	clean_frames()
	for i in range(items.size()):
		if items[i].amount > 0:
			for j in range($GridContainer.get_child_count()):
				if $GridContainer.get_child(i).get_child(0).texture == null:
					$GridContainer.get_child(i).get_child(0).texture = items[i].texture

func show_hovering_item_description():
	$VBoxContainer/Name.text = default_name
	$VBoxContainer/Description.text = default_description
	var selectedItem = get_selected_item()
	if selectedItem:
		$VBoxContainer/Name.text = selectedItem.name
		$VBoxContainer/Description.text = selectedItem.description

func get_selected_item() -> Item:
	var selectedItem = $GridContainer.get_child(hoveringPanel).get_child(0).texture
	for i in range(items.size()):
		if selectedItem == items[i].texture:
			return items[i]
	return null

func clean_frames() -> void:
	for i in range($GridContainer.get_child_count()):
		$GridContainer.get_child(i).get_child(0).texture = null

func add_items(id :int, value :int):
	for i in range(items.size()):
		if id == items[i].id:
			items[i].amount += value

func _on_discard_pressed() -> void:
	var selection = get_selected_item()
	selection.discard()
	isSelected = false
	$Selected.texture = hoveringPanelTexture

func manageButtons() -> void:
	if get_selected_item() is Item:
		$HBoxContainer/Equip.visible = false
		$HBoxContainer/Use.visible = false
	else:
		$HBoxContainer/Use.visible = false
		$HBoxContainer/Equip.visible = false
		$HBoxContainer/Discard.visible = false
