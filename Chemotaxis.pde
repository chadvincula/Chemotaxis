 ////////////////Starting different direction variables!



boolean predatorMode = false;
int r;
int changeColor = 5;
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
	//Predator Mode
 	if(predatorMode == false)
 	{
 		r -= changeColor;
 		for(int i = 0; i < Amoeba.length; i++)
 		{
 			Amoeba[i].myStroke -= changeColor;
 			if(Amoeba[i].myStroke < 0)
 			{
 				Amoeba[i].myStroke += changeColor;
 			}
 		}
 		if(r < 0)
 		{
 			r += changeColor;
 		}
 	}
 	else
 	{
 		r += changeColor;
 		for(int i = 0; i < Amoeba.length; i++)
 		{
 			Amoeba[i].myStroke += changeColor;
 			if(Amoeba[i].myStroke > 255)
 			{
 				Amoeba[i].myStroke -= changeColor;
 			}
 			if(mouseX == Amoeba[i].myX && mouseY == Amoeba[i].myY)
 			{
 				Amoeba[i].alive = false;
 			}
 		}
 		if(r > 255)
 		{
 			r -= changeColor;
 		}
 	}
 	background(r, 0, 0);
 	//move and show the bacteria
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
 	//redraw();
 	if(predatorMode == false)
 		predatorMode = true;
 	else
 		predatorMode = false;
}
class Bacteria
{
 	//lots of java!
 	int myX, myY, myColor, myStroke;
 	boolean alive;
 	//int [] direction;
 	Bacteria(int x, int y)
 	{
 		myX = x;
 		myY = y;
 		myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
 		myStroke = 0;
 		alive = true;
 		//direction = {0, 1, 2, 3, 4, 5, 6, 7};
 	}
 	void show()
 	{
 		if(alive != false)
 		{
	 		fill(myColor);
	 		stroke(myStroke);
	 		ellipse(myX, myY, 10, 10);
	 	}
 	}
 	void walk()
 	{
 		//If PredatorMode is False
 		if(predatorMode == false)
 		{
	 		//Left Direction
	 		if(mouseX < myX)
	 		{
	 			myX += (int)(Math.random()*5)-3;
	 		}
	 		//Right Direction
	 		if(mouseX > myX)
	 		{
	 			myX += (int)(Math.random()*5)-1;
	 		}
	 		//Up Direction
	 		if(mouseY < myY)
	 		{
	 			myY += (int)(Math.random()*5)-3;
	 		}
	 		//Down Direction
	 		if(mouseY > myY)
	 		{
	 			myY += (int)(Math.random()*5)-1;
	 		}
	 	}
	 	else
	 	{
	 		//Right Direction
	 		if(mouseX < myX)
	 		{
	 			myX -= (int)(Math.random()*5)-3;
	 		}
	 		//Left Direction
	 		if(mouseX > myX)
	 		{
	 			myX -= (int)(Math.random()*5)-1;
	 		}
	 		//Down Direction
	 		if(mouseY < myY)
	 		{
	 			myY -= (int)(Math.random()*5)-3;
	 		}
	 		//Up Direction
	 		if(mouseY > myY)
	 		{
	 			myY -= (int)(Math.random()*5)-1;
	 		}
	 	}
 		//Unbiased Random Walk
 		/*
 		else
 		{
 			myX += (int)(Math.random()*5)-2;
 			myY += (int)(Math.random()*5)-2;
 		}
 		*/
 	}
}