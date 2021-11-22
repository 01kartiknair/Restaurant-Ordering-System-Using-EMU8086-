.model small
.stack 100h ; will reserve a memory block of 100h for stack
.data

greetS db 'Welcome to the Restaurant !!!$'
itemS db     ' ---------Todays Special Menu----------$' 
nlineCurV db 13, 10, "$"
crudProgS db 'Microprocessor Project "A Food Ordering Management System"$'
creditsProgS db 'By M Sampreeth, NS Sailesh, Kartik Sudhir Nair $'
nameArr db 20 dup('$') 
str1 db 'What is your good name, dear customer:$' 
str2 db 13,10, 'string op is:$'
thanku db 13,2,'Thank you for coming, $',
simpleLinDw db ' --------------------------------------$'                                   
presShS db   '| Enter 1 to order a Sandwich - 150 rs |$'
presPizS db  '| Enter 2 to order a Pizza    - 250 rs |$'
presBurS db  '| Enter 3 to order a Burger   - 350 rs |$'
presSamS db  '| Enter 4 to order a Samosa   - 100 rs |$'
presDispS db '| Enter 5 to print the receipt         |$'
presDelS db  '| Enter 6 to delete the order          |$'
ordFullS db  '----Sorry you cannot order more!----$'
wrgOpS db    '-----Incorrect option selected------$'
ordSumS db   ' ------------ORDER RECEIPT--------------$'   
totAmS db    ' Your total bill will be = Rs.$'
                                                                               
totNoS db   ' Items x $'
totShS db   ' Sandwich x $'
totPizS db  ' Pizzas x $'
totBurS db  ' Burgers x $'  
totSamS db  ' Samosa x $' 
ordDelS db  'Your order has been deleted. What would you like to have this time?$'
totPriceV dw 0      ;var for total price of all ordered items
totItemsV dw  '0'   ;no of total items  

noOfS dw '0'    ;variable to keep track of how many sandwich ordered
noOfP db '0'    ;...pizza
noOfB db '0'    ;...burger
noOfSm db '0'    ;...samosa          



;code starts here!!
.code

main proc           ;main func starts 
mov ax,@data       
mov ds,ax
     
mov ah,2 
mov dl, 07    
int 21h
int 21h
int 21h

lea dx, crudProgS
call print

lea dx, nlineCurV
call print

lea dx, creditsProgS
call print

lea dx, nlineCurV
call print
call print

lea dx, greetS    
call print

lea dx, nlineCurV
call print
call print

lea dx, str1
call print
lea dx, nlineCurV
call print
call print 

mov ah, 10         ;string input sub routine defined
lea dx, nameArr        ;getting offset address of array
mov nameArr, 20         ;set array size 
int 21h



mainmen:   
           
mov ah,2 
mov dl, 07     ;beep sound
int 21h

lea dx, nlineCurV
call print

call print     
lea dx, itemS   
call print               
lea dx, nlineCurV
call print

lea dx, presShS   
call print       
lea dx, nlineCurV
call print

lea dx, presPizS    
call print          
lea dx, nlineCurV
call print

lea dx, presBurS    
call print          
lea dx, nlineCurV
call print

lea dx, presSamS
call print
lea dx, nlineCurV
call print

lea dx, presDispS     
call print
lea dx, nlineCurV
call print



lea dx, presDelS    
call print
lea dx, nlineCurV
call print
 

lea dx, simpleLinDw
call print 
lea dx, nlineCurV
call print




mov ah,1                 ;user input required
int 21h                 
mov bl,al               

lea dx, nlineCurV
call print

  ;now compare
mov al,bl               
cmp al,'1'              ;for shwarma label
je shwarma               
cmp al,'2'              ;for pizza label
je pizzza                
cmp al,'3'              ;for burger label
je burgger
cmp al, '4'             ;for samosa label
je sammosa               
cmp al,'5'              ;for display label
je displayord                 
cmp al,'6'              ;for delete order label
je delt                                  

lea dx, wrgOpS          ;when none of the above options selected, it means user entered value other than first 6 so we handle the error by prompting wrong order msg
call print

lea dx, nlineCurV
call print
 

jmp mainmen             

;----------------------------------------------------------------------------------------------(da)
print:                  ;label to print dx content  
    mov     ah, 9                               
    int     21h        
    ret

                           
                        ;main proc ends
main endp





shwarma proc            ; shwarma func
cmp totItemsV,'4'         
jle shwrma1             
lea dx, ordFullS
call print                 
jmp mainmen

