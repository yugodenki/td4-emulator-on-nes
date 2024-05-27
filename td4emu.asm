.include "./nes.inc"

.segment "HEADER"
    .byte "NES", $1A          ; NES file signature
    .byte 2                   ; Number of PRG-ROM banks
    .byte 1                   ; Number of CHR-ROM banks
    .byte %00000000           ; Mapper, mirroring, battery, trainer
    .byte %00000000           ; Mapper, VS/PlayChoice, NES 2.0
    .byte 0                   ; No PRG-ROM present

.segment "CHR"
.incbin "./pattern_table.chr"  ; Include the binary chr file

.segment "RODATA"
; This is the default state mainpane where all switches are off
mainpaneFirstQuarter: 
    ; Row 1
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $88, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86
    .byte $00, $54, $44, $34, $00, $43, $50, $55, $00, $45, $4D, $55, $4C, $41, $54, $4F, $52, $00, $00, $88, $87, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; "TD4 CPU EMULATOR"
    .byte $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $87, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    .byte $00, $41, $44, $44, $52, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; "ADDR"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    .byte $00, $30, $30, $30, $30, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $49, $4E, $50, $55, $54, $00, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00 ; ROM 0000  INPUT 
    .byte $00, $30, $30, $30, $31, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 0001
    
mainpaneSecondQuarter:
    .byte $00, $30, $30, $31, $30, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 0010 
    .byte $00, $30, $30, $31, $31, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $21, $22, $00, $00, $00, $00, $00 ; ROM 0011 10Hz
    .byte $00, $30, $31, $30, $30, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $53, $50, $45, $45, $44, $00, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00 ; ROM 0100 SPEED
    .byte $00, $30, $31, $30, $31, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $23, $24, $25, $00, $00, $00, $00, $00 ; ROM 0101 1Hz
    .byte $00, $30, $31, $31, $30, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 0110
    .byte $00, $30, $31, $31, $31, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 0111
    .byte $00, $31, $30, $30, $30, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $52, $45, $53, $45, $54, $00, $00, $00, $00, $90, $00, $00, $00, $00, $00, $00 ; ROM 1000 RESET
    .byte $00, $31, $30, $30, $31, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 1001

mainpaneThirdQuarter:
    .byte $00, $31, $30, $31, $30, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 1010
    .byte $00, $31, $30, $31, $31, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 1011
    .byte $00, $31, $31, $30, $30, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $43, $4C, $4F, $43, $4B, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 1100 CLOCK
    .byte $00, $31, $31, $30, $31, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 1101
    .byte $00, $31, $31, $31, $30, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 1110
    .byte $00, $31, $31, $31, $31, $00, $80, $80, $80, $80, $80, $80, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; ROM 1111
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $50, $43, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; PC
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

mainpaneFourthQuarter:
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $4F, $55, $54, $50, $55, $54, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ; OUTPUT
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $88, $86, $86, $86, $86, $86, $86, $86, $8A, $00
    .byte $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $87, $00, $32, $30, $32, $34, $8B, $00, $89, $86

; Variables to store
.segment "ZEROPAGE"
frame_count_30: .res 1  ; Frame counter to manage timing, one byte
frame_count_60: .res 1  ; Frame counter to manage timing, one byte
frame_count_td4: .res 1 ; Frame counter to manage TD4 clock timing
frame_count_td4_half: .res 1 ; Frame counter to manage TD4 clock LED timing

cursor_sprite: .res 1  ; The tile index to use for cursor (default value set at RESET, changes over time)
cursor_x: .res 1  ; Cursor x position
cursor_y: .res 1  ; Cursor y position
is_cursor_in_right_pane: .res 1  ; Flag that stores if the cursor is in the right half of the pane or not
addr_to_change: .res 1  ; Variable to store the address of the TD4 ROM to modify
bit_to_flip: .res 1  ; Variable to store the bit that needs to be flipped
input_bit_to_flip: .res 1  ; Variable to store the bit for input that needs to be flipped

td4rom: .res 16  ; TD4 ROM, 16 bytes
td4pc: .res 1  ; TD4 Program Counter
td4a: .res 1  ; TD4 A register
td4b: .res 1  ; TD4 B register
td4carry: .res 1  ; TD4 carry flag
td4input: .res 1  ; TD4 input
td4speed: .res 1  ; TD4 clock speed ($00 for 1Hz, $01 for 10Hz)
td4speed_frames: .res 1 ; number of frames for each TD4 clock cycle (60 for 1Hz, 6 for 10Hz)
td4speed_frames_half: .res 1 ; number of frames for half the TD4 clock cycle (30 for 1Hz, 3 for 10Hz)
td4output: .res 1  ; TD4 output
execute_td4_instruction_flag: .res 1  ; Flag for executing TD4 instruction, set in VBlank, used in main loop

reset_button_sprite: .res 1
reset_button_sprite_attribute: .res 1  ; Store sprite attribute as variable so we can switch it 
reset_button_sprite_visible_frame_counter: .res 1 ; Make reset button show as pressed for a certain number of frames
clock_led_sprite: .res 1
pc_led1_sprite: .res 1
pc_led2_sprite: .res 1
pc_led3_sprite: .res 1
pc_led4_sprite: .res 1
output_led1_sprite: .res 1
output_led2_sprite: .res 1
output_led3_sprite: .res 1
output_led4_sprite: .res 1

