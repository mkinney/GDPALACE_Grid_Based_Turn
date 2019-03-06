/// @description 
//Mouse position
mouseX = mouse_x - x;
mouseY = mouse_y - y;
mouseCellX = mouseX div cellSize;
mouseCellY = mouseY div cellSize;

mouseIn = point_in_rectangle(mouseX, mouseY, 0, 0, boardW*cellSize, boardH*cellSize);

var mousePress = mouse_check_button_pressed(mb_left);

//Press
if (mouseIn && mousePress){
	//State 0
	if (state==0){
		//Get array
		var arr = board[# mouseCellX, mouseCellY];
		
		if (is_array(arr)){
			//Get info
			var aPiece = arr[ar.piece];
			var aTeam = arr[ar.team];
		
			//Accept
			if (aTeam==turn){
				//Save selected cell
				selectedX = mouseCellX;
				selectedY = mouseCellY;
				selectedPiece = aPiece;
				
				//State
				state = 1;
			}
		}
	}
	//State 1
	else if (state==1){
		//Get array
		var arr = board[# mouseCellX, mouseCellY];
		
		//If empty, accept
		if (arr==0){
			//Empty selected cell
			board[# selectedX, selectedY] = 0;
			
			//Move to new place
			board[# mouseCellX, mouseCellY] = [selectedPiece, turn];
			
			//State
			state = 0;
			
			//Turn
			turn = !turn;
			
			//Reset selected
			selectedX = -1;
			selectedY = -1;
			selectedPiece = -1;
		}
	}
}

//Canceling
if (mouse_check_button_pressed(mb_right) && state==1){
	state = 0;
	
	selectedX = -1;
	selectedY = -1;
	selectedPiece = -1;
}