.equ SREG, 0x3F
.equ PORTB, 0x05
.equ PORTD, 0x0B
.equ DDRB, 0x04
.equ DDRD, 0x0A


.org 0 
main: ldi r16, 0
      out SREG, r16
      ldi r16, 0x0f
      ldi r17, 0xf0
      ldi r18, 0x55
      
      out DDRB, r16
      out DDRD, r17
      
shiftloop:      lsl r18
      out PORTB, r18
      out PORTD, r18
      call delay
      lsr r18
      out PORTB, r18
      out PORTD, r18
      call delay
      rjmp shiftloop
      
delay: nop
ldi r21, 111
nest2: 
	dec r21
  	ldi r20, 128   
nest1:
	dec r20
	ldi r19, 128
loop:   nop
	dec r19
	cpi r19, 0
	brne loop
	cpi r20, 0
	brne nest1
	cpi r21, 0
	brne nest2
	ret
      
      
mainloop: rjmp mainloop


