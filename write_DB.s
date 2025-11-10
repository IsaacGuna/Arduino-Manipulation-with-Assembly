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
      ldi r18, 0b00000101
      ldi r19, 0b01100000
      out DDRB, r16
      out DDRD, r17
      
      out PORTB, r18
      out PORTD, r19

      	
      
mainloop: rjmp mainloop


