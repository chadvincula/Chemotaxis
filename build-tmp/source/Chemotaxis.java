import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Chemotaxis extends PApplet {

 //declare bacteria variables here
 Bacteria Amoeba;
 public void setup()   
 {     
 	//initialize bacteria variables here
 	size(400, 400);
 	Amoeba = new Bacteria(200,200);
 }   
 public void draw()   
 {    
 	//move and show the bacteria
 	background(0);
 	Amoeba.show();
 	Amoeba.walk();
 }
 public void mousePressed()
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
 	public void show()
 	{
 		fill(myColor);
 		ellipse(myX, myY, 10, 10);
 	}
 	public void walk()
 	{
 		myX += (int)(Math.random()*6)-3;
 		myY += (int)(Math.random()*6)-3;
 	}
 }    
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Chemotaxis" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
