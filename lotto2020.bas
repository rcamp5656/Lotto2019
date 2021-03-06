REM *** Lotto 649 Package Version 2020 RC1 With Automatic Draw Date Update
REM *** Written by: Russ Campbell
REM
REM *** Last Update : April 15 2019 - 4:30 PM
REM
_FULLSCREEN _STRETCH
CLEAR , , 600000
DIM temp(6): TIMER ON
DIM temp2(6)
DIM temp3(49)
DIM temp4(49)
DIM entry(49)
DIM month$(12)
DIM numb(50)
DIM chart(100000, 13)
DIM bonus(50)
DIM outpt(50)
DIM n AS INTEGER
DIM n1 AS INTEGER
DIM n2 AS INTEGER
DIM n3 AS INTEGER
DIM n4 AS INTEGER
DIM dy AS INTEGER
DIM m AS INTEGER
DIM y AS INTEGER
DIM bay(7) AS STRING
DIM a1 AS INTEGER
DIM day1 AS INTEGER
DIM adddays AS INTEGER
REM $STATIC
FOR a1 = 0 TO 6
    READ bay(a1)
NEXT a1
RESTORE dayofweek
RANDOMIZE TIMER
REM ON ERROR GOTO errorhandle
GOSUB grcheck
GOSUB grinit
GOSUB buildchart
GOSUB convert

IF crs$ = "Y" THEN COLOR 1, 7
CLS
IF crs$ = "Y" THEN COLOR 11, 1
REM build top corner at pos 3,6
LOCATE 3, 6
PRINT CHR$(201)
REM build top line at line 3
FOR i = 2 TO 67
    LOCATE 3, 5 + i
    PRINT CHR$(205)
NEXT i
REM build end corner at pos 3,73
LOCATE 3, 73
PRINT CHR$(187)
FOR i = 4 TO 17
    LOCATE i, 6
    PRINT CHR$(186)
    LOCATE i, 73
    PRINT CHR$(186)
NEXT i
LOCATE 18, 6
PRINT CHR$(200)
FOR i = 2 TO 67
    LOCATE 18, 5 + i
    PRINT CHR$(205)
NEXT i
LOCATE 18, 73
PRINT CHR$(188)
IF crs$ = "Y" THEN COLOR 7, 1
FOR i = 8 TO 72
    LOCATE 4, i
    PRINT CHR$(178)
NEXT i
FOR i = 8 TO 72
    LOCATE 17, i
    PRINT CHR$(178)
NEXT i
FOR i = 4 TO 17
    LOCATE i, 7
    PRINT CHR$(178)
    LOCATE i, 72
    PRINT CHR$(178)
NEXT i
IF crs$ = "Y" THEN COLOR 3, 1
LOCATE 5, 8
PRINT CHR$(201)
FOR i = 9 TO 70
    LOCATE 5, i
    PRINT CHR$(205)
NEXT i
LOCATE 5, 71
PRINT CHR$(187)
FOR i = 9 TO 70
    LOCATE 16, 8
    PRINT CHR$(205)
NEXT i
FOR i = 5 TO 16
    LOCATE i, 8
    IF i = 5 THEN
        PRINT CHR$(201)
    ELSEIF i = 16 THEN
        PRINT CHR$(200)
    ELSEIF i = 6 OR i = 7 OR i = 14 THEN
        PRINT CHR$(204)
    ELSE
        PRINT CHR$(186)
    END IF
    LOCATE i, 71
    IF i = 5 THEN
        PRINT CHR$(187)
    ELSEIF i = 16 THEN
        PRINT CHR$(188)
    ELSEIF i = 6 OR i = 7 OR i = 14 THEN
        PRINT CHR$(185)
    ELSE
        PRINT CHR$(186)
    END IF
NEXT i
FOR i = 9 TO 70
    LOCATE 6, i
    PRINT CHR$(205)
NEXT i
FOR i = 9 TO 70
    LOCATE 7, i
    PRINT CHR$(205)
NEXT i
FOR i = 9 TO 70
    LOCATE 16, i
    PRINT CHR$(205)
NEXT i
IF crs$ = "Y" THEN COLOR 10, 5
LOCATE 6, 11
PRINT " Lotto 649 Package Version 2020 RC1 Copyright (c) 2019   "
IF crs$ = "Y" THEN COLOR 2, 12
LOCATE 8, 9
PRINT "                                                              "
LOCATE 9, 9
PRINT "                                                              "
IF crs$ = "Y" THEN COLOR 2, 12
LOCATE 10, 9
PRINT "                                                              "
LOCATE 11, 9
PRINT "                                                              "
LOCATE 12, 9
PRINT "                                                              "
LOCATE 13, 9
PRINT "                                                              "
IF crs$ = "Y" THEN COLOR 10, 5
LOCATE 9, 14
PRINT "Written By    : Russ Campbell                      "
LOCATE 10, 14
PRINT "Release Date  : APR 15 2019 - 4:30 PM              "
LOCATE 11, 14
PRINT "Registered To :                                    "
LOCATE 11, 30
PRINT reg$
LOCATE 12, 14
PRINT "Serial Number : "; reg2$; "      "
IF crs$ = "Y" THEN COLOR 3, 1
FOR i = 9 TO 70
    LOCATE 14, i
    PRINT CHR$(205)
NEXT i
IF crs$ = "Y" THEN COLOR 2, 12
LOCATE 15, 9
PRINT " Graphics Mode : "
LOCATE 15, 25
PRINT "["
LOCATE 15, 30
PRINT "]"
IF crs$ = "Y" THEN COLOR 4, 2
LOCATE 15, 26
PRINT "    "
LOCATE 15, 26
PRINT grmode$
LOCATE 15, 45
IF crs$ = "Y" THEN COLOR 15, 3
LOCATE 15, 31
PRINT
IF crs$ = "Y" THEN COLOR 15, 3
LOCATE 15, 63
PRINT "       "
IF crs$ = "Y" THEN COLOR 11, 6
LOCATE 15, 31
PRINT "       Press any key to continue...     "
IF crs$ = "Y" THEN COLOR 10, 2
DO WHILE INKEY$ = ""
LOOP
GOTO main:
enterdate:
'Find Day of the Week
n = 0: n1 = 0: n2 = 0: n3 = 0: n4 = 0
n1 = FIX(3 * (m + 1) / 5)
n2 = FIX(y / 4)
n3 = FIX(y / 100)
n4 = FIX(y / 400)


n = dy + (2 * m) + n1 + y + n2 - n3 + n4 + 2

day1 = n MOD 7

IF ((y MOD 4 = 3) AND (m = 1)) THEN day1 = day1 + 2
IF ((y MOD 4 = 3) AND (m = 2)) THEN day1 = day1 + 2
IF ((y MOD 4 <> 3) AND (m = 1)) THEN day1 = day1 + 2
IF ((y MOD 4 <> 3) AND (m = 2)) THEN day1 = day1 + 2
IF day1 > 6 THEN day1 = 0
IF bay(day1) = "Sat" AND count = 1 THEN
    adddays = 4
    dy = dy + adddays
ELSEIF bay(day1) = "Wed" AND count = 1 THEN
    adddays = 3
    day1 = day1 + adddays
ELSEIF bay(day1) = "Sat" AND count = -1 THEN
    adddays = -3
    day1 = day1 + adddays
ELSEIF bay(day1) = "Wed" AND count = -1 THEN
    adddays = -4
    day1 = day1 + adddays
ELSEIF bay(day1) = "Sat" AND count = 0 THEN
    adddays = 0
    day1 = day1 + adddays
ELSEIF bay(day1) = "Wed" AND count = 0 THEN
    adddays = 0
    day1 = day1 + adddays
END IF
IF day1 > 6 THEN day1 = 0
'Add 3 or 4 days to the day of week

n1 = FIX(3 * (m + 1) / 5)
n2 = FIX(y / 4)
n3 = FIX(y / 100)
n4 = FIX(y / 400)


n = dy + (2 * m) + n1 + y + n2 - n3 + n4 + 2

day1 = n MOD 7

IF ((y MOD 4 = 3) AND (m = 1)) THEN day1 = day1 + 2
IF ((y MOD 4 = 3) AND (m = 2)) THEN day1 = day1 + 2
IF ((y MOD 4 <> 3) AND (m = 1)) THEN day1 = day1 + 2
IF ((y MOD 4 <> 3) AND (m = 2)) THEN day1 = day1 + 2
IF day1 > 6 THEN day1 = 0

RETURN


picker:
CLS
IF randome$ = "no" THEN
    PRINT ""
    PRINT "This section will prompt you for 14 numbers of your choosing"
    PRINT "then create sets of numbers based on your chosen numbers."
    PRINT ""
ELSEIF randome$ = "yes" THEN
    PRINT ""
    PRINT "This section will pick random numbers for you"
    PRINT "then create as many sets of numbers as you desire."
    PRINT
END IF
PRINT
money:
INPUT "How much money do you wish to spend [At $3.00 per sets of numbers : ]  $", sets
IF sets < 3 THEN
    PRINT "You need to spend at least $3.00 - Please try again!"
    GOTO money
END IF
sets = INT(sets / 3)
PRINT
diskcop:
INPUT "Output to disk file [Y]es or [N]o : ", diskcopy$
IF diskcopy$ = "Y" OR diskcopy$ = "y" OR diskcopy$ = "yes" OR diskcopy$ = "YES" OR diskcopy$ = "Yes" OR diskcopy$ = "yES" THEN
    diskcopy$ = "Y"
    INPUT "Filename [without extension] : ", file$
    IF file$ = "" OR file$ = "numbers2" OR file$ = "numbers2.dat" OR file$ = "lotto5g.exe" OR file$ = "grmode.exe" OR file$ = "grmode" THEN
        PRINT "Invalid filename ... please try again !!!"
        GOTO diskcop
    END IF
    file$ = file$ + ".dat"
    OPEN file$ FOR OUTPUT AS #2
END IF

PRINT
IF randome$ = "yes" THEN
    GOTO Start
ELSEIF randome$ = "no" THEN
    GOTO previously