update_background_outer_loop_counter: .res 1
update_background_inner_loop_counter: .res 1
rom_row_nametable_addr_low: .res 1
rom_row_nametable_addr_high: .res 1

joypad1_buttons: .res 1 ; Variable to keep track of which buttons were pressed
                        ; Will populate during VBlank and its values will be used in the game loop
prev_joypad1_buttons: .res 1 ; Variable to keep the previous state of joypad1_buttons 
                             ; so we can use both button press and release as triggers

.segment "CODE"
.proc reset_handler
RESET:
    SEI                       ; Disable interrupts
    CLD                       ; Clear decimal mode

    LDX #$FF
    TXS  ; Setup stack
    INX  ; X is 0
    STX PPU_CTRL  ; Disable NMI
    STX PPU_MASK  ; Disable rendering
    STA $4010  ; Disable DMC IRQs          

ResetVBlankWait1:
    BIT PPU_STATUS
    BPL ResetVBlankWait1

; Reset memory to a "known" state
    LDX #0
    LDA #0
clrmem:
    STA $0000, X
    STA $0100, X
    STA $0200, X
    STA $0300, X
    STA $0400, X
    STA $0500, X
    STA $0600, X
    STA $0700, X
    INX
    BNE clrmem

ResetVBlankWait2:
    BIT PPU_STATUS
    BPL ResetVBlankWait2

    JSR loadBackground

setupVariables:
    ; Set the cursor sprite to $84
    LDA #$84
    STA cursor_sprite
    ; Set the initial cursor position
    LDA #48
    STA cursor_x
    LDA #47
    STA cursor_y
    ; Set the sprite for reset button
    LDA #$91
    STA reset_button_sprite
    LDA #%00100010  ; behind backgroud, palette 6
    STA reset_button_sprite_attribute
    LDA #0
    STA reset_button_sprite_visible_frame_counter
    ; Set the initial sprites for the LEDs
    LDA #$82
    STA clock_led_sprite
    STA pc_led1_sprite
    STA pc_led2_sprite
    STA pc_led3_sprite
    STA pc_led4_sprite
    STA output_led1_sprite
    STA output_led2_sprite
    STA output_led3_sprite
    STA output_led4_sprite
    ; Set the initial clock speed for TD4 (1Hz)
    LDA #60
    STA td4speed_frames
    LDA #30
    STA td4speed_frames_half

MainLoop:
    JSR VBlankWait1
    
    ; Check execute_td4_instruction flag to see if we need to execute instruction
    LDA execute_td4_instruction_flag
    BNE executeTD4Instruction
    doneExecuteTD4Instruction:

    JSR handleJoypad1
    JMP MainLoop  ; Forever

VBlankWait1: 
    BIT PPU_STATUS  ; Read PPU status to check VBLank
    BPL VBlankWait1  ; Loop until VBlank starts
    RTS

resetTD4: 
    ; This subroutine will reset td4, when the reset button is pressed
    ; TD4 PC will be set to zero
    ; TD4 A register will be set to zero
    ; TD4 B register will be set to zero
    ; TD4 carry will be cleared
    ; TD4 output will be cleared
    LDA #0
    STA td4a
    STA td4b
    STA td4carry
    STA td4output
    STA td4pc

    ; Off all the output LED sprites
    ; Sprites will be unchanged even if td4output is reset, so we need to be explicit here
    LDA #$82
    STA output_led1_sprite
    STA output_led2_sprite
    STA output_led3_sprite
    STA output_led4_sprite
    ; Off all the PC LEDs as well
    STA pc_led1_sprite
    STA pc_led2_sprite
    STA pc_led3_sprite
    STA pc_led4_sprite
    
    RTS

