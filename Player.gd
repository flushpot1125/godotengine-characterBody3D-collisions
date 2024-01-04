extends CharacterBody3D
@onready var animation_tree = %AnimationTree
@onready var state_machine : AnimationNodeStateMachinePlayback = animation_tree.get("parameters/StateMachine/playback")

#class_name Player


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const TURN_SPEED =2.0

var taken = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


var WorldNode

func _ready():
	WorldNode = get_tree().get_root().get_child(1)

func _physics_process(delta):
	if(GlobalVariable.Uncollected_coins_number == 0):
		showClearMessage()
		
	var move = Input.get_axis("down","up")
	var turn = Input.get_axis("right","left")
	var vy = velocity.y
	
	velocity = -transform.basis.z * move * SPEED
	velocity.y = vy
	
	rotate_y( TURN_SPEED * turn * delta )
	move_and_slide()
	
	if ( move or turn ) and is_on_floor():
		move()
		
	if velocity == Vector3.ZERO :
		idle()	
		
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump()
	
	if velocity.y < 0:
		fall()
	
func idle():
	state_machine.travel("Idle")

func move():
	state_machine.travel("Move")

func fall():
	state_machine.travel("Fall")

func jump():
	state_machine.travel("Jump")

func edge_grab():
	state_machine.travel("EdgeGrab")

func wall_slide():
	state_machine.travel("WallSlide")


func showClearMessage():
	var Message = WorldNode.get_node("HUD/MessageArea/Message")
	Message.show()

func _on_coin_000_body_entered(body):
	if body is CharacterBody3D:
		var Coin000 = WorldNode.get_node("Coin000")
		Coin000.hide()
		GlobalVariable.Uncollected_coins_number-=1
		var Score = WorldNode.get_node("HUD/ScoreArea/Score")
		Score.text = "RemainedCoin:"+str(GlobalVariable.Uncollected_coins_number)
		

func _on_coin_001_body_entered(body):
	if body is CharacterBody3D:
		var Coin001 = WorldNode.get_node("Coin001")
		Coin001.hide()
		GlobalVariable.Uncollected_coins_number-=1
		var Score = WorldNode.get_node("HUD/ScoreArea/Score")
		Score.text = "RemainedCoin:"+str(GlobalVariable.Uncollected_coins_number)
		


func _on_coin_002_body_entered(body):
	if body is CharacterBody3D:
		var Coin002 = WorldNode.get_node("Coin002")
		Coin002.hide()
		GlobalVariable.Uncollected_coins_number-=1
		var Score = WorldNode.get_node("HUD/ScoreArea/Score")
		Score.text = "RemainedCoin:"+str(GlobalVariable.Uncollected_coins_number)


func _on_coin_003_body_entered(body):
	if body is CharacterBody3D:
		var Coin003 = WorldNode.get_node("Coin003")
		Coin003.hide()
		GlobalVariable.Uncollected_coins_number-=1
		var Score = WorldNode.get_node("HUD/ScoreArea/Score")
		Score.text = "RemainedCoin:"+str(GlobalVariable.Uncollected_coins_number)


func _on_coin_004_body_entered(body):
	if body is CharacterBody3D:
		var Coin004 = WorldNode.get_node("Coin004")
		Coin004.hide()
		GlobalVariable.Uncollected_coins_number-=1
		var Score = WorldNode.get_node("HUD/ScoreArea/Score")
		Score.text = "RemainedCoin:"+str(GlobalVariable.Uncollected_coins_number)




func _on_coin_005_body_entered(body):
	if body is CharacterBody3D:
		var Coin005 = WorldNode.get_node("Coin005")
		Coin005.hide()
		GlobalVariable.Uncollected_coins_number-=1
		var Score = WorldNode.get_node("HUD/ScoreArea/Score")
		Score.text = "RemainedCoin:"+str(GlobalVariable.Uncollected_coins_number)