END IF
previously:
INPUT "Do you wish to use a previously saved set of numbers  [Y] or [N] : ", answer$
IF answer$ = "y" OR answer$ = "Y" THEN
    OPEN "numbers.dat" FOR INPUT AS #1
    DO UNTIL EOF(1)
        counter = counter + 1
        INPUT #1, number
        entry(counter) = number
    LOOP
ELSE
    GOTO entry
END IF
CLOSE #1
IF counter < qqq THEN
    qqq = counter
ELSEIF counter > qqq THEN
    qqq = counter
END IF
GOTO Start
entry:
IF randome$ = "yes" THEN GOTO Start
CLS
FOR zq = 1 TO qqq
    1 PRINT "Entry #"; zq; " ";: INPUT ":", entry(zq)
    IF entry(zq) = 0 THEN
        IF diskcopy$ = "Y" THEN
            CLOSE #2
        END IF
        GOTO main
    END IF
    IF entry(zq) < 1 OR entry(zq) > 49 THEN
        PRINT "Number Out of Range ! , Try Again !!"
        GOTO 1
    END IF
    IF zq > 1 THEN
        FOR i = 1 TO (zq - 1)
            IF entry(zq) = entry(i) THEN
                PRINT "Number already entered, pick another!"
                GOTO 1
            END IF
        NEXT i
    END IF
NEXT zq

PRINT
CLS
PRINT
PRINT "You have picked the following numbers: "
PRINT
FOR i = 1 TO qqq
    PRINT "Entry # "; i; " "; entry(i)
NEXT i
PRINT
INPUT "Is this all correct [Y]es or [N]o  : ", answer$
IF answer$ = "n" OR answer$ = "N" THEN GOTO entry
PRINT
INPUT "Save Numbers to disk [Y] or [N] : ", answer$
IF answer$ = "Y" OR answer$ = "y" THEN
    OPEN "numbers.dat" FOR OUTPUT AS #1
    FOR i = 1 TO qqq
        PRINT #1, entry(i)
    NEXT i
    CLOSE #1
END IF
Start:
CLS
PRINT
PRINT "Lotto 649 Number List"
PRINT "---------------------"
PRINT
IF hardcopy$ = "Y" OR hardcopy$ = "y" THEN
    LPRINT
    LPRINT "Lotto 649 Number List"
    LPRINT "---------------------"
    LPRINT
END IF
FOR x = 1 TO sets
    FOR y = 1 TO 6
        GOSUB pick
    NEXT y
    IF randome$ = "no" THEN
        FOR i = 1 TO 6
            temp(i) = entry(temp(i))
        NEXT i
    END IF
    FOR i = 1 TO 6
        temp2(i) = temp(i)
    NEXT i
    FOR j = 1 TO 6
        marker = 99
        FOR i = 1 TO 6
            IF temp2(i) < marker THEN
                marker = temp2(i)
                marker2 = i
            END IF
        NEXT i
        temp2(marker2) = 99
        temp(j) = marker
    NEXT j

    a = temp(1): b = temp(2): c = temp(3): d = temp(4): e = temp(5): f = temp(6)
    IF diskcopy$ = "Y" THEN
        PRINT #2, USING "## ## ## ## ## ##"; a; b; c; d; e; f
    END IF
    IF hardcopy$ = "Y" OR hardcopy$ = "y" THEN
        LPRINT USING "## ## ## ## ## ##"; a; b; c; d; e; f
    END IF
    PRINT USING "## ## ## ## ## ##"; a; b; c; d; e; f
    GOSUB cleararrays
NEXT x
PRINT
PRINT "Program Written by : Russ Campbell"
IF hardcopy$ = "Y" AND randome$ = "no" THEN
    LPRINT
    LPRINT "The numbers that you have chosen are as follows: "
    LPRINT
    FOR i = 1 TO qqq
        LPRINT entry(i); " ";
    NEXT i
    PRINT
END IF
IF hardcopy$ = "Y" THEN
    LPRINT
    LPRINT "Program written by : Russ Campbell"
    LPRINT
    LPRINT CHR$(12)
END IF
IF diskcopy$ = "Y" THEN
    CLOSE #2
END IF
PRINT
PRINT "Press any key to continue"
DO WHILE INKEY$ = ""
LOOP
GOTO main
pick:
IF randome$ = "yes" THEN
    raaa = 35
END IF
IF randome$ = "no" THEN
    raaa = 0
END IF
rzzz = INT((qqq + raaa) * RND(1) + 1)
temp(y) = rzzz
temp3(rzzz) = temp3(rzzz) + 1
GOSUB checkforduplicates
RETURN
cleararrays:
ERASE temp3
RETURN
checkforduplicates:
IF y > 1 THEN
    IF temp3(rzzz) > 1 THEN
        GOSUB pick
    END IF
END IF
RETURN
main:
IF crs$ = "Y" THEN COLOR 1, 7
CLS
IF crs$ = "Y" THEN COLOR 3, 8
LOCATE 4, 7
PRINT CHR$(201)
FOR i = 8 TO 73
    LOCATE 4, i
    PRINT CHR$(205)
NEXT i
LOCATE 4, 74
PRINT CHR$(187)
FOR i = 5 TO 13
    LOCATE i, 7
    IF i = 6 OR i = 11 OR i = 13 THEN
        PRINT CHR$(204)
    ELSE
        PRINT CHR$(186)
    END IF
    LOCATE i, 74
    IF i = 6 OR i = 11 OR i = 13 THEN
        PRINT CHR$(185)
    ELSE
        PRINT CHR$(186)
    END IF
NEXT i
FOR i = 8 TO 73
    LOCATE 6, i
    PRINT CHR$(205)
NEXT i
FOR i = 8 TO 73
    LOCATE 11, i
    PRINT CHR$(205)
NEXT i
FOR i = 8 TO 73
    LOCATE 13, i
    PRINT CHR$(205)
NEXT i
LOCATE 14, 7
PRINT CHR$(186)
LOCATE 14, 74
PRINT CHR$(186)
LOCATE 15, 7
PRINT CHR$(200)
FOR i = 8 TO 73
    LOCATE 15, i
    PRINT CHR$(205)
NEXT i
LOCATE 15, 74
PRINT CHR$(188)
IF crs$ = "Y" THEN COLOR 15, 3
LOCATE 14, 8
PRINT "                                                                  "
LOCATE 14, 8
count = 0
m = month
dy = day
y = year
count = 0
GOSUB enterdate


PRINT USING "  Winning Numbers Database Updated On :  \ \  \ \ ##-#### "; bay(day1); month$(m), dy, y
IF crs$ = "Y" THEN COLOR 10, 5
LOCATE 5, 8
PRINT "            Lotto 649 Package Version 2020 RC1 Main Menu          "
IF crs$ = "Y" THEN COLOR 4, 7
FOR i = 7 TO 10
    LOCATE i, 13
    PRINT "["
    LOCATE i, 15
    PRINT "]"
    LOCATE i, 42
    PRINT "["
    LOCATE i, 44
    PRINT "]"
NEXT i
IF crs$ = "Y" THEN COLOR 0, 7
LOCATE 7, 14
PRINT "A"
LOCATE 7, 43
PRINT "B"
LOCATE 8, 14
PRINT "C"
LOCATE 8, 43
PRINT "D"
LOCATE 9, 14
PRINT "E"
LOCATE 9, 43
PRINT "F"
LOCATE 10, 14
PRINT "G"
LOCATE 10, 43
PRINT "H"
IF crs$ = "Y" THEN COLOR 1, 7
LOCATE 7, 18
PRINT "Enter Winning Numbers"
LOCATE 8, 18
PRINT "Use"; qqq; "Number System"
LOCATE 9, 18
PRINT "Initialize Data Files"
LOCATE 10, 18
PRINT "Special Date Bargraphs"
LOCATE 7, 47
PRINT "Search and Print Menus"
LOCATE 8, 47
PRINT "Pick random Numbers"
LOCATE 9, 47
PRINT "Bargraph Menu"
LOCATE 10, 47
PRINT "Frequency Calculator"
IF crs$ = "Y" THEN COLOR 4, 7
LOCATE 12, 31
PRINT "["
LOCATE 12, 33
PRINT "]"
LOCATE 12, 42
PRINT "Escape Key Exits Program"
IF crs$ = "Y" THEN COLOR 1, 7
LOCATE 12, 13
PRINT "Your choice is : "
main2:
LOCATE 12, 32
answer$ = ""
answer$ = INPUT$(1)
PRINT answer$
IF answer$ = CHR$(27) THEN
    GOTO finish
ELSEIF answer$ = "A" OR answer$ = "a" THEN
    GOTO enterwinningnumbers
ELSEIF answer$ = "B" OR answer$ = "b" THEN
    GOTO searchmenu
ELSEIF answer$ = "C" OR answer$ = "c" THEN
    randome$ = "no"
    GOTO picker
ELSEIF answer$ = "D" OR answer$ = "d" THEN
    randome$ = "yes"
    GOTO picker
ELSEIF answer$ = "E" OR answer$ = "e" THEN
    GOTO cleardata
ELSEIF answer$ = "F" OR answer$ = "f" THEN
    spec$ = "N"
    GOTO bargraph
ELSEIF answer$ = "G" OR answer$ = "g" THEN
    spec$ = "Y"
    GOTO enquiremonth
ELSEIF answer$ = "H" OR answer$ = "h" THEN
    GOTO chart2
ELSEIF answer$ = "%" THEN
    CLS
    INPUT "Enter Password: ", pass2$
    owner$ = "Russ Campbell"
    registered$ = reg$
    distribute$ = "QB64.ORG"
    serial$ = reg2$
    version$ = "2020 RC1"
    release$ = "April 15 2019 - 4:30 PM"
    pass$ = "Password"
    IF pass2$ = pass$ THEN
        CLS
        PRINT
        PRINT "Program Written by : "; owner$
        PRINT "Registered to      : "; registered$
        PRINT "Distributed by     : "; distribute$
        PRINT "Serial #           : "; serial$
        PRINT "Version #          : "; version$
        PRINT "Release date       : "; release$
        PRINT
        PRINT "Press any key to continue ... "
        DO WHILE INKEY$ = ""
        LOOP
    END IF
    GOTO main


