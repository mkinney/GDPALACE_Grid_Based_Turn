/// @description 
//Array contents
enum ar{
	piece,
	team
}

//Pieces
enum piece{
	circle,
	square,
	triangle
}

pieceSprite[piece.circle] = sCircle;
pieceSprite[piece.square] = sSquare;
pieceSprite[piece.triangle] = sTriangle;

//Board
cellSize = 64;
boardW = 8;
boardH = 8;

board = ds_grid_create(boardW, boardH);

//Vars
turn = 0;
state = 0;

selectedX = -1;
selectedY = -1;
selectedPiece = -1;

//Place pieces
for(var i=0; i<boardW; i++){
	//Team 0
	var aPiece = choose(piece.circle, piece.square, piece.triangle);
	var aTeam = 0;
	
	board[# i, 0] = [aPiece, aTeam];
	
	//Team 1
	var aPiece = choose(piece.circle, piece.square, piece.triangle);
	var aTeam = 1;
	
	board[# i, boardH-1] = [aPiece, aTeam];
}