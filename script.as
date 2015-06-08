package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Shape;
	
	public class script extends MovieClip 
	{

		var dobbel:Dobbelsteen = new Dobbelsteen();
		var pion:Pion = new Pion();
		var totalX:int = 15;
		var totalY:int = 0;
		var randomGetal:int = new int();
		var zetten:int = new int();
		var gewonnen:Gewonnen = new Gewonnen();
		var text2:Textfield2 = new Textfield2();
		var beweeg:Boolean = new Boolean();
		var boordGroote:int = 10;
		var beginX:int = 10;
		var beginY:int = 30;
		
		public function script() 
		{	
			dobbel.x = beginX+boordGroote*15;
			dobbel.y = beginY+boordGroote*15;
			
			gewonnen.x = 300;
			gewonnen.y = 150;
			
			text2.x = 150;
			text2.y = 100;
			
			pion.y = 10;
			
			dobbel.stop();
			
			drawBoard(boordGroote,beginX,beginY);
			
			stage.addEventListener(Event.ENTER_FRAME, frameLoop);
			dobbel.addEventListener(MouseEvent.CLICK, dobbelClick);
			
			addChild(pion);
			addChild(text2)
			addChild(dobbel)
			
		}
		
		public function frameLoop(e:Event):void
		{
			//trace(pion.x + " " + totalX)
			text2.textfield2.text = "Aantal zetten: " + zetten
			if (pion.x < totalX)
			{
				pion.x++;
				pion.x++;
				dobbel.mouseEnabled = false;
			}
			if (pion.y < totalY)
			{
				pion.y++;
				pion.y++;
				dobbel.mouseEnabled = false;
			}
			if (pion.x == totalX+1)
			{
				dobbel.mouseEnabled = true;
			}
			
			if (totalX >= (boordGroote+1)*30)
			{
				totalY = totalX-boordGroote*30
			}
			
			/*if (pion.x > beginX+(boordGroote-1)*30)
			{
				pion.x = 15+30*29;
				gewonnen.textfield1.text = "Gewonnen!!\n" + "U heeft " + zetten + " zetten gezet.";
				addChild(gewonnen);
			}
			if (pion.y > beginY+(boordGroote-1)*30)
			{
				pion.y = 15+30*29;
				gewonnen.textfield1.text = "Gewonnen!!\n" + "U heeft " + zetten + " zetten gezet.";
				addChild(gewonnen);
			}*/
		}
		
		public function drawBoard(lengte, dobbelX, dobbelY):void
		{
			var rechthoek:Shape = new Shape()
			var cirkel:Shape = new Shape()
			
			//top row
			
			for (var loopLengte:int = 0; loopLengte < lengte; loopLengte++)
			{
				rechthoek.graphics.lineStyle(3, 0x000000);
				rechthoek.graphics.drawRect((10*(loopLengte*3)+dobbelX), 1+dobbelY, 30, 30);
				addChild(rechthoek);
				cirkel.graphics.lineStyle(3, 0x000000);
				cirkel.graphics.drawCircle(15+((10*(loopLengte*3))+dobbelX), 16+dobbelY, 15);
				addChild(cirkel);
			}
			
			//right row
			
			for (var loopLengte:int = 0; loopLengte < lengte; loopLengte++)
			{
				rechthoek.graphics.lineStyle(3, 0x000000);
				rechthoek.graphics.drawRect(1+dobbelX+(lengte-1)*30,(10*(loopLengte*3)+dobbelY), 30, 30);
				addChild(rechthoek);
				cirkel.graphics.lineStyle(3, 0x000000);
				cirkel.graphics.drawCircle(16+dobbelX+(lengte-1)*30, 15+((10*(loopLengte*3))+dobbelY), 15);
				addChild(cirkel);
			}
			
			//left row
			
			for (var loopLengte:int = 0; loopLengte < lengte; loopLengte++)
			{
				rechthoek.graphics.lineStyle(3, 0x000000);
				rechthoek.graphics.drawRect(1+dobbelX,(10*(loopLengte*3)+dobbelY), 30, 30);
				addChild(rechthoek);
				cirkel.graphics.lineStyle(3, 0x000000);
				cirkel.graphics.drawCircle(15+dobbelX, 16+((10*(loopLengte*3))+dobbelY), 15);
				addChild(cirkel);
			}			
			
			//bottom row
			
			for (var loopLengte:int = 0; loopLengte < lengte; loopLengte++)
			{
				rechthoek.graphics.lineStyle(3, 0x000000);
				rechthoek.graphics.drawRect((10*(loopLengte*3)+dobbelX), 1+dobbelY+(lengte-1)*30, 30, 30);
				addChild(rechthoek);
				cirkel.graphics.lineStyle(3, 0x000000);
				cirkel.graphics.drawCircle(15+((10*(loopLengte*3))+dobbelX), 16+dobbelY+(lengte-1)*30, 15);
				addChild(cirkel);
			}
		}
		
		public function dobbelRandom():int
		{
			if (totalX < (boordGroote+1)*30)
			{
				var getalRandom:int = Math.floor(Math.random()*7);
				if (getalRandom < 1)
				{
					getalRandom = 1;
				}
				totalX += 30*getalRandom;
			}
			else
			{
				var getalRandom:int = Math.floor(Math.random()*7);
				if (getalRandom < 1)
				{
					getalRandom = 1;
				}
				totalY += 30*getalRandom;
			}
			return(getalRandom);
		}
		
		public function dobbelClick(mE:MouseEvent):void
		{
			var randomGetal:int = dobbelRandom();
			zetten++;
			dobbel.gotoAndStop(randomGetal);
		}
	}
}

