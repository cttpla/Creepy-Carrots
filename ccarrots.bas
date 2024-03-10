		
				
				
				
' -------------------------------------------------------------------------------------------------------------------------------------
				
				
								'######  ######  ######  ######  ###### #    #
								'#	 #    #	 #	 #	 #    #	 #  # 
								'#	 #####	 ####	 ######	 ######	  ##	
								'#	 #   #	 #	 #	 #	  ##	
								'######  #    #	 ######	 ######	 #	  ##		
													
								'###### ######  ######  ######  ######  ######  ######
								'#	#    #  #    #	#    #	#    #	  ##	#
								'#	######	#####	#####	#    #	  ##	######
								'#	#    #	#    #  #    #  #    #    ##	     #
								'###### #    #	#     # #     # ######    ##    ######
								
								' For Thomson MO6/PC128 Olivetti Prodest
									' by Paolo Cattaneo
									' v01.0 March 2K24 
													

' -------------------------------------------------------------------------------------------------------------------------------------

' UgBasic doesn't support sound for MO6 so we define ASM procedures to call the routine monitor

' -----------------
' ASM PROCEDURES
' -----------------
' sound
' $203A  tempo
' $203C  durata
' $203D  timbro
' $203E  ottava
' put 1...8 in B (note)
' $1E    play routine
DIM jmpnt AS BYTE = 01

PROCEDURE playLose
	BEGIN ASM
NOTEH EQU $1E
TEMPO EQU $203A
DURA  EQU $203C
OCTAV EQU $203E
TIMBR EQU $203D		
		LDB #0
		STB TIMBR
		LDA #4
    	STA TEMPO
    	LDD #08
    	STD OCTAV
		LDB #32
    	STB DURA
    	LDB #01
   		SWI
    	FCB NOTEH
    	LDB #06
   		SWI
    	FCB NOTEH
    	LDB #02
   		SWI
    	FCB NOTEH
    	LDB #01
   		SWI
    	FCB NOTEH    	    	   	    		
	END ASM ON CPU6809
END PROC

PROCEDURE playStep
    BEGIN ASM
	LDB #2
	STB $203D
    LDA #1
    STA $203A
    LDD #2
    STD $203E
    LDB #1
    STB $203C
    SWI
    FCB $1E		
	END ASM ON CPU6809
END PROC

PROCEDURE playGot
    BEGIN ASM
	LDB #2
	STB $203D
    LDA #04
    STA $203A
    LDD #1
    STD $203E
    LDB #1
    STB $203C
    LDB #02
    SWI
    FCB $1E	
    LDB #10
    SWI
    FCB $1E		
	END ASM ON CPU6809
END PROC

PROCEDURE playGotAll
    BEGIN ASM
	LDB #0
	STB $203D
    LDA #04
    STA $203A
    LDD #01
    STD $203E
    LDB #10
    STB $203C
    LDB #07
    SWI
    FCB $1E	
    LDB #$0A
    SWI
    FCB $1E	
    LDB #07
    SWI
    FCB $1E	
    LDB #$0A
    SWI
    FCB $1E	
    LDB #07
    SWI
    FCB $1E	
    LDB #$0A
    SWI
    FCB $1E		
	END ASM ON CPU6809
END PROC

PROCEDURE playJump
    BEGIN ASM
	LDB #2
	STB $203D
    LDA #2
    STA $203A
    LDD #1
    STD $203E
    LDB #2
    STB $203C
    LDB _jmpnt
    SWI
    FCB $1E		
	END ASM ON CPU6809
END PROC

PROCEDURE playPause
    BEGIN ASM
	LDB #0
	STB TIMBR
    LDA #4
    STA TEMPO
    LDD #0
    STD OCTAV
    LDB #64
    STB DURA
    LDB #0
    SWI
    FCB $1E		
	END ASM ON CPU6809
END PROC

PROCEDURE playGrunt
	BEGIN ASM
	LDB #2
	STB $203D
    LDA #16
    STA $203A
    LDD #6
    STD $203E
    LDB #3
    STB $203C
    LDB #01
    SWI
    FCB $1E	
    LDB #03
    SWI
    FCB $1E	
    LDB #01
    SWI
    FCB $1E	
    LDB #03
    SWI
    FCB $1E		
	END ASM ON CPU6809
END PROC

PROCEDURE playTheme
BEGIN ASM		
	LDB #0
	STB TIMBR
    LDA #05
    STA TEMPO
    LDD #2
    STD OCTAV  
    LDB #04
    STB DURA
    LDB #$0A
    SWI
    FCB $1E
    LDB #$0B
    SWI
    FCB $1E	    
    LDB #10
    STB DURA
    LDB #$0C
    SWI
    FCB $1E
    LDB #00
    SWI
    FCB $1E	
    LDB #08
    SWI
    FCB $1E	
	LDB #$0C
    SWI
    FCB $1E	
    LDB #00
    SWI
    FCB $1E
    LDB #00
    SWI
    FCB $1E	
	LDB #$0B
    SWI
    FCB $1E    
    LDB #00
    SWI
    FCB $1E
    LDB #00
    SWI
    FCB $1E	
    LDB #08
    SWI
    FCB $1E
    LDB #00
    SWI
    FCB $1E
    LDB #00
    SWI
    FCB $1E	
    LDB #03
    SWI
    FCB $1E	
    LDB #00
    SWI
    FCB $1E	    
    LDB #05
    SWI
    FCB $1E	
    LDB #06
    SWI
    FCB $1E    
    LDB #00
    SWI
    FCB $1E	    
    LDB #08
    SWI
    FCB $1E		
    LDB #00
    SWI
    FCB $1E	    
    LDB #00
    SWI
    FCB $1E		
    LDD #08
    STD OCTAV
    LDB #08
    SWI
    FCB $1E	    
END ASM ON CPU6809
END PROC

PROCEDURE playWin
	BEGIN ASM
	LDB #0
	STB TIMBR
	LDA #05
    STA TEMPO
    LDD #01
    STD OCTAV
    LDB #14
    STB DURA
    LDB #01
   	SWI
    FCB NOTEH  
    LDB #02
   	SWI
    FCB NOTEH    
    LDB #01
   	SWI
    FCB NOTEH
    LDB #06
   	SWI
    FCB NOTEH 
    LDB #$0A
   	SWI
    FCB NOTEH    
    LDB #06
   	SWI
    FCB NOTEH 
    LDB #$0A
   	SWI
    FCB NOTEH
    LDB #06
   	SWI
    FCB NOTEH 
    LDB #$0A
   	SWI
    FCB NOTEH   
    LDB #06
   	SWI
    FCB NOTEH 
    LDB #$0A
   	SWI
    FCB NOTEH
    LDB #06
   	SWI
    FCB NOTEH 
    LDB #03
   	SWI
    FCB NOTEH    
    LDB #01
   	SWI
    FCB NOTEH 
    LDB #00
   	SWI
    FCB NOTEH  
    LDB #06
   	SWI
    FCB NOTEH 
    LDB #00
   	SWI
    FCB NOTEH    
    LDB #08
   	SWI
    FCB NOTEH  
    LDB #$0A
   	SWI
    FCB NOTEH 
    LDB #06
   	SWI
    FCB NOTEH              	    		         	    		
	END ASM ON CPU6809
