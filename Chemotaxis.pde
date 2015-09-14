 //declare bacteria variables here
 Bacteria Amoeba;
 void setup()   
 {     
 	//initialize bacteria variables here
 	size(400, 400);
 	Amoeba = new Bacteria(200,200);
 }   
 void draw()   
 {    
 	//move and show the bacteria
 	background(0);
 	Amoeba.show();
 	Amoeba.walk();
 }
 void mousePressed()
 {
 	redraw();
 }
 class Bacteria    
 {     
 	//lots of java!
 	int myX, myY, myColor;
 	Bacteria(int x, int y)
 	{
 		myX = x;
 		myY = y;
 		myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
 	}
 	void show()
 	{
 		fill(myColor);
 		ellipse(myX, myY, 10, 10);
 	}
 	void walk()
 	{
 		myX += (int)(Math.random()*6)-3;
 		myY += (int)(Math.random()*6)-3;
 	}
 }    