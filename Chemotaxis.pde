 ////////////////Starting different direction variables!




 //declare bacteria variables here
 Bacteria [] Amoeba = new Bacteria[50];
 void setup()
 {
 	//initialize bacteria variables here
 	size(400, 400);
 	for(int i = 0; i < Amoeba.length; i++)
 	{
 		Amoeba[i] = new Bacteria((int)(Math.random()*399)+1, (int)(Math.random()*399)+1);
 	}
 	//Amoeba = new Bacteria(200,200);
 }
 void draw()
 {
 	//move and show the bacteria
 	background(0);
 	for(int i = 0; i < Amoeba.length; i++)
 	{
 		Amoeba[i].show();
 		Amoeba[i].walk();
 	}
 	//Amoeba.show();
 	//Amoeba.walk();
 }
 void mousePressed()
 {
 	redraw();
 }
 class Bacteria
 {
 	//lots of java!
 	int myX, myY, myColor;
 	int [] direction;
 	Bacteria(int x, int y)
 	{
 		myX = x;
 		myY = y;
 		myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
 		direction = {0, 1, 2, 3, 4, 5, 6, 7};
 	}
 	void show()
 	{
 		fill(myColor);
 		ellipse(myX, myY, 10, 10);
 	}
 	void walk()
 	{
 		myX += (int)(Math.random()*5)-2;
 		myY += (int)(Math.random()*5)-2;
 	}
 }