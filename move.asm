;Move the set of numbers from one memory block to another.

DATA_SEG SEGMENT
    ARY1 DB 81H,11H,22H,33H,44H
    ARY2 DB 5 DUP(0)
    CNT DB 05H           ;Set counter to five
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME DS:DATA_SEG,CS:CODE_SEG
    
START:
    MOV AX,DATA_SEG      ;Initialize data segment
    MOV DS,AX
    
    LEA SI,ARY1          ;Initialize pointer for source array
    MOV DI,OFFSET ARY2   ;Initialize pointer for destination array
    
AGAIN:
    MOV BL,[SI]          ;Read element from source array
    MOV [DI],BL          ;Move element to destination array
    INC SI               ;Increment source pointer
    INC DI               ;Increment destination pointer
    DEC CNT               
    JNZ AGAIN            ;Repeat until counter is zero
    
CODE_SEG ENDS            ;Exit to DOS
END START