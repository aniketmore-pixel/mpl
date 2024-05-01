DATA_SEG SEGMENT
    ARY1 DB 81H,11H,22H,35H,44H,89H,08H,10H,12H,64H   ; List of numbers
    EVEN_NO DB 0       ; Variable to store the count of even numbers
    ODD_NO DB 0        ; Variable to store the count of odd numbers
    LEN DB 10          ; Length of the array
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME DS:DATA_SEG, CS:CODE_SEG
START:
    MOV AX, DATA_SEG    ; Load the address of the data segment into AX
    MOV DS, AX          ; Initialize the data segment register with the address in AX

    MOV CL, LEN         ; Set up loop counter

    LEA BX, ARY1        ; Load the effective address of ARY1 into BX

AGAIN:
    MOV DL, [BX]        ; Load the current byte (number) into DL
    ROR DL, 1           ; Rotate DL right by 1 bit
    JC ODD1             ; If the carry flag is set, jump to ODD1 (number is odd)

    ; If the carry flag is not set (number is even)
    INC EVEN_NO         ; Increment the count of even numbers
    JMP NEXT            ; Jump to NEXT to advance to the next number

ODD1:
    INC ODD_NO          ; Increment the count of odd numbers

NEXT:
    INC BX              ; Move to the next byte in the array
    DEC CL              ; Decrement the loop counter
    JNZ AGAIN           ; If the loop counter is not zero, repeat the loop

    MOV AH, 4CH         ; Set up DOS function to exit
    INT 21H             ; Call DOS interrupt

CODE_SEG ENDS
END START
