DATA_SEG SEGMENT
    PACKED_BCD DB 81H
    HIGH_DIGIT DB 0
    LOW_DIGIT DB 0
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME CS:CODE_SEG, DS:DATA_SEG
    
START:
    MOV AX, DATA_SEG    ; Initialize data segment
    MOV DS, AX
    
    ; Extract high digit
    MOV AH, PACKED_BCD  ; Move the packed BCD number to AH
    SHR AH, 4           ; Shift AH 4 bits to the right to get the high digit
    AND AH, 0FH         ; Mask the upper nibble
    MOV HIGH_DIGIT, AH  ; Store the high digit
    
    ; Extract low digit
    MOV AL, PACKED_BCD  ; Reload AL with the packed BCD number
    AND AL, 0FH         ; Mask the upper nibble
    MOV LOW_DIGIT, AL   ; Store the low digit
    
    MOV AH, 4CH         ; Exit to DOS
    INT 21H

CODE_SEG ENDS
END START