executeTD4Instruction:
    ; Flash the PC LEDs
    JSR setTD4PCLED

    ; First, get the TD4 program counter and load it to X
    LDX td4pc
    
    ; Get the instruction to execute
    LDA td4rom, X

    ; Execute instruction
    ; 0000 ADD A, Im (carry set if overflow)
    ; 0101 ADD B, Im (carry set if overflow)
    ; 0011 MOV A, Im
    ; 0111 MOV B, Im
    ; 0001 MOV A, B (MOV A, B + Im, carry set if overflow)
    ; 0100 MOV B, A (MOV B, A + Im, carry set if overflow)
    ; 1111 JMP Im
    ; 1110 JNC Im
    ; 0010 IN  A (IN + Im to A, carry set if overflow)
    ; 0110 IN  B (IN + Im to B, carry set if overflow)
    ; 1001 OUT B (OUT B + Im, carry set if overflow)
    ; 1011 OUT Im

    ; Get the Im data (low 4 bits) and load it to Y
    AND #%00001111
    TAY 

    ; Get the opcodes (high 4 bits)
    LDA td4rom, X
    AND #%11110000

    CMP #%00000000
    BEQ addAIm
    CMP #%01010000
    BEQ addBIm
    CMP #%00110000
    BEQ movAIm
    CMP #%01110000
    BEQ movBIm
    CMP #%00010000
    BEQ movAB
    CMP #%01000000
    BEQ movBA
    CMP #%11110000
    BEQ jmpIm
    CMP #%11100000
    BEQ jncIm
    CMP #%00100000
    BEQ inToA
    CMP #%01100000
    BEQ inToB
    CMP #%10010000
    BEQ outB
    CMP #%10110000
    BEQ outIm

    addAIm:
        TYA  ; Get Im data
        CLC
        ADC td4a
        STA td4a

        JMP checkAForCarry

    addBIm:
        TYA  ; Get Im data
        CLC
        ADC td4b
        STA td4b

        JMP checkBForCarry

    movAIm:
        STY td4a
        JMP clearCarryAndFinishOpcodeExecution
    movBIm:
        STY td4b
        JMP clearCarryAndFinishOpcodeExecution
    movAB:  ; Move B + Im to A
        ; Move Im data to 6502 A
        TYA
        ; Add B + Im at 6502 A
        CLC
        ADC td4b
        STA td4a
        JMP checkAForCarry

    movBA:  ; Move A + Im to B
        ; Move Im data to 6502 A
        TYA
        ; Add A + Im at 6502 A
        CLC
        ADC td4a
        STA td4b
        JMP checkBForCarry

    jmpIm:
        ; Set td4 pc to Im
        STY td4pc
        ; For jump instructions, we don't want to increment PC
        JMP clearCarryAndFinishOpcodeExecutionWithoutIncPC
    jncIm:
        ; Get td4 carry
        LDA td4carry       
        CMP #$01
        ; If td4 carry set, then do nothing
        ; If td4 carry clear, then set td4pc to Im
        BNE setTd4pcToIm
        ; Since we're not jumping, we need to increment PC
        JMP clearCarryAndFinishOpcodeExecution
        setTd4pcToIm:
            STY td4pc
            ; When we jump, we don't want to increment PC
            JMP clearCarryAndFinishOpcodeExecutionWithoutIncPC
    inToA:  ; Move In + Im to A
        ; Move Im to 6502 A
        TYA
        ; Add Input + Im in 6502 A
        CLC
        ADC td4input
        STA td4a
        JMP checkAForCarry

    inToB:  ; Move In + Im to B
        ; Move Im to 6502 A
        TYA
        ; Add Input + Im in 6502 A
        CLC
        ADC td4input
        STA td4b
        JMP checkBForCarry
        
    outB:  ; Output B + Im
        ; Move Im to 6502 A
        TYA
        ; Add B + Im in 6502 A
        CLC
        ADC td4b
        STA td4b
        JSR toggleOutputLEDSprites
        JMP checkBForCarry
        
    outIm:
        TYA  ; Get Im data
        JSR toggleOutputLEDSprites
        JMP clearCarryAndFinishOpcodeExecution

    ; This code assumes that the 6502 Accumulator is filled with data to output to the LEDs
    toggleOutputLEDSprites:
        TAY ; Store in Y too

        AND #%00001000
        CMP #%00001000
        BEQ toggleOutputLED1SpriteOn
        ; Off LED
        LDA #$82
        STA output_led1_sprite
        JMP toggleOutputLED1SpriteDone
        toggleOutputLED1SpriteOn:
            ; On LED
            LDA #$83
            STA output_led1_sprite
        toggleOutputLED1SpriteDone:

        TYA 
        AND #%00000100
        CMP #%00000100
        BEQ toggleOutputLED2SpriteOn
        ; Off LED
        LDA #$82
        STA output_led2_sprite
        JMP toggleOutputLED2SpriteDone
        toggleOutputLED2SpriteOn:
            ; On LED
            LDA #$83
            STA output_led2_sprite
        toggleOutputLED2SpriteDone:

        TYA
        AND #%00000010
        CMP #%00000010
        BEQ toggleOutputLED3SpriteOn
        ; Off LED
        LDA #$82
        STA output_led3_sprite
        JMP toggleOutputLED3SpriteDone
        toggleOutputLED3SpriteOn:
            ; On LED
            LDA #$83
            STA output_led3_sprite
        toggleOutputLED3SpriteDone:

        TYA
        AND #%00000001
        CMP #%00000001
        BEQ toggleOutputLED4SpriteOn
        ; Off LED
        LDA #$82
        STA output_led4_sprite
        JMP toggleOutputLED4SpriteDone
        toggleOutputLED4SpriteOn:
            ; On LED
            LDA #$83
            STA output_led4_sprite
        toggleOutputLED4SpriteDone:

        RTS

    checkAForCarry:
        LDA td4a
        ; If td4 A is bigger than %00010000, then set td4 carry flag
        CMP #%00010000
        BCS aSetCarry
        ; Otherwise clear carry and finish (it is okay to inc pc)
        JMP clearCarryAndFinishOpcodeExecution

        aSetCarry:
            LDX #$01
            STX td4carry
            ; Get the lower 4-bits and store it back to td4a
            AND #%00001111
            STA td4a
            JMP doneOpcodeExecution

    checkBForCarry:
        LDA td4b
        ; If td4 B is bigger than %00010000, then set td4 carry flag
        CMP #%00010000
        BCS bSetCarry
        ; Otherwise clear carry and finish (it is okay to inc pc)
        JMP clearCarryAndFinishOpcodeExecution

        bSetCarry:
            LDX #$01
            STX td4carry
            ; Get the lower 4-bits and store it back to td4b
            AND #%00001111
            STA td4b
            JMP doneOpcodeExecution    

    clearCarryAndFinishOpcodeExecutionWithoutIncPC:
        LDA #0
        STA td4carry
        ; After clearing carry, jump to after incrementing PC
        JMP doneResetTD4PC
    
    clearCarryAndFinishOpcodeExecution:
        LDA #0
        STA td4carry

    doneOpcodeExecution:


    ; Increment TD4 program counter
    INC td4pc
    ; If the counter is at $10, reset to 0
    LDA #$10
    CMP td4pc
    BNE doneResetTD4PC
    ; Reset to 0
    LDA #0
    STA td4pc
    doneResetTD4PC:

    ; Finally, reset the flag
    LDA #0
    STA execute_td4_instruction_flag
    JMP doneExecuteTD4Instruction