END IF
GOTO main
chart:
CLS
PRINT "Number Pattern"
PRINT "--------------"
PRINT
PRINT "This sections displays the number pattern for winning #s that have"
PRINT "been entered. The amount of times each number has been picked is "
PRINT "displayed as in the chart below."
PRINT
IF bonus$ = "Y" THEN
    title2$ = "With Bonus Numbers"
ELSEIF bonus$ = "N" THEN
    title2$ = "Without Bonus Numbers"
END IF
FOR i = 1 TO 50
    outpt(i) = 0
NEXT i
FOR i = 1 TO 49
    IF bonus$ = "Y" THEN
        outpt(i) = numb(i) + bonus(i)
    ELSEIF bonus$ = "N" THEN
        outpt(i) = numb(i)
    END IF
NEXT i
PRINT
PRINT "Number Chart "; title2$
PRINT
FOR i = 1 TO 10
    PRINT USING "Num ## : ###"; i; outpt(i);
    PRINT USING "  Num ## : ###"; i + 10; outpt(i + 10);
    PRINT USING "  Num ## : ###"; i + 20; outpt(i + 20);
    PRINT USING "  Num ## : ###"; i + 30; outpt(i + 30);
    PRINT USING "  Num ## : ###"; i + 40; outpt(i + 40)
NEXT i
IF hardcopy$ = "Y" THEN
    LPRINT
    LPRINT "Number Chart "; title2$
    LPRINT
    LPRINT
    FOR i = 1 TO 10
        LPRINT USING "Num ## : ###"; i; outpt(i);
        LPRINT USING "  Num ## : ###"; i + 10; outpt(i + 10);
        LPRINT USING "  Num ## : ###"; i + 20; outpt(i + 20);
        LPRINT USING "  Num ## : ###"; i + 30; outpt(i + 30);
        LPRINT USING "  Num ## : ###"; i + 40; outpt(i + 40)
    NEXT i
    LPRINT
    LPRINT "Program Written by Russ Campbell"
    LPRINT
    LPRINT CHR$(12)
END IF
PRINT: PRINT "Press any key to continue"
DO WHILE INKEY$ = ""
LOOP
GOTO graphmenu
enquiremonth:
CLS
PRINT
PRINT "View Graphs from specified date"
PRINT
INPUT "Enter Year to start from  : ", yearin
IF yearin < 2000 THEN
    yearin = 2000
END IF
INPUT "Enter Month to start from : ", monthin
INPUT "Enter Year to finish at   : ", yearend
IF yearend < 2000 THEN
    yearend = 2000
END IF
INPUT "Enter Month to finish at  : ", monthend
bargraph:
FOR i = 1 TO 49
    numb(i) = 0
    bonus(i) = 0
    outpt(i) = 0
NEXT i
GOSUB convert
viewpoint$ = ""
graphmenu:
IF crs$ = "Y" THEN COLOR 1, 7
CLS
IF crs$ = "Y" THEN COLOR 3, 8
LOCATE 2, 6
PRINT CHR$(201)
FOR i = 7 TO 73
    LOCATE 2, i
    PRINT CHR$(205)
NEXT i
LOCATE 2, 74
PRINT CHR$(187)
FOR i = 3 TO 21
    LOCATE i, 6
    IF i = 4 OR i = 7 OR i = 12 OR i = 14 OR i = 20 THEN
        PRINT CHR$(204)
    ELSE
        PRINT CHR$(186)
    END IF
    LOCATE i, 74
    IF i = 4 OR i = 7 OR i = 12 OR i = 14 OR i = 20 THEN
        PRINT CHR$(185)
    ELSE
        PRINT CHR$(186)
    END IF
NEXT i
LOCATE 22, 6
PRINT CHR$(200)
LOCATE 22, 74
PRINT CHR$(188)
FOR i = 7 TO 73
    LOCATE 22, i
    PRINT CHR$(205)
NEXT i
FOR i = 7 TO 73
    LOCATE 7, i
    PRINT CHR$(205)
NEXT i
FOR i = 7 TO 73
    LOCATE 12, i
    PRINT CHR$(205)
NEXT i
FOR i = 7 TO 73
    LOCATE 20, i
    PRINT CHR$(205)
NEXT i
FOR i = 7 TO 73
    LOCATE 14, i
    PRINT CHR$(205)
NEXT i
FOR i = 7 TO 73
    LOCATE 4, i
    PRINT CHR$(205)
NEXT i
LOCATE 4, 37
PRINT CHR$(203)
LOCATE 5, 37
PRINT CHR$(186)
LOCATE 6, 37
PRINT CHR$(186)
LOCATE 7, 37
PRINT CHR$(206)
LOCATE 8, 37
PRINT CHR$(186)
LOCATE 9, 37
PRINT CHR$(186)
LOCATE 10, 37
PRINT CHR$(186)
LOCATE 11, 37
PRINT CHR$(186)
LOCATE 12, 37
PRINT CHR$(202)
IF crs$ = "Y" THEN COLOR 4, 7
FOR i = 8 TO 11
    LOCATE i, 12
    PRINT "["
    IF crs$ = "Y" THEN COLOR 0, 7
    LOCATE i, 13
    PRINT CHR$(57 + i)
    IF crs$ = "Y" THEN COLOR 4, 7
    LOCATE i, 14
    PRINT "]"
NEXT i
FOR i = 8 TO 11
    LOCATE i, 42
    PRINT "["
    IF crs$ = "Y" THEN COLOR 0, 7
    LOCATE i, 43
    PRINT CHR$(61 + i)
    IF crs$ = "Y" THEN COLOR 4, 7
    LOCATE i, 44
    PRINT "]"
NEXT i
FOR i = 15 TO 19
    LOCATE i, 20
    PRINT "["
    IF crs$ = "Y" THEN COLOR 0, 7
    LOCATE i, 21
    PRINT CHR$(58 + i)
    IF crs$ = "Y" THEN COLOR 4, 7
    LOCATE i, 22
    PRINT "]"
NEXT i
IF crs$ = "Y" THEN COLOR 10, 5
LOCATE 3, 7
PRINT "          Lotto 649 Package Version 2020 RC1 Barchart Menu         "
LOCATE 13, 7
PRINT "                     Other Options Available                       "
LOCATE 5, 7
IF crs$ = "Y" THEN COLOR 15, 3
PRINT "         Barcharts            "
LOCATE 6, 7
PRINT "     With Bonus Numbers       "
LOCATE 5, 38
PRINT "         Barcharts                  "
LOCATE 6, 38
PRINT "    Without Bonus Numbers           "
IF crs$ = "Y" THEN COLOR 4, 7
LOCATE 21, 38
PRINT "["
LOCATE 21, 40
PRINT "]"
IF crs$ = "Y" THEN COLOR 1, 7
LOCATE 8, 17
PRINT "Low Numbers"
LOCATE 8, 47
PRINT "Low Numbers"
LOCATE 9, 17
PRINT "Average Numbers"
LOCATE 9, 47
PRINT "Average Numbers"
LOCATE 10, 17
PRINT "High Numbers"
LOCATE 10, 47
PRINT "High Numbers"
LOCATE 11, 17
PRINT "All Numbers"
LOCATE 11, 47
PRINT "All Numbers"
LOCATE 15, 25
PRINT "View Bonus Number Barchart"
LOCATE 16, 25
PRINT "View Normal Chart (No Bonus Numbers)"
LOCATE 17, 25
PRINT "View Normal Chart (With Bonus Numbers)"
LOCATE 18, 25
PRINT "Change Graphics Mode For Display of Charts"
LOCATE 19, 25
PRINT "Return To Main Menu"
LOCATE 21, 20
PRINT "Your Choice Is : "
LOCATE 21, 39
answer$ = ""
answer$ = INPUT$(1)
PRINT answer$
IF answer$ = "" OR answer$ = CHR$(27) THEN
    spec$ = "N"
    GOTO main
ELSEIF answer$ = "a" OR answer$ = "A" THEN
    viewpoint$ = "low"
    bonus$ = "Y"
    GOTO start3
ELSEIF answer$ = "b" OR answer$ = "B" THEN
    viewpoint$ = "average"
    bonus$ = "Y"
    GOTO start3
ELSEIF answer$ = "c" OR answer$ = "C" THEN
    viewpoint$ = "high"
    bonus$ = "Y"
    GOTO start3
ELSEIF answer$ = "d" OR answer$ = "D" THEN
    viewpoint$ = "all"
    bonus$ = "Y"
    GOTO start3
ELSEIF answer$ = "e" OR answer$ = "E" THEN
    viewpoint$ = "low"
    bonus$ = "N"
    GOTO start3
ELSEIF answer$ = "f" OR answer$ = "F" THEN
    viewpoint$ = "average"
    bonus$ = "N"
    GOTO start3
ELSEIF answer$ = "g" OR answer$ = "G" THEN
    viewpoint$ = "high"
    bonus$ = "N"
    GOTO start3
ELSEIF answer$ = "h" OR answer$ = "H" THEN
    viewpoint$ = "all"
    bonus$ = "N"
    GOTO start3
ELSEIF answer$ = "i" OR answer$ = "I" THEN
    viewpoint$ = "all"
    bonus$ = "Y"
    normal$ = "N"
    GOTO start3
ELSEIF answer$ = "j" OR answer$ = "J" THEN
    bonus$ = "N"
    GOTO chart
ELSEIF answer$ = "k" OR answer$ = "K" THEN
    bonus$ = "Y"
    GOTO chart
ELSEIF answer$ = "l" OR answer$ = "L" THEN
    CHAIN "grmode"
ELSEIF answer$ = "m" OR answer$ = "M" OR answer$ = "" THEN
    spec$ = "no"
    GOTO main
END IF
GOTO graphmenu
start3:
IF bonus$ = "N" THEN
    FOR i = 1 TO 49
        outpt(i) = 0
    NEXT i
    FOR i = 1 TO 49
        outpt(i) = numb(i)
    NEXT i
    low = 240: high = 0
    FOR i = 1 TO 49
        IF numb(i) < low THEN
            low = numb(i)
        END IF
        IF numb(i) > high THEN
            high = numb(i)
        END IF
    NEXT i
    spread = INT(high * .10)

