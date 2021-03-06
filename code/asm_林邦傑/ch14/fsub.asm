; ******************* fsub.asm ******************
;
       ORG   0100H
       JMP   start
a      DD    1.5
b      DD    3.5
result DD    0.0
minus  DB    ' - ', '$'
equal  DB    ' = ', '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       FINIT                   ;浮點堆疊初始化
       FLD     DWORD [a]       ;TOS=a
       FSUB    DWORD [b]       ;TOS=a-b
       FSTP    DWORD [result]  ;result=TOS=a-b
       dispf   a,  3           ;顯示a,三位小數
       dispstr minus           ;列印 '-'
       dispf   b,  3           ;顯示b,三位小數
       dispstr equal           ;列印 '='
       dispf   result, 3       ;顯示result,三位小數
       MOV     AX, 4c00H
       INT     21H             ;返回作業系統