; Subroutine that flashes the LED for the PC indicator on screen
setTD4PCLED:
    LDX #0  ; Counter for loop
    LDA td4pc
    ROL
    ROL
    ROL
    ROL
    setTD4PCLoop:
        ROL
        BCS setTD4PCLEDOn
        ; Set LED Off
        LDY #$82
        STY pc_led1_sprite, X  ; Using X to add to address, we can specify led2 - led4 too
        JMP doneSetTD4PCLED
        setTD4PCLEDOn:
            ; Set LED On
            LDY #$83
            STY pc_led1_sprite, X
        doneSetTD4PCLED:
        INX
        CPX #4
        BNE setTD4PCLoop

    RTS 


handleJoypad1:
    ; Move cursor, only handle one move at a time (no diagonal)
    ; First check if the cursor is in the left half of the pane or not(TD4 ROM section)
    ; If not, then branch to right half pane handler
    LDA is_cursor_in_right_pane
    BNE handleRightHalfPaneCursorTrampoline

    LDA joypad1_buttons
    AND #joypad_up
    BNE moveUp

    LDA joypad1_buttons
    AND #joypad_down
    BNE moveDown

    LDA joypad1_buttons
    AND #joypad_left
    BNE moveLeft

    LDA joypad1_buttons
    AND #joypad_right
    BNE moveRight

    JMP doneMove

    ; This is here because it was out of range for the branch
    handleRightHalfPaneCursorTrampoline:
        JMP handleRightHalfPaneCursor

    moveUp:
        JMP checkUp
        checkPassedMoveUp:
        ; Decrease cursor y coordinate by 8
        LDA cursor_y
        SEC
        SBC #8
        STA cursor_y
        JMP doneMove
    moveDown:
        JMP checkDown
        checkPassedMoveDown:
        ; Increase cursor y coordinate by 8
        LDA cursor_y
        CLC
        ADC #8
        STA cursor_y
        JMP doneMove
    moveLeft:
        JMP checkLeft
        checkPassedMoveLeft:
        ; Decrease cursor x coordinate by 8
        LDA cursor_x
        SEC
        SBC #8
        STA cursor_x
        JMP doneMove
    moveRight:
        JMP checkRight
        checkPassedMoveRight:
        ; Increase cursor x coordinate by 8
        LDA cursor_x
        CLC
        ADC #8
        STA cursor_x
        JMP doneMove

    ; Several checks: 
    ;  - Stop the cursor from moving further if it is at boundary
    ;  - Only move once per button press
    checkUp:
        ; Check previous button state
        LDA prev_joypad1_buttons
        AND #joypad_up
        BNE doneMoveTrampoline
        ; Check boundary
        LDA cursor_y
        CMP #rom_y_min
        BEQ doneMoveTrampoline
        JMP checkPassedMoveUp
    checkDown:
        ; Check previous button state
        LDA prev_joypad1_buttons
        AND #joypad_down
        BNE doneMoveTrampoline
        ; Check boundary
        LDA cursor_y
        CMP #rom_y_max
        BEQ doneMoveTrampoline
        JMP checkPassedMoveDown
    checkLeft:
        ; Check previous button state
        LDA prev_joypad1_buttons
        AND #joypad_left
        BNE doneMoveTrampoline
        ; Check boundary
        LDA cursor_x
        CMP #rom_x_min
        BEQ doneMoveTrampoline
        JMP checkPassedMoveLeft
    checkRight:
        ; Check previous button state
        LDA prev_joypad1_buttons
        AND #joypad_right
        BNE doneMoveTrampoline
        ; Check boundary
        LDA cursor_x
        CMP #rom_x_max
        BEQ moveCursorToRightHalfOfPane
        JMP checkPassedMoveRight
    ; This is here because of branch out of range
    doneMoveTrampoline:
        JMP doneMove

    moveCursorToRightHalfOfPane:
        ; If the cursor is at TD4 ROM's right boundary, move cursor to TD4 INPUT
        LDA #$B0
        STA cursor_x
        LDA #$2F
        STA cursor_y
        ; Set flag that the cursor is in the right half of the pane
        LDA #$01
        STA is_cursor_in_right_pane
        JMP doneMove

    ; This section of code handles the movement of the cursor within the right half of the pane (INPUT, SPEED, RESET)
    ; Most of it will be hard-coded
    handleRightHalfPaneCursor:
        LDA joypad1_buttons
        AND #joypad_up
        BNE rightPaneMoveUp

        LDA joypad1_buttons
        AND #joypad_down
        BNE rightPaneMoveDown

        LDA joypad1_buttons
        AND #joypad_left
        BNE rightPaneMoveLeft

        LDA joypad1_buttons
        AND #joypad_right
        BNE rightPaneMoveRight

        JMP doneMove

        setCursorYToInput:
            LDA #$2F
            STA cursor_y
            JMP doneMove

        setCursorYToSpeed:
            LDA #$4F
            STA cursor_y
            JMP doneMove

        setCursorXToSpeed:
            LDA #$C8
            STA cursor_x
            JMP setCursorYToSpeed

        setCursorYToReset:
            LDA #$6F
            STA cursor_y
            JMP doneMove
        
        goBackToLeftPane:
            ; Set cursor to 68, 2F
            LDA #$68
            STA cursor_x
            LDA #$2F
            STA cursor_y
            ; Clear right pane flag
            LDA #$00
            STA is_cursor_in_right_pane
            JMP doneMove

        rightPaneMoveUp:
            ; Check previous button state
            LDA prev_joypad1_buttons
            AND #joypad_up
            BNE doneMove
            ; If y coord is 2F, then do nothing
            LDA cursor_y
            CMP #$2F
            BEQ doneMove
            ; If y coord is 4F, then set y coord to 2F
            CMP #$4F
            BEQ setCursorYToInput
            ; If y coord is 6F, then set y coord to 4F
            CMP #$6F
            BEQ setCursorYToSpeed

        rightPaneMoveDown:
            ; Check previous button state
            LDA prev_joypad1_buttons
            AND #joypad_down
            BNE doneMove
            ; If y coord is 2F, then set x coord to C8, y coord to 4F
            LDA cursor_y
            CMP #$2F
            BEQ setCursorXToSpeed
            ; If y coord is 4F, then set y coord to 6F
            CMP #$4F
            BEQ setCursorYToReset
            ; If y coord is 6F, then do nothing
            CMP #$6F
            BEQ doneMove

        rightPaneMoveLeft:
            ; Check previous button state
            LDA prev_joypad1_buttons
            AND #joypad_left
            BNE doneMove
            ; If y coord is not 2F (4F or 6F), then go back to left pane
            LDA cursor_y
            CMP #$2F
            BNE goBackToLeftPane
            ; Otherwise, the y coord should be 2F
            ; If the x coord is at B0, then go back to left pane
            LDA cursor_x
            CMP #$B0
            BEQ goBackToLeftPane
            ; Otherwise subtract 8 from x coord
            SEC
            SBC #$08
            STA cursor_x
            JMP doneMove

        rightPaneMoveRight:
            ; Check previous button state
            LDA prev_joypad1_buttons
            AND #joypad_right
            BNE doneMove
            ; If y coord is not 2F (4F or 6F), then do nothing
            LDA cursor_y
            CMP #$2F
            BNE doneMove
            ; Otherwise, the y coord should be 2F
            ; If the x coord is at C8, then do nothing
            LDA cursor_x
            CMP #$C8
            BEQ doneMove
            ; Otherwise add 8 to cursor x coord
            CLC
            ADC #$08
            STA cursor_x
            JMP doneMove
        
    doneMove:

    ; Toggle button or switch when A button pressed
    handleAButtonPress:
        LDA joypad1_buttons
        AND #joypad_a
        BNE doneHandleAButtonPress

        ; Do nothing if A button was pressed in the previous button state
        LDA prev_joypad1_buttons
        AND #joypad_a
        BEQ doneHandleAButtonPress

        ; Take action depending on where the cursor is currently
        ; If is_cursor_in_right_pane flag is clear, then it means that
        ; the cursor is in the left pane, which means the TD4 ROM.
        LDA is_cursor_in_right_pane
        CMP #$01
        BEQ handleAButtonPressRightPane

        ; Store the changed TD4 ROM value in memory (using ORA)
        ; and toggle corresponding background tile in nametable.

        ; Get the TD4 ROM Addr to set from cursor_y
        LDA cursor_y
        ; Subtract offset $2F
        SEC
        SBC #$2F
        ; Divide by 8
        LSR
        LSR
        LSR
        ; What's in A right now is the TD4 ROM addr
        STA addr_to_change

        ; Get the TD4 ROM data to set from cursor_x
        LDA cursor_x
        ; Subtract offset $30
        SEC 
        SBC #$30
        ; Divide by 8
        LSR
        LSR
        LSR
        ; transfer A to X since we need A for ROR
        TAX
        INX
        ; Put 00000000 to A
        LDA #%00000000
        ; Set carry
        SEC
        ; X holds the number of times we need to ROR A
        ;   We are going to rotate C:1 A:00000000 to get the desired bit to flip
        getTD4ToggledDataLoop:
        ROR
        DEX
        ; If X is not 0, then keep on going
        BNE getTD4ToggledDataLoop
        ; The current value in A represents the bit that needs to be flipped
        STA bit_to_flip

        ; Flip the desired bit at the desired address
        LDX addr_to_change
        EOR td4rom, X
        STA td4rom, X

        JMP doneHandleAButtonPress

        handleAButtonPressRightPane:
            ; handle INPUT, SPEED, RESET buttons & switches
            LDA cursor_y
            CMP #$2F
            BEQ handleInputToggle
            CMP #$4F
            BEQ handleSpeedToggle
            ; else, if $6F, then toggle RESET
            BNE handleResetToggle

            ; If cursor_y is 2F, INPUT
            handleInputToggle:
                LDA cursor_x
                ; Subtract cursor_x by offset $B0 and divide by 8
                SEC 
                SBC #$B0
                LSR
                LSR
                LSR
                TAX  ; Store in X so we can use it as a counter
                INX
                ; Clear carry and load 00010000 to A
                ; Rotate right until we get the desired bits for the input
                LDA #%00010000
                CLC
                getInputToggleBit:
                    ROR
                    DEX
                    BNE getInputToggleBit
                ; XOR with the current input
                EOR td4input
                STA td4input

                JMP doneHandleAButtonPress

            ; If cursor_y is 4F, SPEED
            handleSpeedToggle:
                ; Toggle speed
                ; $01 is 10Hz, $00 is 1Hz
                LDA #$01
                EOR td4speed
                STA td4speed

                ; Reset the frame counts here
                LDA #0
                STA frame_count_td4
                STA frame_count_td4_half

                JMP doneHandleAButtonPress

            ; If cursor_y is 6F, RESET
            handleResetToggle:
                ; In reality we want to trigger reset at button release only
                ; but right now reset is triggered at button press

                ; Set frame counter to 6, the value will be used during VBlank
                LDA #6
                STA reset_button_sprite_visible_frame_counter

                ; When pressed, jump to ResetTD4 subroutine
                JSR resetTD4
                JMP doneHandleAButtonPress
            

    doneHandleAButtonPress:

    ; Store previous button values 
    endCursorUpdate:
        LDA joypad1_buttons
        STA prev_joypad1_buttons
    
    RTS

