extends Node

func _ready() -> void:
#	use call_deferred to ensure that this method its called after the tools are deactivated (by default)
	call_deferred('enable_tool_buttons')

func enable_tool_buttons() -> void:
	ToolManager.enable_tool_button(DataTypes.Tools.TillGround)
	ToolManager.enable_tool_button(DataTypes.Tools.WaterCrops)
	ToolManager.enable_tool_button(DataTypes.Tools.PlantCorn)
	ToolManager.enable_tool_button(DataTypes.Tools.PlantTomato)