ELSEIF bonus$ = "Y" AND normal$ = "" THEN
    FOR i = 1 TO 49
        outpt(i) = 0
    NEXT i
    FOR i = 1 TO 49
        outpt(i) = numb(i) + bonus(i)
    NEXT i
    low = 250: high = 0
    FOR i = 1 TO 49
        IF outpt(i) < low THEN
            low = outpt(i)
        END IF
        IF outpt(i) > high THEN
            high = outpt(i)
        END IF
    NEXT i
    spread = INT(high * .10)
ELSEIF bonus$ = "Y" AND normal$ = "N" THEN
    FOR i = 1 TO 49
        outpt(i) = 0
    NEXT i
    FOR i = 1 TO 49
        outpt(i) = bonus(i)
    NEXT i
END IF
IF grtype = 0 THEN
    CLS
    GOSUB asciidisplay
    GOTO graphmenu
END IF

SCREEN smode
CLS
IF smode = 12 THEN
    PALETTE 2, 12
END IF
counter = 96
IF grmode$ = "HDMI" THEN
    counter = 96
END IF

FOR i = 1 TO 49
    cl = cl + 1: IF cl > 12 THEN cl = 1
    IF cl = 2 THEN cl = 8
    length = outpt(i) * barl
    IF viewpoint$ = "low" THEN
        title$ = " Numbers Least Drawn"
        IF outpt(i) > low + spread THEN
            length = 4
        END IF
    ELSEIF viewpoint$ = "average" THEN
        title$ = " Numbers Average Drawn"
        IF outpt(i) < low + spread OR outpt(i) > high - spread THEN
            length = 4
        END IF
    ELSEIF viewpoint$ = "high" THEN
        title$ = " Numbers Most Drawn"
        IF outpt(i) < high - spread THEN
            length = 4
        END IF
    ELSEIF viewpoint$ = "all" THEN
        title$ = " All Numbers Drawn"
        length = outpt(i) * barl
    END IF
    IF bonus$ = "Y" AND normal$ = "" THEN
        title2$ = "   With Bonus Numbers"
    ELSEIF bonus$ = "N" AND normal$ = "" THEN
        title2$ = "   Without Bonus Numbers"
    ELSEIF bonus$ = "Y" AND normal$ = "N" THEN
        title2$ = "   Just Bonus Numbers"
    END IF
    LINE (counter, wl)-(counter, wl - length), cl
    LINE (counter + 1, wl)-(counter + 1, wl - length), cl
    LINE (counter + 2, wl)-(counter + 2, wl - length), cl
    LINE (counter + 3, wl)-(counter + 3, wl - length), cl
    LINE (counter + 4, wl)-(counter + 4, wl - length), cl
    LINE (counter + 5, wl)-(counter + 5, wl - length), cl
    LINE (counter + 5, wl)-(counter + 5, wl - length), cl
    IF grmode$ = "Herc" THEN
        LINE (counter + 6, wl)-(counter + 6, wl - length), cl
    END IF
    IF grmode$ = "herc" THEN
        counter = counter + 9
    ELSE
        counter = counter + 8
    END IF
NEXT i
PRINT
LOCATE 3, 4
PRINT "Frequency Distribution Chart  " + title$ + title2$
LOCATE 4, 4
PRINT "Covering the period from  "; month$(monthin); yearin; " to  "; month$(monthend); yearend
IF grmode$ = "vga" THEN
    LOCATE 27, 13
    PRINT "0000000001111111111222222222233333333334444444444"
    LOCATE 28, 13
    PRINT "1234567890123456789012345678901234567890123456789"
ELSEIF grmode$ = "ega" THEN
    LOCATE 21, 13
    PRINT "0000000001111111111222222222233333333334444444444"
    LOCATE 22, 13
    PRINT "1234567890123456789012345678901234567890123456789"
ELSEIF grmode$ = "cga" THEN
    LOCATE 20, 13
    PRINT "0000000001111111111222222222233333333334444444444"
    LOCATE 21, 13
    PRINT "1234567890123456789012345678901234567890123456789"
ELSEIF grmode$ = "HDMI" THEN
    LOCATE 27, 13
    PRINT "0000000001111111111222222222233333333334444444444"
    LOCATE 28, 13
    PRINT "1234567890123456789012345678901234567890123456789"

END IF
LOCATE 7 - offset - 1, 7
PRINT "400"
LOCATE 7 - offset - 1, 63
PRINT "400"
LOCATE 10 - offset, 7
PRINT "300"
LOCATE 10 - offset, 63
PRINT "300"
LOCATE 15 - offset, 7
PRINT "200"
LOCATE 15 - offset, 63
PRINT "200"
LOCATE 20 - offset, 7
PRINT "100"
LOCATE 20 - offset, 63
PRINT "100"
LOCATE 25 - offset, 7
PRINT "0"
LOCATE 25 - offset, 63
PRINT "0"
IF grmode$ = "vga" THEN
    LOCATE 29, 20
ELSEIF grmode$ = "HDMI" THEN
    LOCATE 29, 20
END IF
PRINT "Press any key to continue ...."
DO WHILE INKEY$ = ""
LOOP
viewpoint$ = "": normal$ = "": bonus$ = ""
SCREEN 0
GOTO graphmenu

graphit:
_FULLSCREEN _STRETCH
FOR i = 1 TO 49
    cl = cl + 1: IF cl > 12 THEN cl = 1
    IF cl = 2 THEN cl = 8
    length = outpt(i) * barl
    IF viewpoint$ = "low" THEN
        title$ = " Numbers Least Drawn"
        IF outpt(i) > low + spread THEN
            length = 4
        END IF
    ELSEIF viewpoint$ = "average" THEN
        title$ = " Numbers Average Drawn"
        IF outpt(i) < low + spread OR outpt(i) > high - spread THEN
            length = 4
        END IF
    ELSEIF viewpoint$ = "high" THEN
        title$ = " Numbers Most Drawn"
        IF outpt(i) < high - spread THEN
            length = 4
        END IF
    ELSEIF viewpoint$ = "all" THEN
        title$ = " All Numbers Drawn"
        length = outpt(i) * barl
    END IF
    searchmenu:
    CLS
    IF crs$ = "Y" THEN COLOR 3, 8
    LOCATE 3, 10
    PRINT CHR$(201)
    FOR i = 11 TO 68
        LOCATE 3, i
        PRINT CHR$(205)
    NEXT i
    LOCATE 3, 69
    PRINT CHR$(187)
    FOR i = 4 TO 12
        LOCATE i, 10
        IF i = 5 OR i = 11 THEN
            PRINT CHR$(204)
        ELSE
            PRINT CHR$(186)
        END IF
        LOCATE i, 69
        IF i = 5 OR i = 11 THEN
            PRINT CHR$(185)
        ELSE
            PRINT CHR$(186)
        END IF
    NEXT i
    FOR i = 11 TO 68
        LOCATE 5, i
        PRINT CHR$(205)
    NEXT i
    FOR i = 11 TO 68
        LOCATE 11, i
        PRINT CHR$(205)
    NEXT i
    FOR i = 11 TO 68
        LOCATE 13, i
        PRINT CHR$(205)
    NEXT i
    LOCATE 13, 10
    PRINT CHR$(200)
    LOCATE 13, 69
    PRINT CHR$(188)
    IF crs$ = "Y" THEN COLOR 10, 5
    LOCATE 4, 11
    PRINT " Lotto 649 Package Version 2020 RC1 Search and Print Menu "
    IF crs$ = "Y" THEN COLOR 4, 7
    FOR i = 6 TO 10
        LOCATE i, 17
        PRINT "["
        LOCATE i, 19
        PRINT "]"
    NEXT i
    IF crs$ = "Y" THEN COLOR 0, 7
    FOR i = 6 TO 10
        LOCATE i, 18
        PRINT CHR$(59 + i)
    NEXT i
    IF crs$ = "Y" THEN COLOR 1, 7
    LOCATE 6, 22
    PRINT "Search For Winning Numbers By Date"
    LOCATE 7, 22
    PRINT "Print Out List of Winning Numbers"
    LOCATE 8, 22
    PRINT "Check List of Numbers for Winners"
    LOCATE 9, 22
    PRINT "Scan Database for a series of Numbers"
    LOCATE 10, 22
    PRINT "Print lists from Frequency Calculator"
    LOCATE 12, 17
    PRINT "Your Choice Is: "
    LOCATE 12, 33
    answer$ = INPUT$(1)
    PRINT answer$
    IF answer$ = "a" OR answer$ = "A" THEN
        GOTO search
    ELSEIF answer$ = "b" OR answer$ = "B" THEN
        GOTO printmenu
    ELSEIF answer$ = "c" OR answer$ = "C" THEN
        GOTO checknumbers
    ELSEIF answer$ = "d" OR answer$ = "D" THEN
        GOTO specialcheck
    ELSEIF answer$ = "e" OR answer$ = "E" THEN
        GOTO freqprint
    ELSE
        GOTO main
    END IF
    GOTO main
    freqprint:
    OPEN "next.txt" FOR INPUT AS #1
    DO UNTIL EOF(1)
        INPUT #1, a$
        LPRINT a$
    LOOP
    CLOSE #1
    LPRINT CHR$(12)
    OPEN "freq.txt" FOR INPUT AS #1
    DO UNTIL EOF(1)
        INPUT #1, a$
        LPRINT a$
    LOOP
    CLOSE #1
    IF bonus$ = "Y" AND normal$ = "" THEN
        title2$ = "   With Bonus Numbers"
    ELSEIF bonus$ = "N" AND normal$ = "" THEN
        title2$ = "   Without Bonus Numbers"
    ELSEIF bonus$ = "Y" AND normal$ = "N" THEN
        title2$ = "   Just Bonus Numbers"
    END IF
    LINE (counter, wl)-(counter, wl - length), cl
    LINE (counter + 1, wl)-(counter + 1, wl - length), cl
    LINE (counter + 2, wl)-(counter + 2, wl - length), cl
    LINE (counter + 3, wl)-(counter + 3, wl - length), cl
    LINE (counter + 4, wl)-(counter + 4, wl - length), cl
    LINE (counter + 5, wl)-(counter + 5, wl - length), cl
    LINE (counter + 6, wl)-(counter + 6, wl - length), cl
    counter = counter + 8