END PROC

' ---------------------------------- END ASM PROCEDURES ------------------
							
							
							'
							' Launch on device with this command line:
							' CLEAR,&H2FFF: LOADM"CASS:",R: EXEC
							'
							' We don't need strings so we define the minimal allocation to save memory
							DEFINE STRING SPACE 8
							DEFINE STRING COUNT 8
							' 
							' Option type unsigned and narrow define the default numbers as signed byte
							OPTION EXPLICIT: OPTION TYPE UNSIGNED: OPTION TYPE NARROW
							' Set the Bit16 mode on MO6 with Double Buffer
							BITMAP ENABLE (160, 200, 16): DOUBLE BUFFER ON
							
							' Vars to use for temp maths in game			
							DIM x AS BYTE, y AS BYTE, v AS SIGNED BYTE, i AS BYTE, c AS BYTE, val AS BYTE
							DIM dirx AS SIGNED BYTE, diry AS SIGNED BYTE, posx AS BYTE, posy AS BYTE
							'
							' Player props:
							' position is a POSITION type to do maths with negative results
							' POSITION is a signed 16 bits so supports both values > 127 and negatives
							' We also need a oPosition (old position) to keep the coords of the object
							' we want to erase on every page swap
							' For the same reason we need to know when the player got a carrot to erase
							' it in the next page swap, hence we have the var called got
							' We then have a playerStandFrame, playerJumpFrame, playerWalkFrame and Speed
							' to set the correct animation for each state/direction
							DIM plrX AS POSITION, plrY AS POSITION, oPlrX AS BYTE, oPlrY AS BYTE, got AS BYTE = 00
							DIM plrDirX AS SIGNED BYTE = 01, plrDirY AS SIGNED BYTE = 01, plrFrm AS BYTE = 00, ladFrm AS BYTE = 00
		   					DIM plrSFrm AS BYTE = 00, plrJFrm AS BYTE = 00, plrWFrm AS BYTE = 00, plrSpdX AS BYTE = 01
		   					DIM lives AS BYTE = 10, haha AS BYTE = 00
		   					'
		   					' the start and end position for each level
		   					DIM startPx AS BYTE, startPy AS BYTE, doorX AS BYTE, doorY AS BYTE
		   					'
		   					' how many carrots has to take in the level and a copy to restore them
		   					' when the player completes a level or does a game over
		   					DIM itemsGot AS BYTE = 00, crts AS BYTE = 00:
							'
							' jumpCount starts from -04 and increments each frame interpolate the jump 
							DIM jumpCount AS SIGNED BYTE = -04, isJumping AS BYTE = 00, jmpnt AS BYTE = 00
							' Booleans: isJX = horizontal jump. onLad = is on a ladder
							DIM isJX AS BYTE = 00, onLad AS BYTE = 00, isDied AS BYTE = 00, hasWon AS BYTE = 00
							DIM yMap1 AS BYTE, yMap2 AS BYTE
							
							'
							' Graphic resources set and load
							' we need to set some empty images to store the background slice
							' and restore it on the next frame
							DIM plBG AS IMAGE: plBG := NEW IMAGE(8, 16)
							DIM blk AS IMAGE: blk := LOAD IMAGE("ccarrots/blk.bmp") EXACT BANKED 
							DIM life AS IMAGE: life := LOAD IMAGE("ccarrots/life.bmp") EXACT BANKED 
							DIM otto AS IMAGES: otto := LOAD IMAGES("ccarrots/bun.bmp") FRAME SIZE(8, 16) EXACT BANKED 
							DIM otto2 AS IMAGES: otto2 := LOAD IMAGES("ccarrots/bun2.bmp") FRAME SIZE(8, 16) EXACT BANKED 
							DIM witch AS IMAGES: witch := LOAD IMAGES("ccarrots/witch.bmp") FRAME SIZE(8, 16) EXACT BANKED 
							DIM tiles AS IMAGES: tiles := LOAD IMAGES("ccarrots/tiles2.bmp") FRAME SIZE (8, 8) EXACT BANKED
							DIM enms AS IMAGES: enms := LOAD IMAGES("ccarrots/enms.bmp") FRAME SIZE (8, 8) EXACT BANKED
							DIM door AS IMAGES: door := LOAD IMAGES("ccarrots/door.bmp") FRAME SIZE(8, 16) EXACT BANKED
							DIM logo AS IMAGE: logo := LOAD IMAGE("ccarrots/hudlogo.bmp") EXACT BANKED 
							DIM splash AS IMAGES: splash := LOAD IMAGES("ccarrots/bigspl.bmp") FRAME SIZE(40, 40) EXACT BANKED 
							
							' Current level, total levels
							' ATM ugBasic stores data embedded in code so we can only set up to four levels.
							' The space on every 19 rows sets a new level
							' Tiles with values 01 are carrots, tiles with values < 08 are decorations, 
							' tiles 07 are ladders, tiles 08 and 09 are deadly,
							' tiles from 10 to 14 are special platforms, tiles from 15 are ground platforms
							DIM lvl AS BYTE = 00: CONST lvls = 04
							DIM ltiles(lvls, 19, 20) AS BYTE = #{ _
																03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02, 00, 02, 00, 00, 00, 00, 00, 00, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 15, 15, 15, 15, 15, 00, 00, 00, 00, 00, _
							 	 								01, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, _
							 	 								15, 00, 00, 00, 01, 00, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 00, 01, _
							 	 								00, 15, 00, 00, 15, 00, 00, 00, 00, 00, 00, 15, 15, 15, 15, 15, 15, 15, 15, 01, _
							 	 								00, 07, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, _
							 	 								00, 07, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 01, 00, 00, 00, 01, _
							 	 								00, 07, 01, 01, 01, 01, 00, 00, 00, 01, 01, 01, 00, 15, 15, 15, 01, 01, 01, 01, _
							 	 								00, 15, 15, 15, 15, 15, 00, 00, 00, 15, 15, 15, 00, 07, 00, 00, 15, 15, 15, 01, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 07, 00, 07, 00, 00, 00, 00, 00, 01, _
							 	 								00, 00, 00, 00, 01, 01, 00, 01, 00, 00, 01, 07, 01, 07, 01, 01, 01, 01, 01, 01, _
							 	 								00, 15, 00, 00, 15, 15, 00, 15, 00, 00, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, _
							 	 								00, 07, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, _
							 	 								01, 07, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 01, 00, 00, 00, _
							 	 								15, 15, 15, 15, 00, 00, 15, 00, 00, 00, 00, 00, 00, 00, 15, 15, 15, 00, 00, 15, _
							 	 								00, 00, 00, 00, 00, 00, 07, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 07, _
							 	 							    02, 00, 02, 02, 01, 02, 07, 00, 00, 00, 00, 00, 00, 01, 00, 00, 00, 00, 00, 07, _
							 	 								15, 15, 15, 15, 15, 15, 15, 15, 08, 08, 08, 08, 08, 15, 08, 08, 08, 08, 15, 15,  _
								 	 							04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, 04, _
							 	 								01, 00, 00, 04, 04, 04, 04, 04, 00, 01, 01, 04, 04, 00, 01, 00, 04, 04, 04, 04, _
							 	 								16, 01, 00, 00, 04, 00, 00, 04, 00, 16, 16, 16, 16, 16, 16, 00, 00, 04, 04, 04, _
							 	 								07, 16, 00, 16, 00, 00, 00, 00, 00, 00, 00, 00, 00, 07, 00, 00, 00, 00, 04, 04, _
							 	 								07, 00, 00, 00, 01, 01, 01, 01, 01, 01, 00, 01, 01, 07, 01, 09, 01, 01, 01, 00, _
							 	 								16, 16, 16, 09, 00, 00, 00, 00, 00, 00, 09, 11, 11, 11, 11, 11, 11, 11, 11, 00, _
							 	 								00, 07, 00, 00, 00, 00, 04, 00, 00, 00, 04, 01, 01, 01, 01, 01, 01, 01, 01, 00, _
							 	 								00, 07, 01, 01, 01, 01, 00, 00, 00, 00, 00, 01, 04, 04, 04, 04, 04, 09, 04, 00, _
							 	 								00, 07, 01, 01, 01, 01, 00, 00, 00, 00, 01, 01, 00, 16, 04, 16, 16, 16, 16, 16, _
							 	 								00, 16, 16, 16, 16, 16, 00, 04, 00, 00, 16, 16, 00, 00, 00, 00, 00, 00, 00, 04, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 01, 07, 00, 04, 04, 04, 04, 04, 04, 04, _
							 	 								00, 01, 00, 00, 01, 01, 00, 01, 01, 00, 01, 07, 01, 01, 01, 01, 01, 01, 01, 01, _
							 	 								00, 16, 00, 00, 16, 16, 09, 16, 16, 00, 10, 10, 10, 10, 10, 10, 10, 16, 16, 16, _
							 	 								00, 07, 00, 00, 00, 00, 00, 07, 04, 00, 04, 04, 04, 04, 04, 04, 00, 04, 04, 07, _
							 	 								01, 07, 01, 01, 00, 04, 00, 07, 00, 00, 01, 04, 04, 01, 01, 01, 04, 00, 04, 07, _
							 	 								16, 16, 16, 16, 04, 04, 04, 07, 00, 16, 16, 00, 04, 11, 11, 11, 04, 04, 01, 07, _
							 	 								00, 00, 00, 07, 01, 01, 01, 07, 00, 00, 00, 00, 01, 01, 01, 01, 01, 04, 04, 07, _
							 	 							    04, 00, 04, 07, 01, 01, 01, 07, 00, 00, 00, 00, 10, 10, 10, 10, 10, 00, 01, 07, _
							 	 								16, 16, 16, 16, 16, 16, 16, 16, 09, 09, 09, 09, 09, 09, 09, 09, 09, 09, 16, 16,  _
							 	 								05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, _
							 	 								01, 01, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, _
							 	 								17, 17, 17, 17, 17, 17, 17, 17, 05, 05, 05, 05, 05, 05, 05, 05, 05, 17, 17, 05, _
							 	 								07, 01, 01, 01, 01, 01, 09, 07, 00, 00, 00, 00, 00, 00, 00, 00, 00, 07, 01, 00, _
							 	 								07, 00, 00, 09, 00, 00, 09, 07, 01, 01, 01, 01, 01, 01, 00, 01, 01, 07, 01, 01, _
							 	 								17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 11, 11, 00, 10, 11, 17, 17, 01, _
							 	 								00, 07, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 05, 01, 07, 01, _
							 	 								00, 07, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 00, 17, 00, 00, 17, 17, 17, 17, _
							 	 								00, 07, 01, 01, 01, 01, 05, 05, 05, 01, 05, 05, 05, 05, 05, 05, 05, 05, 05, 05, _
							 	 								17, 17, 17, 17, 17, 17, 00, 00, 00, 17, 00, 00, 00, 00, 05, 00, 00, 00, 00, 00, _
							 	 								00, 05, 00, 05, 00, 09, 00, 00, 00, 00, 00, 00, 00, 00, 00, 05, 00, 00, 00, 01, _
							 	 								05, 00, 05, 00, 05, 05, 05, 00, 01, 01, 01, 00, 00, 00, 09, 00, 05, 00, 00, 01, _
							 	 								00, 05, 01, 05, 00, 00, 00, 05, 11, 11, 11, 00, 09, 09, 09, 09, 09, 09, 00, 17, _
							 	 								05, 00, 01, 00, 05, 00, 05, 09, 00, 01, 01, 01, 00, 00, 00, 00, 00, 05, 05, 07, _
							 	 								00, 05, 01, 05, 00, 00, 00, 09, 00, 10, 10, 10, 00, 00, 00, 00, 05, 00, 05, 07, _
							 	 								05, 00, 05, 00, 05, 09, 05, 09, 01, 01, 01, 00, 00, 00, 00, 00, 00, 05, 00, 07, _
							 	 								00, 05, 00, 05, 00, 09, 00, 09, 11, 11, 11, 00, 00, 00, 00, 00, 00, 00, 00, 07, _
							 	 							    05, 00, 05, 00, 05, 09, 09, 09, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 17, _
							 	 								17, 17, 17, 17, 17, 17, 17, 17, 09, 09, 09, 09, 09, 09, 09, 09, 09, 09, 09, 00,  _
							 	 								06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 00, _
							 	 								06, 06, 06, 06, 06, 06, 06, 06, 01, 01, 01, 01, 01, 01, 06, 06, 06, 06, 06, 19, _
							 	 								01, 01, 01, 01, 01, 01, 01, 01, 18, 18, 18, 18, 18, 18, 06, 06, 06, 06, 06, 18, _
							 	 								18, 18, 18, 18, 18, 18, 11, 11, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, _
							 	 								07, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, 06, _
							 	 								07, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, _
							 	 								18, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, 03, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 01, 11, 10, 00, 18, 09, 00, 00, _
							 	 								00, 00, 00, 00, 18, 18, 18, 18, 00, 00, 11, 00, 11, 00, 00, 00, 09, 00, 00, 00, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 09, 00, 00, 00, 00, _
							 	 								00, 00, 00, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 09, 01, 01, 09, 01, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 09, 01, 01, 00, 09, 18, 18, 00, 18, _
							 	 								09, 09, 09, 09, 00, 00, 00, 00, 09, 00, 18, 00, 18, 11, 09, 09, 00, 07, 00, 00, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 07, 00, 01, 00, 00, 00, 00, 07, 00, 00, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 18, 18, 01, 00, 00, 00, 00, 18, 18, 00, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 01, 18, 18, 18, 18, 01, 00, 00, 00, 09, 09, 18, _
							 	 								00, 00, 00, 00, 00, 00, 00, 00, 18, 09, 18, 18, 09, 18, 00, 00, 00, 00, 00, 00, _
							 	 								18, 18, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08, 08  _
							 	 							  }
							' carrots positions in levels, we need to store them to restore 
							' on every level completed or game over
							DIM xCrt(lvls, 60): DIM yCrt(lvls, 60):		 	 							  
														 
							'
							' Enemies props, just like the player ones
							' We don't want to set them as a x, y, z matrix otherwise
							' it will be too much slow on execution
							' We instead set specific two dims matrix to read from 
							' them on every level change
							' LX, RX, UY, DY are limits where to change direction
							' senK is the enemy kind (00 green, 004 pump, 008 eye)
							'
							CONST nems = 06: DIM nemsg AS BYTE(lvls) = #{ 05, 04, 02, 02 }
							DIM senX AS BYTE(lvls, nems) = #{ _
																 120, 125, 032, 048, 017, 123, _
																 008, 120, 056, 112, 000, 000, _
																 064, 016, 000, 000, 000, 000, _
																 000, 032, 000, 000, 000, 000  _
															   }
							
							DIM senY AS BYTE(lvls, nems) = #{ _
																 132, 088, 064, 048, 112, 032, _
																 100, 088, 064, 064, 000, 000, _
																 048, 064, 000, 000, 000, 000, _
																 016, 064, 000, 000, 000, 000  _
															   }
							
							DIM senLX AS BYTE(lvls, nems) = #{ _
																 000, 080, 008, 008, 008, 088, _
																 008, 080, 000, 96, 000, 000, _
																 008, 008, 000, 000, 000, 000, _
																 000, 032, 000, 000, 000, 000  _
															   }
							
							DIM senRX AS BYTE(lvls, nems) = #{ _
																 000, 150, 042, 112, 032, 136, _
																 068, 150, 000, 144, 000, 000, _
																 144, 048, 000, 000, 000, 000, _
																 040, 064, 000, 000, 000, 000  _
															   }
							DIM senUY AS BYTE(lvls, nems) = #{ _
																 108, 000, 000, 000, 000, 000, _
																 096, 000, 044, 020, 000, 000, _
																 004, 000, 000, 000, 000, 000, _
																 000, 000, 000, 000, 000, 000  _
															   }
							
							DIM senDY AS BYTE(lvls, nems) = #{ _
																 140, 000, 000, 064, 000, 000, _
																 120, 000, 088, 068, 000, 000, _
																 048, 000, 000, 000, 000, 000, _
																 000, 000, 000, 000, 000, 000  _
															   }
							
							DIM sendrX AS SIGNED BYTE(lvls, nems) = #{ _
																 000, -01, 001, -01, -01, -01, _
																 001, -01, 001, 000, 000, 000, _
																 -01, 001, 000, 000, 000, 000, _
																 001, 001, 000, 000, 000, 000  _
															   }
							
							DIM sendrY AS SIGNED BYTE(lvls, nems) = #{ _
																 -01, 000, 000, 000, 000, 000, _
																 001, 000, 001, -01, 000, 000, _
																 -01, 000, 000, 000, 000, 000, _
																 000, 000, 000, 000, 000, 000  _
															   }
															   
							DIM senSpd AS BYTE(lvls, nems) = #{ _
																 002, 004, 002, 002, 001, 004, _
																 004, 002, 003, 003, 000, 000, _
																 004, 004, 000, 000, 000, 000, _
																 004, 004, 000, 000, 000, 000  _
															   }
							
							DIM senK AS BYTE(lvls, nems) = #{ _
																 000, 004, 004, 000, 008, 008, _
																 000, 008, 000, 000, 000, 000, _
																 000, 008, 000, 000, 000, 000, _
																 008, 008, 000, 000, 000, 000  _
															   }
							'
							' Those values are the ones that will be affected in game in pratice:
							DIM eX AS POSITION(nems) = #{ 130, 125, 32, 048, 017, 123 }:  DIM eY AS POSITION(nems) = #{ 132, 88, 64, 048, 112, 032 }: 
							DIM oeX AS BYTE(nems) = #{ 0, 0, 0, 0, 0, 0 }:	 DIM oeY AS BYTE(nems) = #{ 0, 0, 0, 0, 0, 0 }: 
							DIM eDirX AS SIGNED BYTE(nems) = #{ 0, -01, 01, -01, -01, -01 }: DIM eDirY AS SIGNED BYTE(nems) = #{ -01, 0, 0, 0, 0, 0 }: 
							DIM eKind AS BYTE(nems) = #{ 00, 04, 04, 00, 08, 08 }: DIM eSpd AS BYTE(nems) = #{ 02, 04, 02, 02, 01, 04 }: 
							DIM eLX AS BYTE(nems) = #{ 0, 80, 08, 08, 08, 88 }: DIM eRX AS BYTE(nems) = #{ 0, 150, 42, 112, 032, 136 }: 
							DIM eUY AS BYTE(nems) = #{ 108, 0, 0, 0, 0, 0 }: DIM eDY AS BYTE(nems) = #{ 140, 0, 0, 0, 0, 0 }: 
							DIM eFrm AS BYTE(nems) = #{ 0, 0, 0, 0, 0, 0 }:
							DIM eBg AS IMAGES: eBg := NEW IMAGES(nems, 8, 8)
							
							'
							' Special platforms props - same for enemies
							'
							' Count of mobile platforms for each level
							CONST nmp = 06: DIM nmpg AS BYTE(lvls) = #{ 03, 01, 04, 06 }
							DIM smpX AS BYTE(lvls, nmp) = #{ _
																 056, 128, 144, 000, 000, 000, _
																 040, 000, 000, 000, 000, 000, _
																 024, 048, 104, 140, 000, 000, _
																 040, 128, 004, 072, 144, 032  _
															   }
							
							DIM smpY AS BYTE(lvls, nmp) = #{ _
																 040, 024, 032, 000, 000, 000, _
																 040, 000, 000, 000, 000, 000, _
																 128, 096, 136, 092, 000, 000, _
																 136, 136, 092, 096, 056, 048  _
															   }
							' for cloud platforms we use limitX as spawn timer
							DIM smLX AS BYTE(lvls, nmp) = #{ _
																 020, 015, 020, 000, 000, 000, _
																 032, 000, 000, 000, 000, 000, _
																 000, 000, 084, 116, 000, 000, _
																 010, 020, 000, 008, 030, 008  _
															   }
							
							DIM smRX AS BYTE(lvls, nmp) = #{ _
																 000, 000, 000, 000, 000, 000, _
																 072, 000, 000, 000, 000, 000, _
																 000, 000, 144, 144, 000, 000, _
																 000, 000, 024, 072, 000, 152  _
															   }
							DIM smUY AS BYTE(lvls, nmp) = #{ _
																 000, 000, 000, 000, 000, 000, _
																 000, 000, 000, 000, 000, 000, _
																 112, 088, 000, 068, 000, 000, _
																 000, 000, 072, 000, 000, 000  _
															   }
							
							DIM smDY AS BYTE(lvls, nmp) = #{ _
																 001, 001, 001, 000, 000, 000, _
																 000, 000, 000, 000, 000, 000, _
																 136, 128, 000, 096, 000, 000, _
																 000, 000, 096, 000, 000, 000  _
															   }
							
							DIM smdrX AS SIGNED BYTE(lvls, nmp) = #{ _
																 001, 001, 001, 000, 000, 000, _
																 001, 000, 000, 000, 000, 000, _
																 000, 000, 001, -01, 001, 001, _
																 001, 001, -01, 001, 001, -01  _
															   }
							
							DIM smdrY AS SIGNED BYTE(lvls, nmp) = #{ _
																 000, 000, 000, 000, 000, 000, _
																 000, 000, 000, 000, 000, 000, _
																 -01, 001, 000, -01, 000, 000, _
																 000, 000, -01, 000, 000, 000  _
															   }
															   
							DIM smSpd AS BYTE(lvls, nmp) = #{ _
																 000, 000, 000, 000, 000, 000, _
																 004, 000, 000, 000, 000, 000, _
																 004, 003, 004, 004, 000, 000, _
																 000, 000, 004, 004, 000, 004  _
															   }
							
							DIM smpK AS BYTE(lvls, nmp) = #{ _
																 012, 012, 012, 000, 000, 000, _
																 013, 000, 000, 000, 000, 000, _
																 013, 013, 013, 013, 012, 012, _
																 012, 012, 013, 013, 012, 013  _
															   }
							' Values to use in game:
							DIM mpX AS BYTE(nmp) = #{ 56, 128, 144, 32, 0, 0 }:  DIM mpY AS BYTE(nmp) = #{ 40, 24, 32, 40, 0, 0 }: 
							DIM ompX AS BYTE(nmp) = #{ 0, 0, 0, 0, 0, 0 }:	 DIM ompY AS BYTE(nmp) = #{ 0, 0, 0, 0, 0, 0 }: 
							DIM mpDirX AS SIGNED BYTE(nmp) = #{ 01, 01, 01, 01, 0, 0 }: DIM mpDirY AS SIGNED BYTE(nmp) = #{ 0, 0, 0, 0, 0, 0 }: 
							DIM mpKind AS BYTE(nmp) = #{ 12, 12, 12, 13, 0, 0 }: DIM mpSpd AS BYTE(nmp) = #{ 00, 00, 00, 08, 04, 04 }: 
							DIM mpLX AS BYTE(nmp) = #{ 20, 15, 20, 24, 0, 0 }: DIM mpRX AS BYTE(nmp) = #{ 0, 0, 0, 80, 0, 0 }: 
							DIM mpUY AS BYTE(nmp) = #{ 0, 0, 0, 0, 0, 0 }: DIM mpDY AS BYTE(nmp) = #{ 01, 01, 01, 00, 00, 00 }: 
							DIM mpBg AS IMAGES: mpBg := NEW IMAGES(nmp, 8, 8)
							
							' 
							DIM posDoorX AS BYTE(4) = #{ 96, 96, 144, 152 }: DIM posDoorY AS BYTE(4) = #{ 0, 0, 0, 0 }
							DIM posStartX AS BYTE(4) = #{ 08, 08, 08, 08 }: DIM posStartY AS BYTE(4) = #{ 128, 128, 128, 128 }
							' Elements to update in game:
							' neg is the totall amount, nemg is enemies total amount and nmvpg is the moving platforms total amount
							DIM neg AS BYTE = 06, nemg AS BYTE = 00, nmvpg AS BYTE = 00	
							
						
														 
