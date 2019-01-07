package arm;

import kha.Color;
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


	private var posXLeft:Float;
	private var posXRight:Float;

	private var posyDown:Float;

	//defualt
	private var posVertical:Float;
	private var posHorizontal:Float;
	private var width:Int;
	private var height:Int;
	//endDfault
	
	private var UP:Bool;
	private var Down:Bool;
	private var Left:Bool;
	private var Right:Bool;

	private var verifica:Timer;
	
	private var corUp:Color;
	private var corUp2:Color;

	private var corDown:Color;
	private var corDown2:Color;

	private var corLeft:Color;
	private var corLeft2:Color;

	private var corRight:Color;
	private var corRight2:Color;

	public function new() {
		super();

		notifyOnInit(function() {
			canvas = Scene.active.getTrait(CanvasScript);
			Scene.active.notifyOnInit(Inicialization);
			 Mouse.get().notify(onMouseDown,onMouseUp,onMouseMove,null);
			
			
			
			verifica= new  Timer(100);
			movimento();

			corUp=Color.Black;
			corUp2=Color.White;
			

			corDown=Color.Black;
			corDown2=Color.White;
			

			corLeft=Color.Black;
			corLeft2=Color.White;
			

			corRight=Color.Black;
			corRight2=Color.White;
			
			
		});
		

		 notifyOnUpdate(function() {


			 
			 object.getTrait(RigidBody).syncTransform();

			 
			 posYup=System.windowHeight()/2+System.windowHeight()/26;
			
			
			 posXRight=System.windowWidth()/6.2;

			 posXLeft=System.windowWidth()/105;

			 posyDown=System.windowHeight()-System.windowHeight()/6;

		     posVertical=System.windowWidth()/12;
			 posHorizontal=System.windowHeight()/2+System.windowHeight()/5.4;
			 width=Std.int(System.windowWidth()/13);
			 height=Std.int(System.windowHeight()/7);

			
		
			
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
public function onMouseDown(button:Int,x:Int,y:Int):Void{
	
	if(posVertical<=x && posYup<=y && posVertical+width>=x && posYup+height>=y){

		UP=true;
		trace("up");
		corUp=Color.White;
		corUp2=Color.Black;
	}
	if(posVertical<=x && posyDown<=y && posVertical+width>=x && posyDown+height>=y){

		Down=true;
		trace("Down");
		corDown=Color.White;
		corDown2=Color.Black;
	}
	if(posXRight<=x && posHorizontal<=y && posXRight+width>=x && posHorizontal+height>=y){

		Right=true;
		trace("Right");
		corRight=Color.White;
		corRight2=Color.Black;
	}


	if(posXLeft<=x && posHorizontal<=y && posXLeft+width>=x && posHorizontal+height>=y){

		Left=true;
		trace("Left");
		corLeft=Color.White;
		corLeft2=Color.Black;
	}

}

 public function onMouseUp(button:Int,x:Int,y:Int):Void{
	if(posVertical<=x && posYup<=y && posVertical+width>=x && posYup+height>=y){

		UP=false;
		corUp=Color.Black;
		corUp2=Color.White;
	}
	if(posVertical<=x && posyDown<=y && posVertical+width>=x && posyDown+height>=y){

		Down=false;
		trace("Down");
		corDown=Color.Black;
		corDown2=Color.White;
	}
	if(posXRight<=x && posHorizontal<=y && posXRight+width>=x && posHorizontal+height>=y){

		Right=false;
		trace("Right");
		corRight=Color.Black;
		corRight2=Color.White;
	}
	if(posXLeft<=x && posHorizontal<=y && posXLeft+width>=x && posHorizontal+height>=y){

		Left=false;
		trace("Left");
		corLeft=Color.Black;
		corLeft2=Color.White;
	}
 }

 public function onMouseMove(x:Int,y:Int,cx:Int,cy:Int):Void{


 }

	function Inicialization(){
		notifyOnRender2D(render2D);


	}


	function render2D(g:kha.graphics2.Graphics): Void {
		
		g.begin(false);
			
			g.color=corUp;
			g.fillRect(posVertical,posYup,width,height);

			g.color=corLeft;
			g.fillRect(posXLeft,posHorizontal,width,height);

			g.color=corRight;
			g.fillRect(posXRight,posHorizontal,width,height);

			g.color=corDown;
			g.fillRect(posVertical,posyDown,width,height);

			g.color=corUp2;
			g.fillRect(posVertical/0.88,posYup/0.96,width/1.5,height/1.5);
			
			g.color=corLeft2;
			g.fillRect(posXRight/8,posHorizontal/0.97,width/1.5,height/1.5);

			//right
			g.color=corRight2;
			g.fillRect(posXRight/0.94,posHorizontal/0.97,width/1.5,height/1.5);
			//down
			g.color=corDown2;
			g.fillRect(posVertical/0.88,posyDown/0.97,width/1.5,height/1.5);
			g.end();
			
	}
}
