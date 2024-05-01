DATA_SEG SEGMENT
    NUM1 DW 5        ; Number for factorial calculation
    FACT DW ?        ; Variable to store the factorial result
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME DS:DATA_SEG,CS:CODE_SEG
    
START:
    MOV AX,DATA_SEG  ; Load the address of the data segment into AX
    MOV DS,AX        ; Initialize the data segment register with the address in AX

    CALL FACTORIAL   ; Call the FACTORIAL procedure to calculate the factorial of NUM1
    
    MOV AH,4CH       ; Set AH to 4CH for exit
    INT 21H          ; Call interrupt 21H to terminate the program
    
FACTORIAL PROC
    MOV CX,NUM1      ; Load the value of NUM1 into CX for factorial calculation
    MOV AX,1         ; Initialize AX with 1 (starting value for the factorial)

    FACT_LOOP:       ; Start of the loop
        MUL CX       ; Multiply AX by CX
        DEC CX       ; Decrement CX
        JNZ FACT_LOOP ; Jump to FACT_LOOP if CX is not zero

    MOV FACT,AX      ; Store the result of the factorial calculation in FACT
    RET              ; Return from the procedure
FACTORIAL ENDP

CODE_SEG ENDS
END START