' -----------------------------------------------------------------------
'			
' Procedures: we need to define them in order to avoid redudant code
' and so the memory waste	
'						
' -----------------------------------------------------------------------

' animates the climb state
PROCEDURE animClimb:
	SHARED ladFrm, plrFrm
	INC ladFrm: IF (ladFrm > 02) THEN
					ladFrm = 0: playStep[]: IF (plrFrm <> 11) THEN: plrFrm = 11: ELSE: plrFrm = 05: ENDIF
				ENDIF
END PROC

' read the tile value from its coordinate
PROCEDURE tileVal[x AS BYTE, y AS BYTE]:
	SHARED ltiles, v, lvl
	v = ltiles(lvl, x, y)
END PROC 

' sets the player on the fall state
PROCEDURE setFall:
	 SHARED isJumping, jmpnt, jumpCount, isJX
	 ' we need to set isJX = 0 bcs is a vertical fall, otherwise he could fall horizontaly
	 ' due a previous state
	 IF (isJumping == 0) THEN: isJumping = 01: jmpnt = -08: jumpCount = 01: isJX = 0: ENDIF
END PROC

' check if the tile under player's feet lets the player pass through (< 10)
PROCEDURE checkFall[ty, tx, txl]
		SHARED yMap1, yMap2, ltiles, l, lvl
		tileVal[ty, tx]: yMap1 =  v: tileVal[ty, txl]: yMap2 = v:
		IF (yMap1 < 10 AND yMap2 < 10) THEN: setFall[]: ENDIF
