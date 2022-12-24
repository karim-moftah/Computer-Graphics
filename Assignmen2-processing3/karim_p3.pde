size(900, 600);
// sea
fill(0, 0, 255,182); // Blue color
noStroke();
rect(0,500,900,100);

// buttom ship
fill(155, 10, 10,182);
quad(200,500,100,425,600,425,500,500);

// waves
int x=25;
for(int i=0;i<=17;i++){
fill(0, 0, 255,182); // Blue color
arc(x,500,50,40,radians(180),radians(360));
x+=50;
noStroke();
}

//background
fill(204,255,255,100);
rect(0,0,900,425);

// middle ship
fill(25, 125, 123,182);
rect(200,350,300,75);
fill(150, 0, 200,255);
rect(250,375,50,25);
fill(150, 0, 200,255);
rect(350,375,50,25);


// upper ship
fill(45, 120, 200,255);
rect(300,320,100,30);

// flag
fill(30, 30, 30,255);
rect(170,200,15,225);

fill(255, 0, 0,255);
rect(25,200,145,25);

fill(255, 255, 255,255);
rect(25,225,145,25);

fill(0, 0, 0,255);
rect(25,250,145,25);


// sun
fill(255, 255, 120,255);
arc(100,75,100,100,radians(0),radians(360));

//cloud
fill(153, 255, 255,255);
ellipse(400,75,100,50);
ellipse(450,75,100,50);
ellipse(600,75,100,50);
ellipse(650,75,100,50);

// land
fill(204, 204, 0,255);
arc(750,450,250,50,radians(180),radians(360));

// tree
fill(102, 0, 51,255);
rect(740,200,30,225);
fill(76, 153, 0,255);
triangle(650,220,750,100,840,220);
triangle(650,250,750,130,840,250);

// fish
fill(255, 153, 51,255);
arc(500,550,40,30,radians(30),radians(330));
ellipse(410,550,170,40);
fill(0, 0, 0,255);
ellipse(350,550,8,8);

fill(255, 153, 255,255);
arc(200,550,40,30,radians(30),radians(330));
ellipse(110,550,170,40);
fill(0, 0, 0,255);
ellipse(50,550,8,8);
