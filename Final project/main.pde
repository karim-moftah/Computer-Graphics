String[][] board = {
  {"", "", ""}, 
  {"", "", ""}, 
  {"", "", ""}
};

int w;      // square width
int h;      // square height
PImage bg_img;
float ang =1;

// game options
// note: when playing with pc it is mentioned as player2 in the code
boolean start=false;
boolean mode=false;
boolean p2=false;
boolean order=false;
boolean end=false;

String result = null;

String startFirst = null;

int boardWidth;
int boardHeight;

String player1;
String player2;
String currentPlayer;

int full_spots = 0;
//int counter = 0;


Drop[] drops = new Drop[50];    // create an array of type Drop to contain the xo drops appearing in welcome page

void setup() {
  size(500, 500);        // window size
  boardHeight=height;
  boardWidth=width;
  w=boardHeight/3;
  h=boardWidth/3;
  bg_img = loadImage("sky.jpg");

  
 //  each element of the array make it an object of Drop
  for (int i=0; i<drops.length; i++)
    drops[i] = new Drop();
}

boolean equals3(String a, String b, String c) {
  return a == b && b == c && a != "";
}

String checkWinner() {
  String winner = null;

  for (int i = 0; i < 3; i++){           // checks on winning columns 
    if (equals3(board[i][0], board[i][1], board[i][2])) {
      winner = board[i][0];
        
    }
}
  for (int i = 0; i < 3; i++) {
    if (equals3(board[0][i], board[1][i], board[2][i])) {  // checks on winning rows 
      winner = board[0][i];
    }
  }
  if (equals3(board[0][0], board[1][1], board[2][2])) {    // checks on diagonal (\)
    winner = board[0][0]; 
  }

  if (equals3(board[2][0], board[1][1], board[0][2]))     // checks on diagonal (/) 
    winner = board[2][0];

  int openSpots = 0;
  for (int i = 0; i < 3; i++) 
    for (int j = 0; j < 3; j++) 
      if (board[i][j] == "") 
        openSpots++;

// checks there is winning or tie (no winner and no remaining spots)
  if (winner == null && openSpots == 0) return "tie";
  else return winner;
}

void mousePressed() {

  if (!mode) { 
    if (mouseX>(width/2)-80 && mouseX<(width/2)+80 && mouseY>220 && mouseY<270) {
      // 300 > mousex > 200
      // 270 > mousey > 220
      // this is to choose playing against PC
      mode=true;
 
    } else if (mouseX>(width/2)-80 && mouseX<(width/2)+80 && mouseY>290 && mouseY<340) {
      // 300 > mousex > 200
      // 340 > mousey > 290
      // this is to choose playing as 2 players
      mode=true;
      p2=true;
      order= true;  
    }
  } else if (!start) {
    if (mouseX>80 && mouseX<180 && mouseY>200 && mouseY<300) { // O
      // choosing to play with O
      player1="O";
      player2="X";
      start=true; 
      currentPlayer=player1;
    } else if (mouseX>320 && mouseX<420 && mouseY>200 && mouseY<300) { // X
     // choosing to play with X
      player2="O";
      player1="X";
      currentPlayer=player1;
      start=true;
    }
  } else if (!order) {         // choosing who starts first if choosing to play with PC
    if (mouseX>80 && mouseX<180 && mouseY>200 && mouseY<300) {
      order=true;
      startFirst = "human";
      currentPlayer=player1;
    } else if (mouseX>320 && mouseX<420 && mouseY>200 && mouseY<300) {
      order=true;
      startFirst = "pc";
      currentPlayer=player2;
      pcMove();
    }
  } else if (end) { 
      // at the end of each game clean all the variables and the board to use them again 

    // Replay Button Action
    if (mouseX>(width/2)-70 && mouseX<(width/2)+70 && mouseY>220 && mouseY<270) {
      end=false;
      result = null;
      full_spots = 0;
      //counter = 0;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          board[i][j] = "";
        }
      }
      if (startFirst == "pc" && order && !p2) {
        currentPlayer=player2;
        pcMove(); 
      }
    } else if (mouseX>(width/2)-70 && mouseX<(width/2)+70 && mouseY>290 && mouseY<340) {
    // Replay Button Action
      result = null;
      full_spots = 0;
      //counter = 0;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          board[i][j] = "";
        }
      }
      end=false;
      mode = false;
      start = false;
      order=false;
      p2=false;
    } else if(mouseX>(width/2)-70 && mouseX<(width/2)+70 && mouseY>360 && mouseY<410) {
       // Exit Button Action
      exit();
    }
    
  } else {      // mode = true, start = true, order = true, end = false 
    if (p2) {      // playing in 2 players mood
      if (currentPlayer == player2) {
        int i = floor(mouseX / w);
        int j = floor(mouseY / h);
        if (board[i][j] == "") {
          board[i][j] = player2;
          full_spots ++;
          currentPlayer = player1;
        }
      } else {
        int i = floor(mouseX / w);
        int j = floor(mouseY / h);
        if (board[i][j] == "") {
          board[i][j] = player1;
          full_spots++;
          currentPlayer = player2;
        }
      }
    } else {      // playing with PC mood
      if (currentPlayer == player1) {
        int i = floor(mouseX / w);
        int j = floor(mouseY / h);
        if (board[i][j] == "") {
          board[i][j] = player1;
          full_spots++;
          if(full_spots < 9){             // to avoid stackoverflow
            currentPlayer = player2;
            pcMove();
          }
          
        }
      }
    }
  }
}

