## Secret Santa

This class performs an annual drawing of names, ensuring that certain rules are followed.
A family may decide to draw names at Christmas so that each person can receive one especially nice gift instead of many lesser ones. The tedium of obtaining a good drawing by "pulling names from a hat" inspired this program.

A sample input file named "SSANTAinput.txt" is included in this package so that you can run the program and see the results. The name of each single person appears on a separate line. Spouse pairs are entered on a separate line as Spouse1 & Spouse2. You will be asked for the directory of the input file and optional output file when the program runs.

Install the package, then (cmd-do) the following:

SecretSanta new.

The rules ensure no repetition year-to-year:

- Can not draw yourself
- Can not draw your spouse (you will give your spouse a gift anyway)
- Can not have reciprocals (A draws B and B draws A)
- Can not be a repeat of the last 3 years

Names can be drawn even if there is no history for "the last 3 years". You will be asked if you want to save the results of the drawing. If you do, it will be saved in a file named "SSANTAoutput.txt" for use next year. Each following year, the results are appended to the output file as long as you specify to save the drawing results. In this way, history is built up over time.

Statistics are displayed below the drawing results. 

Tested in Cuis 5.0  rev 3633 on 2/25/2019