ret
shwarma endp

shwrma1:                ;label to display price of one shwarma
mov ax,150              
add totPriceV, ax         
                                         
        mov dx, 1         
        add dx,48       
        mov ah,2        
        int 21h
        mov dx, 0d
        int 21h
        mov dx, 5
        add dx, 48
        mov ah, 2
        int 21h
        mov dx, 0d
        int 21h
        mov dx, 0
        add dx, 48
        mov ah, 2
        int 21h
        lea dx, nlineCurV        
                

inc totItemsV              

inc noOfS                 

jmp mainmen 

;-----------------------------------------------------------------------------------------------------------------(ah)

pizzza proc               ;pizza function
cmp totItemsV,'4'
jle pizza1
lea dx, ordFullS
call print
jmp mainmen

ret 

pizzza endp
    
pizza1:               ;label to dsiplay price of one pizza
mov ax,250              
add totPriceV, ax         
                                     
    mov dx, 2         
    add dx,48       
    mov ah,2        
    int 21h
    mov dx, 0d
    int 21h
    mov dx, 5
    add dx, 48
    mov ah, 2
    int 21h
    mov dx, 0d
    int 21h
    mov dx, 0
    add dx, 48
    mov ah, 2
    int 21h
    lea dx, nlineCurV



inc totItemsV
inc noOfP
jmp mainmen


burgger proc             ;burger function
cmp totItemsV,'4'
jle burger1 

lea dx, ordFullS
call print

jmp mainmen

ret

burgger endp

burger1:              ;label to display price of 1 burger
mov ax,350              
add totPriceV, ax         
                                         
mov dx, 3         
add dx,48       
mov ah,2        
int 21h
mov dx, 0d
int 21h
mov dx, 5
add dx, 48
mov ah, 2
int 21h
mov dx, 0d
int 21h
mov dx, 0
add dx, 48
mov ah, 2
int 21h
lea dx, nlineCurV

inc totItemsV
inc noOfB
jmp mainmen

sammosa proc               ;samosa function
cmp totItemsV,'4'
jle samosa1
lea dx, ordFullS
call print
jmp mainmen

ret 

sammosa endp
    
samosa1:               ;label to dsiplay price of one pizza
mov ax,100              
add totPriceV, ax         
                                         
mov dx, 1         
add dx,48       
mov ah,2        
int 21h
mov dx, 0d
int 21h
mov dx, 0
add dx, 48
mov ah, 2
int 21h
mov dx, 0d
int 21h
mov dx, 0
add dx, 48
mov ah, 2
int 21h
lea dx, nlineCurV



inc totItemsV
inc noOfSm
jmp mainmen
;-------------------------------------------------------------------------------------------------------(ar)

displayord proc               ;function to display the order

lea dx, nlineCurV
call print 

lea dx, ordSumS
call print
lea dx, nlineCurV
call print 


lea dx, totAmS                    
call print

                              
mov ax, totPriceV

mov dx,0                        
mov bx,10                       
mov cx,0                        
totalpush:
        div bx
        push dx
        mov dx,0
    
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint 



lea dx, nlineCurV
call print


lea dx, totNoS
call print

mov dx,totItemsV
mov ah,2
int 21h

lea dx, nlineCurV
call print

lea dx, totShS
call print

mov dx,noOfS
mov ah,2
int 21h

lea dx, nlineCurV
call print

lea dx, totPizS
call print


mov dl,noOfP
mov ah,2
int 21h

lea dx, nlineCurV
call print


lea dx, totBurS
call print

mov dl,noOfB
mov ah,2
int 21h

lea dx, nlineCurV
call print

lea dx, totSamS
call print

mov dl,noOfSm
mov ah,2
int 21h

lea dx, nlineCurV
call print

lea dx, simpleLinDw
call print 
lea dx, nlineCurV
call print 
lea dx, nlineCurV
call print 

lea dx, thanku
call print

lea dx, nameArr+2
call print

mov ah,2 
mov dl, 07         ;3 beep sounds to end the programr
int 21h
int 21h 
int 21h
                   ;end label to terminate the program
mov ah,4ch
int 21h 

jmp mainmen

ret

displayord endp

delt proc          ;proc for deleting the order
mov noOfS,'0'
mov noOfP,'0'
mov noOfB,'0'
mov noOfSm, '0'
mov totPriceV,0

mov totItemsV,'0'

lea dx, ordDelS
call print

lea dx, nlineCurV
call print

jmp mainmen
 
ret

delt endp

end main