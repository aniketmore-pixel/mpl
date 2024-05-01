;16 bit BCD addition

DATA_SEG SEGMENT
    NUM1 DW 1234H
    NUM2 DW 5678H
    SUM DW 0
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME DS:DATA_SEG, CS:CODE_SEG
    
START:
    MOV AX,DATA_SEG    ; Initialize data segment register
    MOV DS,AX
    
    MOV AX,NUM1        ; Get the first number
    MOV BX,NUM2        ; Get the second number
    
    ADD AL,BL          ; Add the lower bytes
    DAA                ; Decimal Adjust after Addition
    MOV CL,AL

    MOV AX,NUM1  
    ADC AH,BH          ; Add the higher bytes with carry
    DAA
    MOV CH,AH

    MOV SUM,CX         ; Store the result in sum

    MOV AH,4CH
    INT 21H    
CODE_SEG ENDS
END START