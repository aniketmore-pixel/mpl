;Count number of zeroes and ones in the given 8-bit number.

DATA_SEG SEGMENT
    NUM1 DB 81H    ; 8-bit number to be analyzed
    ZEROS DB 0     ; Variable to store the count of zeroes
    ONES DB 0      ; Variable to store the count of ones
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME DS:DATA_SEG, CS:CODE_SEG
START:
    MOV AX, DATA_SEG  ; Load the address of the data segment into AX
    MOV DS, AX        ; Initialize the data segment register with the address in AX

    MOV CL, 08H       ; Set CL to 8 to loop through each bit of NUM1

    MOV AL, NUM1      ; Load the 8-bit number into AL

BACK:
    ROR AL, 1         ; Rotate AL right by 1 bit
    JC CARRY1         ; Jump to CARRY1 if the carry flag is set (bit rotated out is 1)
    INC ZEROS         ; Increment the count of zeroes
    DEC CL            ; Decrement the loop counter
    JNZ BACK          ; Jump back if the loop counter is not zero

CARRY1:
    INC ONES          ; Increment the count of ones
    DEC CL            ; Decrement the loop counter
    JNZ BACK          ; Jump back if the loop counter is not zero

    MOV AH, 4CH       ; Set up DOS function to exit
    INT 21H           ; Call DOS interrupt

CODE_SEG ENDS
END START