NEXT i
PRINT
LOCATE 3, 4
PRINT "Frequency Distribution Chart  " + title$ + title2$
LOCATE 4, 4
PRINT "Covering the period from  "; month$(monthin); yearin; " to  "; month$(monthend); yearend
IF grmode$ = "HDMI" THEN
    LOCATE 27, 13
    PRINT "0000000001111111111222222222233333333334444444444"
    LOCATE 28, 13
    PRINT "1234567890123456789012345678901234567890123456789"
ELSEIF grmode$ = "vga" THEN
    LOCATE 27, 13
    PRINT "0000000001111111111222222222233333333334444444444"
    LOCATE 28, 13
    PRINT "1234567890123456789012345678901234567890123456789"

END IF
LOCATE 7 - offset - 1, 13
PRINT "400"
LOCATE 7 - offset - 1, 63
PRINT "400"
LOCATE 10 - offset, 13
PRINT "300"
LOCATE 10 - offset, 63
PRINT "300"
LOCATE 15 - offset, 13
PRINT "200"
LOCATE 15 - offset, 63
PRINT "200"
LOCATE 20 - offset, 13
PRINT "100"
LOCATE 20 - offset, 63
PRINT "0"
LOCATE 25 - offset, 13
PRINT "0"
LOCATE 25 - offset, 63
PRINT "200"
IF grmode$ = "HDMI" THEN
    LOCATE 29, 22
ELSEIF grmode$ = "vga" THEN
    LOCATE 29, 22
END IF
PRINT "Press any key to continue ...."
DO WHILE INKEY$ = ""
LOOP
viewpoint$ = "": normal$ = "": bonus$ = ""
SCREEN 0
GOTO graphmenu
GOTO main
specialcheck:
bypass$ = ""
CLS
PRINT "This section checks for patterns in winning numbers. You can choose"
PRINT "to search either the last 3 months of the database, or the whole "
PRINT "database for any sets of numbers that you input."
PRINT
PRINT "Any matches will be printed out as the program runs ...."
PRINT
INPUT "Do you wish to load numbers from a saved file [ Enter defaults to Yes ]: ", saved$
IF saved$ = "" THEN
    saved$ = "Y"
END IF
IF saved$ = "n" OR saved$ = "N" THEN
    saved$ = "N"
    GOTO search2
END IF
filename:
INPUT "Enter filename [without extension] [Enter Defaults to Demo File] : ", file$
IF file$ = "numbers2" THEN
    PRINT
    PRINT "Incorrect filename !"
    PRINT
    PRINT "Press any key to continue ...."
    DO WHILE INKEY$ = ""
    LOOP
    GOTO filename
ELSEIF file$ = "grmode" THEN
    PRINT
    PRINT "Incorrect filename !"
    PRINT
    PRINT "Press any key to continue ...."
    DO WHILE INKEY$ = ""
    LOOP
    GOTO filename
ELSEIF file$ = "" THEN
    file$ = "demo"
    PRINT "Loading Demo File"
END IF
PRINT
file$ = file$ + ".cnf"
IF saved$ = "N" THEN GOTO savednumbers
IF saved$ = "Y" OR saved$ = "y" THEN
    saved$ = "Y"
    OPEN file$ FOR INPUT AS #1
    DO UNTIL EOF(1)
        INPUT #1, entry(zqa)
        zqa = zqa + 1
    LOOP
END IF
CLOSE #1
search2:
PRINT "Search [L]ast 3 months data or [E]ntire list of data "
PRINT
INPUT "[L] or [E] <return defaults to [L] > : ", answer$
IF answer$ = "e" OR answer$ = "E" THEN
    bypass$ = "Y"
    GOTO bypass
END IF
IF month > 3 THEN
    firstmonth = month - 3
    lastmonth = month
    firstyear = year
    lastyear = year
ELSEIF month < 4 THEN
    firstyear = year - 1
    lastyear = year
    monthadj = monthadj + 12
    firstmonth = monthadj - 3
    lastmonth = month
END IF
bypass:
IF saved$ = "Y" THEN GOTO savednumbers
savednumbers:
IF saved$ = "Y" OR saved$ = "y" THEN GOTO sc
INPUT "Do you wish to save the following numbers to disk : ", numsave$
IF numsave$ = "Y" OR numsave$ = "y" THEN
    numsave$ = "Y"
    filename2:
    INPUT "Enter filename [without extension] [Enter Defaults to Demo File]: ", file$
    IF file$ = "numbers2" THEN
        PRINT "Incorrect filename !"
        PRINT
        PRINT "Press any key to continue ...."
        DO WHILE INKEY$ = ""
        LOOP
        GOTO filename2
    ELSEIF file$ = "grmode" THEN
        PRINT
        PRINT "Incorrect filename !"
        PRINT
        PRINT "Press any key to continue ...."
        DO WHILE INKEY$ = ""
        LOOP
        GOTO filename2
    END IF
    file$ = file$ + ".cnf"
    PRINT
    OPEN file$ FOR OUTPUT AS #1
END IF
IF numsave$ = "N" THEN GOTO sc
za = 0: zb = 0: zc = 0: zd = 0: ze = 0: zf = 0: zg = 0: zh = 0: zi = 0: zj = 0: zk = 0: zl = 0: zm = 0: zn = 0: zo = 0
INPUT "How many Numbers : ", numbrs
FOR zqa = 1 TO numbrs
    rd2:
    IF saved$ = "Y" THEN
        GOTO szc
    END IF
    PRINT "Entry #"; zqa; " ";: INPUT ":", entry(zqa)
    IF entry(zqa) < 1 OR entry(zqa) > 49 THEN PRINT "Number Out of Range ! , Try Again !!": GOTO rd2
    IF zqa > 1 THEN
        FOR i = 1 TO (zqa - 1)
            IF entry(zqa) = entry(i) THEN PRINT "Number already entered, pick another": GOTO rd2
        NEXT i
    END IF
    IF numsave$ = "Y" THEN
        PRINT #1, entry(zqa)
    END IF
NEXT zqa
CLOSE #1

sc:
szc:
za = entry(1): zb = entry(2): zc = entry(3): zd = entry(4): ze = entry(5): zf = entry(6): zg = entry(7): zh = entry(8): zi = entry(9): zj = entry(10): zk = entry(11): zl = entry(12): zm = entry(13): zn = entry(14)
PRINT "Press any key to start search ...."
DO WHILE INKEY$ = ""
LOOP
CLS
PRINT
PRINT "Searching , please stand bye ............."
PRINT
FOR i = 1 TO linecounter
    IF bypass$ = "Y" THEN
        GOTO bypass2
    END IF
    IF chart(i, 3) < firstyear THEN GOTO sczzz
    IF chart(i, 1) < firstmonth AND chart(i, 3) = firstyear THEN GOTO sczzz
    bypass2:
    FOR j = 4 TO 9
        IF chart(i, j) = za OR chart(i, j) = zb OR chart(i, j) = zc OR chart(i, j) = zd OR chart(i, j) = ze OR chart(i, j) = zf THEN
            match = match + 1
        END IF
        IF chart(i, j) = zg AND match = 5 THEN
            match = match + 1
        END IF
    NEXT j
    IF match > 2 THEN
        PRINT "Match for : ";
        PRINT USING "\    \"; month$(chart(i, 1));
        PRINT USING "## #### ## ## ## ## ## ## ##"; chart(i, 2); chart(i, 3); chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9); chart(i, 10);
        PRINT "  > "; match; " Correct."
        IF hardcopy$ = "Y" THEN LPRINT "Match for : ";
        LPRINT USING "\    \"; month$(chart(i, 1));
        LPRINT USING "## #### ## ## ## ## ## ## ##"; chart(i, 2); chart(i, 3); chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9); chart(i, 10);
        LPRINT "  > "; match; " Correct."
    END IF
    match = 0
    found = found + 1
    match = 0
    sczzz:
NEXT i
IF found = 0 THEN
    PRINT
    PRINT "No Match found for your numbers"
    PRINT
    PRINT "Your numbers were : ";
    LPRINT "Your Numbers were : ";
    FOR i = 1 TO 14
        IF entry(i) = 0 THEN GOTO nopr1
        PRINT entry(i);
        LPRINT entry(i);
    NEXT i
    nopr1:
    PRINT
    LPRINT

ELSE
    PRINT
    PRINT found; " Matches found for your numbers"
    PRINT
    PRINT "Your numbers were : ";
    FOR i = 1 TO 14
        IF entry(i) = 0 THEN
            GOTO nopr2
        END IF
        PRINT entry(i);
    NEXT i
    nopr2:
    PRINT
END IF
IF hardcopy$ = "Y" AND found > 0 THEN
    LPRINT
    LPRINT "Program written by : Russ Campbell"
    LPRINT
    LPRINT CHR$(12)
END IF
     
found = 0
PRINT
PRINT "Press any key to continue ..."
DO WHILE INKEY$ = ""
LOOP
GOTO main
checknumbers:
CLS
PRINT
PRINT "Winning Number Check"
PRINT
PRINT "This section of the program will take a file that you have written"
PRINT "out from option C or D and check to see if you have any winning "
PRINT "numbers in the file."
PRINT
PRINT "You can either enter the numbers manually or read them in from"
PRINT "the winning numbers database."
PRINT
INPUT "Enter filename [without extension] : "; file$
IF file$ = "numbers2" THEN
    PRINT
    PRINT "Incorrect filename !"
    PRINT
    PRINT "Press any key to continue ...."
    DO WHILE INKEY$ = ""
    LOOP
    GOTO checknumbers
ELSEIF file$ = "" THEN
    GOTO searchmenu
END IF

PRINT
PRINT
INPUT "Get numbers Manually or Read from database [M] or [R] : "; answer$
IF answer$ = "r" OR answer$ = "R" THEN
    GOTO inq
