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
		var beginX:int = 30;
		var beginY:int = 30;
		var direct:int = 90;
		var total:int = 0;
		var hoekWidth:int = 50;
		var hoekHeight:int = 30;
		var hoek:int = 0;
		
		public function script() 
		{	
			dobbel.x = beginX+boordGroote*hoekWidth/2;
			dobbel.y = beginY+boordGroote*hoekWidth/2;
			
			gewonnen.x = beginY+boordGroote*hoekWidth/2;
			gewonnen.y = beginY+boordGroote*hoekWidth/2;
			
			text2.x = beginY+boordGroote*hoekWidth/2-70;
			text2.y = beginY+boordGroote*hoekWidth/2-100;
			
			pion.x = beginX+5;
			pion.y = beginY-20;
			
			dobbel.stop();
			
			drawBoard(boordGroote, beginX ,beginY, hoekWidth, hoekHeight);
			
			stage.addEventListener(Event.ENTER_FRAME, frameLoop);
			dobbel.addEventListener(MouseEvent.CLICK, dobbelClick);
			
			addChild(pion);
			addChild(text2)
			addChild(dobbel)
		}
		
		public function frameLoop(e:Event):void
		{
			trace("pion-x:" + pion.x + " total-x:" + totalX  + " pion-y:" + pion.y + " total-y:" + totalY + " direction:" + direct + " total:" + total + " hoek:" + hoek)
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

			
			if (pion.x >= beginX+5+(boordGroote-1)*hoekWidth+hoekWidth/2)
			{
				if (direct == 90)
				{
					if (odd(hoekWidth/2))
					{
						total += hoekWidth/2+1
					}
					else
					{
						total += hoekWidth/2
					}
					direct = 180
					
				}
			}
			if (pion.y >= beginY-20+(boordGroote-1)*hoekWidth+hoekWidth/2)
			{
				if (direct == 180)
				{
					if (odd(hoekWidth/2))
					{
						total += hoekWidth/2+1
					}
					else
					{
						total += hoekWidth/2
					}
					direct = 270
				}
			}
			if (pion.x < beginX+5)
			{
				if (direct == 270)
				{
					if (odd(hoekWidth/2))
					{
						total += hoekWidth/2+1
					}
					else
					{
						total += hoekWidth/2
					}
					pion.x = beginX+5
					direct = 0
				}
			}
			if ((pion.y > beginY && pion.y < beginY+ 30)&&(pion.x > beginX && pion.x < beginX+30))
			{
				total = 0;
				gewonnen.textfield1.text = "Gewonnen!!\n" + "U heeft " + zetten + " zetten gezet.";
				addChild(gewonnen)
			}
		}
		function odd(nummer:int):Boolean
		{
			//check if the number is odd or even
			if (nummer % 2 == 0)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		public function drawBoard(lengte:int, dobbelX:int, dobbelY:int, dobbelWidth:int, dobbelHeight:int):void
		{
			var rechthoek:Shape = new Shape()
			var cirkel:Shape = new Shape()
			
			if (hoekHeight < hoekWidth)
			{
				hoek = hoekHeight/2+5
			}
			
			//top row
			
			for (var loopLengte:int = 0; loopLengte < lengte; loopLengte++)
			{
				rechthoek.graphics.lineStyle(3, 0x000000);
				rechthoek.graphics.drawRect((10*(loopLengte*(dobbelWidth/10))+dobbelX), 1+dobbelY, dobbelWidth, dobbelHeight);
				addChild(rechthoek);
			}
			
			//right row
			
			for (var loopLengte:int = 0; loopLengte < lengte; loopLengte++)
			{
				rechthoek.graphics.lineStyle(3, 0x000000);
				rechthoek.graphics.drawRect(1+dobbelX+(lengte-1)*dobbelWidth+hoek,(10*(loopLengte*(dobbelWidth/10))+dobbelY), dobbelHeight, dobbelWidth);
				addChild(rechthoek);
			}
			
			//left row
			
			for (var loopLengte:int = 0; loopLengte < lengte; loopLengte++)
			{
				rechthoek.graphics.lineStyle(3, 0x000000);
				rechthoek.graphics.drawRect(1+dobbelX,(10*(loopLengte*dobbelWidth/10)+dobbelY), dobbelHeight, dobbelWidth);
				addChild(rechthoek);
			}			
			
			//bottom row
			
			for (var loopLengte:int = 0; loopLengte < lengte; loopLengte++)
			{
				rechthoek.graphics.lineStyle(3, 0x000000);
				rechthoek.graphics.drawRect((10*(loopLengte*(dobbelWidth/10))+dobbelX), 1+dobbelY+(lengte-1)*dobbelWidth+hoek, dobbelWidth, dobbelHeight);
				addChild(rechthoek);
			}
		}
		
		public function dobbelRandom():int
		{
			var getalRandom:int = Math.floor(Math.random()*7);
			if (getalRandom < 1)
			{
				getalRandom = 1;
			}
			total += hoekWidth*getalRandom;

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

