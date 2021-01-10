extends "res://src/gameplay/Qbit_view/QbitView.gd"


onready var currentSphereView2Qbits = $Spheres/CurrentSphereView2Qbits
onready var goalSphereView2Qbits = $Spheres/GoalSphereView2Qbits

onready var currentMatrixView2Qbits = $Matrices/CurrentMatrixView2Qbits
onready var goalMatrixView2Qbits = $Matrices/GoalMatrixView2Qbits


func _ready():
	goalSphereView2Qbits.moveToFirstGoalSphereLocation()
	goalSphereView2Qbits.moveToSecondGoalSphereLocation()
	currentSphereView2Qbits.moveToSecondCurrentSphereLocation()
	
	#rotateFirstCurrentQbitStateArrow(0,0,0)
	#rotateSecondCurrentQbitStateArrow(PI/2,0,0)
	#rotateFirstGoalQbitStateArrow(PI,0,0)
	#rotateSecondGoalQbitStateArrow(-PI/2,0,0)



func rotateFirstCurrentQbitStateArrow(rotX: float, rotY: float, rotZ: float)->void:
	$Spheres/CurrentSphereView2Qbits.rotateFirstQbitStateArrow(rotX, rotY, rotZ)

func rotateSecondCurrentQbitStateArrow(rotX: float, rotY: float, rotZ: float)->void:
	$Spheres/CurrentSphereView2Qbits.rotateSecondQbitStateArrow(rotX, rotY, rotZ)


func rotateFirstGoalQbitStateArrow(rotX: float, rotY: float, rotZ: float)->void:
	$Spheres/GoalSphereView2Qbits.rotateFirstQbitStateArrow(rotX, rotY, rotZ)

func rotateSecondGoalQbitStateArrow(rotX: float, rotY: float, rotZ: float)->void:
	$Spheres/GoalSphereView2Qbits.rotateSecondQbitStateArrow(rotX, rotY, rotZ)



func updateCurrentQbitSystem(qbitStateMatrix1:Array, qbitStateMatrix2:Array)->void:
	$Matrices/CurrentMatrixView2Qbits.updateQbitSystem(TwoQbitStateFrom1QbitStates(qbitStateMatrix1, qbitStateMatrix2))
	
	var blochAngles: Array = stateToBlochSphereRotation(qbitStateMatrix1)
	rotateFirstCurrentQbitStateArrow(0,-blochAngles[0],blochAngles[1])
	
	blochAngles = stateToBlochSphereRotation(qbitStateMatrix2)
	rotateSecondCurrentQbitStateArrow(0,-blochAngles[0],blochAngles[1])
	


func updateGoalQbitSystem(qbitStateMatrix1:Array, qbitStateMatrix2:Array)->void:
	$Matrices/GoalMatrixView2Qbits.updateQbitSystem(TwoQbitStateFrom1QbitStates(qbitStateMatrix1, qbitStateMatrix2)) 
	
	var blochAngles: Array = stateToBlochSphereRotation(qbitStateMatrix1)
	rotateFirstGoalQbitStateArrow(0,-blochAngles[0],blochAngles[1])
	
	blochAngles = stateToBlochSphereRotation(qbitStateMatrix2)
	rotateSecondGoalQbitStateArrow(0,-blochAngles[0],blochAngles[1])
	




func rotateSpheresHorizontally(rotY: float)->void:
	currentSphereView2Qbits.rotateSpheresHorizontally(rotY)
	goalSphereView2Qbits.rotateSpheresHorizontally(rotY)

func renderSpheres()->void:
	currentSphereView2Qbits.renderSpheres()
	goalSphereView2Qbits.renderSpheres()






