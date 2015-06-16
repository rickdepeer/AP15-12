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
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	
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
		var bartsmitVraag:BartsmitVraag = new BartsmitVraag();
		var bartsmitAntwoord1:BartsmitAntwoord1 = new BartsmitAntwoord1();
		var bartsmitAntwoord2:BartsmitAntwoord2 = new BartsmitAntwoord2();
		var cenaVraag:CenaVraag = new CenaVraag();
		var cenaAntwoord1:CenaAntwoord1 = new CenaAntwoord1();
		var cenaAntwoord2:CenaAntwoord2 = new CenaAntwoord2();
		var mediamarktVraag:MediamarktVraag = new MediamarktVraag();
		var mediamarktAntwoord1:MediamarktAntwoord1 = new MediamarktAntwoord1();
		var mediamarktAntwoord2:MediamarktAntwoord2 = new MediamarktAntwoord2();
		var mcdonaldsVraag:McdonaldsVraag = new McdonaldsVraag();
		var mcdonaldsAntwoord1:McdonaldsAntwoord1 = new McdonaldsAntwoord1();
		var mcdonaldsAntwoord2:McdonaldsAntwoord2 = new McdonaldsAntwoord2();
		var jumboVraag:JumboVraag = new JumboVraag();
		var jumboAntwoord1:JumboAntwoord1 = new JumboAntwoord1();
		var jumboAntwoord2:JumboAntwoord2 = new JumboAntwoord2();
		var macelavivVraag:MacelavivVraag = new MacelavivVraag();
		var macelavivAntwoord1:MacelavivAntwoord1 = new MacelavivAntwoord1();
		var macelavivAntwoord2:MacelavivAntwoord2 = new MacelavivAntwoord2();
		var euromastVraag:EuromastVraag = new EuromastVraag();
		var euromastAntwoord1:EuromastAntwoord1 = new EuromastAntwoord1();
		var euromastAntwoord2:EuromastAntwoord2 = new EuromastAntwoord2();
		var score:int = 0
		var vraaggesteld:Boolean = false;
		var randomNummer:int = 1 // default == 7
		var beginNaam:BeginNaam = new BeginNaam();
		var naamVeld:TextField = new TextField();
		
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
			
			bartsmitVraag.x = 450;
			bartsmitVraag.y = 450;
			
			cenaVraag.x = 450;
			cenaVraag.y = 450;
			
			mediamarktVraag.x = 450;
			mediamarktVraag.y = 450;
			
			mcdonaldsVraag.x = 450;
			mcdonaldsVraag.y = 450;
			
			jumboVraag.x = 450;
			jumboVraag.y = 450;
			
			macelavivVraag.x = 450;
			macelavivVraag.y = 450;
			
			euromastVraag.x = 450;
			euromastVraag.y = 450;
			
			//Antwoorden
			bkant1.x = 350;
			bkant1.y = 500;
			
			bkant2.x = 550;
			bkant2.y = 500;
			
			bartsmitAntwoord1.x = 350;
			bartsmitAntwoord1.y = 540;
			
			bartsmitAntwoord2.x = 550;
			bartsmitAntwoord2.y = 540;
			
			cenaAntwoord1.x = 350;
			cenaAntwoord1.y = 540;
			
			cenaAntwoord2.x = 550;
			cenaAntwoord2.y = 540;
			
			mcdonaldsAntwoord1.x = 350;
			mcdonaldsAntwoord1.y = 540;
			
			mcdonaldsAntwoord2.x = 550;
			mcdonaldsAntwoord2.y = 540;
			
			mediamarktAntwoord1.x = 350;
			mediamarktAntwoord1.y = 540;
			
			mediamarktAntwoord2.x = 550;
			mediamarktAntwoord2.y = 540;
			
			jumboAntwoord1.x = 350;
			jumboAntwoord1.y = 540;
			
			jumboAntwoord2.x = 550;
			jumboAntwoord2.y = 540;
			
			macelavivAntwoord1.x = 350;
			macelavivAntwoord1.y = 540;
			
			macelavivAntwoord2.x = 550;
			macelavivAntwoord2.y = 540;
			
			euromastAntwoord1.x = 350;
			euromastAntwoord1.y = 540;
			
			euromastAntwoord2.x = 550;
			euromastAntwoord2.y = 540;
			
			// other positioning
			beginknop.x = 450;
			beginknop.y = 600;
			
			naamVeld.x = 550;
			naamVeld.y = 430;
			naamVeld.height = 54;
			naamVeld.width = 270;
			naamVeld.type = TextFieldType.INPUT;
			naamVeld.background = true;
			naamVeld.text = "";
			
			beginNaam.x = 220;
			beginNaam.y = 450;
			
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
			bartsmitAntwoord1.addEventListener(MouseEvent.CLICK, bartsmitAntwoord1_fout);
			bartsmitAntwoord2.addEventListener(MouseEvent.CLICK, bartsmitAntwoord2_goed);
			cenaAntwoord1.addEventListener(MouseEvent.CLICK, cenaAntwoord1_goed);
			cenaAntwoord2.addEventListener(MouseEvent.CLICK, cenaAntwoord2_fout);
			mediamarktAntwoord1.addEventListener(MouseEvent.CLICK, mediamarktAntwoord1_goed);
			mediamarktAntwoord2.addEventListener(MouseEvent.CLICK, mediamarktAntwoord2_fout);
			mcdonaldsAntwoord1.addEventListener(MouseEvent.CLICK, mcdonaldsAntwoord1_fout);
			mcdonaldsAntwoord2.addEventListener(MouseEvent.CLICK, mcdonaldsAntwoord2_goed);
			jumboAntwoord1.addEventListener(MouseEvent.CLICK, jumboAntwoord1_fout);
			jumboAntwoord2.addEventListener(MouseEvent.CLICK, jumboAntwoord2_goed);
			euromastAntwoord1.addEventListener(MouseEvent.CLICK, euromastAntwoord1_fout);
			euromastAntwoord2.addEventListener(MouseEvent.CLICK, euromastAntwoord2_goed);
			macelavivAntwoord1.addEventListener(MouseEvent.CLICK, macelavivAntwoord1_goed);
			macelavivAntwoord2.addEventListener(MouseEvent.CLICK, macelavivAntwoord2_fout);
			
			//startscherm
			addChild(beginscherm);
			addChild(beginknop);
			addChild(naamVeld);
			addChild(beginNaam);
		}
		
		// START OF GAME
		/*if (naamVeld.text == !"")
		{*/
			public function begin(mEvt:MouseEvent):void
			{
				var naam:String = naamVeld.text;
				removeChild(beginscherm);
				removeChild(beginknop);
				removeChild(naamVeld);
				removeChild(beginNaam);
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
		//}
		
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
		
		public function cenaAntwoord1_goed(mEvt:MouseEvent):void
		{
			removeChild(cenaVraag);
			removeChild(cenaAntwoord1);
			removeChild(cenaAntwoord2);
			score++;
			vraaggesteld = false;
		}
		
		public function cenaAntwoord2_fout(mEvt:MouseEvent):void
		{
			removeChild(cenaVraag);
			removeChild(cenaAntwoord1);
			removeChild(cenaAntwoord2);
			vraaggesteld = false;
		}
		
		public function mediamarktAntwoord1_goed(mEvt:MouseEvent):void
		{
			removeChild(mediamarktVraag);
			removeChild(mediamarktAntwoord1);
			removeChild(mediamarktAntwoord2);
			score++;
			vraaggesteld = false;
		}
		
		public function mediamarktAntwoord2_fout(mEvt:MouseEvent):void
		{
			removeChild(mediamarktVraag);
			removeChild(mediamarktAntwoord1);
			removeChild(mediamarktAntwoord2);
			vraaggesteld = false;
		}
		
		public function mcdonaldsAntwoord2_goed(mEvt:MouseEvent):void
		{
			removeChild(mcdonaldsVraag);
			removeChild(mcdonaldsAntwoord1);
			removeChild(mcdonaldsAntwoord2);
			score++;
			vraaggesteld = false;
		}
		
		public function mcdonaldsAntwoord1_fout(mEvt:MouseEvent):void
		{
			removeChild(mcdonaldsVraag);
			removeChild(mcdonaldsAntwoord1);
			removeChild(mcdonaldsAntwoord2);
			vraaggesteld = false;
		}
		
		public function jumboAntwoord2_goed(mEvt:MouseEvent):void
		{
			removeChild(jumboVraag);
			removeChild(jumboAntwoord1);
			removeChild(jumboAntwoord2);
			score++;
			vraaggesteld = false;
		}
		
		public function jumboAntwoord1_fout(mEvt:MouseEvent):void
		{
			removeChild(jumboVraag);
			removeChild(jumboAntwoord1);
			removeChild(jumboAntwoord2);
			vraaggesteld = false;
		}
		
		public function macelavivAntwoord1_goed(mEvt:MouseEvent):void
		{
			removeChild(macelavivVraag);
			removeChild(macelavivAntwoord1);
			removeChild(macelavivAntwoord2);
			vraaggesteld = false;
			score++;
		}
		
		public function macelavivAntwoord2_fout(mEvt:MouseEvent):void
		{
			removeChild(macelavivVraag);
			removeChild(macelavivAntwoord1);
			removeChild(macelavivAntwoord2);
			vraaggesteld = false;
		}
		
		public function euromastAntwoord1_fout(mEvt:MouseEvent):void
		{
			removeChild(euromastVraag);
			removeChild(euromastAntwoord1);
			removeChild(euromastAntwoord2);
			vraaggesteld = false;
		}
		
		public function euromastAntwoord2_goed(mEvt:MouseEvent):void
		{
			removeChild(euromastVraag);
			removeChild(euromastAntwoord1);
			removeChild(euromastAntwoord2);
			vraaggesteld = false;
			score++;
		}
		
		public function bartsmitAntwoord1_fout(mEvt:MouseEvent):void
		{
			removeChild(bartsmitVraag);
			removeChild(bartsmitAntwoord1);
			removeChild(bartsmitAntwoord2);
			vraaggesteld = false;
		}
		
		public function bartsmitAntwoord2_goed(mEvt:MouseEvent):void
		{
			removeChild(bartsmitVraag);
			removeChild(bartsmitAntwoord1);
			removeChild(bartsmitAntwoord2);
			vraaggesteld = false;
			score++;
		}
		
		public function frameLoop(e:Event):void
		{
			trace("pion-x:" + pion.x + " total-x:" + totalX  + " pion-y:" + pion.y + " total-y:" + totalY + " direction:" + direct + " total:" + total + " hoek:" + hoek + " vraag:" + vraaggesteld + " score: " + score)
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
			
			if (pion.x > 490 && pion.x < 510 && pion.y < 115 && total < 40 && vraaggesteld == false)
			{
				vraaggesteld = true;
				addChild(cenaVraag);
				addChild(cenaAntwoord1);
				addChild(cenaAntwoord2);
			}
			
			if (pion.x > 770 && pion.y > 230 && pion.y < 240 && total < 40 && vraaggesteld == false)
			{
				vraaggesteld = true;
				addChild(mediamarktVraag);
				addChild(mediamarktAntwoord1);
				addChild(mediamarktAntwoord2);
			}
			
			if (pion.x > 770 && pion.y > 470 && pion.y < 480 && total < 40 && vraaggesteld == false)
			{
				vraaggesteld = true;
				addChild(mcdonaldsVraag);
				addChild(mcdonaldsAntwoord1);
				addChild(mcdonaldsAntwoord2);
			}
			
			if (pion.x > 770 && pion.y > 470 && pion.y < 480 && total < 40 && vraaggesteld == false)
			{
				vraaggesteld = true;
				addChild(mcdonaldsVraag);
				addChild(mcdonaldsAntwoord1);
				addChild(mcdonaldsAntwoord2);
			}
			
			if (pion.x > 560 && pion.x < 565 && pion.y > 760 && total < 40 && vraaggesteld == false)
			{
				vraaggesteld = true;
				addChild(jumboVraag);
				addChild(jumboAntwoord1);
				addChild(jumboAntwoord2);
			}
			
			if (pion.x > 320 && pion.x < 325 && pion.y > 760 && total < 40 && vraaggesteld == false)
			{
				vraaggesteld = true;
				addChild(macelavivVraag);
				addChild(macelavivAntwoord1);
				addChild(macelavivAntwoord2);
			}
			
			if (pion.x < 40 && pion.y < 540 && pion.y > 534 && total < 40 && vraaggesteld == false)
			{
				vraaggesteld = true;
				addChild(euromastVraag);
				addChild(euromastAntwoord1);
				addChild(euromastAntwoord2);
			}
			
			if (pion.x < 40 && pion.y < 300 && pion.y > 295 && total < 40 && vraaggesteld == false)
			{
				vraaggesteld = true;
				addChild(bartsmitVraag);
				addChild(bartsmitAntwoord1);
				addChild(bartsmitAntwoord2);
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