void draw() {        // starts from the begining of the window

  image(bg_img,0,0); //background(bg_img);
 
  for (int i=0; i<drops.length; i++) {  // Draw Droping x and o
    drops[i].fall();  
    drops[i].show();
  }
  if (!mode && !end) {      // Home Screen

    //fill(251, 197, 49);
    //noStroke();
    //rect(0, 60, width, 80);    // rect(x,y, width, height)  --> x,y 

    pushMatrix();
    fill(9, 132, 227);
    textSize(30);
    strokeWeight(5);
    translate(250,250);
    rotate(ang);
    ang+=0.01;
    text("Tic Tac Toe", 80, 125); 		// text, lower left 
    popMatrix();

    fill(251, 197, 49);
    noStroke();
    rect((width/2)-80, 220, 160, 50, 50);   // rect( x_pos, y_pos, width, height, border-redius)
    noStroke();
    rect((width/2)-80, 290, 160, 50, 50);
    fill(9, 132, 227);
   
    textSize(32);
    text("PC", 230, 255); 
    textSize(28);
    text("2 Players", 190, 325);
  }

  if (!start && mode && !end) {      // choosing to play with x or o page

    fill(251, 197, 49);
    noStroke();
    rect(0, 60, width, 50);


    fill(9, 132, 227);
    textSize(32);
    strokeWeight(5);
    text("Start Playing With", 130, 95); 

    fill(251, 197, 49);
    noStroke();
    rect(80, 200, 100, 100, 10);    // o rect
    fill(251, 197, 49);
    noStroke();
    rect(width-180, 200, 100, 100, 10);    // x rect

    fill(251, 197, 49);
    noStroke();
    rect((width/2)-25, 225, 50, 50, 10);  // OR rect

    fill(9, 132, 227);
    textSize(25);
    text("OR", 235, 260); 

    stroke(140, 122, 230);
    noFill();
    ellipse(130, 250, 60, 60);

    float xr = 30;
    line(370 - xr, 250 - xr, 370 + xr, 250 + xr);
    line(370 + xr, 250 - xr, 370 - xr, 250 + xr);
  }

  if (!order && start && mode && !p2 && !end) {    // if playing with PC .. choosing which order to play in page

    fill(251, 197, 49);
    noStroke();
    rect(0, 60, width, 50);


    fill(9, 132, 227);
    textSize(32);
    strokeWeight(5);
    text("You want to play in", 130, 95); 

    fill(251, 197, 49);
    noStroke();
    rect(80, 200, 100, 100, 10);

    fill(251, 197, 49);
    noStroke();
    rect(width-180, 200, 100, 100, 10);

    fill(251, 197, 49);
    noStroke();
    rect((width/2)-25, 225, 50, 50, 10);

    fill(9, 132, 227);
    textSize(25);
    text("OR", 235, 260);

    stroke(0);
    textSize(64);
    text("1", 115, 270); 

    textSize(64);
    text("2", 350, 270);
  }

  if (start && mode && order) {       // drawing the board
    background(156, 136, 255);
    strokeWeight(4);
    
    // vertical lines
    line(w, 0, w, boardHeight);      // line(x1, y1, x2, y2)
    line(w * 2, 0, w * 2, boardHeight);
    
    //horizontal lines
    line(0, h, boardWidth, h);
    line(0, h * 2, boardWidth, h * 2);

    for (int j = 0; j < 3; j++) {
      for (int i = 0; i < 3; i++) {
       // finding the center of each square of the 9 squares
        float x = w * i + w / 2;
        float y = h * j + h / 2;
        // for each element of the board array draw the coresponding shape in its place
        String spot = board[i][j];
        textSize(32);
        if (spot=="O") {
          noFill();
          ellipse(x, y, w / 2, h / 2);
        } else if (spot == "X") {
          float xr = w / 4;
          line(x - xr, y - xr, x + xr, y + xr);
          line(x + xr, y - xr, x - xr, y + xr);
        }
      }
    }

    result = checkWinner();
    if (result != null) {
      end = true;
      //delay(5000);
    }
    

    if (end) {
      
      

      image(bg_img,0,0);         // drawing image at the end of each game
      for (int i=0; i<drops.length; i++) {
        drops[i].fall();
        drops[i].show();
      }
     
      fill(251, 197, 49);
      noStroke();
      rect(0, 60, width, 80);


      fill(9, 132, 227);
      textSize(70);
      strokeWeight(5);
      if (result == "tie") {
        text("Tie!", 200, 125);
      } else {
        text(result+" wins!", 150, 125);
      }

      fill(251, 197, 49);
      noStroke();
      rect((width/2)-70, 220, 140, 50, 10);    // Replay Button
      noStroke();
      rect((width/2)-70, 290, 140, 50, 10);    // Go Home Button
      noStroke();
      rect((width/2)-70, 360, 140, 50, 10);    // Exit Button
      fill(0, 102, 153);
      textSize(32);
      text("Replay", 205, 255);
      textSize(28);
      text("Go Home", 190, 325);
      text("Exit", 225, 395);
    }
  }
}


void pcMove() {
  
  int i = int(random(0,3)), j = int(random(0,3));
  if (board[i][j] == "") {
    board[i][j] = player2;
    full_spots++;
    currentPlayer = player1;
  }else{
    //counter++;
    pcMove();
    
  }

}


    //if(counter > 20 && full_spots == 8){
    //  for (int x = 0; x < 3; x++) {
    //    for (int y = 0; y < 3; y++) {
    //      if (board[x][y] == ""){
    //        board[x][y] =player2;
    //        full_spots++;
    //        currentPlayer = player1;
    //        //return;
    //      }        
    //    }
    //  }
    //}
    