; Load background tiles and set color palettes
loadBackground:
    ; Set palette colors
    LDA #$3F
    STA PPU_ADDR                 ; PPU_ADDR high byte
    LDA #$00
    STA PPU_ADDR                 ; PPU_ADDR low byte
    ; Mainly for background
    LDA #$1B                     ; Green
    STA PPU_DATA
    LDA #$30                     ; white
    STA PPU_DATA
    LDA #$0A                     ; dark green
    STA PPU_DATA
    LDA #$2B                     ; light green
    STA PPU_DATA
    ; palette 4, for sprites (LED)
    LDA #$3F
    STA PPU_ADDR
    LDA #$11                     
    STA PPU_ADDR
    LDA #$20                     ; white
    STA PPU_DATA
    LDA #$27                     ; orange
    STA PPU_DATA
    LDA #$2D                     ; grey
    STA PPU_DATA
    ; palette 5, for sprites (LED)
    LDA #$3F
    STA PPU_ADDR
    LDA #$15                 
    STA PPU_ADDR
    LDA #$20                     ; white
    STA PPU_DATA
    LDA #$25                     ; purple pink
    STA PPU_DATA
    LDA #$2D                     ; grey
    STA PPU_DATA
    ; palette 6, for sprites (RESET button)
    LDA #$3F
    STA PPU_ADDR
    LDA #$19
    STA PPU_ADDR
    LDA #$30                     ; white
    STA PPU_DATA
    LDA #$0A                     ; dark green
    STA PPU_DATA
    LDA #$2B                     ; light green
    STA PPU_DATA

    ; Set nametable
    ;   Set where to start changing the nametable ($2000)
    LDA #$20
    STA PPU_ADDR
    LDA #$00
    STA PPU_ADDR
    
    ; Start loading background
    LDX #0 ; Counter for 256 tiles
    loadBgMainpaneFirstQuarter:
        LDA mainpaneFirstQuarter, X
        STA PPU_DATA
        INX
        BNE loadBgMainpaneFirstQuarter  ; will not branch when X rolls over from 255 to 0, hence Zero flag is set

    loadBgMainpaneSecondQuarter:
        LDA mainpaneSecondQuarter, X
        STA PPU_DATA
        INX
        BNE loadBgMainpaneSecondQuarter  ; will not branch when X rolls over from 255 to 0, hence Zero flag is set
    
    loadBgMainpaneThirdQuarter:
        LDA mainpaneThirdQuarter, X
        STA PPU_DATA
        INX
        BNE loadBgMainpaneThirdQuarter  ; will not branch when X rolls over from 255 to 0, hence Zero flag is set

    loadBgMainpaneFourthQuarter:
        LDA mainpaneFourthQuarter, X
        STA PPU_DATA
        INX
        CPX #192
        BNE loadBgMainpaneFourthQuarter
    
    doneLoadingBg:
    LDA #$00
    STA PPU_ADDR
    STA PPU_ADDR

    ; Enable NMI and rendering
    LDA #%10000000
    STA PPU_CTRL
    LDA #%00011110
    STA PPU_MASK

    RTS
