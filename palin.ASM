DATA_SEG SEGMENT         ; Define the data segment
    ARY1 DB 'ABCCBA'     ; Define an array containing a string
    PALIN DB ?           ; Define a variable to store palindrome flag
    LEN DW 6             ; Define a word variable to store length of string
DATA_SEG ENDS            ; End of data segment

CODE_SEG SEGMENT         ; Define the code segment
    ASSUME DS:DATA_SEG, CS:CODE_SEG  ; Specify segment registers
START:                    ; Start of the program
    MOV AX, DATA_SEG     ; Move address of data segment to AX
    MOV DS, AX           ; Set DS to point to the data segment

    MOV SI, OFFSET ARY1 ; Move offset of ARY1 (source) to SI
    MOV DI, OFFSET ARY1 ; Move offset of ARY1 (destination) to DI
    MOV BX, LEN          ; Move length of string to BX
    DEC BX               ; Decrement BX to point to last character
    ADD DI, BX           ; Add BX to DI to point to the end of the string

AGAIN:                   ; Label for loop
    MOV CH, [DI]         ; Move character from DI to CH (end of string)
    CMP [SI], CH         ; Compare character at SI with character at DI
    JNZ NO_PALI          ; Jump if not equal (string is not palindrome)
    INC SI               ; Increment SI (move to next character)
    DEC DI               ; Decrement DI (move to previous character)
    JNZ AGAIN            ; Jump to AGAIN if DI is not zero

    MOV PALIN, 0FFH      ; Set PALIN to 0FFH (string is palindrome)
    JMP EXIT             ; Jump to EXIT

NO_PALI:                 ; Label if string is not palindrome
    MOV PALIN, 0         ; Set PALIN to 0 (string is not palindrome)

EXIT:                    ; Label for exit
    MOV AH, 4CH          ; Set AH to 4CH (terminate program)
    INT 21H              ; Call interrupt 21H (DOS function)
CODE_SEG ENDS            ; End of code segment
END START                ; End of program, start at START
