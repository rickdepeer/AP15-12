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
		var boordGroote:int = 20;
		var beginX:int = 30;
		var beginY:int = 30;
		var direct:int = 90;
		var total:int = 0;
		
		public function script() 
		{	
			dobbel.x = beginX+boordGroote*15;
			dobbel.y = beginY+boordGroote*15;
			
			gewonnen.x = 300;
			gewonnen.y = 150;
			
			text2.x = 150;
			text2.y = 100;
			
			pion.x = beginX+5;
			pion.y = beginY-20;
			
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
			trace("pion-x:" + pion.x + " total-x:" + totalX  + " pion-y:" + pion.y + " total-y:" + totalY + " direction:" + direct + " total:" + total)
			text2.textfield2.text = "Aantal zetten: " + zetten
			if(direct == 90 && total != 0)
			{
				pion.x++;
				pion.x++;
				total--;
				total--;
				dobbel.mouseEnabled = false;
			}
			if(direct == 180 && total != 0)
			{
				pion.y++;
				pion.y++;
				total--;
				total--;
				dobbel.mouseEnabled = false;
			}
			if(direct == 270 && total != 0)
			{
				pion.x--;
				pion.x--;
				total--;
				total--;
				dobbel.mouseEnabled = false;
			}
			if(direct == 0 && total != 0)
			{
				pion.y--;
				pion.y--;
				total--;
				total--;
				dobbel.mouseEnabled = false;
			}
			if(total == 0)
			{
				dobbel.mouseEnabled = true;
			}
			if (direct == 90)
			{
				totalX = total;
			}
			if (direct == 180)
			{
				totalY = total;
			}
			if (direct == 270)
			{
				totalX = total;
				totalX *= -1;
			}
			if (direct == 0)
			{
				totalY = total;
				totalY *= -1;
			}

			
			if (pion.x >= beginX+5+(boordGroote-1)*30)
			{
				if (direct == 90)
				{
					direct = 180
				}
			}
			if (pion.y >= beginY-20+(boordGroote-1)*30)
			{
				if (direct == 180)
				{
					direct = 270
				}
			}
			if (pion.x < beginX+5)
			{
				if (direct == 270)
				{
					pion.x = beginX+5
					direct = 0
				}
			}
			if ((pion.y > beginY && pion.y < beginY+ 30)&&(pion.x > beginX && pion.x < beginX+30))
			{
				gewonnen.textfield1.text = "Gewonnen!!\n" + "U heeft " + zetten + " zetten gezet.";
				addChild(gewonnen)
			}
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
			var getalRandom:int = Math.floor(Math.random()*7);
			if (getalRandom < 1)
			{
				getalRandom = 1;
			}
			total += 30*getalRandom;

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

