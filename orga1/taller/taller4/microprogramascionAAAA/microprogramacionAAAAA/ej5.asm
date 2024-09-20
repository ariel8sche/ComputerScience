SET R0, 4
sumatoria:
ADD R1, R0
DEC R0
JN fin
JMP sumatoria
fin:
JMP fin