END PROC
								 
' moves the player horizontally								 
PROCEDURE mvPlrH[x]:
	SHARED plrDirX, plrX, plrY, plrSpdX, plrFrm, plrWFrm, i, ltiles, yMap1, yMap2, posx, posy, val
	'
	IF (x > 0) THEN: i = 00: IF plrWFrm > 03 THEN: plrWFrm = i: ENDIF:ENDIF
	IF (x < 0) THEN: i = 06: IF plrWFrm < i THEN:  plrWFrm = i: ENDIF:ENDIF
	ADD plrWFrm, plrSpdX : IF plrWFrm >= 04 + i THEN: plrWFrm = i: ENDIF: plrFrm = plrWFrm:
	'
	IF plrX + x <= 0 OR plrX + x >= 152 THEN: GOTO emv: ENDIF 
	plrDirX = x: IF (plrWFrm MOD 02 == 0) THEN: ADD plrX, 04 * plrDirX: playStep[]: ENDIF
	'	
	posy = (plrY + 16): DIV posy, 8: posx = plrX: DIV posx, 8: val = (plrX + 07): DIV val, 8
	checkFall[posy, posx, val]
emv:
END PROC

' moves the player vertically
PROCEDURE mvPlrV[plrYdir]:
	SHARED  plrX,  plrY, plrDirY, plrFrm, onLad, curLuigLad, i, ladFrm, ltiles, plrSpdX
	IF (onLad == 01) THEN
		 plrDirY = plrYdir: animClimb[]
		 IF (plrDirY < 0) THEN: plrY = plrY - 02: IF ltiles(lvl, (plrY + 15) / 8, plrX / 8) < 07 THEN: onLad = 00: ENDIF: ENDIF
		 IF (plrDirY > 0) THEN: plrY = plrY + 02: IF ltiles(lvl, (plrY + 16) / 8, plrX / 8) >= 10 THEN: onLad = 00: ENDIF: ENDIF
	ELSE
				' not on stairs so we check for them
				IF 		(plrYdir < 0 AND ltiles(lvl, (plrY + 08) / 8, plrX / 8) == 07) _
					OR  (plrYdir > 0 AND ltiles(lvl, (plrY + 24) / 8, plrX / 8) == 07) THEN
					onLad = 01: plrFrm = 11: plrDirY = plrYdir: plrY = plrY + (02 * plrDirY): animClimb[]
				ENDIF			
	ENDIF			