.endproc

.proc nmi_handler
NMI:
    ; Code executed every half clock cycle of TD4
    LDA frame_count_td4_half
    CMP td4speed_frames_half
    BEQ frameTD4HalfHandler
    doneFrameTD4HalfHandler:

    ; Code executed every clock cycle of TD4
    LDA frame_count_td4
    CMP td4speed_frames
    BEQ frameTD4Handler
    doneFrameTD4Handler:

    ; Code executed when frame_count is 30 (0.5 sec)
    LDA frame_count_30
    CMP #30
    BEQ frame30Handler
    ; Jump here after frame30Handler
    doneFrame30Handler:

    ; Code executed when frame_count is at 60 (1 sec)
    LDA frame_count_60
    CMP #60
    BEQ frame60Handler
    ; Jump back to here after frame60Handler
    doneFrame60Handler:

    ; Code executed for RESET button
    LDA reset_button_sprite_visible_frame_counter
    ; If frame counter is zero, then set sprite attribute to non-visible
    BEQ setResetButtonSpriteInvisible
    ; If value is non-zero, then set sprite attribute to visible
    LDA #%00000010  ; front of background
    STA reset_button_sprite_attribute
    ; Decrement frame counter
    DEC reset_button_sprite_visible_frame_counter
    JMP doneResetButtonSpriteVisible
    setResetButtonSpriteInvisible:
        LDA #%00100010  ; behind background
        STA reset_button_sprite_attribute
    doneResetButtonSpriteVisible:

    LDA is_cursor_in_right_pane
    CMP #$01
    BEQ drawInputsTrampoline
    ; Update ROM row as background if cursor in left pane
    JMP drawRomRow
    doneDrawingBackground:

    ; Draw sprites
    JSR drawSprites

    ; Increment frame counters
    INC frame_count_td4_half
    INC frame_count_td4
    INC frame_count_30
    INC frame_count_60

    ; Read controller
    JSR readJoy

    ; End NMI handler
    RTI