ELSEIF answer$ = "M" OR answer$ = "m" THEN
    GOTO manent
ELSE
    GOTO checknumbers
END IF
inq:
INPUT "Enter year of draw  : "; yearinp
IF yearinp < 2000 THEN
    GOTO main
END IF
INPUT "Enter month of draw : "; monthinp
INPUT "Enter day of draw   : "; dayinp
PRINT
PRINT "Date of Draw        : "; month$(monthinp); dayinp; yearinp
PRINT
INPUT "Is this correct ??? "; answer$
PRINT
IF answer$ = "N" OR answer$ = "n" OR answer$ = "no" OR answer$ = "NO" OR answer$ = "nO" OR answer$ = "No" THEN
    GOTO inq
END IF
IF answer$ = "" THEN
    GOTO searchmenu
END IF
FOR i = 1 TO linecounter
    IF chart(i, 3) <> yearinp THEN
        GOTO nextitem2
    ELSEIF chart(i, 1) <> monthinp THEN
        GOTO nextitem2
    ELSEIF chart(i, 2) <> dayinp THEN
        GOTO nextitem2
    ELSEIF chart(i, 3) = yearinp AND chart(i, 1) = monthinp AND chart(i, 2) = dayinp THEN
        search = 1
        PRINT
        PRINT "Winning Numbers : "; chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9), chart(i, 10)
        PRINT
        INPUT "Is this Correct <return defaults yes> [Y]es or [N]o : "; answer$
        IF answer$ = "N" OR answer$ = "n" OR answer$ = "NO" OR answer$ = "no" OR answer$ = "No" OR answer$ = "nO" THEN
            GOTO inq
        END IF
        ac = chart(i, 4)
        bc = chart(i, 5)
        cc = chart(i, 6)
        dc = chart(i, 7)
        ec = chart(i, 8)
        fc = chart(i, 9)
        gc = chart(i, 10)
    END IF
    nextitem2:
NEXT i
IF search = 0 THEN
    PRINT
    PRINT "Draw not found"
    PRINT
    PRINT "Either use manual entry or ensure that correct data"
    PRINT "has been entered with main menu option A"
    PRINT
    PRINT "Press any key to Continue ...."
    DO WHILE INKEY$ = ""
    LOOP
    CLOSE #2
    GOTO searchmenu
END IF
search = 0
GOTO reedfiles
manent:
CLS
PRINT
PRINT "Check for winning numbers"
PRINT
PRINT "This option is only for checking winning numbers, it does NOT"
PRINT "update the numbers database. Use option A from the main menu"
PRINT "if you want to update the database."
PRINT
FOR zqa = 1 TO 7
    rd1:
    IF zqa = 7 THEN
        PRINT "Bonus #"; "  "; " ";: INPUT entry(zqa)
    ELSE
        PRINT "Entry #"; zqa; " ";: INPUT entry(zqa)
    END IF
    IF entry(zqa) = 0 THEN GOTO searchmenu
    IF entry(zqa) < 1 OR entry(zqa) > 49 THEN PRINT "Number Out of Range ! , Try Again !!": GOTO rd1
    IF zqa > 1 THEN
        FOR i = 1 TO (zqa - 1)
            IF entry(zqa) = entry(i) THEN PRINT "Number already entered, pick another": GOTO rd1
        NEXT i
    END IF
NEXT zqa

ac = entry(1): bc = entry(2): cc = entry(3): dc = entry(4): ec = entry(5): fc = entry(6): gc = entry(7)
reedfiles:
file$ = file$ + ".dat"
OPEN file$ FOR INPUT AS #2
CLS
linecount = 0
DO UNTIL EOF(2)
    INPUT #2, a, b, c, d, e, f
    IF a = ac OR a = bc OR a = cc OR a = dc OR a = ec OR a = fc THEN
        winnings = winnings + 1
    END IF
    IF b = ac OR b = bc OR b = cc OR b = dc OR b = ec OR b = fc THEN
        winnings = winnings + 1
    END IF
    IF c = ac OR c = bc OR c = cc OR c = dc OR c = ec OR c = fc THEN
        winnings = winnings + 1
    END IF
    IF d = ac OR d = bc OR d = cc OR d = dc OR d = ec OR d = fc THEN
        winnings = winnings + 1
    END IF
    IF e = ac OR e = bc OR e = cc OR e = dc OR e = ec OR e = fc THEN
        winnings = winnings + 1
    END IF
    IF f = ac OR f = bc OR f = cc OR f = dc OR f = ec OR f = fc THEN
        winnings = winnings + 1
    END IF
    IF winnings = 5 THEN
        IF g = ac OR g = bc OR g = cc OR g = dc OR g = ec OR g = fc THEN
            winnings = winnings + 1
        END IF
    END IF
    linecount = linecount + 1
    IF winnings = 3 THEN
        PRINT "You have 3 correct numbers in line # "; linecount
        correctnum = correctnum + 1
    END IF
    IF winnings = 4 THEN
        PRINT "You have 4 correct numbers in line # "; linecount
        correctnum = correctnum + 1
    END IF
    IF winnings = 5 THEN
        PRINT "You have 5 correct numbers in line # "; linecount
        correctnum = correctnum + 1
    END IF
    IF winnings = 6 THEN
        PRINT "You have all 6 numbers correct in line # "; linecount
        correctnum = correctnum + 1
    END IF
    IF hardcopy$ = "Y" AND winnings > 2 THEN
        LPRINT "Line # "; linecount; ">= ";
        LPRINT USING "## ## ## ## ## ## ##"; a; b; c; d; e; f; g;
        LPRINT "    > "; winnings; "  Correct."
    END IF
    winnings = 0
LOOP
PRINT "You had a total of "; correctnum; " possible winners in that file."
PRINT "Check your printout, diskfile or tickets for more info."
IF hardcopy$ = "Y" AND correctnum > 0 THEN
    LPRINT
    LPRINT "Program Written by : Russ Campbell"
    LPRINT
    LPRINT CHR$(12)
END IF
correctnum = 0
PRINT
PRINT "The winning numbers were : "; ac; bc; cc; dc; ec; fc, gc
PRINT
PRINT "Press any key to continue ....."
PRINT
DO WHILE INKEY$ = ""
LOOP
CLOSE #2
GOTO searchmenu
enterwinningnumbers:
OPEN "numbers2.dat" FOR APPEND AS #1
beginning:
CLS
PRINT
PRINT "Lotto 649 Package Version 2020 RC1 Winning Numbers Entry"
PRINT "--------------------------------------------------------"
PRINT
PRINT "This section allows you to enter winning numbers from each draw."
PRINT "It then stores the numbers in a database for use with the chart"
PRINT "used in section B. I now have automatic next draw date entry."
PRINT
count = 0
GOSUB enterdate
PRINT "Winning Numbers Updated on "; bay(day1); " "; month$(m); " "; dy; " "; y
PRINT "Last numbers entered : "; a; b; c; d; e; f; g
count = 1
GOSUB enterdate


PRINT
PRINT "Next Draw Date "; bay(day1); " "; month$(m); " "; dy; " "; y
PRINT
PRINT "Is This Correct : [Y] or [N]"
answer$ = INPUT$(1)
IF answer$ = "Y" OR answer$ = "y" OR answer$ = "" THEN
    GOTO enternumbers
END IF
CLOSE #1
count = 0
GOSUB enterdate
GOTO main
enternumbers:

PRINT
first:
INPUT "Enter 1st number   : ", a
IF a = 0 THEN CLOSE #1: count = -1: GOSUB enterdate: GOTO main
IF a < 1 OR a > 49 THEN PRINT "Number Out of range !": GOTO first
second:
INPUT "Enter 2nd number   : ", b
IF b < 1 OR b > 49 THEN PRINT "Number Out of Range !": GOTO second
IF b = a THEN PRINT "Number already picked!": GOTO second
third:
INPUT "Enter 3rd number   : ", c
IF c < 1 OR c > 49 THEN PRINT "Number Out of Range !": GOTO third
IF c = b OR c = a THEN PRINT "Number already picked!": GOTO third
fourth:
INPUT "Enter 4th number   : ", d
IF d < 1 OR d > 49 THEN PRINT "Number Out of Range !": GOTO fourth
IF d = c OR d = b OR d = a THEN PRINT "Number already picked!": GOTO fourth
fifth:
INPUT "Enter 5th number   : ", e
IF e < 1 OR e > 49 THEN PRINT "Number Out of Range !": GOTO fifth
IF e = d OR e = c OR e = b OR e = a THEN PRINT "Number already picked!": GOTO fifth
sixth:
INPUT "Enter 6th number   : ", f
IF f < 1 OR f > 49 THEN PRINT "Number Out of Range !": GOTO sixth
IF f = e OR f = d OR f = c OR f = b OR f = a THEN PRINT "Number already picked!": GOTO sixth
seventh:
INPUT "Enter bonus number : ", g
IF g < 1 OR g > 49 THEN PRINT "Number Out of Range !": GOTO seventh
IF g = f OR g = e OR g = d OR g = c OR g = b OR g = a THEN PRINT "Number already picked !": GOTO seventh
PRINT
PRINT "You Have Entered: "; bay(day1); " "; month$(m); " "; dy; " "; y; " "; a; " "; b; " "; c; " "; d; " "; e; " "; f; " Bonus  :"; g

PRINT "Is the above correct [Y]es  No  Quit [Y default] : "
answer$ = INPUT$(1)

IF answer$ = "" OR answer$ = "y" THEN answer$ = "Y"
IF answer$ = "n" OR answer$ = "N" OR answer$ = "no" OR answer$ = "NO" THEN count = -1: GOSUB enterdate: GOTO beginning
IF answer$ = "Q" OR answer$ = "q" THEN CLOSE #1: GOTO main
IF answer$ = "Y" THEN

    PRINT #1, USING " ## ## #### ## ## ## ## ## ## ## "; m; dy; y; a; b; c; d; e; f; g

END IF
PRINT
PRINT "Any more winning numbers ??? [Y] or No [Y default] "
answer$ = INPUT$(1)
IF answer$ = "" OR answer$ = "Y" OR answer$ = "y" THEN
    count = 1: GOSUB enterdate: GOTO beginning