END PROC

' draw the player frame at xy coord
PROCEDURE putC[frm AS BYTE, x AS BYTE, y AS BYTE]
	SHARED otto
	PUT IMAGE otto FRAME frm AT x, y WITH TRANSPARENCY
END PROC
' draw a player's death frame at xy coord
PROCEDURE putD[frm AS BYTE, x AS BYTE, y AS BYTE]
	SHARED otto2
	PUT IMAGE otto2 FRAME frm AT x, y
END PROC
' draw the bg behind the player at xy coord
PROCEDURE putpBG[x AS BYTE, y AS BYTE]
	SHARED plBG
	PUT IMAGE plBG AT x, y
END PROC
' draw a specific tile  at xy coord
PROCEDURE putT[frm AS BYTE, x AS BYTE, y AS BYTE]
	SHARED tiles
	PUT IMAGE tiles FRAME frm AT x, y
END PROC
' draw the splash at xy coord
PROCEDURE putSplash[frm AS BYTE, x AS BYTE, y AS BYTE]
	SHARED splash
	PUT IMAGE splash FRAME frm AT x, y
END PROC
' reset all the carrots on the level
PROCEDURE rstCrt:
 	SHARED i, x, y, xCrt, yCrt, ltiles, crts
	 i = 0: REPEAT: x = xCrt(lvl, i): y = yCrt(lvl, i): ltiles(lvl, y, x) = 01: INC i: UNTIL i == crts:
