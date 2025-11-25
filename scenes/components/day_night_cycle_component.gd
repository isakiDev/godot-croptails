class_name DayNightCycleComponent
extends CanvasModulate

@export var initial_day: int = 1:
	set(init_day):
		initial_day = init_day
		DayAndNightCycleManager.initial_day = init_day
		DayAndNightCycleManager.set_initial_time()

@export var initial_hour: int = 12:
	set(init_hour):
		initial_hour = init_hour
		DayAndNightCycleManager.initial_hour = init_hour
		DayAndNightCycleManager.set_initial_time()

@export var initial_minute: int = 30:
	set(init_minute):
		initial_minute = init_minute
		DayAndNightCycleManager.initial_minute = init_minute
		DayAndNightCycleManager.set_initial_time()

@export var day_night_gradient_texture: GradientTexture1D

func _ready() -> void:
	DayAndNightCycleManager.initial_day = initial_day
	DayAndNightCycleManager.initial_hour = initial_hour
	DayAndNightCycleManager.initial_minute = initial_minute

	DayAndNightCycleManager.game_time.connect(on_game_time)

func on_game_time(time: float) -> void:
	# Get sample value to load the correct color from the gradient

	# sin(time) by default always returns values between -1 and 1.
	# Subtracting PI * 0.5 shifts the sine wave horizontally,
	# changing where the wave starts (but the range remains -1 to 1).
	#
	# Adding 1.0 remaps the range from -1 → 1 to 0 → 2.
	#
	# Multiplying by 0.5 scales the range from 0 → 2 down to 0 → 1,
	# which is required for sampling a GradientTexture.
	var sample_value = 0.5 * (sin(time - PI * 0.5) + 1.0)

	color = day_night_gradient_texture.gradient.sample(sample_value)
