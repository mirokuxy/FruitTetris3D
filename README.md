# FruitTetris3D
This is a readme file for FruitTetris3D game for assignment 2 of CMTP361 at SFU


## Make the game:
```make```

## Execute the game:
```./FruitTetris3D```

## Game Instructions

1) to manipulate camera

* ctrl + 'up' : move up
* ctrl + 'down' : move down
* ctrl + 'left' : move left
* ctrl + 'right' : move right
* mouse roll forward : magnify objects / decrease FOV
* mouse roll backward : minify objects / increase FOV

PS : The camera always looks at the center of the game window

2) to manipulate the robot arm

* 'w' : move up
* 's' : move down
* 'a' : move left
* 'd' : move right
* 'space' : drop fruit

3) to manipulate tiles

* 'up' (direction key) : rotate the tile
* 'down' (direction key) : accelerate falling
* 'space' : shuffle the fruits within the tile

4) general game control

* 'z' : suspend game / continue game
* 'r' : restart game
* 'q' : quit game 

## Game Logic Explanation

1) Any full row will be removed

2) Any consecutive 3 fruits of the same the kind will be removed

3) Remove happens after tiles lands

4) 1) & 2) can happen at the same time

5) After remove happens, fruits that are then not connected to the ground (directly or indirectly) will begin to fall

6) Falling fruits that are connected to each other will fall as a whole

7) Falling ends only when the connected fruits as a whole lands on some ground

8) When any of these new falling fruits is still falling, no user-controlled tile will generate, nor can user control these free falling fruits

9) After all the free falling fruits lands, a user-controlled tile will be generated immediately

new about robot arm:

10) tile cannot be shuffled or rotated when on a robot arm

11) tile cannot no longer be moved left or right after leaving the robot arm

12) tile cannot be dropped from robot arm when it's out side of the game window or colliding with other tiles

13) when countdown time goes to 0, if the current tile is inside the game window and not colliding with other tiles then it will fall at the current position, otherwise it will fall from the top-center of the game window.

## File Directory Explanation

include/ :
	GLM lib headers ( for mathmatical calculation )
	SOIL lib headers and libs ( for loading textures )
	FreeType lib headers and libs ( for font loading and text rendering )
	My own headers ( shader class; camera class; cube class; tile class; window class; robot class)

shader/ :
	vertex shaders
	fragment shaders

texture/ :
	texture files

fonts/ :
	fonts

Tetris.cpp : 
	Main program

Makefile :
	makefile file

## Steps not completed
NONE

## Additional Features

1) lighting effect
	1: robot arm has following 3 lightings:
			ambient light
			diffuse light
			specular light
	2: a moving light source

2) text rendering
	1: promt text indicating the 'q' and 'r' operation
	2: countdown time text
	3: game over text

3) blending effect
	1: robot arms (not including the base) are drawn with a 0.8 transparency rate, so that the arms will not hide the tiles completely.
	2: text with blending

4) camera control :
	camera can move up and down

5) Texture :
	Each kind of fruit is represented by a corresponding picture with corresponding color.

6) Game Control :
	'z' to suspend and continue game;

7) Multiple Shaders :

	tiles 			: vshader.glsl , 		fshader.glsl
	background grid : vshaderGrid.glsl , 	fshaderGrid.glsl
	light source 	: lightVshader.glsl , 	lightFshader.glsl
	robot arm 		: robotVshader.glsl , 	robotFshader.glsl
	text 			: textVshader.glsl , 	textFshader.glsl