END PROC
			

' ---------------------------------------------------------------------------
splash:				
							CLS BLACK
							putSplash[00, 00, 16]: putSplash[01, 40, 16]: putSplash[02, 80, 16]:  putSplash[03, 120, 16]
						    putSplash[04, 00, 56]: putSplash[05, 40, 56]: putSplash[06, 80, 56]:  putSplash[07, 120, 56]
						    putSplash[08, 00, 96]: putSplash[09, 40, 96]: putSplash[10, 80, 96]:  putSplash[11, 120, 96]
						    putSplash[12, 00, 136]: putSplash[13, 40, 136]: putSplash[14, 80, 136]:  putSplash[15, 120, 136]
							SCREEN SWAP
							WAIT KEY: playGot[]: lvl = 00: lives = 10: 'CLS BLACK: SCREEN SWAP
				
				
							'
							' ------------ Init Graphics and stats ---------
							'		
initLv:							
							COLOR BORDER BLACK							
							GOSUB initLevel: GOSUB swapPage: GOSUB initLevel: 'GOSUB swapPage
						    '
							plrX = posStartX(lvl): plrY = posStartY(lvl): GET IMAGE plBG FROM plrX, plrY: 
							onLad = 00: isDied = 00: hasWon = 00: got = 0: isJumping = 0: onLad = 0:
							doorX = posDoorX(lvl): doorY = posDoorY(lvl): startPx = plrX: startPy = plrY
							oPlrX = plrX: oPlrY = plrY: plrFrm = 0: isDied = 0: hasWon = 0:
							nemg = nemsg(lvl): nmvpg = nmpg(lvl) 
							x = 0: REPEAT: 
									'
									eX(x) = senX(lvl, x): eY(x) = senY(lvl, x):
									eDirX(x) = sendrX(lvl, x): eDirY(x) = sendrY(lvl, x)
									eKind(x) = senK(lvl, x): eSpd(x) = senSpd(lvl, x)
									eLX(x) = senLX(lvl, x): eRX(x) = senRX(lvl, x)
									eUY(x) = senUY(lvl, x): eDY(x) = senDY(lvl, x)
									'
							 		GET IMAGE eBg FRAME x FROM eX(x), eY(x)
								    oeX(x) = eX(x): oeY(x) = eY(x): INC x: UNTIL x == neg
							x = 0: REPEAT: 
									'
									mpX(x) = smpX(lvl, x): mpY(x) = smpY(lvl, x):
									mpDirX(x) = smdrX(lvl, x): mpDirY(x) = smdrY(lvl, x)
									mpKind(x) = smpK(lvl, x): mpSpd(x) = smSpd(lvl, x)
									mpLX(x) = smLX(lvl, x): mpRX(x) = smRX(lvl, x)
									mpUY(x) = smUY(lvl, x): mpDY(x) = smDY(lvl, x)
									'
									GET IMAGE mpBg FRAME x FROM mpX(x), mpY(x)
								    ompX(x) = mpX(x): ompY(x) = mpY(x): INC x: UNTIL x == neg	
							'	    
startPlay:						
							plrSFrm = 00: plrFrm = 00: plrDirX = 01:  isJumping = 0: onLad = 0: isJX = 0	
							playTheme[]: 	        
							
							
