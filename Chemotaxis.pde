boolean predatorMode = false;
int r;
int changeColor = 5;
int playerX = 200;
int playerY = 200;
Player Me;
//declare bacteria variables here
Bacteria [] Amoeba = new Bacteria[50];;

void setup()
{
	//initialize bacteria variables here
	size(400, 400);
	background(r, 0, 0);
 	for(int i = 0; i < Amoeba.length; i++)
	{
		Amoeba[i] = new Bacteria((int)(Math.random()*399)+1, (int)(Math.random()*399)+1);
		Amoeba[i].myPopulation += 1;
	}
	Me = new Player(playerX, playerY);
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
 			if(Me.myX < Amoeba[i].myX+10 && Me.myX > Amoeba[i].myX-10 && Me.myY < Amoeba[i].myY+10 && Me.myY > Amoeba[i].myY-10)
 			{
 				Amoeba[i].alive = false;
 			}
 		}
 		if(r > 255)
 		{
 			r -= changeColor;
 		}
 	}
 	fill(r, 0, 0, 50);
 	rect(200, 200, 400, 400);
 	//Player
 	Me.show();
 	Me.move();
 	//move and show the bacteria
 	for(int i = 0; i < Amoeba.length; i++)
 	{
 		Amoeba[i].show();
 		Amoeba[i].walk();
 		//text(Amoeba[i].myPopulation, 10, 390);
 	}
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
 	int myX, myY, myColor, myStroke, myPopulation;
 	boolean alive;
 	Bacteria(int x, int y)
 	{
 		myX = x;
 		myY = y;
 		myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
 		myStroke = 0;
 		myPopulation = 0;
 		alive = true;
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
	 			myX -= (int)(Math.random()*7)-4;
	 		}
	 		//Left Direction
	 		if(mouseX > myX)
	 		{
	 			myX -= (int)(Math.random()*7)-2;
	 		}
	 		//Down Direction
	 		if(mouseY < myY)
	 		{
	 			myY -= (int)(Math.random()*7)-4;
	 		}
	 		//Up Direction
	 		if(mouseY > myY)
	 		{
	 			myY -= (int)(Math.random()*7)-2;
	 		}
	 	}
 	}
}

class Player
{
	int myX, myY;
	Player(int x, int y)
	{
		myX = x;
		myY = y;
	}
	void look1()
	{
		noStroke();
		fill(255, 0, 0);
		rectMode(CENTER);
		rect(myX, myY, 20, 20);
	}
	void look2()
	{
		noStroke();
		fill(0);
		ellipse(myX, myY, 10, 10);
		ellipse(myX-3, myY-5, 10, 10);
		ellipse(myX+3, myY-5, 10, 10);
		ellipse(myX-6, myY, 10, 10);
		ellipse(myX+6, myY, 10, 10);
		ellipse(myX-3, myY+5, 10, 10);
		ellipse(myX+3, myY+5, 10, 10);
	}
	void show()
	{
		if(predatorMode == false)
			look1();
		else
			look2();
	}
	void move()
	{
		if(mouseX < myX)
		{
			myX -= 2;
		}
		if(mouseX > myX)
		{
			myX += 2;
		}
		if(mouseY < myY)
		{
			myY -= 2;
		}
		if(mouseY > myY)
		{
			myY += 2;
		}
	}
}