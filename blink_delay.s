.equ SREG, 0x3F
.equ PORTB, 0x05
.equ DDRB, 0x04
.org 0 

main: ldi r16, 0
      out SREG, r16
      
      ldi r16, 0x01  ;initialise registers
      
      ldi r17, 0x0f
      
      ldi r18, 128
      
      ldi r19, 0
      
      out DDRB, r17

repeat: ldi r21, 111
	call delay
      out PORTB, r16
      ldi r21, 56
      call delay
      out PORTB, r19
      rjmp repeat
	
	
      
delay: nop
nest2: 
	dec r21
  	ldi r20, 128   
nest1:
	dec r20
	ldi r18, 128
loop:   nop
	dec r18
	cpi r18, 0
	brne loop
	cpi r20, 0
	brne nest1
	cpi r21, 0
	brne nest2
	ret
	
mainloop: rjmp mainloop

