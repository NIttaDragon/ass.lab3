Dosseg
.model small
.stack 100
.data
  i dw ?
  k db ?
  mass db 100 dup(0)
.code
.startup
start:
      mov si,0 ;начальное значение массива

      mov ax,3
      add ax,ax
      mov k,'%'
      mov cl,k

z1:
      cmp si,ax
      jg m2
      add si,1

      mov ah,1 ;ввод символа
      int 21h

      mov mass[si],al
      add si,1
      mov mass[si],cl
      loop z1
m2:
      mov si,0
      ;mov al,dl
m3:
      cmp si,ax
      jg m4
      add si,1
      mov dl,mass[si]

      mov ah,2
      int 21h

      loop m3
m4:
      ret
end start

;постоянно вводится 5 символов, хотя я задаю разный ax
;после ввода символов зависает и больше не работает
;не уверена на счет символа % и его впихивания в массив
