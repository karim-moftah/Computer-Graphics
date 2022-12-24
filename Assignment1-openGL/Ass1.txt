#include<windows.h>
#include<GL\glut.h>
#include<GL\gl.h>
void linesegment (void)
{
	glClear(GL_COLOR_BUFFER_BIT);
    // grey
	glColor3f(0.87,0.83,.83);
	glBegin(GL_POLYGON);
	 glVertex2i(0,300);
	glVertex2i(0,100);
	glVertex2i(1000,100);
	glVertex2i(1000,300);
	glEnd();

    // bottom-ship
	glColor3f(0.0,0.4,0.4);
	glBegin(GL_POLYGON);
	 glVertex2i(200,100);
	glVertex2i(500,100);
	glVertex2i(600,175);
	glVertex2i(100,175);
	glEnd();


    // sea
	glColor3f(0.0,0.0,1.0);
	glBegin(GL_POLYGON);
    glVertex2i(0,0);
	glColor3f(0.0,0.0,1.0);
	glVertex2i(0,100);
    glVertex2i(1000,100);
    glVertex2i(1000,0);
	glEnd();






    //middle-ship
    glColor3f(0.4,0.5,0.5);
	glBegin(GL_POLYGON);
	 glVertex2i(200,250);
	glVertex2i(500,250);
	glVertex2i(500,175);
	glVertex2i(200,175);
	glEnd();
	//-----
	glColor3f(1.0,.4,.7);
	glBegin(GL_POLYGON);
	 glVertex2i(250,225);
	glVertex2i(250,200);
	glVertex2i(300,200);
	glVertex2i(300,225);
	glEnd();


    glColor3f(1.0,.4,.7);
	glBegin(GL_POLYGON);
	 glVertex2i(350,225);
	glVertex2i(350,200);
	glVertex2i(400,200);
	glVertex2i(400,225);
	glEnd();

//top ship
glColor3f(.8,1.,.8);
	glBegin(GL_POLYGON);
	 glVertex2i(300,280);
	glVertex2i(300,250);
	glVertex2i(400,250);
	glVertex2i(400,280);
	glEnd();

// green
glColor3f(0.0,0.5,0.0);
	glBegin(GL_POLYGON);
	 glVertex2i(0,550);
	glVertex2i(0,300);
	glVertex2i(1000,300);
	glVertex2i(1000,550);
	glEnd();

// upper
	glColor3f(0.6,0.8,.9);
	glBegin(GL_POLYGON);
	 glVertex2i(0,600);
	glVertex2i(0,550);
	glVertex2i(1000,550);
	glVertex2i(1000,600);
	glEnd();

	// root
	glColor3f(0.5,0.0,0.0);
	glBegin(GL_POLYGON);
	 glVertex2i(600,450);
	glVertex2i(600,320);
	glVertex2i(700,320);
	glVertex2i(700,450);
	glEnd();

		// leaves
	glColor3f(0.1,0.8,0.5);
	glBegin(GL_POLYGON);
	 glVertex2i(650,520);
	glVertex2i(550,450);
	glVertex2i(750,450);

	glEnd();

	glFlush();

}
void init (void)
{
	glClearColor(1.0,1.0,1.0,0.0); //specifies clear 	values for the color buffers (R,G,B,Alpha)
	glMatrixMode(GL_PROJECTION); // sets the 	current matrix mode
	gluOrtho2D(0.0,1000.0,0.0,600.0); //2D orthographic 	projection matrix (left,right,bottom,top)
}
int main (int argc, char** argv)
{
	glutInit(&argc,argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB); //sets 	the initial display mode
	glutInitWindowPosition(50,100); //sets the initial window 	position
    	glutInitWindowSize(700,600); //sets the initial window size
    	glutCreateWindow("Assignment01"); // creates the window with name line
	init();
	glutDisplayFunc(linesegment); //sets the display callback for 	the current window.
	glutMainLoop(); // enters the GLUT event processing loop
return 0;
}