' ---------------------------------------------------------------------------------------------------------------------						
'
'
'										     M A I N     L O O P
'
'
' ---------------------------------------------------------------------------------------------------------------------						
mainLoop:							
						 
						 	'
							DO
										'
										putpBG[oPlrX, oPlrY]
				 						'
						 				' Reset bg on enemies and plats
						 				x = 0: REPEAT: IF (x < nemg) THEN: PUT IMAGE eBg FRAME x AT oeX(x), oeY(x): ENDIF
						 				  IF (x < nmvpg AND mpKind(x) == 13) THEN: PUT IMAGE mpBg FRAME x AT ompX(x), ompY(x): ENDIF
						 				INC x: UNTIL x == neg
						 				'		
										' we need two frames (pages) update before updating the carrots tile taken							
										IF (got == 01) THEN: posx = plrX: DIV posx, 08: MUL posx, 08: posy = plrY + 08: DIV posy, 08: MUL posy, 08:
											putT[0, posx, posy]: got = 0:
										ENDIF
						 				
	  					 				' Store old position for page swap										'
 				 						oPlrX = plrX: oPlrY = plrY
 				 						
						 				' Update enemies and plats 
						 				' Update player pos if on mobile plats
	  					 				GOSUB updateElms
	  					 				
	  					 				'
	  					 				' Update player if not on died state
	  					 				'
										' is Jumping, jump!
										IF (isDied == 00) THEN:
							 			 	IF (isJumping == 01) THEN: GOSUB progressJump
							 				ELSE:
							 					plrSpdX = 01				
												' move left right and jump
							 					' se non e sulle scale
							 					IF (onLad == 00) THEN
							 						plrFrm = plrSFrm:
							 						IF (KEY PRESSED(#LEFT))  THEN: mvPlrH[-01]: plrSFrm = 06: plrJFrm = 10: ENDIF
							 						IF (KEY PRESSED(#RIGHT)) THEN: mvPlrH[01]: plrSFrm = 00: plrJFrm = 04: ENDIF
							 						IF (KEY PRESSED(#SPACE)) THEN: isJumping = 01: DEC plrY: jumpCount = -04: jmpnt = -01:
														isJX = 0
														IF (KEY PRESSED(#LEFT) OR KEY PRESSED(#RIGHT)) THEN: isJX = 1: ENDIF
														IF (KEY PRESSED(#UP)) THEN: plrSpdX = 02: ENDIF
														GOSUB progressJump: ENDIF
							 					ENDIF
							 					'
							 					' scale
							 					' up down ladders
							 					'
							 					'
							 					IF (KEY PRESSED(#UP)   AND isJumping == 00) THEN: mvPlrV[-01] : ENDIF
							 					IF (KEY PRESSED(#DOWN) AND isJumping == 00) THEN: mvPlrV[01]: ENDIF
							 					
		  					 					'
		  					 					' Check collision with special platforms:
		  					 					' tapis roulant:
		  					 					posy = (plrY + 16): DIV posy, 8: posx = plrX: DIV posx, 8: val = (plrX + 7): DIV val, 8
		  					 					tileVal[posy, posx]: yMap1 = v: tileVal[posy, val]: yMap2 = v
		  					 					IF 		(yMap1 == 10 OR yMap2 == 10) THEN: ADD plrX, -04: checkFall[posy, plrX / 8, (plrX + 07) / 8]
		  					 					ELSE IF (yMap1 == 11 OR yMap2 == 11) THEN: ADD plrX, 04:  checkFall[posy, plrX / 8, (plrX + 07) / 8] 
		  					 					'
		  					 					ENDIF
							 					'
							 				ENDIF
						 				ENDIF
						 				
						 				' Super jump animation ?
						 				IF (plrSpdX == 02) THEN: plrFrm = plrWFrm + 01 : ENDIF		
	  					 					  					 				
	  					 				'
	  					 				' Check collision with cross
	  					 				'
						 				posx = plrX: DIV posx, 8: posy = plrY + 08: DIV posy, 8
										tileVal[posy, posx]: yMap2 = v: MUL posx, 8: MUL posy, 8
						 				' we need to get the exact cell pos, not the character pos
						 				IF (yMap2 == 01) THEN:  putT[00, posx, posy]
						 					DIV posx, 8: DIV posy, 8
											got = 01: ltiles(lvl, posy, posx) = 00: playGot[]: DEC itemsGot: 
											' Check to open level door 
											IF (itemsGot <= 00) THEN: playGotAll[]:
											      IF (lvl == lvls - 01) THEN: ' good end sequence
											        hasWon = 01: EXIT 
											        ELSE: PUT IMAGE door FRAME 01 AT doorX, doorY: ENDIF
											ENDIF        
										ELSEIF (yMap2 > 07 AND yMap2 < 10) THEN:
											' 
											' Fatal tile !!
											'
											isDied = 10 - yMap2
										ENDIF
										' 
										' Check collision with door
										' if we have all the carrots it trggers the level change
										'
										IF (itemsGot == 00) THEN:
										 IF (plrX == doorX AND plrY == doorY) THEN: COLOR BORDER BLUE: EXIT: ENDIF: ENDIF
										'
										' Get background for the player
						 				GET IMAGE plBG FROM oPlrX, oPlrY
						 				' get background for enemies and mobile platforms	
						 				x = 0: REPEAT: 
						 						IF (x < nemg) THEN: GET IMAGE eBg FRAME x FROM oeX(x), oeY(x): ENDIF
						 			 	 		IF (x < nmvpg AND mpKind(x) == 13) THEN: GET IMAGE mpBg FRAME x FROM ompX(x), ompY(x): ENDIF
						 				INC x: UNTIL x == neg
										'
										' draw main character
						 				putC[plrFrm, plrX, plrY]
						 				'
						 				' draw enemies and mobile platforms
						 				i = 0: REPEAT: 
						 					   	IF (i < nemg) THEN: PUT IMAGE enms FRAME eKind(i) + eFrm(i) AT eX(i), eY(i): ENDIF
						 					   	IF (i < nmvpg AND mpKind(i) == 13) THEN: putT[13, mpX(i), mpY(i)]: ENDIF
						 				INC i: UNTIL i == neg
						 				' special for last level: animates the witch's laugh
						 				IF (lvl == 03) THEN: INC haha: IF (haha > 01) THEN:  putT[19, doorX - 08, doorY]: haha = 0: 
						 							ELSE: putT[14, doorX - 08, doorY]: ENDIF: ENDIF
						 				'										
										' lose a life
										IF plrY > 148 THEN: isDied = 01: ENDIF
										IF (isDied > 0) THEN: EXIT: ENDIF
						 				'
						 				GOSUB swapPage
							LOOP
							
'
' ----------- Check for completing a level or the game -----							
'
exitLoop:
	'
	IF (isDied > 00) THEN: 
		' Put the right death animation (bones/water), swap screen and restore the run
		IF (isDied == 01) THEN: putD[00, plrX, plrY]: ELSE: putD[01, plrX, plrY]: ENDIF: isDied = 00: DEC lives: 
		putT[0, lives * 08, 154]: COLOR BORDER BLACK: SCREEN SWAP: playGrunt[]: i = 0: playPause[]: playLose[]: playPause[]
		putT[0, lives * 08, 154]: IF (lives == 00) THEN: rstCrt[]: WAIT KEY: GOTO splash: ENDIF:
		putpBG[oPlrX, oPlrY]: GET IMAGE plBG FROM plrX, plrY: oPlrX = plrX: oPlrY = plrY
		SCREEN SWAP: plrX = posStartX(lvl): plrY = posStartY(lvl): putC[0, plrX, plrY]: putpBG[oPlrX, oPlrY]: SCREEN SWAP: GOTO startPlay
	ENDIF
	'
	' Final level complete: hide witch's laugh and put witch skeleton, play final music then return to splash screen
	IF (hasWon == 01) THEN:
		putT[0, doorX - 08, doorY]
		PUT IMAGE witch FRAME 01 AT doorX, doorY: PUT IMAGE otto2 FRAME 02 AT plrX, plrY:
		SCREEN SWAP: playWin[]: WAIT KEY: GOTO splash: ENDIF
	'	
	' ends a level
	playWin[]: rstCrt[]: INC lvl: GOTO initLv
							
							
'
' ----------- Lose a life and check for game over ----------
'
							
							
'
' ------------------------ Screen Swap ---------------------
'							
swapPage:
     SCREEN SWAP
RETURN							
							
'
' -------------------------- Jump --------------------------
'
progressJump:
	' increment jump and check for ceiling in order to not go over it
	ADD plrY, jumpCount: IF (plrY < 00) THEN: plrY = 00: ENDIF
	IF (jumpCount < 04) THEN: INC jumpCount: ENDIF
	'
	' increments jump note to play
	ADD jmpnt, (05 + jumpCount) / 02  
	'
	' sounds
	playJump[]
	'
	' is horizionta jump? move the chat horizontally
	IF isJX = 01 THEN: mvPlrH[plrDirX]: ENDIF	
	'
	' Repos on ground if descending after jump or falling
	'
	IF (jumpCount > 03) THEN
		yMap1 = ltiles(lvl, (plrY + 16) / 8, plrX / 8)
		' + isJX * 2 to put some tolerance on edges while the
		' jump is horizontal
		yMap2 = ltiles(lvl, (plrY + 16) / 8, (plrX + 06 + isJX) / 8)
		IF (yMap1 >= 10 OR yMap2 >= 10) THEN
			isJumping = 0: ADD plrY, 16: DIV plrY, 8: MUL plrY, 8: ADD plrY, -16
		RETURN:	ENDIF 
	ENDIF
RETURN


updateElms:
i = 0:
REPEAT:
' 
' -------------------- UPDATE ENEMIES -----------------------
'
	IF (i < nemg) THEN: 
			' progress animation
		    INC eFrm(i)
		    ' peek and poke is a different way to access arrays, let's update the animation frame
			IF (PEEK(VARPTR(eFrm) + i) > 03) THEN: POKE VARPTR(eFrm) + i, 00: ENDIF: 
			IF (PEEK(VARPTR(eFrm) + i) < 00) THEN: POKE VARPTR(eFrm) + i, 03: ENDIF
			posx = eX(i): posy = eY(i): dirx = eDirX(i): diry = eDirY(i): val = eSpd(i) 
			' new pos coordinates and direction math 	
			x = posx + (val * dirx): y = posy + (val * diry)
			' check enemy movement limit and change direction
			IF (x <= eLX(i) OR x >= eRX(i)) THEN: eDirX(i) = dirx * -01: x = posx: ENDIF
			IF (y <= eUY(i) OR y >= eDY(i)) THEN: eDirY(i) = diry * -01: y = posy: ENDIF
			' move enemy
			oeX(i) = posx: oeY(i) = posy: eX(i) = x: eY(i) = y 
			' check player collision
			IF (ABS(plrX - eX(i)) <= 04 AND ABS((plrY + 04) - eY(i)) <= 08) THEN: isDied = 01: ENDIF
		
	ENDIF		
' 
' -------------------- UPDATE PLATFORMS ---------------------
'		
	IF (i < nmvpg) THEN:
		' cloud disappear
		IF (mpKind(i) == 12) THEN: INC mpSpd(i): IF (mpSpd(i) >= mpLX(i) - 01) THEN:
		    x = (mpX(i)) / 8: y = (mpY(i)) / 8:
		    ' for this kind of platform we use dir as stat
		    	IF (mpSpd(i) == mpLX(i) - 01) THEN: mpDirX(i) = mpDirX(i) * -01: ELSE: mpSpd(i) = 00: ENDIF 
				IF (mpDirX(i) > 0) THEN: putT[0, mpX(i), mpY(i)]: ltiles(lvl, y, x) = 00: 
									IF (plrY + 16 < mpY(i) + 08 AND onLad == 0) THEN:
										checkFall[(plrY + 16) / 8, plrX / 8, (plrX + 7) / 8] 
									ENDIF	 	
				ELSE: putT[12, mpX(i), mpY(i)]: ltiles(lvl, y, x) = 12: 
				ENDIF 
		ENDIF: ENDIF
		
		' platform moves
		IF (mpKind(i) == 13) THEN: 
			' Move the player if is on the platform:
	  		 c = 0: IF (ABS(plrX - mpX(i)) < 08 AND ABS((plrY + 16) - mpY(i)) <= 03) THEN: c = 01: ENDIF
	  		 '	  		 
		     x = (ompX(i)) / 8: y = (ompY(i)) / 8: ompX(i) = mpX(i): ompY(i) = mpY(i)
		     v = mpSpd(i)
		     ' move H
			  IF (mpX(i) <= mpLX(i) OR mpX(i) >= mpRX(i)) THEN: mpDirX(i) = mpDirX(i) * -01: ENDIF
			 ADD mpX(i), v * mpDirX(i):
		     ' move V
		      IF (mpY(i) <= mpUY(i) OR mpY(i) >= mpDY(i)) THEN: mpDirY(i) = mpDirY(i) * -01: ENDIF 
			 ADD mpY(i), v * mpDirY(i):
			 x = (mpX(i)) / 8: y = (mpY(i)) / 8:
		     IF (c == 01) THEN: isJumping = 00: ADD plrX, v * mpDirX(i): plrY = mpY(i) - 16: ENDIF
	    ENDIF
	ENDIF
		
INC i: UNTIL i == neg:
RETURN	


'
' -------------------- Init Level -------------------------
'						
initLevel:
	CLS BLACK 
		' draws the logo, read the current level matrix and draws the level
	 	PUT IMAGE logo AT 40, 164: i = 0: REPEAT: PUT IMAGE life AT  i * 8, 154: INC i: UNTIL i == lives
		itemsGot = 0
	    y = 0: REPEAT
		x = 0: REPEAT
			 v = ltiles(lvl, y, x): IF (v == 01) THEN: xCrt(lvl, itemsGot) = x: yCrt(lvl, itemsGot) = y: INC itemsGot: ENDIF
			 putT[v, x * 8, y * 8]
			 INC x: UNTIL x = 20
		INC y: UNTIL y == 19: crts = itemsGot	
		IF (lvl < 03) THEN: PUT IMAGE door FRAME 00 AT posDoorX(lvl), posDoorY(lvl): 
		 ELSE: PUT IMAGE witch FRAME 00 AT posDoorX(lvl), posDoorY(lvl): ENDIF
RETURN							
							

'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
