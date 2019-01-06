package arm;
import iron.system.Time;
import kha.System;
import iron.Scene;
import armory.trait.internal.CanvasScript;
import armory.trait.physics.RigidBody;
import kha.input.Mouse;
import haxe.Timer;

class Player extends iron.Trait {
	private var addX:Int;
	private var addY:Int;

	private var canvas:CanvasScript;

	
	private var posYup:Float;
	private var widthUp:Float;

	private var posXLeft:Float;
	private var posXRight:Float;

	private var posyDown:Float;

	//defualt
	private var posVertical:Float;
	private var posHorizontal:Float;
	private var width:Float;
	private var height:Float;
	
	private var UP:Bool;
	private var Down:Bool;
	private var Left:Bool;
	private var Right:Bool;

	private var verifica:Timer;

	public function new() {
		super();

		notifyOnInit(function() {
			canvas = Scene.active.getTrait(CanvasScript);
			
			 Mouse.get().notify(onMouseLeft,onMouseUp,onMouseMove,null);
			
			verifica= new  Timer(100);
			movimento();
			
		});
		

		 notifyOnUpdate(function() {


			 
			 object.getTrait(RigidBody).syncTransform();

			 
			 posYup=System.windowHeight()/2+System.windowHeight()/26;
			
			
			 posXLeft=System.windowWidth()/6.2;

			 posXRight=System.windowWidth()/105;

			 posyDown=System.windowHeight()-System.windowHeight()/6;

		     posVertical=System.windowWidth()/12;
			 posHorizontal=System.windowHeight()/2+System.windowHeight()/5.4;
			 width=Std.int(System.windowWidth()/13);
			 height=Std.int(System.windowHeight()/7);

			 canvas.getElement("Up").x=posVertical;
			 canvas.getElement("Up").y=posYup;
			 canvas.getElement("Up").width=Std.int(widthUp);
			 canvas.getElement("Up").height=Std.int(height);

			 canvas.getElement("Left").x=posXLeft;
			 canvas.getElement("Left").y=posHorizontal;
			 canvas.getElement("Left").width=Std.int(width);
			 canvas.getElement("Left").height=Std.int(height);

			 canvas.getElement("Right").x=posXRight;
			 canvas.getElement("Right").y=posHorizontal;
			 canvas.getElement("Right").width=Std.int(width);
			 canvas.getElement("Right").height=Std.int(height);
			
			 canvas.getElement("Down").x=posVertical;
			 canvas.getElement("Down").y=posYup;
			 canvas.getElement("Down").width=Std.int(widthUp);
			 canvas.getElement("DOwn").height=Std.int(height);
			
		
			 

		 });

		// notifyOnRemove(function() {
		// });
	}
	
	
	
	function movimento(){
	verifica.run=function (){
		if(UP){

			addX-=1;
		
			object.transform.loc.x=addX;
			object.transform.buildMatrix();

			 }
		if(Down){

			addX+=1;
		
			object.transform.loc.x=addX;
			object.transform.buildMatrix();

		 }
		 if(Left){

			addY+=1;
		
			object.transform.loc.y=addY;
			object.transform.buildMatrix();

		 }
		  if(Right){

			addY-=1;
		
			object.transform.loc.y=addY;
			object.transform.buildMatrix();

		 }

			}


	}
public function onMouseLeft(button:Int,x:Int,y:Int):Void{
	
	if(posVertical<=x && posYup<=y && posVertical+width>=x && posYup+height>=y){

		UP=true;
		trace("up");
	}
	if(posVertical<=x && posyDown<=y && posVertical+width>=x && posyDown+height>=y){

		Down=true;
		trace("Down");
	}
	if(posXLeft<=x && posHorizontal<=y && posXLeft+width>=x && posHorizontal+height>=y){

		Left=true;
		trace("Left");
	}


	if(posXRight<=x && posHorizontal<=y && posXRight+width>=x && posHorizontal+height>=y){

		Right=true;
		trace("Right");
	}

}

 public function onMouseUp(button:Int,x:Int,y:Int):Void{
	if(posVertical<=x && posYup<=y && posVertical+width>=x && posYup+height>=y){

		UP=false;
	}
	if(posVertical<=x && posyDown<=y && posVertical+width>=x && posyDown+height>=y){

		Down=false;
		trace("Down");
	}
	if(posXLeft<=x && posHorizontal<=y && posXLeft+width>=x && posHorizontal+height>=y){

		Left=false;
		trace("Left");
	}
	if(posXRight<=x && posHorizontal<=y && posXRight+width>=x && posHorizontal+height>=y){

		Right=false;
		trace("Right");
	}
 }

 public function onMouseMove(x:Int,y:Int,cx:Int,cy:Int):Void{


 }

	

}