drawInputsTrampoline:
    JMP drawInputs

frame30Handler:
    ; Switch the tile used for cursor
    LDA cursor_sprite
    CMP #$84
    BEQ changeCursorSpriteToSecond
    ; If not, change it back to $84
    LDA #$84
    STA cursor_sprite
    doneChangeCursorSpriteToSecond: 

    ; Reset frame_count
    LDA #0
    STA frame_count_30

    ; End frame30Handler
    JMP doneFrame30Handler

changeCursorSpriteToSecond: 
    ; Change cursor sprite to $85 (smaller cursor)
    LDA #$85
    STA cursor_sprite
    JMP doneChangeCursorSpriteToSecond

frame60Handler:
    ; Reset frame_count
    LDA #0
    STA frame_count_60

    ; End frame60Handler
    JMP doneFrame60Handler

frameTD4HalfHandler:
    ; Reset frame count
    LDA #0
    STA frame_count_td4_half

    ; This only determines when to flash the clock LED for TD4
    LDA clock_led_sprite
    CMP #$82
    BEQ setClockOnLED
    LDA #$82
    STA clock_led_sprite
    JMP doneFrameTD4HalfHandler

    setClockOnLED:
        LDA #$83
        STA clock_led_sprite
        JMP doneFrameTD4HalfHandler

frameTD4Handler:
    ; This determines when to execute TD4 instruction
    ; Set the execution flag
    LDA #$01
    STA execute_td4_instruction_flag

    ; Reset frame count
    LDA #0
    STA frame_count_td4

    JMP doneFrameTD4Handler


; Draw the background (DIP switches) based on the values in memory
drawRomRow:
    ; The variable addr_to_change contains the addr that needs to be changed
    LDX addr_to_change
    INX 
    ; If addr to change is 00, then start writing at $20C6
    LDA #$A6  ; The origin - $20 of the nametable addr
    STA rom_row_nametable_addr_low
    LDA #$20  ; The origin of the nametable addr
    STA rom_row_nametable_addr_high
    setRomRowNametableAddrLoop:
        LDA rom_row_nametable_addr_low        
        CLC
        ADC #$20
        STA rom_row_nametable_addr_low
        LDA rom_row_nametable_addr_high
        ADC #$00  ; Add using carry from last time
        STA rom_row_nametable_addr_high
        DEX 
        BNE setRomRowNametableAddrLoop
    ; Set PPU Addr to start writing nametable
    LDA rom_row_nametable_addr_high
    STA PPU_ADDR
    LDA rom_row_nametable_addr_low
    STA PPU_ADDR
            
    ; Loop through the row of DIP switches and set the corresponding tile
    ; Load memory with 8 for the inner loop counter (1 addr of the ROM)
    LDA #8
    STA update_background_inner_loop_counter

    CLC
    LDX addr_to_change
    LDA td4rom, X
    setTileBackground:
        ROL
        BCC setOffSwitchTile
        LDY #$81
        JMP switchTileSelected
        setOffSwitchTile:
        LDY #$80
        switchTileSelected:
        STY PPU_DATA
        DEC update_background_inner_loop_counter
        BNE setTileBackground

    ; Done writing nametable data to PPU
    LDA #$00
    STA PPU_ADDR
    STA PPU_ADDR

    JMP doneDrawingBackground

drawInputs:
    ; Based on the values in INPUT, SPEED, update the background tiles
    
    ; INPUT
    LDA td4input
    LDX #4  ; Counter for looping 4 times for all input switches
    LDY #$20
    STY PPU_ADDR
    LDY #$D6
    STY PPU_ADDR
    ROL
    ROL
    ROL
    ROL
    drawInputSwitchLoop:
        ROL
        BCC drawOffInputSwitch
        LDY #$81
        STY PPU_DATA
        JMP doneDrawingInputSwitch
        drawOffInputSwitch:
            LDY #$80
            STY PPU_DATA
        doneDrawingInputSwitch:
        DEX
        BNE drawInputSwitchLoop

    ; SPEED
    LDY #$21
    STY PPU_ADDR
    LDY #$59
    STY PPU_ADDR

    LDA td4speed

    ; Check which flag is on currently
    CMP #$01
    BEQ drawOnSpeedSwitch
    ; 1Hz
    LDY #$80
    STY PPU_DATA
    ; Also change the frames needed for td4
    LDY #60
    STY td4speed_frames
    LDY #30
    STY td4speed_frames_half
    
    JMP doneDrawOnSpeedSwitch
    drawOnSpeedSwitch:
        ; 10Hz
        LDY #$81
        STY PPU_DATA
        ; Also change the frames needed for td4
        LDY #6
        STY td4speed_frames
        LDY #3
        STY td4speed_frames_half
    doneDrawOnSpeedSwitch:

    LDA #$00
    STA PPU_ADDR
    STA PPU_ADDR

    JMP doneDrawingBackground

