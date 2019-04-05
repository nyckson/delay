; Ton = 600mS, Toff = 1000mS
;
;Equipe: Nildson de Castro
;       Lucas Diógenes
;       Paula Fabianna

org 0000h

inicio:
        mov p0,#11101111b
        ajmp repete

repete:
        acall delay600ms
        acall delay1000ms
        ajmp repete             ;2 ciclos | considerados parte do Toff


; Ton = 600mS
delay600ms:             ; 2
        mov p0,#11111111b       ; 1
        mov R1,#0f4h    ; 1      | move o valor 244 para o R1

aux1:
        mov R2,#0f5h    ; 1 x 244      | move o valor 245 para o R2
        nop             ; 1 x 244
        nop             ; 1 x 244
        nop             ; 1 x 244
        nop             ; 1 x 244
        nop             ; 1 x 244
        nop             ; 1 x 244

aux2:
        nop             ; 1 x 244 x 245 = 59780
        nop             ; 1 x 244 x 245 = 59780
        nop             ; 1 x 244 x 245 = 59780
        nop             ; 1 x 244 x 245 = 59780
        nop             ; 1 x 244 x 245 = 59780
        nop             ; 1 x 244 x 245 = 59780
        nop             ; 1 x 244 x 245 = 59780
        nop             ; 1 x 244 x 245 = 59780

        djnz R2,aux2    ; 2 x 244 x 245 = 119560
        djnz R1,aux1    ; 2 x 244 = 488

        ret             ; 2     |       Total = 600002  ciclos




; Toff = 1000mS
delay1000ms:             ; 2
        mov p0,#11101111b       ; 1
        mov R3,#0feh    ; 1      | move o valor 254 para o R3

aux3:
        mov R4,#0f5h    ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254
        nop             ; 1 x 254       |       15

aux4:
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230
        nop             ; 1 x 254 x 245 = 62230 | 14

        djnz R4,aux4    ; 2 x 254 x 245 = 124460
        djnz R3,aux3    ; 2 x 254 = 508

        ret             ; 2     |       Total = 1000004  ciclos
                        ;               contando os 2 ciclos do acall depois do retorno
                        ;               Total Toof = 1000006 ciclos