ELSE
    CLOSE #1
    GOSUB buildchart
    GOSUB convert
    count = 1: GOSUB enterdate: GOTO main
END IF
GOTO main
cleardata:
CLS
PRINT
PRINT "Initialize data files"
PRINT
PRINT "This option clears all of the data files for the winning Lotto 649"
PRINT "numbers. Are you sure you want to do this ??? "
PRINT
INPUT "Are you sure you want to do this [Y]es or [N]o : ", answer$
IF answer$ = "YES" OR answer$ = "Yes" OR answer$ = "yES" OR answer$ = "Y" OR answer$ = "y" THEN
    answer$ = "YES"
END IF
IF answer$ <> "YES" THEN
    GOTO main
ELSEIF answer$ = "YES" THEN
    OPEN "numbers2.dat" FOR OUTPUT AS #1
    CLOSE #1
END IF
GOTO main
buildchart:
chartbuild = chartbuild + 1
chartcount = 62
linecounter = 0
ERASE chart
OPEN "numbers2.dat" FOR INPUT AS #1
DO UNTIL EOF(1)
    INPUT #1, month, day, year, a, b, c, d, e, f, g
    chart(linecounter, 1) = month
    chart(linecounter, 2) = day
    chart(linecounter, 3) = year
    chart(linecounter, 4) = a
    chart(linecounter, 5) = b
    chart(linecounter, 6) = c
    chart(linecounter, 7) = d
    chart(linecounter, 8) = e
    chart(linecounter, 9) = f
    chart(linecounter, 10) = g
    linecounter = linecounter + 1
LOOP
CLOSE #1
readdaymonthyear:
RESTORE monthread
FOR monthdata = 1 TO 12
    READ month$(monthdata)
NEXT monthdata
RETURN

convert:

FOR i = 1 TO linecounter
    IF spec$ = "Y" THEN
        IF chart(i, 3) < yearin THEN GOTO zqzq
        IF chart(i, 1) < monthin AND chart(i, 3) = yearin THEN GOTO zqzq
        IF chart(i, 3) > yearend THEN GOTO zqzq
        IF chart(i, 1) > monthend AND chart(i, 3) = yearend THEN GOTO zqzq
    END IF
    numb(chart(i, 4)) = numb(chart(i, 4)) + 1
    numb(chart(i, 5)) = numb(chart(i, 5)) + 1
    numb(chart(i, 6)) = numb(chart(i, 6)) + 1
    numb(chart(i, 7)) = numb(chart(i, 7)) + 1
    numb(chart(i, 8)) = numb(chart(i, 8)) + 1
    numb(chart(i, 9)) = numb(chart(i, 9)) + 1
    bonus(chart(i, 10)) = bonus(chart(i, 10)) + 1

    zqzq:
NEXT i
IF spec$ = "N" THEN
    yearin = chart(1, 3)
    yearend = chart(linecounter, 3)
    monthin = chart(1, 1)
    monthend = chart(linecounter, 3)
END IF
RETURN
printmenu:
CLS
IF crs$ = "Y" THEN COLOR 10, 5

LOCATE 4, 18
PRINT "    Lotto 649 Version 2020 RC1 Print Menu      "
IF crs$ = "Y" THEN COLOR 3, 8
LOCATE 3, 17
PRINT CHR$(201)
FOR i = 18 TO 57
    LOCATE 3, i
    PRINT CHR$(205)
NEXT i
LOCATE 3, 58
PRINT CHR$(187)
FOR i = 18 TO 57
    LOCATE 5, i
    PRINT CHR$(205)
NEXT i
FOR i = 18 TO 57
    LOCATE 9, i
    PRINT CHR$(205)
NEXT i
FOR i = 18 TO 57
    LOCATE 11, i
    PRINT CHR$(205)
NEXT i
LOCATE 11, 17
PRINT CHR$(200)
LOCATE 11, 58
PRINT CHR$(188)
FOR i = 4 TO 10
    LOCATE i, 17
    IF i = 5 OR i = 9 THEN
        PRINT CHR$(204)
    ELSE
        PRINT CHR$(186)
    END IF
    LOCATE i, 58
    IF i = 5 OR i = 9 THEN
        PRINT CHR$(185)
    ELSE
        PRINT CHR$(186)
    END IF
NEXT i
IF crs$ = "Y" THEN COLOR 4, 7
FOR i = 6 TO 8
    LOCATE i, 27
    PRINT "["
    LOCATE i, 28
    IF crs$ = "Y" THEN COLOR 0, 7
    PRINT CHR$(59 + i)
    IF crs$ = "Y" THEN COLOR 4, 7
    LOCATE i, 29
    PRINT "]"
NEXT i
LOCATE 10, 45
PRINT "["
LOCATE 10, 47
PRINT "]"
IF crs$ = "Y" THEN COLOR 1, 7
LOCATE 6, 31
PRINT "Print Entire List"
LOCATE 7, 31
PRINT "Print Partial List"
LOCATE 8, 31
PRINT "Goto Search Menu"
LOCATE 10, 27
PRINT "Your Choice is:"
LOCATE 10, 46
answer$ = INPUT$(1)
PRINT answer$
IF answer$ = "a" OR answer$ = "A" THEN
    monthin = 1
    monthend = 12
    yearin = 2000
    yearend = 3000
    GOTO printentirelist
ELSEIF answer$ = "b" OR answer$ = "B" THEN
    monthin = 1
    monthend = 12
    yearin = 2000
    yearend = 3000
    GOTO printpartial
ELSEIF answer$ = "c" OR answer$ = "C" OR answer$ = "" THEN
    GOTO searchmenu
ELSE
    GOTO searchmenu
END IF
printpartial:
CLS
PRINT
PRINT "Printing Partial List of winning numbers."
partial = 1
PRINT
INPUT "Start  Month: ", monthin
IF monthin = 0 THEN GOTO main
IF monthin < 1 OR monthin > 12 THEN
    GOTO printpartial
END IF
INPUT "Start  Year [All 4 digits] : ", yearin
IF yearin = 0 THEN
    GOTO main
END IF
INPUT "Finish Month: ", monthend
IF monthend = 0 THEN
    GOTO main
END IF
IF monthend < 1 OR monthend > 12 THEN
    GOTO printpartial
END IF
INPUT "Ending Year [All 4 digits] : ", yearend
IF yearend = 0 THEN
    GOTO main
END IF
printentirelist:
IF partial <> 0 THEN GOTO lister
PRINT
PRINT "Printing Entire List of winning numbers."
PRINT
lister:
IF hardcopy$ = "Y" THEN
    LPRINT
    LPRINT "List of Lotto 649 Winning Numbers"
    LPRINT "---------------------------------"
    LPRINT
    LPRINT "Month | Day | Year |  1st | 2nd | 3rd | 4th | 5th | 6th | Bonus"
    LPRINT "----- | --- | ---- |  --- | --- | --- | --- | --- | --- | -----"
    LPRINT
    pat$ = "   ## |  ## | #### |   ## |  ## |  ## |  ## |  ## |  ## |    ##"
    FOR i = 1 TO linecounter
        IF chart(i, 3) < yearin THEN GOTO qzqz
        IF chart(i, 1) < monthin AND chart(i, 3) = yearin THEN GOTO qzqz
        IF chart(i, 3) > yearend THEN GOTO qzqz
        IF chart(i, 1) > monthend AND chart(i, 3) = yearend THEN GOTO qzqz
        LPRINT USING pat$; chart(i, 1); chart(i, 2); chart(i, 3); chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9); chart(i, 10)
        qzqz:
    NEXT i
END IF
CLS
PRINT
PRINT "List of Lotto 649 Winning Numbers"
PRINT "---------------------------------"
PRINT
PRINT "Month | Day | Year |  1st | 2nd | 3rd | 4th | 5th | 6th | Bonus"
PRINT "----- | --- | ---- |  --- | --- | --- | --- | --- | --- | -----"
PRINT
pat$ = "   ## |  ## | #### |   ## |  ## |  ## |  ## |  ## |  ## |    ##"
FOR i = 1 TO linecounter
    linecounter = linecounter + 1
    IF chart(i, 3) < yearin THEN GOTO qzqzqz
    IF chart(i, 1) < monthin AND chart(i, 3) = yearin THEN GOTO qzqzqz
    IF chart(i, 3) > yearend THEN GOTO qzqzqz
    IF chart(i, 1) > monthend AND chart(i, 3) = yearend THEN GOTO qzqzqz
    PRINT USING pat$; chart(i, 1); chart(i, 2); chart(i, 3); chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9); chart(i, 10)
    FOR zz = 1 TO 5000000: NEXT zz
    qzqzqz:
NEXT i
DO WHILE INKEY$ = ""
LOOP
GOTO printmenu
errorhandle:
CLS
PRINT
PRINT "There is something wrong with what you have input. Either you said"
PRINT "that you have a printer online, when in fact you don't or you have"
PRINT "tried to read a non-existant file."
PRINT
PRINT "In the above case if you do have a printer online, make sure that"
PRINT "it is turned on, is online and has paper in it."
PRINT
PRINT "If you are trying to read the chart, and get this error, then make "
PRINT "sure that the 'numbers2.dat' file exists. It can be created with "
PRINT "the [I]nitialize program option."
PRINT
PRINT "If you are using the barchart menu, and are trying to display a chart"
PRINT "when this error occurrs, then it is most likely that you have the "
PRINT "wrong graphics mode set. Try reseting your graphics mode."
PRINT
PRINT "If all else fails, and the error keeps coming up, then it is obviously"
PRINT "a program error. Please let me know about it and I will try to fix it."
PRINT
PRINT
PRINT "Press any key to continue ..."
DO WHILE INKEY$ = ""
LOOP
GOTO finish:
asciidisplay:
FOR j = 1 TO 49
    IF viewpoint$ = "low" THEN
        title$ = "Numbers Least Drawn"
        IF outpt(j) > low + spread THEN
            markz = 1
        END IF
    ELSEIF viewpoint$ = "average" THEN
        title$ = " Numbers Average Drawn"
        IF outpt(j) < low + spread OR outpt(i) > high - spread THEN
            markz = 1
        END IF
    ELSEIF viewpoint$ = "high" THEN
        title$ = " Numbers Most Drawn"
        IF outpt(j) < high - spread THEN
            markz = 1
        END IF
    ELSEIF viewpoint$ = "all" THEN
        title$ = "All Numbers Drawn"
    END IF
    IF bonus$ = "Y" AND normal$ = "" THEN
        title2$ = "  With Bonus Numbers"
    ELSEIF bonus$ = "N" AND normal$ = "" THEN
        title2$ = "  Without Bonus Numbers"
    ELSEIF bonus$ = "Y" AND normal$ = "N" THEN
        title2$ = "  Just Bonus Numbers"
    END IF
    IF markz > 0 THEN
        GOTO disp
    END IF
    countz = (outpt(j) / 16.247255256274392)
    countz = 30 - countz
    IF ca > 2 THEN
        ca = 0
    END IF
    FOR i = 20 TO countz STEP -1
        LOCATE i, j + 11
        PRINT CHR$(176 + ca)
    NEXT i
    disp:
    markz = 0
    ca = ca + 1