drawSprites:
    ; Sprite 0, OUTPUT LED 1
    ; Y position
    LDA #$CF
    STA $0200
    ; Tile to use
    LDA output_led1_sprite
    STA $0201
    ; Attribute
    LDA #%00000000  ; palette 4
    STA $0202
    ; X position
    LDA #$B0
    STA $0203

    ; Sprite 1, OUTPUT LED 2
    ; Y position
    LDA #$CF
    STA $0204
    ; Tile to use
    LDA output_led2_sprite
    STA $0205
    ; Attribute
    LDA #%00000000  ; palette 4
    STA $0206
    ; X position
    LDA #$C0
    STA $0207

    ; Sprite 2, OUTPUT LED 3
    ; Y position
    LDA #$CF
    STA $0208
    ; Tile to use
    LDA output_led3_sprite
    STA $0209
    ; Attribute
    LDA #%00000000  ; palette 4
    STA $020A
    ; X position
    LDA #$D0
    STA $020B

    ; Sprite 3, OUTPUT LED 4
    ; Y position
    LDA #$CF
    STA $020C
    ; Tile to use
    LDA output_led4_sprite
    STA $020D
    ; Attribute
    LDA #%00000000  ; palette 4
    STA $020E
    ; X position
    LDA #$E0
    STA $020F

    ; Sprite 4, cursor
    ; Y position
    LDA cursor_y
    STA $0210
    ; Tile to use
    LDA cursor_sprite
    STA $0211
    ; Attribute
    LDA #%00000000  ; palette 4
    STA $0212
    ; X position
    LDA cursor_x
    STA $0213

    ; Sprite 5, clock LED
    ; Y position
    LDA #$8F
    STA $0214
    ; Tile to use
    LDA clock_led_sprite
    STA $0215
    ; Attribute
    LDA #%00000000  ; palette 4
    STA $0216
    ; X position
    LDA #$B0
    STA $0217

    ; Sprite 6, TD4 PC LED1
    ; Y position
    LDA #$AF
    STA $0218
    ; Tile to use
    LDA pc_led1_sprite
    STA $0219
    ; Attribute
    LDA #%00000001  ; palette 5
    STA $021A
    ; X position
    LDA #$B0
    STA $021B

    ; Sprite 7, TD4 PC LED2
    ; Y position
    LDA #$AF
    STA $021C
    ; Tile to use
    LDA pc_led2_sprite
    STA $021D
    ; Attribute
    LDA #%00000001  ; palette 5
    STA $021E
    ; X position
    LDA #$C0
    STA $021F

    ; Sprite 8, TD4 PC LED3
    ; Y position
    LDA #$AF
    STA $0220
    ; Tile to use
    LDA pc_led3_sprite
    STA $0221
    ; Attribute
    LDA #%00000001  ; palette 5
    STA $0222
    ; X position
    LDA #$D0
    STA $0223

    ; Sprite 9, TD4 PC LED4
    ; Y position
    LDA #$AF
    STA $0224
    ; Tile to use
    LDA pc_led4_sprite
    STA $0225
    ; Attribute
    LDA #%00000001  ; palette 5
    STA $0226
    ; X position
    LDA #$E0
    STA $0227

    ; Sprite 10, the "pressed" button for TD4 RESET
    ; This sprite will be switched to a different attribute (so that it's visible) when RESET is pressed
    ; but for only 30 frames
    ; Y position
    LDA #$6F
    STA $0228
    ; Tile to use
    LDA reset_button_sprite
    STA $0229
    ; Attribute
    LDA reset_button_sprite_attribute
    STA $022A
    ; X position
    LDA #$C8
    STA $022B

    ; transfer sprites to PPU using DMA
    LDA #$00
    STA PPU_OAMADDR  ; sets the low byte of the RAM address for sprites
    LDA #$02
    STA PPU_OAMDMA  ; sets the high byte of the RAM address for sprites and start transfer 

    ; Enable NMI
    LDA #%10000000  ; bits 1 and 0 are Y and X
    STA PPU_CTRL

    ; End drawSprites
    RTS

readJoy:
    LDA #$01
    STA JOYPAD1
    ; Reset joypad1_buttons to 01 (this will be used for terminating the readJoyLoop)
    STA joypad1_buttons
    LSR A  ; A is 0, Carry set
    ; Write 0 to JOYPAD1
    STA JOYPAD1

    readJoyLoop:
        LDA JOYPAD1
        LSR A  ; bit 0 -> carry
        ROL joypad1_buttons  ; carry -> bit 0, bit 7 -> carry
        ; carry should be clear until 8 bits are read
        BCC readJoyLoop

    RTS

.endproc

.segment "VECTORS"
    .word nmi_handler         ; $FFFA-$FFFB
    .word reset_handler       ; $FFFC-$FFFD
    .word 0                   ; $FFFE-$FFFF