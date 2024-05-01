DATA_SEG SEGMENT           ; Define the data segment
    NUM1 DB 12H            ; Define a byte variable NUM1 with initial value 12H
    NUM2 DW 5678H          ; Define a word variable NUM2 with initial value 5678H
    NUM3 DB 0              ; Define a byte variable NUM3 with initial value 0
    NUM4 DW 0              ; Define a word variable NUM4 with initial value 0
    ARY1 DB 81H,22H,33H,44H,55H,66H,77H,88H,99H  ; Define an array ARY1
    ARY2 DB 35H,44H,81H,22H,64H,78H,92H,56H,66H  ; Define an array ARY2
    ARY3 DB 10 DUP(0)      ; Define an array ARY3 with 10 elements initialized to 0
DATA_SEG ENDS             ; End of data segment

CODE_SEG SEGMENT           ; Define the code segment
    ASSUME DS:DATA_SEG, CS:CODE_SEG  ; Specify segment registers
START:                      ; Start of the program
    MOV AX,DATA_SEG        ; Move address of data segment to AX
    MOV DS,AX              ; Set DS to point to the data segment

    ; Immediate Addressing Mode - Load immediate data into AL and CX
    MOV AL,08H             ; Move immediate data 08H to AL
    MOV CX,1245H           ; Move immediate data 1245H to CX

    ; Register Addressing Mode - Move data between registers
    MOV BH,AL              ; Move content of AL to BH
    MOV DX,CX              ; Move content of CX to DX

    ; Direct Addressing Mode - Move data between memory and register
    MOV BL,NUM1            ; Move content of NUM1 to BL
    MOV CX,NUM2            ; Move content of NUM2 to CX
    MOV NUM3,AL            ; Move content of AL to NUM3

    ; Load Offset of ARY1, ARY2 & ARY3
    MOV SI, OFFSET ARY1    ; Move offset of ARY1 to SI
    MOV DI, OFFSET ARY3    ; Move offset of ARY3 to DI
    
    ; Indirect Addressing Mode - Move data between memory locations indirectly
    MOV BX,[SI]            ; Move content pointed by SI (ARY1) to BX
    MOV [DI],BX            ; Move content of BX to memory location pointed by DI (ARY3)

    ; Based Addressing Mode - Move data using a base register
    MOV AL,[SI+4]          ; Move content of memory location (SI+4) to AL

    ; Indexed Addressing Mode - Move data using an index register
    MOV CL,4               ; Move immediate data 4 to CL
    MOV BL,04H             ; Move immediate data 04H to BL
    ; MOV [DI+CL],BL      ; Move content of BL to memory location (DI+CL)

    MOV AH,4CH             ; Set AH to 4CH (terminate program)
    INT 21H                ; Call interrupt 21H (DOS function)

CODE_SEG ENDS              ; End of code segment
END START                  ; End of program, start at START
