PPU_CTRL   = $2000
PPU_MASK   = $2001
PPU_STATUS = $2002
PPU_OAMADDR= $2003
PPU_OAMDATA= $2004
PPU_SCROLL = $2005
PPU_ADDR   = $2006
PPU_DATA   = $2007
PPU_OAMDMA = $4014

JOYPAD1 = $4016
JOYPAD2 = $4017

joypad_a      = %10000000
joypad_b      = %01000000
joypad_select = %00100000
joypad_start  = %00010000
joypad_up     = %00001000
joypad_down   = %00000100
joypad_left   = %00000010
joypad_right  = %00000001

rom_x_min = $30
rom_x_max = $68
rom_y_min = $2F
rom_y_max = $A7