NEXT j
LOCATE 3, 4
PRINT "Frequency Distribution Chart  " + title$ + title2$
LOCATE 4, 4
PRINT "Covering the period from "; month$(monthin); yearin; " to "; month$(monthend); yearend
LOCATE 21, 12
PRINT "0000000001111111111222222222233333333334444444444"
LOCATE 22, 12
PRINT "1234567890123456789012345678901234567890123456789"
xyxty = 4 * 2
FOR i = 20 TO 6 STEP -1
    LOCATE i, 6
    PRINT xyxty
    LOCATE i, 63
    PRINT xyxty
    xyxty = xyxty + 48
NEXT i
LOCATE 24, 20
PRINT "Press any key to continue ..."
DO WHILE INKEY$ = ""
LOOP
viewpoint$ = "": normal$ = "": bonus$ = ""
RETURN
GOTO main
chart2:
CLS
PRINT
PRINT "This section will check each number from 1 to 49 and see how often"
PRINT "it occurs. It takes a few seconds to run however."
PRINT
PRINT "It will then give you a saved report that tells when the numbers came"
PRINT "up last, when they may come up again by, and the average days between"
PRINT "occurances. Note that your winning numbers database has the be up to"
PRINT "date completely for this to work properly."
PRINT
PRINT "Press any key to continue ....."
DO WHILE INKEY$ = ""
LOOP
CLS
x1 = VAL(MID$(DATE$, 1, 2))
x2 = VAL(MID$(DATE$, 4, 5))
x3 = VAL(MID$(DATE$, 7, 10))
x1 = x1 * 30
x3 = x3 * 365
now2 = x1 + x2 + x3
OPEN "freq.txt" FOR OUTPUT AS #1 LEN = 80
OPEN "next.txt" FOR OUTPUT AS #2 LEN = 80

FOR j = 1 TO 49
    FOR i = 1 TO linecounter
        IF chart(i, 4) = j OR chart(i, 5) = j OR chart(i, 6) = j OR chart(i, 7) = j OR chart(i, 8) = j OR chart(i, 9) = j THEN
            count = count + 1
            k = i
            IF count = 1 THEN
                day3 = chart(i, 2)
                month1 = chart(i, 1)
                year1 = chart(i, 3)
            END IF
            IF count > 1 THEN
                day4 = chart(i, 2)
                month2 = chart(i, 1)
                year2 = chart(i, 3)
                now = (year2 * 365) + (month2 * 30) + day4
                thn = (year1 * 365) + (month1 * 30) + day3
                balance = now - thn
                temp4(j) = temp4(j) + balance
                year1 = year2
                month1 = month2
                day3 = day4
            END IF
        END IF
    NEXT i
    temp4(j) = INT(temp4(j) / count)
    count = 0
    PRINT #1, USING "Number ## comes up every ## days."; j; temp4(j)
    PRINT #1, USING "Number ## last came up ## ## ####."; j; chart(k, 1); chart(k, 2); chart(k, 3)
    day5 = chart(k, 2) + temp4(j)
    IF day5 > 30 THEN
        day5 = day5 - 30
        month3 = chart(k, 1) + 1
    ELSE
        month3 = chart(k, 1)
    END IF
    IF month3 > 12 THEN
        month3 = month3 - 12
        year3 = chart(k, 3) + 1
    ELSE
        year3 = chart(k, 3)
    END IF
    PRINT #1, USING "Number ##   due by:    ## ## ####."; j; month3; day5; year3
    z1 = month3 * 30
    z2 = day3
    z3 = year3 * 365
    thn2 = z1 + z2 + z3
    IF thn2 < (now2 - 20) THEN
        PRINT #2, USING "Number  ##  is a good bet as it was due by : ## ## ####"; j; month3; day3; year3
        PRINT USING "Number ## is a good bet, it was due by : ## ## ####"; j; month3; day3; year3
    END IF
    k = 0
    PRINT #1, ""
NEXT j
PRINT
PRINT "Press any key to continue ..."
DO WHILE INKEY$ = ""
LOOP
CLOSE #1
CLOSE #2
GOTO main
search:
CLS
PRINT
PRINT "Search for Winning Numbers by Date"
PRINT "----------------------------------"
PRINT
month2:
INPUT "Enter Month: ", month2
IF month2 = 0 THEN
    GOTO searchmenu
END IF
IF month2 < 1 OR month2 > 12 THEN
    PRINT "Invalid Month !": GOTO month2
END IF
day2:
INPUT "Enter Day: ", day2
IF day2 < 1 OR day2 > 31 THEN
    PRINT "Invalid Month !": GOTO day2
END IF
INPUT "Enter Year [Last 2 digits] : ", year2
year2 = year2 + 2000
FOR i = 1 TO linecounter
    IF chart(i, 3) <> year2 THEN
        GOTO nextitem
    ELSEIF chart(i, 1) <> month2 THEN
        GOTO nextitem
    ELSEIF chart(i, 2) <> day2 THEN
        GOTO nextitem
    ELSEIF chart(i, 3) = year2 AND chart(i, 1) = month2 AND chart(i, 2) = day2 THEN
        search = 1
        CLS
        PRINT
        PRINT "Winning Numbers List"
        PRINT "--------------------"
        PRINT
        PRINT "Month : ", chart(i, 1)
        PRINT "Day   : ", chart(i, 2)
        PRINT "Year  : ", chart(i, 3)
        PRINT
        PRINT "1st   : ", chart(i, 4)
        PRINT "2nd   : ", chart(i, 5)
        PRINT "3rd   : ", chart(i, 6)
        PRINT "4th   : ", chart(i, 7)
        PRINT "5th   : ", chart(i, 8)
        PRINT "6th   : ", chart(i, 9)
        PRINT "Bonus : ", chart(i, 10)
        PRINT
        PRINT "Press any key to continue ... "
        PRINT
        DO WHILE INKEY$ = ""
        LOOP
    END IF
    nextitem:
NEXT i
IF search = 0 THEN
    PRINT
    PRINT "There was no draw on : "; month2; day2; year2
    PRINT
    PRINT "Press any key to continue ...."
    DO WHILE INKEY$ = ""
    LOOP
END IF
search = 0
GOTO searchmenu
grcheck:
OPEN "grmode.dat" FOR INPUT AS #1
INPUT #1, hardcopy$
INPUT #1, crs$
INPUT #1, grtype
INPUT #1, qqq
CLOSE #1
OPEN "dname.dat" FOR INPUT AS #1
INPUT #1, reg$
FOR i = 1 TO LEN(reg$)
    counter4 = counter4 - 5.4851276
    z2 = ASC(MID$(reg$, i, i))
    MID$(reg$, i, i) = CHR$(z2 + counter4)
NEXT i
CLOSE #1
counter4 = 0
OPEN "reg.dat" FOR INPUT AS #1
INPUT #1, reg2$
FOR i = 1 TO LEN(reg2$)
    counter4 = counter4 - 5.4269537
    z2 = ASC(MID$(reg2$, i, i))
    MID$(reg2$, i, i) = CHR$(z2 + counter4)
NEXT i
CLOSE #1

RETURN
grinit:
IF hardcopy$ = "y" THEN
    hardcopy$ = "Y"
END IF
IF grtype = 0 THEN
    grmode$ = "none"
ELSEIF grtype = 1 THEN
    grmode$ = "vga"
    wl = 400
    smode = 12
    barl = 0.76762357
    offset = 0
ELSEIF grtype = 2 THEN
    grmode$ = "HDMI"
    wl = 400
    smode = 12
    barl = 0.762357357
    offset = 0
END IF
RETURN
finish:
IF crs$ = "Y" THEN COLOR 7, 0
CLS
PRINT "Program Guarantee"
PRINT "-----------------"
PRINT
PRINT "The only guarantee that this program has is that if you use it, you will"
PRINT "probably spend more money on lotteries. I do not guarantee winning of "
PRINT "the lotteries with the use of this program, nor do I take any responsibility"
PRINT "for losses incurred by the use of this program."
PRINT
PRINT "Release of Lotto 649 Package Version 2020"
PRINT "-----------------------------------------"
PRINT
PRINT "This program has been released into the public domain"
PRINT "and recompiled with QB64 , source code for everything"
PRINT "has been included. I however will continue to support"
PRINT "the program as I wrote it. My address, telephone #"
PRINT "is listed below: NO SPAM PLEASE!"
PRINT ""
PRINT "Russ Campbell"
PRINT "409 Mill Street, UNit 202B"
PRINT "Kitchener, Ontario, Canada"
PRINT "N2G 3M4, Phone # (226) 798-5888 Voice or Text"
PRINT "Internet : rcamp48@rogers.com"
PRINT
PRINT "Thanks for using Lotto 649 Package Version 2020"
PRINT "Press any key to continue ...."
DO WHILE INKEY$ = ""
LOOP
END
dayofweek:
DATA Sat,Sun,Mon,Tue,Wed,Thu,Fri
RETURN
monthread:
DATA "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
month$ = month$(month)
RETURN

