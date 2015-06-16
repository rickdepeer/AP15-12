package  
{
	// imports
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Shape;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	
	public class script extends MovieClip 
	{
		// variable declarations
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
		var hoekWidth:int = 80;
		var hoekHeight:int = 80;
		var hoek:int = 0;
		var burgerking:Burgerking = new Burgerking();
		var cena:Cena = new Cena();
		var mcdonalds:Mcdonalds = new Mcdonalds();
		var mediamarkt:Mediamarkt = new Mediamarkt();
		var jumbo:Jumbo = new Jumbo();
		var primark:Primark = new Primark();
		var macelaviv:Macelaviv = new Macelaviv();
		var bartsmit:Bartsmit = new Bartsmit();
		var euromast:Euromast = new Euromast();
		var mijnNaam:String = "Rick";
		var beginscherm:Beginscherm = new Beginscherm();
		var beginknop:Beginknop = new Beginknop();
		var bkvraag:Bkvraag = new Bkvraag();
		var bkant1:Bkant1 = new Bkant1();
		var bkant2:Bkant2 = new Bkant2();
		var score:int = 0
		var vraaggesteld:Boolean = false;
		var randomNummer:int = 1 // default == 7
		
		public function script() 
		{	
			//Foto positions
			burgerking.x = beginX + hoekWidth * 3;
			burgerking.y = beginY;
			burgerking.height = hoekHeight;
			burgerking.width = hoekWidth;
			
			cena.x = beginX + hoekWidth * 6;
			cena.y = beginY;
			cena.height = hoekHeight;
			cena.width = hoekWidth;
			
			mcdonalds.x = beginX + hoekWidth * boordGroote - 80;
			mcdonalds.y = beginY + hoekHeight * 6;
			mcdonalds.height = hoekHeight;
			mcdonalds.width = hoekWidth;
			
			mediamarkt.x = beginX + hoekWidth * boordGroote - 80;
			mediamarkt.y = beginY + hoekHeight * 3;
			mediamarkt.height = hoekHeight;
			mediamarkt.width = hoekWidth;
			
			jumbo.x = beginX + hoekWidth * 6;
			jumbo.y = beginY + hoekHeight * 9;
			jumbo.height = hoekHeight;
			jumbo.width = hoekWidth;
			
			primark.x = beginX + hoekWidth * 12;
			primark.y = beginY + hoekHeight * 14;
			primark.height = hoekHeight;
			primark.width = hoekWidth;
			
			macelaviv.x = beginX + hoekWidth * 3;
			macelaviv.y = beginY + hoekHeight * 9;
			macelaviv.height = hoekHeight;
			macelaviv.width = hoekWidth;
			
			bartsmit.x = beginX;
			bartsmit.y = beginY + hoekHeight * 3;
			bartsmit.height = hoekHeight;
			bartsmit.width = hoekWidth;
			
			euromast.x = beginX;
			euromast.y = beginY + hoekHeight * 6;
			euromast.height = hoekHeight;
			euromast.width = hoekWidth;
			/*Einde Foto's*/
			
			/*Vragen*/
			bkvraag.x = 450;
			bkvraag.y = 450;
			
			//Antwoorden
			bkant1.x = 350;
			bkant1.y = 500;
			
			bkant2.x = 550;
			bkant2.y = 500;
			
			// other positioning
			beginknop.x = 450;
			beginknop.y = 500;
			
			dobbel.x = beginX+boordGroote*hoekWidth/2;
			dobbel.y = beginY+boordGroote*hoekWidth/2;
			
			gewonnen.x = beginY+boordGroote*hoekWidth/2;
			gewonnen.y = beginY+boordGroote*hoekWidth/2;
			
			text2.x = beginY+boordGroote*hoekWidth/2-70;
			text2.y = beginY+boordGroote*hoekWidth/2-100;
			
			pion.x = beginX+5;
			pion.y = beginY-20;
			
			dobbel.stop();
			
			// listener events
			stage.addEventListener(Event.ENTER_FRAME, frameLoop);
			dobbel.addEventListener(MouseEvent.CLICK, dobbelClick);
			beginknop.addEventListener(MouseEvent.CLICK, begin);
			bkant1.addEventListener(MouseEvent.CLICK, bkant1_goed);
			bkant2.addEventListener(MouseEvent.CLICK, bkant2_fout);
			
			//startscherm
			addChild(beginscherm);
			addChild(beginknop);
		}
		
		// START OF GAME
		public function begin(mEvt:MouseEvent):void
		{
			removeChild(beginscherm);
			removeChild(beginknop);
			addChild(euromast);
			addChild(bartsmit);
			addChild(macelaviv);
			addChild(primark);
			addChild(jumbo);
			addChild(mcdonalds);
			addChild(mediamarkt);
			addChild(cena);
			addChild(burgerking);
			
			drawBoard(boordGroote, beginX ,beginY, hoekWidth, hoekHeight);
			
			addChild(pion);
			addChild(text2)
			addChild(dobbel)
		}
		
		// VRAGEN
		public function bkant1_goed(mEvt:MouseEvent):void
		{
			removeChild(bkvraag);
			removeChild(bkant1);
			removeChild(bkant2);
			score++;
			vraaggesteld = false;
		}
		
		public function bkant2_fout(mEvt:MouseEvent):void
		{
			removeChild(bkvraag);
			removeChild(bkant1);
			removeChild(bkant2);
			vraaggesteld = false;
		}
		
		public function frameLoop(e:Event):void
		{
			trace("pion-x:" + pion.x + " total-x:" + totalX  + " pion-y:" + pion.y + " total-y:" + totalY + " direction:" + direct + " total:" + total + " hoek:" + hoek + " vraag:" + vraaggesteld)
			text2.textfield2.text = "Aantal zetten: " + zetten
			
			// direction
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
			
			// direction keep moment
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
			
			// win and submit score
			if ((pion.y > beginY && pion.y < beginY+ 30)&&(pion.x > beginX && pion.x < beginX+30))
			{
				total = 0;
				gewonnen.textfield1.text = "Gewonnen!!\n" + "U heeft " + zetten + " zetten gezet.";
				removeChild(pion);
				addChild(gewonnen)
				
				var scriptRequest:URLRequest = new URLRequest("http://ap15-12.ict-lab.nl/saveGameResults.php?name="+ mijnNaam +"&score=" + zetten);
				var scriptLoader:URLLoader = new URLLoader();
				scriptRequest.method = URLRequestMethod.POST;
				scriptLoader.addEventListener("complete", onC);
				scriptLoader.load(scriptRequest);
				stage.frameRate = 0;
			}
			
			if (pion.x > 260 && pion.x < 270 && pion.y < 115 && total < 40 && vraaggesteld == false)
			{
				vraaggesteld = true;
				addChild(bkvraag);
				addChild(bkant1);
				addChild(bkant2);
			}
			
		}
		function onC(e) 
		{
			var someLoader:Loader = new Loader();
			addChild(someLoader);
		}
		
		// function odd
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
		
		// function drawBoard
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
		
		// function dobbelRandom
		public function dobbelRandom():int 
		{
			var getalRandom:int = Math.floor(Math.random()* randomNummer);
			if (getalRandom < 1)
			{
				getalRandom = 1;
			}
			total += hoekWidth*getalRandom;

			return(getalRandom);
		}
		
		// function dobbelClick
		public function dobbelClick(mE:MouseEvent):void 
		{
			var randomGetal:int = dobbelRandom();
			zetten++;
			dobbel.gotoAndStop(randomGetal);
		}
	}
}

