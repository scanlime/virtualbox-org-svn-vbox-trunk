; $Id$ 
;; @file
; Auto Generated source file. Do not edit.
;

;
; Source file: vgarom.asm
;
;  ============================================================================================
;  
;   Copyright (C) 2001,2002 the LGPL VGABios developers Team
;  
;   This library is free software; you can redistribute it and/or
;   modify it under the terms of the GNU Lesser General Public
;   License as published by the Free Software Foundation; either
;   version 2 of the License, or (at your option) any later version.
;  
;   This library is distributed in the hope that it will be useful,
;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;   Lesser General Public License for more details.
;  
;   You should have received a copy of the GNU Lesser General Public
;   License along with this library; if not, write to the Free Software
;   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
;  
;  ============================================================================================
;  
;   This VGA Bios is specific to the plex86/bochs Emulated VGA card.
;   You can NOT drive any physical vga card with it.
;  
;  ============================================================================================
;  

;
; Source file: vberom.asm
;
;  ============================================================================================
;  
;   Copyright (C) 2002 Jeroen Janssen
;  
;   This library is free software; you can redistribute it and/or
;   modify it under the terms of the GNU Lesser General Public
;   License as published by the Free Software Foundation; either
;   version 2 of the License, or (at your option) any later version.
;  
;   This library is distributed in the hope that it will be useful,
;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;   Lesser General Public License for more details.
;  
;   You should have received a copy of the GNU Lesser General Public
;   License along with this library; if not, write to the Free Software
;   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
;  
;  ============================================================================================
;  
;   This VBE is part of the VGA Bios specific to the plex86/bochs Emulated VGA card.
;   You can NOT drive any physical vga card with it.
;  
;  ============================================================================================
;  
;   This VBE Bios is based on information taken from :
;    - VESA BIOS EXTENSION (VBE) Core Functions Standard Version 3.0 located at www.vesa.org
;  
;  ============================================================================================

;
; Source file: vgabios.c
;
;  // ============================================================================================
;  
;  vgabios.c
;  
;  // ============================================================================================
;  //
;  //  Copyright (C) 2001,2002 the LGPL VGABios developers Team
;  //
;  //  This library is free software; you can redistribute it and/or
;  //  modify it under the terms of the GNU Lesser General Public
;  //  License as published by the Free Software Foundation; either
;  //  version 2 of the License, or (at your option) any later version.
;  //
;  //  This library is distributed in the hope that it will be useful,
;  //  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  //  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;  //  Lesser General Public License for more details.
;  //
;  //  You should have received a copy of the GNU Lesser General Public
;  //  License along with this library; if not, write to the Free Software
;  //  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
;  //
;  // ============================================================================================
;  //
;  //  This VGA Bios is specific to the plex86/bochs Emulated VGA card.
;  //  You can NOT drive any physical vga card with it.
;  //
;  // ============================================================================================
;  //
;  //  This file contains code ripped from :
;  //   - rombios.c of plex86
;  //
;  //  This VGA Bios contains fonts from :
;  //   - fntcol16.zip (c) by Joseph Gil avalable at :
;  //      ftp://ftp.simtel.net/pub/simtelnet/msdos/screen/fntcol16.zip
;  //     These fonts are public domain
;  //
;  //  This VGA Bios is based on information taken from :
;  //   - Kevin Lawton's vga card emulation for bochs/plex86
;  //   - Ralf Brown's interrupts list available at http://www.cs.cmu.edu/afs/cs/user/ralf/pub/WWW/files.html
;  //   - Finn Thogersons' VGADOC4b available at http://home.worldonline.dk/~finth/
;  //   - Michael Abrash's Graphics Programming Black Book
;  //   - Francois Gervais' book "programmation des cartes graphiques cga-ega-vga" edited by sybex
;  //   - DOSEMU 1.0.1 source code for several tables values and formulas
;  //
;  // Thanks for patches, comments and ideas to :
;  //   - techt@pikeonline.net
;  //
;  // ============================================================================================

;
; Source file: vbe.c
;
;  // ============================================================================================
;  //
;  //  Copyright (C) 2002 Jeroen Janssen
;  //
;  //  This library is free software; you can redistribute it and/or
;  //  modify it under the terms of the GNU Lesser General Public
;  //  License as published by the Free Software Foundation; either
;  //  version 2 of the License, or (at your option) any later version.
;  //
;  //  This library is distributed in the hope that it will be useful,
;  //  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  //  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;  //  Lesser General Public License for more details.
;  //
;  //  You should have received a copy of the GNU Lesser General Public
;  //  License along with this library; if not, write to the Free Software
;  //  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
;  //
;  // ============================================================================================
;  //
;  //  This VBE is part of the VGA Bios specific to the plex86/bochs Emulated VGA card.
;  //  You can NOT drive any physical vga card with it.
;  //
;  // ============================================================================================
;  //
;  //  This VBE Bios is based on information taken from :
;  //   - VESA BIOS EXTENSION (VBE) Core Functions Standard Version 3.0 located at www.vesa.org
;  //
;  // ============================================================================================

;
; Oracle LGPL Disclaimer: For the avoidance of doubt, except that if any license choice
; other than GPL or LGPL is available it will apply instead, Oracle elects to use only
; the Lesser General Public License version 2.1 (LGPLv2) at this time for any software where
; a choice of LGPL license versions is made available with the language indicating
; that LGPLv2 or any later version may be used, or where a choice of which version
; of the LGPL is applied is otherwise unspecified.
;





section VGAROM progbits vstart=0x0 align=1 ; size=0x9e0 class=CODE group=AUTO
    db  055h, 0aah, 040h, 0e9h, 064h, 00ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 049h, 042h
    db  04dh, 000h
vgabios_int10_handler:                       ; 0xc0022 LB 0x57e
    pushfw                                    ; 9c
    cmp ah, 00fh                              ; 80 fc 0f
    jne short 0002eh                          ; 75 06
    call 00193h                               ; e8 68 01
    jmp near 00103h                           ; e9 d5 00
    cmp ah, 01ah                              ; 80 fc 1a
    jne short 00039h                          ; 75 06
    call 00566h                               ; e8 30 05
    jmp near 00103h                           ; e9 ca 00
    cmp ah, 00bh                              ; 80 fc 0b
    jne short 00044h                          ; 75 06
    call 00105h                               ; e8 c4 00
    jmp near 00103h                           ; e9 bf 00
    cmp ax, 01103h                            ; 3d 03 11
    jne short 0004fh                          ; 75 06
    call 0045ah                               ; e8 0e 04
    jmp near 00103h                           ; e9 b4 00
    cmp ah, 012h                              ; 80 fc 12
    jne short 00094h                          ; 75 40
    cmp bl, 010h                              ; 80 fb 10
    jne short 0005fh                          ; 75 06
    call 00467h                               ; e8 0b 04
    jmp near 00103h                           ; e9 a4 00
    cmp bl, 030h                              ; 80 fb 30
    jne short 0006ah                          ; 75 06
    call 0048ah                               ; e8 23 04
    jmp near 00103h                           ; e9 99 00
    cmp bl, 031h                              ; 80 fb 31
    jne short 00075h                          ; 75 06
    call 004ddh                               ; e8 6b 04
    jmp near 00103h                           ; e9 8e 00
    cmp bl, 032h                              ; 80 fb 32
    jne short 00080h                          ; 75 06
    call 00502h                               ; e8 85 04
    jmp near 00103h                           ; e9 83 00
    cmp bl, 033h                              ; 80 fb 33
    jne short 0008ah                          ; 75 05
    call 00520h                               ; e8 98 04
    jmp short 00103h                          ; eb 79
    cmp bl, 034h                              ; 80 fb 34
    jne short 000e7h                          ; 75 58
    call 00544h                               ; e8 b2 04
    jmp short 00103h                          ; eb 6f
    cmp ax, 0101bh                            ; 3d 1b 10
    je short 000e7h                           ; 74 4e
    cmp ah, 010h                              ; 80 fc 10
    jne short 000a3h                          ; 75 05
    call 001bah                               ; e8 19 01
    jmp short 00103h                          ; eb 60
    cmp ah, 04fh                              ; 80 fc 4f
    jne short 000e7h                          ; 75 3f
    cmp AL, strict byte 003h                  ; 3c 03
    jne short 000b1h                          ; 75 05
    call 00846h                               ; e8 97 07
    jmp short 00103h                          ; eb 52
    cmp AL, strict byte 005h                  ; 3c 05
    jne short 000bah                          ; 75 05
    call 0086bh                               ; e8 b3 07
    jmp short 00103h                          ; eb 49
    cmp AL, strict byte 006h                  ; 3c 06
    jne short 000c3h                          ; 75 05
    call 00898h                               ; e8 d7 07
    jmp short 00103h                          ; eb 40
    cmp AL, strict byte 007h                  ; 3c 07
    jne short 000cch                          ; 75 05
    call 008ebh                               ; e8 21 08
    jmp short 00103h                          ; eb 37
    cmp AL, strict byte 008h                  ; 3c 08
    jne short 000d5h                          ; 75 05
    call 0091fh                               ; e8 4c 08
    jmp short 00103h                          ; eb 2e
    cmp AL, strict byte 009h                  ; 3c 09
    jne short 000deh                          ; 75 05
    call 00956h                               ; e8 7a 08
    jmp short 00103h                          ; eb 25
    cmp AL, strict byte 00ah                  ; 3c 0a
    jne short 000e7h                          ; 75 05
    call 009c9h                               ; e8 e4 08
    jmp short 00103h                          ; eb 1c
    push ES                                   ; 06
    push DS                                   ; 1e
    push ax                                   ; 50
    push cx                                   ; 51
    push dx                                   ; 52
    push bx                                   ; 53
    push sp                                   ; 54
    push bp                                   ; 55
    push si                                   ; 56
    push di                                   ; 57
    mov bx, 0c000h                            ; bb 00 c0
    mov ds, bx                                ; 8e db
    call 03264h                               ; e8 6b 31
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    pop bx                                    ; 5b
    pop bx                                    ; 5b
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop ax                                    ; 58
    pop DS                                    ; 1f
    pop ES                                    ; 07
    popfw                                     ; 9d
    iret                                      ; cf
    cmp bh, 000h                              ; 80 ff 00
    je short 00110h                           ; 74 06
    cmp bh, 001h                              ; 80 ff 01
    je short 00161h                           ; 74 52
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    push DS                                   ; 1e
    mov dx, strict word 00040h                ; ba 40 00
    mov ds, dx                                ; 8e da
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    cmp byte [word 00049h], 003h              ; 80 3e 49 00 03
    jbe short 00154h                          ; 76 2f
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 000h                  ; b0 00
    out DX, AL                                ; ee
    db  08ah, 0c3h
    ; mov al, bl                                ; 8a c3
    and AL, strict byte 00fh                  ; 24 0f
    test AL, strict byte 008h                 ; a8 08
    je short 00135h                           ; 74 02
    add AL, strict byte 008h                  ; 04 08
    out DX, AL                                ; ee
    mov CL, strict byte 001h                  ; b1 01
    and bl, 010h                              ; 80 e3 10
    mov dx, 003c0h                            ; ba c0 03
    db  08ah, 0c1h
    ; mov al, cl                                ; 8a c1
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    and AL, strict byte 0efh                  ; 24 ef
    db  00ah, 0c3h
    ; or al, bl                                 ; 0a c3
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    db  0feh, 0c1h
    ; inc cl                                    ; fe c1
    cmp cl, 004h                              ; 80 f9 04
    jne short 0013bh                          ; 75 e7
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    pop DS                                    ; 1f
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov CL, strict byte 001h                  ; b1 01
    and bl, 001h                              ; 80 e3 01
    mov dx, 003c0h                            ; ba c0 03
    db  08ah, 0c1h
    ; mov al, cl                                ; 8a c1
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    and AL, strict byte 0feh                  ; 24 fe
    db  00ah, 0c3h
    ; or al, bl                                 ; 0a c3
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    db  0feh, 0c1h
    ; inc cl                                    ; fe c1
    cmp cl, 004h                              ; 80 f9 04
    jne short 0016eh                          ; 75 e7
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop ax                                    ; 58
    retn                                      ; c3
    push DS                                   ; 1e
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    push bx                                   ; 53
    mov bx, strict word 00062h                ; bb 62 00
    mov al, byte [bx]                         ; 8a 07
    pop bx                                    ; 5b
    db  08ah, 0f8h
    ; mov bh, al                                ; 8a f8
    push bx                                   ; 53
    mov bx, 00087h                            ; bb 87 00
    mov ah, byte [bx]                         ; 8a 27
    and ah, 080h                              ; 80 e4 80
    mov bx, strict word 00049h                ; bb 49 00
    mov al, byte [bx]                         ; 8a 07
    db  00ah, 0c4h
    ; or al, ah                                 ; 0a c4
    mov bx, strict word 0004ah                ; bb 4a 00
    mov ah, byte [bx]                         ; 8a 27
    pop bx                                    ; 5b
    pop DS                                    ; 1f
    retn                                      ; c3
    cmp AL, strict byte 000h                  ; 3c 00
    jne short 001c0h                          ; 75 02
    jmp short 00221h                          ; eb 61
    cmp AL, strict byte 001h                  ; 3c 01
    jne short 001c6h                          ; 75 02
    jmp short 0023fh                          ; eb 79
    cmp AL, strict byte 002h                  ; 3c 02
    jne short 001cch                          ; 75 02
    jmp short 00247h                          ; eb 7b
    cmp AL, strict byte 003h                  ; 3c 03
    jne short 001d3h                          ; 75 03
    jmp near 00278h                           ; e9 a5 00
    cmp AL, strict byte 007h                  ; 3c 07
    jne short 001dah                          ; 75 03
    jmp near 002a5h                           ; e9 cb 00
    cmp AL, strict byte 008h                  ; 3c 08
    jne short 001e1h                          ; 75 03
    jmp near 002cdh                           ; e9 ec 00
    cmp AL, strict byte 009h                  ; 3c 09
    jne short 001e8h                          ; 75 03
    jmp near 002dbh                           ; e9 f3 00
    cmp AL, strict byte 010h                  ; 3c 10
    jne short 001efh                          ; 75 03
    jmp near 00320h                           ; e9 31 01
    cmp AL, strict byte 012h                  ; 3c 12
    jne short 001f6h                          ; 75 03
    jmp near 00339h                           ; e9 43 01
    cmp AL, strict byte 013h                  ; 3c 13
    jne short 001fdh                          ; 75 03
    jmp near 00361h                           ; e9 64 01
    cmp AL, strict byte 015h                  ; 3c 15
    jne short 00204h                          ; 75 03
    jmp near 003b4h                           ; e9 b0 01
    cmp AL, strict byte 017h                  ; 3c 17
    jne short 0020bh                          ; 75 03
    jmp near 003cfh                           ; e9 c4 01
    cmp AL, strict byte 018h                  ; 3c 18
    jne short 00212h                          ; 75 03
    jmp near 003f7h                           ; e9 e5 01
    cmp AL, strict byte 019h                  ; 3c 19
    jne short 00219h                          ; 75 03
    jmp near 00402h                           ; e9 e9 01
    cmp AL, strict byte 01ah                  ; 3c 1a
    jne short 00220h                          ; 75 03
    jmp near 0040dh                           ; e9 ed 01
    retn                                      ; c3
    cmp bl, 014h                              ; 80 fb 14
    jnbe short 0023eh                         ; 77 18
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    db  08ah, 0c3h
    ; mov al, bl                                ; 8a c3
    out DX, AL                                ; ee
    db  08ah, 0c7h
    ; mov al, bh                                ; 8a c7
    out DX, AL                                ; ee
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push bx                                   ; 53
    mov BL, strict byte 011h                  ; b3 11
    call 00221h                               ; e8 dc ff
    pop bx                                    ; 5b
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    db  08bh, 0dah
    ; mov bx, dx                                ; 8b da
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov CL, strict byte 000h                  ; b1 00
    mov dx, 003c0h                            ; ba c0 03
    db  08ah, 0c1h
    ; mov al, cl                                ; 8a c1
    out DX, AL                                ; ee
    mov al, byte [es:bx]                      ; 26 8a 07
    out DX, AL                                ; ee
    inc bx                                    ; 43
    db  0feh, 0c1h
    ; inc cl                                    ; fe c1
    cmp cl, 010h                              ; 80 f9 10
    jne short 00256h                          ; 75 f1
    mov AL, strict byte 011h                  ; b0 11
    out DX, AL                                ; ee
    mov al, byte [es:bx]                      ; 26 8a 07
    out DX, AL                                ; ee
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    push dx                                   ; 52
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 010h                  ; b0 10
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    and AL, strict byte 0f7h                  ; 24 f7
    and bl, 001h                              ; 80 e3 01
    sal bl, 1                                 ; d0 e3
    sal bl, 1                                 ; d0 e3
    sal bl, 1                                 ; d0 e3
    db  00ah, 0c3h
    ; or al, bl                                 ; 0a c3
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop ax                                    ; 58
    retn                                      ; c3
    cmp bl, 014h                              ; 80 fb 14
    jnbe short 002cch                         ; 77 22
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    db  08ah, 0c3h
    ; mov al, bl                                ; 8a c3
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    db  08ah, 0f8h
    ; mov bh, al                                ; 8a f8
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    mov BL, strict byte 011h                  ; b3 11
    call 002a5h                               ; e8 d1 ff
    db  08ah, 0c7h
    ; mov al, bh                                ; 8a c7
    pop bx                                    ; 5b
    db  08ah, 0f8h
    ; mov bh, al                                ; 8a f8
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    db  08bh, 0dah
    ; mov bx, dx                                ; 8b da
    mov CL, strict byte 000h                  ; b1 00
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    db  08ah, 0c1h
    ; mov al, cl                                ; 8a c1
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    mov byte [es:bx], al                      ; 26 88 07
    inc bx                                    ; 43
    db  0feh, 0c1h
    ; inc cl                                    ; fe c1
    cmp cl, 010h                              ; 80 f9 10
    jne short 002e3h                          ; 75 e7
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 011h                  ; b0 11
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    mov byte [es:bx], al                      ; 26 88 07
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003c8h                            ; ba c8 03
    db  08ah, 0c3h
    ; mov al, bl                                ; 8a c3
    out DX, AL                                ; ee
    mov dx, 003c9h                            ; ba c9 03
    pop ax                                    ; 58
    push ax                                   ; 50
    db  08ah, 0c4h
    ; mov al, ah                                ; 8a c4
    out DX, AL                                ; ee
    db  08ah, 0c5h
    ; mov al, ch                                ; 8a c5
    out DX, AL                                ; ee
    db  08ah, 0c1h
    ; mov al, cl                                ; 8a c1
    out DX, AL                                ; ee
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    mov dx, 003c8h                            ; ba c8 03
    db  08ah, 0c3h
    ; mov al, bl                                ; 8a c3
    out DX, AL                                ; ee
    pop dx                                    ; 5a
    push dx                                   ; 52
    db  08bh, 0dah
    ; mov bx, dx                                ; 8b da
    mov dx, 003c9h                            ; ba c9 03
    mov al, byte [es:bx]                      ; 26 8a 07
    out DX, AL                                ; ee
    inc bx                                    ; 43
    mov al, byte [es:bx]                      ; 26 8a 07
    out DX, AL                                ; ee
    inc bx                                    ; 43
    mov al, byte [es:bx]                      ; 26 8a 07
    out DX, AL                                ; ee
    inc bx                                    ; 43
    dec cx                                    ; 49
    jne short 0034ah                          ; 75 ee
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    push dx                                   ; 52
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 010h                  ; b0 10
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    and bl, 001h                              ; 80 e3 01
    jne short 0038fh                          ; 75 18
    and AL, strict byte 07fh                  ; 24 7f
    sal bh, 1                                 ; d0 e7
    sal bh, 1                                 ; d0 e7
    sal bh, 1                                 ; d0 e7
    sal bh, 1                                 ; d0 e7
    sal bh, 1                                 ; d0 e7
    sal bh, 1                                 ; d0 e7
    sal bh, 1                                 ; d0 e7
    db  00ah, 0c7h
    ; or al, bh                                 ; 0a c7
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    jmp short 003a9h                          ; eb 1a
    push ax                                   ; 50
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 014h                  ; b0 14
    out DX, AL                                ; ee
    pop ax                                    ; 58
    and AL, strict byte 080h                  ; 24 80
    jne short 003a3h                          ; 75 04
    sal bh, 1                                 ; d0 e7
    sal bh, 1                                 ; d0 e7
    and bh, 00fh                              ; 80 e7 0f
    db  08ah, 0c7h
    ; mov al, bh                                ; 8a c7
    out DX, AL                                ; ee
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003c7h                            ; ba c7 03
    db  08ah, 0c3h
    ; mov al, bl                                ; 8a c3
    out DX, AL                                ; ee
    pop ax                                    ; 58
    db  08ah, 0e0h
    ; mov ah, al                                ; 8a e0
    mov dx, 003c9h                            ; ba c9 03
    in AL, DX                                 ; ec
    xchg al, ah                               ; 86 e0
    push ax                                   ; 50
    in AL, DX                                 ; ec
    db  08ah, 0e8h
    ; mov ch, al                                ; 8a e8
    in AL, DX                                 ; ec
    db  08ah, 0c8h
    ; mov cl, al                                ; 8a c8
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    mov dx, 003c7h                            ; ba c7 03
    db  08ah, 0c3h
    ; mov al, bl                                ; 8a c3
    out DX, AL                                ; ee
    pop dx                                    ; 5a
    push dx                                   ; 52
    db  08bh, 0dah
    ; mov bx, dx                                ; 8b da
    mov dx, 003c9h                            ; ba c9 03
    in AL, DX                                 ; ec
    mov byte [es:bx], al                      ; 26 88 07
    inc bx                                    ; 43
    in AL, DX                                 ; ec
    mov byte [es:bx], al                      ; 26 88 07
    inc bx                                    ; 43
    in AL, DX                                 ; ec
    mov byte [es:bx], al                      ; 26 88 07
    inc bx                                    ; 43
    dec cx                                    ; 49
    jne short 003e0h                          ; 75 ee
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003c6h                            ; ba c6 03
    db  08ah, 0c3h
    ; mov al, bl                                ; 8a c3
    out DX, AL                                ; ee
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003c6h                            ; ba c6 03
    in AL, DX                                 ; ec
    db  08ah, 0d8h
    ; mov bl, al                                ; 8a d8
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 010h                  ; b0 10
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    db  08ah, 0d8h
    ; mov bl, al                                ; 8a d8
    shr bl, 1                                 ; d0 eb
    shr bl, 1                                 ; d0 eb
    shr bl, 1                                 ; d0 eb
    shr bl, 1                                 ; d0 eb
    shr bl, 1                                 ; d0 eb
    shr bl, 1                                 ; d0 eb
    shr bl, 1                                 ; d0 eb
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 014h                  ; b0 14
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    db  08ah, 0f8h
    ; mov bh, al                                ; 8a f8
    and bh, 00fh                              ; 80 e7 0f
    test bl, 001h                             ; f6 c3 01
    jne short 00449h                          ; 75 04
    shr bh, 1                                 ; d0 ef
    shr bh, 1                                 ; d0 ef
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003c4h                            ; ba c4 03
    db  08ah, 0e3h
    ; mov ah, bl                                ; 8a e3
    mov AL, strict byte 003h                  ; b0 03
    out DX, ax                                ; ef
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push DS                                   ; 1e
    push ax                                   ; 50
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    db  032h, 0edh
    ; xor ch, ch                                ; 32 ed
    mov bx, 00088h                            ; bb 88 00
    mov cl, byte [bx]                         ; 8a 0f
    and cl, 00fh                              ; 80 e1 0f
    mov bx, strict word 00063h                ; bb 63 00
    mov ax, word [bx]                         ; 8b 07
    mov bx, strict word 00003h                ; bb 03 00
    cmp ax, 003b4h                            ; 3d b4 03
    jne short 00487h                          ; 75 02
    mov BH, strict byte 001h                  ; b7 01
    pop ax                                    ; 58
    pop DS                                    ; 1f
    retn                                      ; c3
    push DS                                   ; 1e
    push bx                                   ; 53
    push dx                                   ; 52
    db  08ah, 0d0h
    ; mov dl, al                                ; 8a d0
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    mov bx, 00089h                            ; bb 89 00
    mov al, byte [bx]                         ; 8a 07
    mov bx, 00088h                            ; bb 88 00
    mov ah, byte [bx]                         ; 8a 27
    cmp dl, 001h                              ; 80 fa 01
    je short 004b8h                           ; 74 15
    jc short 004c2h                           ; 72 1d
    cmp dl, 002h                              ; 80 fa 02
    je short 004ach                           ; 74 02
    jmp short 004d6h                          ; eb 2a
    and AL, strict byte 07fh                  ; 24 7f
    or AL, strict byte 010h                   ; 0c 10
    and ah, 0f0h                              ; 80 e4 f0
    or ah, 009h                               ; 80 cc 09
    jne short 004cch                          ; 75 14
    and AL, strict byte 06fh                  ; 24 6f
    and ah, 0f0h                              ; 80 e4 f0
    or ah, 009h                               ; 80 cc 09
    jne short 004cch                          ; 75 0a
    and AL, strict byte 0efh                  ; 24 ef
    or AL, strict byte 080h                   ; 0c 80
    and ah, 0f0h                              ; 80 e4 f0
    or ah, 008h                               ; 80 cc 08
    mov bx, 00089h                            ; bb 89 00
    mov byte [bx], al                         ; 88 07
    mov bx, 00088h                            ; bb 88 00
    mov byte [bx], ah                         ; 88 27
    mov ax, 01212h                            ; b8 12 12
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop DS                                    ; 1f
    retn                                      ; c3
    push DS                                   ; 1e
    push bx                                   ; 53
    push dx                                   ; 52
    db  08ah, 0d0h
    ; mov dl, al                                ; 8a d0
    and dl, 001h                              ; 80 e2 01
    sal dl, 1                                 ; d0 e2
    sal dl, 1                                 ; d0 e2
    sal dl, 1                                 ; d0 e2
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    mov bx, 00089h                            ; bb 89 00
    mov al, byte [bx]                         ; 8a 07
    and AL, strict byte 0f7h                  ; 24 f7
    db  00ah, 0c2h
    ; or al, dl                                 ; 0a c2
    mov byte [bx], al                         ; 88 07
    mov ax, 01212h                            ; b8 12 12
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop DS                                    ; 1f
    retn                                      ; c3
    push bx                                   ; 53
    push dx                                   ; 52
    db  08ah, 0d8h
    ; mov bl, al                                ; 8a d8
    and bl, 001h                              ; 80 e3 01
    xor bl, 001h                              ; 80 f3 01
    sal bl, 1                                 ; d0 e3
    mov dx, 003cch                            ; ba cc 03
    in AL, DX                                 ; ec
    and AL, strict byte 0fdh                  ; 24 fd
    db  00ah, 0c3h
    ; or al, bl                                 ; 0a c3
    mov dx, 003c2h                            ; ba c2 03
    out DX, AL                                ; ee
    mov ax, 01212h                            ; b8 12 12
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    retn                                      ; c3
    push DS                                   ; 1e
    push bx                                   ; 53
    push dx                                   ; 52
    db  08ah, 0d0h
    ; mov dl, al                                ; 8a d0
    and dl, 001h                              ; 80 e2 01
    xor dl, 001h                              ; 80 f2 01
    sal dl, 1                                 ; d0 e2
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    mov bx, 00089h                            ; bb 89 00
    mov al, byte [bx]                         ; 8a 07
    and AL, strict byte 0fdh                  ; 24 fd
    db  00ah, 0c2h
    ; or al, dl                                 ; 0a c2
    mov byte [bx], al                         ; 88 07
    mov ax, 01212h                            ; b8 12 12
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop DS                                    ; 1f
    retn                                      ; c3
    push DS                                   ; 1e
    push bx                                   ; 53
    push dx                                   ; 52
    db  08ah, 0d0h
    ; mov dl, al                                ; 8a d0
    and dl, 001h                              ; 80 e2 01
    xor dl, 001h                              ; 80 f2 01
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    mov bx, 00089h                            ; bb 89 00
    mov al, byte [bx]                         ; 8a 07
    and AL, strict byte 0feh                  ; 24 fe
    db  00ah, 0c2h
    ; or al, dl                                 ; 0a c2
    mov byte [bx], al                         ; 88 07
    mov ax, 01212h                            ; b8 12 12
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop DS                                    ; 1f
    retn                                      ; c3
    cmp AL, strict byte 000h                  ; 3c 00
    je short 0056fh                           ; 74 05
    cmp AL, strict byte 001h                  ; 3c 01
    je short 00584h                           ; 74 16
    retn                                      ; c3
    push DS                                   ; 1e
    push ax                                   ; 50
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    mov bx, 0008ah                            ; bb 8a 00
    mov al, byte [bx]                         ; 8a 07
    db  08ah, 0d8h
    ; mov bl, al                                ; 8a d8
    db  032h, 0ffh
    ; xor bh, bh                                ; 32 ff
    pop ax                                    ; 58
    db  08ah, 0c4h
    ; mov al, ah                                ; 8a c4
    pop DS                                    ; 1f
    retn                                      ; c3
    push DS                                   ; 1e
    push ax                                   ; 50
    push bx                                   ; 53
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    db  08bh, 0c3h
    ; mov ax, bx                                ; 8b c3
    mov bx, 0008ah                            ; bb 8a 00
    mov byte [bx], al                         ; 88 07
    pop bx                                    ; 5b
    pop ax                                    ; 58
    db  08ah, 0c4h
    ; mov al, ah                                ; 8a c4
    pop DS                                    ; 1f
    retn                                      ; c3
    times 0x7 db 0
do_out_dx_ax:                                ; 0xc05a0 LB 0x7
    xchg ah, al                               ; 86 c4
    out DX, AL                                ; ee
    xchg ah, al                               ; 86 c4
    out DX, AL                                ; ee
    retn                                      ; c3
do_in_ax_dx:                                 ; 0xc05a7 LB 0x43
    in AL, DX                                 ; ec
    xchg ah, al                               ; 86 c4
    in AL, DX                                 ; ec
    retn                                      ; c3
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    test AL, strict byte 008h                 ; a8 08
    je short 005b1h                           ; 74 fb
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    test AL, strict byte 008h                 ; a8 08
    jne short 005beh                          ; 75 fb
    pop dx                                    ; 5a
    pop ax                                    ; 58
    retn                                      ; c3
    push dx                                   ; 52
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00003h                ; b8 03 00
    call 005a0h                               ; e8 d0 ff
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 d1 ff
    cmp AL, strict byte 004h                  ; 3c 04
    jbe short 005e8h                          ; 76 0e
    db  08ah, 0e0h
    ; mov ah, al                                ; 8a e0
    shr ah, 1                                 ; d0 ec
    shr ah, 1                                 ; d0 ec
    shr ah, 1                                 ; d0 ec
    test AL, strict byte 007h                 ; a8 07
    je short 005e8h                           ; 74 02
    db  0feh, 0c4h
    ; inc ah                                    ; fe c4
    pop dx                                    ; 5a
    retn                                      ; c3
_dispi_get_max_bpp:                          ; 0xc05ea LB 0x26
    push dx                                   ; 52
    push bx                                   ; 53
    call 00624h                               ; e8 35 00
    db  08bh, 0d8h
    ; mov bx, ax                                ; 8b d8
    or ax, strict byte 00002h                 ; 83 c8 02
    call 00610h                               ; e8 19 00
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00003h                ; b8 03 00
    call 005a0h                               ; e8 a0 ff
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 a1 ff
    push ax                                   ; 50
    db  08bh, 0c3h
    ; mov ax, bx                                ; 8b c3
    call 00610h                               ; e8 04 00
    pop ax                                    ; 58
    pop bx                                    ; 5b
    pop dx                                    ; 5a
    retn                                      ; c3
dispi_set_enable_:                           ; 0xc0610 LB 0x26
    push dx                                   ; 52
    push ax                                   ; 50
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00004h                ; b8 04 00
    call 005a0h                               ; e8 85 ff
    pop ax                                    ; 58
    mov dx, 001cfh                            ; ba cf 01
    call 005a0h                               ; e8 7e ff
    pop dx                                    ; 5a
    retn                                      ; c3
    push dx                                   ; 52
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00004h                ; b8 04 00
    call 005a0h                               ; e8 72 ff
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 73 ff
    pop dx                                    ; 5a
    retn                                      ; c3
dispi_set_bank_:                             ; 0xc0636 LB 0x26
    push dx                                   ; 52
    push ax                                   ; 50
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00005h                ; b8 05 00
    call 005a0h                               ; e8 5f ff
    pop ax                                    ; 58
    mov dx, 001cfh                            ; ba cf 01
    call 005a0h                               ; e8 58 ff
    pop dx                                    ; 5a
    retn                                      ; c3
    push dx                                   ; 52
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00005h                ; b8 05 00
    call 005a0h                               ; e8 4c ff
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 4d ff
    pop dx                                    ; 5a
    retn                                      ; c3
_dispi_set_bank_farcall:                     ; 0xc065c LB 0xe7
    cmp bx, 00100h                            ; 81 fb 00 01
    je short 00686h                           ; 74 24
    db  00bh, 0dbh
    ; or bx, bx                                 ; 0b db
    jne short 00698h                          ; 75 32
    db  08bh, 0c2h
    ; mov ax, dx                                ; 8b c2
    push dx                                   ; 52
    push ax                                   ; 50
    mov ax, strict word 00005h                ; b8 05 00
    mov dx, 001ceh                            ; ba ce 01
    call 005a0h                               ; e8 2d ff
    pop ax                                    ; 58
    mov dx, 001cfh                            ; ba cf 01
    call 005a0h                               ; e8 26 ff
    call 005a7h                               ; e8 2a ff
    pop dx                                    ; 5a
    db  03bh, 0d0h
    ; cmp dx, ax                                ; 3b d0
    jne short 00698h                          ; 75 16
    mov ax, strict word 0004fh                ; b8 4f 00
    retf                                      ; cb
    mov ax, strict word 00005h                ; b8 05 00
    mov dx, 001ceh                            ; ba ce 01
    call 005a0h                               ; e8 11 ff
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 12 ff
    db  08bh, 0d0h
    ; mov dx, ax                                ; 8b d0
    retf                                      ; cb
    mov ax, 0014fh                            ; b8 4f 01
    retf                                      ; cb
    push dx                                   ; 52
    push ax                                   ; 50
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00008h                ; b8 08 00
    call 005a0h                               ; e8 f9 fe
    pop ax                                    ; 58
    mov dx, 001cfh                            ; ba cf 01
    call 005a0h                               ; e8 f2 fe
    pop dx                                    ; 5a
    retn                                      ; c3
    push dx                                   ; 52
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00008h                ; b8 08 00
    call 005a0h                               ; e8 e6 fe
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 e7 fe
    pop dx                                    ; 5a
    retn                                      ; c3
    push dx                                   ; 52
    push ax                                   ; 50
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00009h                ; b8 09 00
    call 005a0h                               ; e8 d3 fe
    pop ax                                    ; 58
    mov dx, 001cfh                            ; ba cf 01
    call 005a0h                               ; e8 cc fe
    pop dx                                    ; 5a
    retn                                      ; c3
    push dx                                   ; 52
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00009h                ; b8 09 00
    call 005a0h                               ; e8 c0 fe
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 c1 fe
    pop dx                                    ; 5a
    retn                                      ; c3
    push ax                                   ; 50
    push bx                                   ; 53
    push dx                                   ; 52
    db  08bh, 0d8h
    ; mov bx, ax                                ; 8b d8
    call 005c6h                               ; e8 d6 fe
    cmp AL, strict byte 004h                  ; 3c 04
    jnbe short 006f6h                         ; 77 02
    shr bx, 1                                 ; d1 eb
    shr bx, 1                                 ; d1 eb
    shr bx, 1                                 ; d1 eb
    shr bx, 1                                 ; d1 eb
    mov dx, 003d4h                            ; ba d4 03
    db  08ah, 0e3h
    ; mov ah, bl                                ; 8a e3
    mov AL, strict byte 013h                  ; b0 13
    out DX, ax                                ; ef
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop ax                                    ; 58
    retn                                      ; c3
    call 006e8h                               ; e8 dd ff
    push dx                                   ; 52
    push ax                                   ; 50
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00006h                ; b8 06 00
    call 005a0h                               ; e8 8a fe
    pop ax                                    ; 58
    mov dx, 001cfh                            ; ba cf 01
    call 005a0h                               ; e8 83 fe
    pop dx                                    ; 5a
    retn                                      ; c3
    push dx                                   ; 52
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00006h                ; b8 06 00
    call 005a0h                               ; e8 77 fe
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 78 fe
    pop dx                                    ; 5a
    retn                                      ; c3
    push dx                                   ; 52
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00007h                ; b8 07 00
    call 005a0h                               ; e8 65 fe
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 66 fe
    pop dx                                    ; 5a
    retn                                      ; c3
_vga_compat_setup:                           ; 0xc0743 LB 0xf0
    push ax                                   ; 50
    push dx                                   ; 52
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00001h                ; b8 01 00
    call 005a0h                               ; e8 52 fe
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 53 fe
    push ax                                   ; 50
    mov dx, 003d4h                            ; ba d4 03
    mov ax, strict word 00011h                ; b8 11 00
    out DX, ax                                ; ef
    pop ax                                    ; 58
    push ax                                   ; 50
    shr ax, 1                                 ; d1 e8
    shr ax, 1                                 ; d1 e8
    shr ax, 1                                 ; d1 e8
    dec ax                                    ; 48
    db  08ah, 0e0h
    ; mov ah, al                                ; 8a e0
    mov AL, strict byte 001h                  ; b0 01
    out DX, ax                                ; ef
    pop ax                                    ; 58
    call 006e8h                               ; e8 7a ff
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00002h                ; b8 02 00
    call 005a0h                               ; e8 29 fe
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 2a fe
    dec ax                                    ; 48
    push ax                                   ; 50
    mov dx, 003d4h                            ; ba d4 03
    db  08ah, 0e0h
    ; mov ah, al                                ; 8a e0
    mov AL, strict byte 012h                  ; b0 12
    out DX, ax                                ; ef
    pop ax                                    ; 58
    mov AL, strict byte 007h                  ; b0 07
    out DX, AL                                ; ee
    inc dx                                    ; 42
    in AL, DX                                 ; ec
    and AL, strict byte 0bdh                  ; 24 bd
    test ah, 001h                             ; f6 c4 01
    je short 00796h                           ; 74 02
    or AL, strict byte 002h                   ; 0c 02
    test ah, 002h                             ; f6 c4 02
    je short 0079dh                           ; 74 02
    or AL, strict byte 040h                   ; 0c 40
    out DX, AL                                ; ee
    mov dx, 003d4h                            ; ba d4 03
    mov ax, strict word 00009h                ; b8 09 00
    out DX, AL                                ; ee
    mov dx, 003d5h                            ; ba d5 03
    in AL, DX                                 ; ec
    and AL, strict byte 060h                  ; 24 60
    out DX, AL                                ; ee
    mov dx, 003d4h                            ; ba d4 03
    mov AL, strict byte 017h                  ; b0 17
    out DX, AL                                ; ee
    mov dx, 003d5h                            ; ba d5 03
    in AL, DX                                 ; ec
    or AL, strict byte 003h                   ; 0c 03
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 010h                  ; b0 10
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    or AL, strict byte 001h                   ; 0c 01
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003ceh                            ; ba ce 03
    mov ax, 00506h                            ; b8 06 05
    out DX, ax                                ; ef
    mov dx, 003c4h                            ; ba c4 03
    mov ax, 00f02h                            ; b8 02 0f
    out DX, ax                                ; ef
    mov dx, 001ceh                            ; ba ce 01
    mov ax, strict word 00003h                ; b8 03 00
    call 005a0h                               ; e8 b9 fd
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 ba fd
    cmp AL, strict byte 008h                  ; 3c 08
    jc short 00831h                           ; 72 40
    mov dx, 003d4h                            ; ba d4 03
    mov AL, strict byte 014h                  ; b0 14
    out DX, AL                                ; ee
    mov dx, 003d5h                            ; ba d5 03
    in AL, DX                                 ; ec
    or AL, strict byte 040h                   ; 0c 40
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    mov dx, 003c0h                            ; ba c0 03
    mov AL, strict byte 010h                  ; b0 10
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    or AL, strict byte 040h                   ; 0c 40
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    mov AL, strict byte 020h                  ; b0 20
    out DX, AL                                ; ee
    mov dx, 003c4h                            ; ba c4 03
    mov AL, strict byte 004h                  ; b0 04
    out DX, AL                                ; ee
    mov dx, 003c5h                            ; ba c5 03
    in AL, DX                                 ; ec
    or AL, strict byte 008h                   ; 0c 08
    out DX, AL                                ; ee
    mov dx, 003ceh                            ; ba ce 03
    mov AL, strict byte 005h                  ; b0 05
    out DX, AL                                ; ee
    mov dx, 003cfh                            ; ba cf 03
    in AL, DX                                 ; ec
    and AL, strict byte 09fh                  ; 24 9f
    or AL, strict byte 040h                   ; 0c 40
    out DX, AL                                ; ee
    pop dx                                    ; 5a
    pop ax                                    ; 58
_vbe_has_vbe_display:                        ; 0xc0833 LB 0x13
    push DS                                   ; 1e
    push bx                                   ; 53
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    mov bx, 000b9h                            ; bb b9 00
    mov al, byte [bx]                         ; 8a 07
    and AL, strict byte 001h                  ; 24 01
    db  032h, 0e4h
    ; xor ah, ah                                ; 32 e4
    pop bx                                    ; 5b
    pop DS                                    ; 1f
    retn                                      ; c3
vbe_biosfn_return_current_mode:              ; 0xc0846 LB 0x25
    push DS                                   ; 1e
    mov ax, strict word 00040h                ; b8 40 00
    mov ds, ax                                ; 8e d8
    call 00624h                               ; e8 d5 fd
    and ax, strict byte 00001h                ; 83 e0 01
    je short 0085dh                           ; 74 09
    mov bx, 000bah                            ; bb ba 00
    mov ax, word [bx]                         ; 8b 07
    db  08bh, 0d8h
    ; mov bx, ax                                ; 8b d8
    jne short 00866h                          ; 75 09
    mov bx, strict word 00049h                ; bb 49 00
    mov al, byte [bx]                         ; 8a 07
    db  08ah, 0d8h
    ; mov bl, al                                ; 8a d8
    db  032h, 0ffh
    ; xor bh, bh                                ; 32 ff
    mov ax, strict word 0004fh                ; b8 4f 00
    pop DS                                    ; 1f
    retn                                      ; c3
vbe_biosfn_display_window_control:           ; 0xc086b LB 0x2d
    cmp bl, 000h                              ; 80 fb 00
    jne short 00894h                          ; 75 24
    cmp bh, 001h                              ; 80 ff 01
    je short 0088bh                           ; 74 16
    jc short 0087bh                           ; 72 04
    mov ax, 00100h                            ; b8 00 01
    retn                                      ; c3
    db  08bh, 0c2h
    ; mov ax, dx                                ; 8b c2
    call 00636h                               ; e8 b6 fd
    call 0064ah                               ; e8 c7 fd
    db  03bh, 0c2h
    ; cmp ax, dx                                ; 3b c2
    jne short 00894h                          ; 75 0d
    mov ax, strict word 0004fh                ; b8 4f 00
    retn                                      ; c3
    call 0064ah                               ; e8 bc fd
    db  08bh, 0d0h
    ; mov dx, ax                                ; 8b d0
    mov ax, strict word 0004fh                ; b8 4f 00
    retn                                      ; c3
    mov ax, 0014fh                            ; b8 4f 01
    retn                                      ; c3
vbe_biosfn_set_get_logical_scan_line_length: ; 0xc0898 LB 0x53
    db  08bh, 0c1h
    ; mov ax, cx                                ; 8b c1
    cmp bl, 001h                              ; 80 fb 01
    je short 008c6h                           ; 74 27
    cmp bl, 002h                              ; 80 fb 02
    je short 008aah                           ; 74 06
    jc short 008c3h                           ; 72 1d
    mov ax, 00100h                            ; b8 00 01
    retn                                      ; c3
    push ax                                   ; 50
    call 005c6h                               ; e8 18 fd
    db  032h, 0ffh
    ; xor bh, bh                                ; 32 ff
    db  08ah, 0dch
    ; mov bl, ah                                ; 8a dc
    db  00ah, 0dbh
    ; or bl, bl                                 ; 0a db
    jne short 008beh                          ; 75 08
    sal ax, 1                                 ; d1 e0
    sal ax, 1                                 ; d1 e0
    sal ax, 1                                 ; d1 e0
    mov BL, strict byte 001h                  ; b3 01
    db  033h, 0d2h
    ; xor dx, dx                                ; 33 d2
    pop ax                                    ; 58
    div bx                                    ; f7 f3
    call 00708h                               ; e8 42 fe
    call 005c6h                               ; e8 fd fc
    db  032h, 0ffh
    ; xor bh, bh                                ; 32 ff
    db  08ah, 0dch
    ; mov bl, ah                                ; 8a dc
    call 0071fh                               ; e8 4f fe
    db  08bh, 0c8h
    ; mov cx, ax                                ; 8b c8
    db  00ah, 0dbh
    ; or bl, bl                                 ; 0a db
    jne short 008deh                          ; 75 08
    shr ax, 1                                 ; d1 e8
    shr ax, 1                                 ; d1 e8
    shr ax, 1                                 ; d1 e8
    mov BL, strict byte 001h                  ; b3 01
    mul bx                                    ; f7 e3
    db  08bh, 0d8h
    ; mov bx, ax                                ; 8b d8
    call 00731h                               ; e8 4c fe
    db  08bh, 0d0h
    ; mov dx, ax                                ; 8b d0
    mov ax, strict word 0004fh                ; b8 4f 00
    retn                                      ; c3
vbe_biosfn_set_get_display_start:            ; 0xc08eb LB 0x34
    cmp bl, 080h                              ; 80 fb 80
    je short 008fbh                           ; 74 0b
    cmp bl, 001h                              ; 80 fb 01
    je short 0090fh                           ; 74 1a
    jc short 00901h                           ; 72 0a
    mov ax, 00100h                            ; b8 00 01
    retn                                      ; c3
    call 005b9h                               ; e8 bb fc
    call 005ach                               ; e8 ab fc
    db  08bh, 0c1h
    ; mov ax, cx                                ; 8b c1
    call 0069ch                               ; e8 96 fd
    db  08bh, 0c2h
    ; mov ax, dx                                ; 8b c2
    call 006c2h                               ; e8 b7 fd
    mov ax, strict word 0004fh                ; b8 4f 00
    retn                                      ; c3
    call 006b0h                               ; e8 9e fd
    db  08bh, 0c8h
    ; mov cx, ax                                ; 8b c8
    call 006d6h                               ; e8 bf fd
    db  08bh, 0d0h
    ; mov dx, ax                                ; 8b d0
    db  032h, 0ffh
    ; xor bh, bh                                ; 32 ff
    mov ax, strict word 0004fh                ; b8 4f 00
    retn                                      ; c3
vbe_biosfn_set_get_dac_palette_format:       ; 0xc091f LB 0x37
    cmp bl, 001h                              ; 80 fb 01
    je short 00942h                           ; 74 1e
    jc short 0092ah                           ; 72 04
    mov ax, 00100h                            ; b8 00 01
    retn                                      ; c3
    call 00624h                               ; e8 f7 fc
    cmp bh, 006h                              ; 80 ff 06
    je short 0093ch                           ; 74 0a
    cmp bh, 008h                              ; 80 ff 08
    jne short 00952h                          ; 75 1b
    or ax, strict byte 00020h                 ; 83 c8 20
    jne short 0093fh                          ; 75 03
    and ax, strict byte 0ffdfh                ; 83 e0 df
    call 00610h                               ; e8 ce fc
    mov BH, strict byte 006h                  ; b7 06
    call 00624h                               ; e8 dd fc
    and ax, strict byte 00020h                ; 83 e0 20
    je short 0094eh                           ; 74 02
    mov BH, strict byte 008h                  ; b7 08
    mov ax, strict word 0004fh                ; b8 4f 00
    retn                                      ; c3
    mov ax, 0014fh                            ; b8 4f 01
    retn                                      ; c3
vbe_biosfn_set_get_palette_data:             ; 0xc0956 LB 0x73
    test bl, bl                               ; 84 db
    je short 00969h                           ; 74 0f
    cmp bl, 001h                              ; 80 fb 01
    je short 00997h                           ; 74 38
    cmp bl, 003h                              ; 80 fb 03
    jbe short 009c5h                          ; 76 61
    cmp bl, 080h                              ; 80 fb 80
    jne short 009c1h                          ; 75 58
    push ax                                   ; 50
    push cx                                   ; 51
    push dx                                   ; 52
    push bx                                   ; 53
    push sp                                   ; 54
    push bp                                   ; 55
    push si                                   ; 56
    push di                                   ; 57
    push DS                                   ; 1e
    push ES                                   ; 06
    pop DS                                    ; 1f
    db  08ah, 0c2h
    ; mov al, dl                                ; 8a c2
    mov dx, 003c8h                            ; ba c8 03
    out DX, AL                                ; ee
    inc dx                                    ; 42
    db  08bh, 0f7h
    ; mov si, di                                ; 8b f7
    lodsw                                     ; ad
    db  08bh, 0d8h
    ; mov bx, ax                                ; 8b d8
    lodsw                                     ; ad
    out DX, AL                                ; ee
    db  08ah, 0c7h
    ; mov al, bh                                ; 8a c7
    out DX, AL                                ; ee
    db  08ah, 0c3h
    ; mov al, bl                                ; 8a c3
    out DX, AL                                ; ee
    loop 0097dh                               ; e2 f3
    pop DS                                    ; 1f
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    pop bx                                    ; 5b
    pop bx                                    ; 5b
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop ax                                    ; 58
    mov ax, strict word 0004fh                ; b8 4f 00
    retn                                      ; c3
    push ax                                   ; 50
    push cx                                   ; 51
    push dx                                   ; 52
    push bx                                   ; 53
    push sp                                   ; 54
    push bp                                   ; 55
    push si                                   ; 56
    push di                                   ; 57
    db  08ah, 0c2h
    ; mov al, dl                                ; 8a c2
    mov dx, 003c7h                            ; ba c7 03
    out DX, AL                                ; ee
    add dl, 002h                              ; 80 c2 02
    db  033h, 0dbh
    ; xor bx, bx                                ; 33 db
    in AL, DX                                 ; ec
    db  08ah, 0d8h
    ; mov bl, al                                ; 8a d8
    in AL, DX                                 ; ec
    db  08ah, 0e0h
    ; mov ah, al                                ; 8a e0
    in AL, DX                                 ; ec
    stosw                                     ; ab
    db  08bh, 0c3h
    ; mov ax, bx                                ; 8b c3
    stosw                                     ; ab
    loop 009aah                               ; e2 f3
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    pop bx                                    ; 5b
    pop bx                                    ; 5b
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop ax                                    ; 58
    jmp short 00993h                          ; eb d2
    mov ax, 0014fh                            ; b8 4f 01
    retn                                      ; c3
    mov ax, 0024fh                            ; b8 4f 02
    retn                                      ; c3
vbe_biosfn_return_protected_mode_interface: ; 0xc09c9 LB 0x17
    test bl, bl                               ; 84 db
    jne short 009dch                          ; 75 0f
    mov di, 0c000h                            ; bf 00 c0
    mov es, di                                ; 8e c7
    mov di, 04400h                            ; bf 00 44
    mov cx, 00115h                            ; b9 15 01
    mov ax, strict word 0004fh                ; b8 4f 00
    retn                                      ; c3
    mov ax, 0014fh                            ; b8 4f 01
    retn                                      ; c3

  ; Padding 0x20 bytes at 0xc09e0
  times 32 db 0

section _TEXT progbits vstart=0xa00 align=1 ; size=0x3186 class=CODE group=AUTO
set_int_vector_:                             ; 0xc0a00 LB 0x1c
    push bx                                   ; 53
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    sal bx, 1                                 ; d1 e3
    sal bx, 1                                 ; d1 e3
    xor ax, ax                                ; 31 c0
    mov es, ax                                ; 8e c0
    mov word [es:bx], dx                      ; 26 89 17
    mov word [es:bx+002h], 0c000h             ; 26 c7 47 02 00 c0
    pop bp                                    ; 5d
    pop bx                                    ; 5b
    retn                                      ; c3
init_vga_card_:                              ; 0xc0a1c LB 0x1c
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push dx                                   ; 52
    mov AL, strict byte 0c3h                  ; b0 c3
    mov dx, 003c2h                            ; ba c2 03
    out DX, AL                                ; ee
    mov AL, strict byte 004h                  ; b0 04
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    mov AL, strict byte 002h                  ; b0 02
    mov dx, 003c5h                            ; ba c5 03
    out DX, AL                                ; ee
    lea sp, [bp-002h]                         ; 8d 66 fe
    pop dx                                    ; 5a
    pop bp                                    ; 5d
    retn                                      ; c3
init_bios_area_:                             ; 0xc0a38 LB 0x32
    push bx                                   ; 53
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    xor bx, bx                                ; 31 db
    mov ax, strict word 00040h                ; b8 40 00
    mov es, ax                                ; 8e c0
    mov al, byte [es:bx+010h]                 ; 26 8a 47 10
    and AL, strict byte 0cfh                  ; 24 cf
    or AL, strict byte 020h                   ; 0c 20
    mov byte [es:bx+010h], al                 ; 26 88 47 10
    mov byte [es:bx+00085h], 010h             ; 26 c6 87 85 00 10
    mov word [es:bx+00087h], 0f960h           ; 26 c7 87 87 00 60 f9
    mov byte [es:bx+00089h], 051h             ; 26 c6 87 89 00 51
    mov byte [es:bx+065h], 009h               ; 26 c6 47 65 09
    pop bp                                    ; 5d
    pop bx                                    ; 5b
    retn                                      ; c3
_vgabios_init_func:                          ; 0xc0a6a LB 0x22
    inc bp                                    ; 45
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    call 00a1ch                               ; e8 ab ff
    call 00a38h                               ; e8 c4 ff
    call 036a3h                               ; e8 2c 2c
    mov dx, strict word 00022h                ; ba 22 00
    mov ax, strict word 00010h                ; b8 10 00
    call 00a00h                               ; e8 80 ff
    mov ax, strict word 00003h                ; b8 03 00
    db  032h, 0e4h
    ; xor ah, ah                                ; 32 e4
    int 010h                                  ; cd 10
    mov sp, bp                                ; 89 ec
    pop bp                                    ; 5d
    dec bp                                    ; 4d
    retf                                      ; cb
vga_get_cursor_pos_:                         ; 0xc0a8c LB 0x46
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push cx                                   ; 51
    push si                                   ; 56
    mov cl, al                                ; 88 c1
    mov si, dx                                ; 89 d6
    cmp AL, strict byte 007h                  ; 3c 07
    jbe short 00aa7h                          ; 76 0e
    push SS                                   ; 16
    pop ES                                    ; 07
    mov word [es:si], strict word 00000h      ; 26 c7 04 00 00
    mov word [es:bx], strict word 00000h      ; 26 c7 07 00 00
    jmp short 00acbh                          ; eb 24
    mov dx, strict word 00060h                ; ba 60 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 07 27
    push SS                                   ; 16
    pop ES                                    ; 07
    mov word [es:si], ax                      ; 26 89 04
    mov al, cl                                ; 88 c8
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    sal dx, 1                                 ; d1 e2
    add dx, strict byte 00050h                ; 83 c2 50
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 f1 26
    push SS                                   ; 16
    pop ES                                    ; 07
    mov word [es:bx], ax                      ; 26 89 07
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bp                                    ; 5d
    retn                                      ; c3
vga_read_char_attr_:                         ; 0xc0ad2 LB 0xaf
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0000ah                ; 83 ec 0a
    mov ch, al                                ; 88 c5
    mov si, dx                                ; 89 d6
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 b2 26
    xor ah, ah                                ; 30 e4
    call 03170h                               ; e8 82 26
    mov cl, al                                ; 88 c1
    cmp AL, strict byte 0ffh                  ; 3c ff
    je short 00b68h                           ; 74 74
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    lea bx, [bp-012h]                         ; 8d 5e ee
    lea dx, [bp-010h]                         ; 8d 56 f0
    call 00a8ch                               ; e8 8b ff
    mov al, byte [bp-012h]                    ; 8a 46 ee
    mov byte [bp-00ah], al                    ; 88 46 f6
    mov ax, word [bp-012h]                    ; 8b 46 ee
    mov al, ah                                ; 88 e0
    xor ah, ah                                ; 30 e4
    mov word [bp-00eh], ax                    ; 89 46 f2
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 81 26
    xor ah, ah                                ; 30 e4
    inc ax                                    ; 40
    mov word [bp-00ch], ax                    ; 89 46 f4
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 8e 26
    mov di, ax                                ; 89 c7
    mov bl, cl                                ; 88 cb
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    cmp byte [bx+04630h], 000h                ; 80 bf 30 46 00
    jne short 00b68h                          ; 75 2e
    mul word [bp-00ch]                        ; f7 66 f4
    sal ax, 1                                 ; d1 e0
    or AL, strict byte 0ffh                   ; 0c ff
    mov cl, ch                                ; 88 e9
    xor ch, ch                                ; 30 ed
    inc ax                                    ; 40
    mul cx                                    ; f7 e1
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mul di                                    ; f7 e7
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    xor ah, ah                                ; 30 e4
    add dx, ax                                ; 01 c2
    sal dx, 1                                 ; d1 e2
    add dx, cx                                ; 01 ca
    mov ax, word [bx+04633h]                  ; 8b 87 33 46
    call 031b7h                               ; e8 52 26
    mov word [ss:si], ax                      ; 36 89 04
    lea sp, [bp-008h]                         ; 8d 66 f8
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
    xchg si, ax                               ; 96
    db  00bh, 0d4h
    ; or dx, sp                                 ; 0b d4
    db  00bh, 0d9h
    ; or bx, cx                                 ; 0b d9
    db  00bh, 0e1h
    ; or sp, cx                                 ; 0b e1
    db  00bh, 0e6h
    ; or sp, si                                 ; 0b e6
    db  00bh, 0ebh
    ; or bp, bx                                 ; 0b eb
    db  00bh, 0f0h
    ; or si, ax                                 ; 0b f0
    db  00bh, 0f5h
    ; or si, bp                                 ; 0b f5
    db  00bh
vga_get_font_info_:                          ; 0xc0b81 LB 0x7b
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    mov si, dx                                ; 89 d6
    cmp ax, strict word 00007h                ; 3d 07 00
    jnbe short 00bcbh                         ; 77 3e
    mov di, ax                                ; 89 c7
    sal di, 1                                 ; d1 e7
    jmp word [cs:di+00b71h]                   ; 2e ff a5 71 0b
    mov dx, strict word 0007ch                ; ba 7c 00
    xor ax, ax                                ; 31 c0
    call 031d3h                               ; e8 35 26
    push SS                                   ; 16
    pop ES                                    ; 07
    mov word [es:bx], ax                      ; 26 89 07
    mov word [es:si], dx                      ; 26 89 14
    mov dx, 00085h                            ; ba 85 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 ec 25
    xor ah, ah                                ; 30 e4
    push SS                                   ; 16
    pop ES                                    ; 07
    mov bx, cx                                ; 89 cb
    mov word [es:bx], ax                      ; 26 89 07
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 da 25
    xor ah, ah                                ; 30 e4
    push SS                                   ; 16
    pop ES                                    ; 07
    mov bx, word [bp+004h]                    ; 8b 5e 04
    mov word [es:bx], ax                      ; 26 89 07
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00002h                               ; c2 02 00
    mov dx, 0010ch                            ; ba 0c 01
    jmp short 00b99h                          ; eb c0
    mov ax, 05bedh                            ; b8 ed 5b
    mov dx, 0c000h                            ; ba 00 c0
    jmp short 00b9eh                          ; eb bd
    mov ax, 053edh                            ; b8 ed 53
    jmp short 00bdch                          ; eb f6
    mov ax, 057edh                            ; b8 ed 57
    jmp short 00bdch                          ; eb f1
    mov ax, 079edh                            ; b8 ed 79
    jmp short 00bdch                          ; eb ec
    mov ax, 069edh                            ; b8 ed 69
    jmp short 00bdch                          ; eb e7
    mov ax, 07b1ah                            ; b8 1a 7b
    jmp short 00bdch                          ; eb e2
    jmp short 00bcbh                          ; eb cf
vga_read_pixel_:                             ; 0xc0bfc LB 0x143
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 00006h                ; 83 ec 06
    mov si, dx                                ; 89 d6
    mov word [bp-00ah], bx                    ; 89 5e f6
    mov di, cx                                ; 89 cf
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 87 25
    xor ah, ah                                ; 30 e4
    call 03170h                               ; e8 57 25
    mov ch, al                                ; 88 c5
    cmp AL, strict byte 0ffh                  ; 3c ff
    je short 00c2eh                           ; 74 0f
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    cmp byte [bx+04630h], 000h                ; 80 bf 30 46 00
    jne short 00c31h                          ; 75 03
    jmp near 00d38h                           ; e9 07 01
    mov bl, byte [bx+04631h]                  ; 8a 9f 31 46
    cmp bl, cl                                ; 38 cb
    jc short 00c48h                           ; 72 0f
    jbe short 00c50h                          ; 76 15
    cmp bl, 005h                              ; 80 fb 05
    je short 00ca8h                           ; 74 68
    cmp bl, 004h                              ; 80 fb 04
    je short 00c50h                           ; 74 0b
    jmp near 00d33h                           ; e9 eb 00
    cmp bl, 002h                              ; 80 fb 02
    je short 00cadh                           ; 74 60
    jmp near 00d33h                           ; e9 e3 00
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 5e 25
    mov bx, ax                                ; 89 c3
    mov ax, word [bp-00ah]                    ; 8b 46 f6
    mul bx                                    ; f7 e3
    mov CL, strict byte 003h                  ; b1 03
    mov bx, si                                ; 89 f3
    shr bx, CL                                ; d3 eb
    add bx, ax                                ; 01 c3
    mov cx, si                                ; 89 f1
    and cx, strict byte 00007h                ; 83 e1 07
    mov ax, 00080h                            ; b8 80 00
    sar ax, CL                                ; d3 f8
    mov byte [bp-008h], al                    ; 88 46 f8
    mov byte [bp-006h], ch                    ; 88 6e fa
    jmp short 00c80h                          ; eb 06
    cmp byte [bp-006h], 004h                  ; 80 7e fa 04
    jnc short 00caah                          ; 73 2a
    mov ah, byte [bp-006h]                    ; 8a 66 fa
    xor al, al                                ; 30 c0
    or AL, strict byte 004h                   ; 0c 04
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    mov dx, bx                                ; 89 da
    mov ax, 0a000h                            ; b8 00 a0
    call 0319bh                               ; e8 08 25
    and al, byte [bp-008h]                    ; 22 46 f8
    test al, al                               ; 84 c0
    jbe short 00ca3h                          ; 76 09
    mov cl, byte [bp-006h]                    ; 8a 4e fa
    mov AL, strict byte 001h                  ; b0 01
    sal al, CL                                ; d2 e0
    or ch, al                                 ; 08 c5
    inc byte [bp-006h]                        ; fe 46 fa
    jmp short 00c7ah                          ; eb d2
    jmp short 00d13h                          ; eb 69
    jmp near 00d35h                           ; e9 88 00
    mov ax, word [bp-00ah]                    ; 8b 46 f6
    shr ax, 1                                 ; d1 e8
    mov bx, strict word 00050h                ; bb 50 00
    mul bx                                    ; f7 e3
    mov bx, si                                ; 89 f3
    shr bx, 1                                 ; d1 eb
    shr bx, 1                                 ; d1 eb
    add bx, ax                                ; 01 c3
    test byte [bp-00ah], 001h                 ; f6 46 f6 01
    je short 00cc8h                           ; 74 03
    add bh, 020h                              ; 80 c7 20
    mov dx, bx                                ; 89 da
    mov ax, 0b800h                            ; b8 00 b8
    call 0319bh                               ; e8 cb 24
    mov bl, ch                                ; 88 eb
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    cmp byte [bx+04632h], 002h                ; 80 bf 32 46 02
    jne short 00cfah                          ; 75 1b
    mov cx, si                                ; 89 f1
    xor ch, ch                                ; 30 ed
    and cl, 003h                              ; 80 e1 03
    mov bx, strict word 00003h                ; bb 03 00
    sub bx, cx                                ; 29 cb
    mov cx, bx                                ; 89 d9
    sal cx, 1                                 ; d1 e1
    xor ah, ah                                ; 30 e4
    sar ax, CL                                ; d3 f8
    mov ch, al                                ; 88 c5
    and ch, 003h                              ; 80 e5 03
    jmp short 00d35h                          ; eb 3b
    mov cx, si                                ; 89 f1
    xor ch, ch                                ; 30 ed
    and cl, 007h                              ; 80 e1 07
    mov bx, strict word 00007h                ; bb 07 00
    sub bx, cx                                ; 29 cb
    mov cx, bx                                ; 89 d9
    xor ah, ah                                ; 30 e4
    sar ax, CL                                ; d3 f8
    mov ch, al                                ; 88 c5
    and ch, 001h                              ; 80 e5 01
    jmp short 00d35h                          ; eb 22
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 9b 24
    mov bx, ax                                ; 89 c3
    sal bx, CL                                ; d3 e3
    mov ax, word [bp-00ah]                    ; 8b 46 f6
    mul bx                                    ; f7 e3
    mov dx, si                                ; 89 f2
    add dx, ax                                ; 01 c2
    mov ax, 0a000h                            ; b8 00 a0
    call 0319bh                               ; e8 6c 24
    mov ch, al                                ; 88 c5
    jmp short 00d35h                          ; eb 02
    xor ch, ch                                ; 30 ed
    mov byte [ss:di], ch                      ; 36 88 2d
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_perform_gray_scale_summing_:          ; 0xc0d3f LB 0x9f
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    push ax                                   ; 50
    mov bx, ax                                ; 89 c3
    mov di, dx                                ; 89 d7
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor al, al                                ; 30 c0
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    xor si, si                                ; 31 f6
    cmp si, di                                ; 39 fe
    jnc short 00dc3h                          ; 73 65
    mov al, bl                                ; 88 d8
    mov dx, 003c7h                            ; ba c7 03
    out DX, AL                                ; ee
    mov dx, 003c9h                            ; ba c9 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov cx, ax                                ; 89 c1
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov word [bp-00ah], ax                    ; 89 46 f6
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov word [bp-00ch], ax                    ; 89 46 f4
    mov al, cl                                ; 88 c8
    xor ah, ah                                ; 30 e4
    mov cx, strict word 0004dh                ; b9 4d 00
    imul cx                                   ; f7 e9
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    xor ah, ah                                ; 30 e4
    mov dx, 00097h                            ; ba 97 00
    imul dx                                   ; f7 ea
    add cx, ax                                ; 01 c1
    mov word [bp-00ah], cx                    ; 89 4e f6
    mov cl, byte [bp-00ch]                    ; 8a 4e f4
    xor ch, ch                                ; 30 ed
    mov ax, cx                                ; 89 c8
    mov dx, strict word 0001ch                ; ba 1c 00
    imul dx                                   ; f7 ea
    add ax, word [bp-00ah]                    ; 03 46 f6
    add ax, 00080h                            ; 05 80 00
    mov al, ah                                ; 88 e0
    cbw                                       ; 98
    mov cx, ax                                ; 89 c1
    cmp ax, strict word 0003fh                ; 3d 3f 00
    jbe short 00db1h                          ; 76 03
    mov cx, strict word 0003fh                ; b9 3f 00
    mov al, bl                                ; 88 d8
    mov dx, 003c8h                            ; ba c8 03
    out DX, AL                                ; ee
    mov al, cl                                ; 88 c8
    mov dx, 003c9h                            ; ba c9 03
    out DX, AL                                ; ee
    out DX, AL                                ; ee
    out DX, AL                                ; ee
    inc bx                                    ; 43
    inc si                                    ; 46
    jmp short 00d5ah                          ; eb 97
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov AL, strict byte 020h                  ; b0 20
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    lea sp, [bp-008h]                         ; 8d 66 f8
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_set_cursor_shape_:                    ; 0xc0dde LB 0xb3
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    push ax                                   ; 50
    mov byte [bp-00ah], al                    ; 88 46 f6
    mov ch, dl                                ; 88 d5
    and byte [bp-00ah], 03fh                  ; 80 66 f6 3f
    and ch, 01fh                              ; 80 e5 1f
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    xor ah, ah                                ; 30 e4
    mov word [bp-00ch], ax                    ; 89 46 f4
    mov bh, byte [bp-00ch]                    ; 8a 7e f4
    mov al, ch                                ; 88 e8
    mov si, ax                                ; 89 c6
    mov bl, ch                                ; 88 eb
    mov dx, strict word 00060h                ; ba 60 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 b8 23
    mov dx, 00089h                            ; ba 89 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 85 23
    mov cl, al                                ; 88 c1
    mov dx, 00085h                            ; ba 85 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 96 23
    mov bx, ax                                ; 89 c3
    mov di, ax                                ; 89 c7
    test cl, 001h                             ; f6 c1 01
    je short 00e65h                           ; 74 3b
    cmp ax, strict word 00008h                ; 3d 08 00
    jbe short 00e65h                          ; 76 36
    cmp ch, 008h                              ; 80 fd 08
    jnc short 00e65h                          ; 73 31
    cmp byte [bp-00ah], 020h                  ; 80 7e f6 20
    jnc short 00e65h                          ; 73 2b
    mov ax, word [bp-00ch]                    ; 8b 46 f4
    inc ax                                    ; 40
    cmp si, ax                                ; 39 c6
    je short 00e4bh                           ; 74 09
    mul bx                                    ; f7 e3
    mov CL, strict byte 003h                  ; b1 03
    shr ax, CL                                ; d3 e8
    dec ax                                    ; 48
    jmp short 00e54h                          ; eb 09
    inc ax                                    ; 40
    mul bx                                    ; f7 e3
    mov CL, strict byte 003h                  ; b1 03
    shr ax, CL                                ; d3 e8
    dec ax                                    ; 48
    dec ax                                    ; 48
    mov byte [bp-00ah], al                    ; 88 46 f6
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    inc ax                                    ; 40
    mul di                                    ; f7 e7
    mov CL, strict byte 003h                  ; b1 03
    shr ax, CL                                ; d3 e8
    dec ax                                    ; 48
    mov ch, al                                ; 88 c5
    mov dx, strict word 00063h                ; ba 63 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 49 23
    mov bx, ax                                ; 89 c3
    mov AL, strict byte 00ah                  ; b0 0a
    mov dx, bx                                ; 89 da
    out DX, AL                                ; ee
    lea si, [bx+001h]                         ; 8d 77 01
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    mov dx, si                                ; 89 f2
    out DX, AL                                ; ee
    mov AL, strict byte 00bh                  ; b0 0b
    mov dx, bx                                ; 89 da
    out DX, AL                                ; ee
    mov al, ch                                ; 88 e8
    mov dx, si                                ; 89 f2
    out DX, AL                                ; ee
    lea sp, [bp-008h]                         ; 8d 66 f8
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_set_cursor_pos_:                      ; 0xc0e91 LB 0xa3
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push ax                                   ; 50
    mov byte [bp-008h], al                    ; 88 46 f8
    mov cx, dx                                ; 89 d1
    cmp AL, strict byte 007h                  ; 3c 07
    jbe short 00ea4h                          ; 76 03
    jmp near 00f2ch                           ; e9 88 00
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    sal dx, 1                                 ; d1 e2
    add dx, strict byte 00050h                ; 83 c2 50
    mov bx, cx                                ; 89 cb
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 10 23
    mov dx, strict word 00062h                ; ba 62 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 dd 22
    cmp al, byte [bp-008h]                    ; 3a 46 f8
    jne short 00f2ch                          ; 75 69
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 eb 22
    mov bx, ax                                ; 89 c3
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 c4 22
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    inc dx                                    ; 42
    mov ax, bx                                ; 89 d8
    mul dx                                    ; f7 e2
    or AL, strict byte 0ffh                   ; 0c ff
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    mov si, ax                                ; 89 c6
    mov ax, dx                                ; 89 d0
    inc ax                                    ; 40
    mul si                                    ; f7 e6
    mov dl, cl                                ; 88 ca
    xor dh, dh                                ; 30 f6
    mov si, ax                                ; 89 c6
    add si, dx                                ; 01 d6
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    mul bx                                    ; f7 e3
    add si, ax                                ; 01 c6
    mov dx, strict word 00063h                ; ba 63 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 ae 22
    mov bx, ax                                ; 89 c3
    mov AL, strict byte 00eh                  ; b0 0e
    mov dx, bx                                ; 89 da
    out DX, AL                                ; ee
    mov cx, si                                ; 89 f1
    mov cl, ch                                ; 88 e9
    xor ch, ch                                ; 30 ed
    mov ax, cx                                ; 89 c8
    lea cx, [bx+001h]                         ; 8d 4f 01
    mov dx, cx                                ; 89 ca
    out DX, AL                                ; ee
    mov AL, strict byte 00fh                  ; b0 0f
    mov dx, bx                                ; 89 da
    out DX, AL                                ; ee
    and si, 000ffh                            ; 81 e6 ff 00
    mov ax, si                                ; 89 f0
    mov dx, cx                                ; 89 ca
    out DX, AL                                ; ee
    lea sp, [bp-006h]                         ; 8d 66 fa
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_set_active_page_:                     ; 0xc0f34 LB 0xe5
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    push ax                                   ; 50
    mov ch, al                                ; 88 c5
    cmp AL, strict byte 007h                  ; 3c 07
    jnbe short 00f58h                         ; 77 14
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 4e 22
    xor ah, ah                                ; 30 e4
    call 03170h                               ; e8 1e 22
    mov cl, al                                ; 88 c1
    cmp AL, strict byte 0ffh                  ; 3c ff
    jne short 00f5bh                          ; 75 03
    jmp near 0100fh                           ; e9 b4 00
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    lea bx, [bp-00eh]                         ; 8d 5e f2
    lea dx, [bp-00ch]                         ; 8d 56 f4
    call 00a8ch                               ; e8 24 fb
    mov bl, cl                                ; 88 cb
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    mov si, bx                                ; 89 de
    sal si, CL                                ; d3 e6
    cmp byte [si+04630h], 000h                ; 80 bc 30 46 00
    jne short 00fc0h                          ; 75 47
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 35 22
    mov bx, ax                                ; 89 c3
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 0e 22
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    inc dx                                    ; 42
    mov ax, bx                                ; 89 d8
    mul dx                                    ; f7 e2
    mov si, ax                                ; 89 c6
    mov dx, ax                                ; 89 c2
    sal dx, 1                                 ; d1 e2
    or dl, 0ffh                               ; 80 ca ff
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    mov di, ax                                ; 89 c7
    mov ax, dx                                ; 89 d0
    inc ax                                    ; 40
    mul di                                    ; f7 e7
    mov bx, ax                                ; 89 c3
    mov dx, strict word 0004eh                ; ba 4e 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 10 22
    or si, 000ffh                             ; 81 ce ff 00
    lea ax, [si+001h]                         ; 8d 44 01
    mul di                                    ; f7 e7
    jmp short 00fd0h                          ; eb 10
    mov bl, byte [bx+046afh]                  ; 8a 9f af 46
    mov CL, strict byte 006h                  ; b1 06
    sal bx, CL                                ; d3 e3
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    mul word [bx+046c6h]                      ; f7 a7 c6 46
    mov bx, ax                                ; 89 c3
    mov dx, strict word 00063h                ; ba 63 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 dc 21
    mov si, ax                                ; 89 c6
    mov AL, strict byte 00ch                  ; b0 0c
    mov dx, si                                ; 89 f2
    out DX, AL                                ; ee
    mov ax, bx                                ; 89 d8
    mov al, bh                                ; 88 f8
    lea di, [si+001h]                         ; 8d 7c 01
    mov dx, di                                ; 89 fa
    out DX, AL                                ; ee
    mov AL, strict byte 00dh                  ; b0 0d
    mov dx, si                                ; 89 f2
    out DX, AL                                ; ee
    mov al, bl                                ; 88 d8
    mov dx, di                                ; 89 fa
    out DX, AL                                ; ee
    mov al, ch                                ; 88 e8
    xor ah, bh                                ; 30 fc
    mov si, ax                                ; 89 c6
    mov bx, ax                                ; 89 c3
    mov dx, strict word 00062h                ; ba 62 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 a2 21
    mov dx, word [bp-00eh]                    ; 8b 56 f2
    mov ax, si                                ; 89 f0
    call 00e91h                               ; e8 82 fe
    lea sp, [bp-00ah]                         ; 8d 66 f6
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_set_video_mode_:                      ; 0xc1019 LB 0x3c7
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 00012h                ; 83 ec 12
    mov byte [bp-00ch], al                    ; 88 46 f4
    and AL, strict byte 080h                  ; 24 80
    mov byte [bp-012h], al                    ; 88 46 ee
    call 00833h                               ; e8 04 f8
    test ax, ax                               ; 85 c0
    je short 0103fh                           ; 74 0c
    mov AL, strict byte 007h                  ; b0 07
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    xor al, al                                ; 30 c0
    mov dx, 003c5h                            ; ba c5 03
    out DX, AL                                ; ee
    and byte [bp-00ch], 07fh                  ; 80 66 f4 7f
    cmp byte [bp-00ch], 007h                  ; 80 7e f4 07
    jne short 0104dh                          ; 75 04
    mov byte [bp-00ch], 000h                  ; c6 46 f4 00
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    xor ah, ah                                ; 30 e4
    call 03170h                               ; e8 1b 21
    mov byte [bp-010h], al                    ; 88 46 f0
    cmp AL, strict byte 0ffh                  ; 3c ff
    jne short 0105fh                          ; 75 03
    jmp near 013d6h                           ; e9 77 03
    mov byte [bp-014h], al                    ; 88 46 ec
    mov byte [bp-013h], 000h                  ; c6 46 ed 00
    mov bx, word [bp-014h]                    ; 8b 5e ec
    mov al, byte [bx+046afh]                  ; 8a 87 af 46
    mov byte [bp-00eh], al                    ; 88 46 f2
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 006h                  ; b1 06
    sal bx, CL                                ; d3 e3
    mov al, byte [bx+046c3h]                  ; 8a 87 c3 46
    xor ah, ah                                ; 30 e4
    mov word [bp-016h], ax                    ; 89 46 ea
    mov al, byte [bx+046c4h]                  ; 8a 87 c4 46
    mov word [bp-018h], ax                    ; 89 46 e8
    mov al, byte [bx+046c5h]                  ; 8a 87 c5 46
    mov word [bp-01ah], ax                    ; 89 46 e6
    mov dx, 00087h                            ; ba 87 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 03 21
    mov dx, 00088h                            ; ba 88 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 fa 20
    mov dx, 00089h                            ; ba 89 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 f1 20
    mov ch, al                                ; 88 c5
    test AL, strict byte 008h                 ; a8 08
    jne short 010f5h                          ; 75 45
    mov CL, strict byte 003h                  ; b1 03
    mov bx, word [bp-014h]                    ; 8b 5e ec
    sal bx, CL                                ; d3 e3
    mov al, byte [bx+04635h]                  ; 8a 87 35 46
    mov dx, 003c6h                            ; ba c6 03
    out DX, AL                                ; ee
    xor al, al                                ; 30 c0
    mov dx, 003c8h                            ; ba c8 03
    out DX, AL                                ; ee
    mov bl, byte [bx+04636h]                  ; 8a 9f 36 46
    cmp bl, 001h                              ; 80 fb 01
    jc short 010dbh                           ; 72 0d
    jbe short 010e4h                          ; 76 14
    cmp bl, cl                                ; 38 cb
    je short 010eeh                           ; 74 1a
    cmp bl, 002h                              ; 80 fb 02
    je short 010e9h                           ; 74 10
    jmp short 010f1h                          ; eb 16
    test bl, bl                               ; 84 db
    jne short 010f1h                          ; 75 12
    mov di, 04e43h                            ; bf 43 4e
    jmp short 010f1h                          ; eb 0d
    mov di, 04f03h                            ; bf 03 4f
    jmp short 010f1h                          ; eb 08
    mov di, 04fc3h                            ; bf c3 4f
    jmp short 010f1h                          ; eb 03
    mov di, 05083h                            ; bf 83 50
    xor bx, bx                                ; 31 db
    jmp short 010fdh                          ; eb 08
    jmp short 01149h                          ; eb 52
    cmp bx, 00100h                            ; 81 fb 00 01
    jnc short 0113ch                          ; 73 3f
    mov al, byte [bp-010h]                    ; 8a 46 f0
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 003h                  ; b1 03
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    mov al, byte [si+04636h]                  ; 8a 84 36 46
    mov si, ax                                ; 89 c6
    mov al, byte [si+046bfh]                  ; 8a 84 bf 46
    cmp bx, ax                                ; 39 c3
    jnbe short 01131h                         ; 77 1b
    mov ax, bx                                ; 89 d8
    mov dx, strict word 00003h                ; ba 03 00
    mul dx                                    ; f7 e2
    mov si, di                                ; 89 fe
    add si, ax                                ; 01 c6
    mov al, byte [si]                         ; 8a 04
    mov dx, 003c9h                            ; ba c9 03
    out DX, AL                                ; ee
    mov al, byte [si+001h]                    ; 8a 44 01
    out DX, AL                                ; ee
    mov al, byte [si+002h]                    ; 8a 44 02
    out DX, AL                                ; ee
    jmp short 01139h                          ; eb 08
    xor al, al                                ; 30 c0
    mov dx, 003c9h                            ; ba c9 03
    out DX, AL                                ; ee
    out DX, AL                                ; ee
    out DX, AL                                ; ee
    inc bx                                    ; 43
    jmp short 010f7h                          ; eb bb
    test ch, 002h                             ; f6 c5 02
    je short 01149h                           ; 74 08
    mov dx, 00100h                            ; ba 00 01
    xor ax, ax                                ; 31 c0
    call 00d3fh                               ; e8 f6 fb
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor bx, bx                                ; 31 db
    jmp short 01158h                          ; eb 05
    cmp bx, strict byte 00013h                ; 83 fb 13
    jnbe short 01173h                         ; 77 1b
    mov al, bl                                ; 88 d8
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 006h                  ; b1 06
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    add si, bx                                ; 01 de
    mov al, byte [si+046e6h]                  ; 8a 84 e6 46
    out DX, AL                                ; ee
    inc bx                                    ; 43
    jmp short 01153h                          ; eb e0
    mov AL, strict byte 014h                  ; b0 14
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    xor al, al                                ; 30 c0
    out DX, AL                                ; ee
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    mov AL, strict byte 003h                  ; b0 03
    mov dx, 003c5h                            ; ba c5 03
    out DX, AL                                ; ee
    mov bx, strict word 00001h                ; bb 01 00
    jmp short 01190h                          ; eb 05
    cmp bx, strict byte 00004h                ; 83 fb 04
    jnbe short 011aeh                         ; 77 1e
    mov al, bl                                ; 88 d8
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 006h                  ; b1 06
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    add si, bx                                ; 01 de
    mov al, byte [si+046c7h]                  ; 8a 84 c7 46
    mov dx, 003c5h                            ; ba c5 03
    out DX, AL                                ; ee
    inc bx                                    ; 43
    jmp short 0118bh                          ; eb dd
    xor bx, bx                                ; 31 db
    jmp short 011b7h                          ; eb 05
    cmp bx, strict byte 00008h                ; 83 fb 08
    jnbe short 011d5h                         ; 77 1e
    mov al, bl                                ; 88 d8
    mov dx, 003ceh                            ; ba ce 03
    out DX, AL                                ; ee
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 006h                  ; b1 06
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    add si, bx                                ; 01 de
    mov al, byte [si+046fah]                  ; 8a 84 fa 46
    mov dx, 003cfh                            ; ba cf 03
    out DX, AL                                ; ee
    inc bx                                    ; 43
    jmp short 011b2h                          ; eb dd
    mov bl, byte [bp-010h]                    ; 8a 5e f0
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    cmp byte [bx+04631h], 001h                ; 80 bf 31 46 01
    jne short 011eah                          ; 75 05
    mov dx, 003b4h                            ; ba b4 03
    jmp short 011edh                          ; eb 03
    mov dx, 003d4h                            ; ba d4 03
    mov si, dx                                ; 89 d6
    mov ax, strict word 00011h                ; b8 11 00
    out DX, ax                                ; ef
    xor bx, bx                                ; 31 db
    jmp short 011fch                          ; eb 05
    cmp bx, strict byte 00018h                ; 83 fb 18
    jnbe short 0121bh                         ; 77 1f
    mov al, bl                                ; 88 d8
    mov dx, si                                ; 89 f2
    out DX, AL                                ; ee
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 006h                  ; b1 06
    sal ax, CL                                ; d3 e0
    mov cx, ax                                ; 89 c1
    mov di, ax                                ; 89 c7
    add di, bx                                ; 01 df
    lea dx, [si+001h]                         ; 8d 54 01
    mov al, byte [di+046cdh]                  ; 8a 85 cd 46
    out DX, AL                                ; ee
    inc bx                                    ; 43
    jmp short 011f7h                          ; eb dc
    mov bx, cx                                ; 89 cb
    mov al, byte [bx+046cch]                  ; 8a 87 cc 46
    mov dx, 003c2h                            ; ba c2 03
    out DX, AL                                ; ee
    mov AL, strict byte 020h                  ; b0 20
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    cmp byte [bp-012h], 000h                  ; 80 7e ee 00
    jne short 01298h                          ; 75 61
    mov bl, byte [bp-010h]                    ; 8a 5e f0
    xor bh, ch                                ; 30 ef
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    cmp byte [bx+04630h], 000h                ; 80 bf 30 46 00
    jne short 0125ah                          ; 75 13
    mov es, [bx+04633h]                       ; 8e 87 33 46
    mov cx, 04000h                            ; b9 00 40
    mov ax, 00720h                            ; b8 20 07
    xor di, di                                ; 31 ff
    cld                                       ; fc
    jcxz 01258h                               ; e3 02
    rep stosw                                 ; f3 ab
    jmp short 01298h                          ; eb 3e
    cmp byte [bp-00ch], 00dh                  ; 80 7e f4 0d
    jnc short 01272h                          ; 73 12
    mov es, [bx+04633h]                       ; 8e 87 33 46
    mov cx, 04000h                            ; b9 00 40
    xor ax, ax                                ; 31 c0
    xor di, di                                ; 31 ff
    cld                                       ; fc
    jcxz 01270h                               ; e3 02
    rep stosw                                 ; f3 ab
    jmp short 01298h                          ; eb 26
    mov AL, strict byte 002h                  ; b0 02
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    mov dx, 003c5h                            ; ba c5 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov word [bp-01ch], ax                    ; 89 46 e4
    mov AL, strict byte 00fh                  ; b0 0f
    out DX, AL                                ; ee
    mov es, [bx+04633h]                       ; 8e 87 33 46
    mov cx, 08000h                            ; b9 00 80
    xor ax, ax                                ; 31 c0
    xor di, di                                ; 31 ff
    cld                                       ; fc
    jcxz 01294h                               ; e3 02
    rep stosw                                 ; f3 ab
    mov al, byte [bp-01ch]                    ; 8a 46 e4
    out DX, AL                                ; ee
    mov bl, byte [bp-00ch]                    ; 8a 5e f4
    xor bh, bh                                ; 30 ff
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 03 1f
    mov bx, word [bp-016h]                    ; 8b 5e ea
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 13 1f
    mov bl, byte [bp-00eh]                    ; 8a 5e f2
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 006h                  ; b1 06
    sal bx, CL                                ; d3 e3
    mov bx, word [bx+046c6h]                  ; 8b 9f c6 46
    mov dx, strict word 0004ch                ; ba 4c 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 fd 1e
    mov bx, si                                ; 89 f3
    mov dx, strict word 00063h                ; ba 63 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 f2 1e
    mov bl, byte [bp-018h]                    ; 8a 5e e8
    xor bh, bh                                ; 30 ff
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 c8 1e
    mov bx, word [bp-01ah]                    ; 8b 5e e6
    mov dx, 00085h                            ; ba 85 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 d8 1e
    mov bl, byte [bp-012h]                    ; 8a 5e ee
    or bl, 060h                               ; 80 cb 60
    xor bh, bh                                ; 30 ff
    mov dx, 00087h                            ; ba 87 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 ab 1e
    mov bx, 000f9h                            ; bb f9 00
    mov dx, 00088h                            ; ba 88 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 9f 1e
    mov dx, 00089h                            ; ba 89 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 88 1e
    mov bl, al                                ; 88 c3
    and bl, 07fh                              ; 80 e3 7f
    xor bh, bh                                ; 30 ff
    mov dx, 00089h                            ; ba 89 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 86 1e
    mov bx, strict word 00008h                ; bb 08 00
    mov dx, 0008ah                            ; ba 8a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 7a 1e
    mov cx, ds                                ; 8c d9
    mov bx, 053d1h                            ; bb d1 53
    mov dx, 000a8h                            ; ba a8 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031e5h                               ; e8 a8 1e
    xor bx, bx                                ; 31 db
    mov dx, strict word 00065h                ; ba 65 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 61 1e
    xor bx, bx                                ; 31 db
    mov dx, strict word 00066h                ; ba 66 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 56 1e
    mov bl, byte [bp-010h]                    ; 8a 5e f0
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    cmp byte [bx+04630h], 000h                ; 80 bf 30 46 00
    jne short 0136ch                          ; 75 09
    mov dx, strict word 00007h                ; ba 07 00
    mov ax, strict word 00006h                ; b8 06 00
    call 00ddeh                               ; e8 72 fa
    xor bx, bx                                ; 31 db
    jmp short 01375h                          ; eb 05
    cmp bx, strict byte 00008h                ; 83 fb 08
    jnc short 01381h                          ; 73 0c
    mov al, bl                                ; 88 d8
    xor ah, ah                                ; 30 e4
    xor dx, dx                                ; 31 d2
    call 00e91h                               ; e8 13 fb
    inc bx                                    ; 43
    jmp short 01370h                          ; eb ef
    xor ax, ax                                ; 31 c0
    call 00f34h                               ; e8 ae fb
    mov bl, byte [bp-010h]                    ; 8a 5e f0
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    cmp byte [bx+04630h], 000h                ; 80 bf 30 46 00
    jne short 013a6h                          ; 75 10
    xor bl, bl                                ; 30 db
    mov AL, strict byte 004h                  ; b0 04
    mov AH, strict byte 011h                  ; b4 11
    int 010h                                  ; cd 10
    xor bl, bl                                ; 30 db
    mov al, cl                                ; 88 c8
    mov AH, strict byte 011h                  ; b4 11
    int 010h                                  ; cd 10
    mov dx, 057edh                            ; ba ed 57
    mov ax, strict word 0001fh                ; b8 1f 00
    call 00a00h                               ; e8 51 f6
    mov ax, word [bp-01ah]                    ; 8b 46 e6
    cmp ax, strict word 00010h                ; 3d 10 00
    je short 013d1h                           ; 74 1a
    cmp ax, strict word 0000eh                ; 3d 0e 00
    je short 013cch                           ; 74 10
    cmp ax, strict word 00008h                ; 3d 08 00
    jne short 013d6h                          ; 75 15
    mov dx, 053edh                            ; ba ed 53
    mov ax, strict word 00043h                ; b8 43 00
    call 00a00h                               ; e8 36 f6
    jmp short 013d6h                          ; eb 0a
    mov dx, 05bedh                            ; ba ed 5b
    jmp short 013c4h                          ; eb f3
    mov dx, 069edh                            ; ba ed 69
    jmp short 013c4h                          ; eb ee
    lea sp, [bp-00ah]                         ; 8d 66 f6
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
vgamem_copy_pl4_:                            ; 0xc13e0 LB 0x8f
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0000ah                ; 83 ec 0a
    mov byte [bp-008h], al                    ; 88 46 f8
    mov al, dl                                ; 88 d0
    mov byte [bp-00ah], bl                    ; 88 5e f6
    mov byte [bp-006h], cl                    ; 88 4e fa
    xor ah, ah                                ; 30 e4
    mov dl, byte [bp+006h]                    ; 8a 56 06
    xor dh, dh                                ; 30 f6
    mov cx, dx                                ; 89 d1
    imul dx                                   ; f7 ea
    mov dl, byte [bp+004h]                    ; 8a 56 04
    xor dh, dh                                ; 30 f6
    mov si, dx                                ; 89 d6
    imul dx                                   ; f7 ea
    mov dl, byte [bp-008h]                    ; 8a 56 f8
    xor dh, dh                                ; 30 f6
    mov bx, dx                                ; 89 d3
    add ax, dx                                ; 01 d0
    mov word [bp-00eh], ax                    ; 89 46 f2
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    xor ah, ah                                ; 30 e4
    imul cx                                   ; f7 e9
    imul si                                   ; f7 ee
    add ax, bx                                ; 01 d8
    mov word [bp-00ch], ax                    ; 89 46 f4
    mov ax, 00105h                            ; b8 05 01
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    xor bl, bl                                ; 30 db
    cmp bl, byte [bp+006h]                    ; 3a 5e 06
    jnc short 0145fh                          ; 73 30
    mov al, byte [bp-006h]                    ; 8a 46 fa
    xor ah, ah                                ; 30 e4
    mov cx, ax                                ; 89 c1
    mov al, bl                                ; 88 d8
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+004h]                    ; 8a 46 04
    mov si, ax                                ; 89 c6
    mov ax, dx                                ; 89 d0
    imul si                                   ; f7 ee
    mov si, word [bp-00eh]                    ; 8b 76 f2
    add si, ax                                ; 01 c6
    mov di, word [bp-00ch]                    ; 8b 7e f4
    add di, ax                                ; 01 c7
    mov dx, 0a000h                            ; ba 00 a0
    mov es, dx                                ; 8e c2
    cld                                       ; fc
    jcxz 0145bh                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsb                                 ; f3 a4
    pop DS                                    ; 1f
    db  0feh, 0c3h
    ; inc bl                                    ; fe c3
    jmp short 0142ah                          ; eb cb
    mov ax, strict word 00005h                ; b8 05 00
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00004h                               ; c2 04 00
vgamem_fill_pl4_:                            ; 0xc146f LB 0x7c
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 00006h                ; 83 ec 06
    mov byte [bp-008h], al                    ; 88 46 f8
    mov al, dl                                ; 88 d0
    mov byte [bp-006h], bl                    ; 88 5e fa
    mov bh, cl                                ; 88 cf
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+004h]                    ; 8a 46 04
    mov cx, ax                                ; 89 c1
    mov ax, dx                                ; 89 d0
    imul cx                                   ; f7 e9
    mov dl, bh                                ; 88 fa
    xor dh, dh                                ; 30 f6
    imul dx                                   ; f7 ea
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    add dx, ax                                ; 01 c2
    mov word [bp-00ah], dx                    ; 89 56 f6
    mov ax, 00205h                            ; b8 05 02
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    xor bl, bl                                ; 30 db
    cmp bl, byte [bp+004h]                    ; 3a 5e 04
    jnc short 014dbh                          ; 73 2d
    mov cl, byte [bp-006h]                    ; 8a 4e fa
    xor ch, ch                                ; 30 ed
    mov al, byte [bp+006h]                    ; 8a 46 06
    xor ah, ah                                ; 30 e4
    mov si, ax                                ; 89 c6
    mov al, bl                                ; 88 d8
    mov dx, ax                                ; 89 c2
    mov al, bh                                ; 88 f8
    mov di, ax                                ; 89 c7
    mov ax, dx                                ; 89 d0
    imul di                                   ; f7 ef
    mov di, word [bp-00ah]                    ; 8b 7e f6
    add di, ax                                ; 01 c7
    mov ax, si                                ; 89 f0
    mov dx, 0a000h                            ; ba 00 a0
    mov es, dx                                ; 8e c2
    cld                                       ; fc
    jcxz 014d7h                               ; e3 02
    rep stosb                                 ; f3 aa
    db  0feh, 0c3h
    ; inc bl                                    ; fe c3
    jmp short 014a9h                          ; eb ce
    mov ax, strict word 00005h                ; b8 05 00
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00004h                               ; c2 04 00
vgamem_copy_cga_:                            ; 0xc14eb LB 0xc2
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 00008h                ; 83 ec 08
    mov byte [bp-006h], al                    ; 88 46 fa
    mov al, dl                                ; 88 d0
    mov bh, cl                                ; 88 cf
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+006h]                    ; 8a 46 06
    mov cx, ax                                ; 89 c1
    mov ax, dx                                ; 89 d0
    imul cx                                   ; f7 e9
    mov dl, byte [bp+004h]                    ; 8a 56 04
    xor dh, dh                                ; 30 f6
    mov di, dx                                ; 89 d7
    imul dx                                   ; f7 ea
    mov dx, ax                                ; 89 c2
    sar dx, 1                                 ; d1 fa
    mov al, byte [bp-006h]                    ; 8a 46 fa
    xor ah, ah                                ; 30 e4
    mov si, ax                                ; 89 c6
    add dx, ax                                ; 01 c2
    mov word [bp-008h], dx                    ; 89 56 f8
    mov al, bl                                ; 88 d8
    imul cx                                   ; f7 e9
    imul di                                   ; f7 ef
    sar ax, 1                                 ; d1 f8
    add ax, si                                ; 01 f0
    mov word [bp-00ah], ax                    ; 89 46 f6
    xor bl, bl                                ; 30 db
    cmp bl, byte [bp+006h]                    ; 3a 5e 06
    jnc short 015a4h                          ; 73 70
    test bl, 001h                             ; f6 c3 01
    je short 01570h                           ; 74 37
    mov cl, bh                                ; 88 f9
    xor ch, ch                                ; 30 ed
    mov al, bl                                ; 88 d8
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    sar dx, 1                                 ; d1 fa
    mov al, byte [bp+004h]                    ; 8a 46 04
    mov si, ax                                ; 89 c6
    mov ax, dx                                ; 89 d0
    imul si                                   ; f7 ee
    mov si, word [bp-008h]                    ; 8b 76 f8
    add si, 02000h                            ; 81 c6 00 20
    add si, ax                                ; 01 c6
    mov di, word [bp-00ah]                    ; 8b 7e f6
    add di, 02000h                            ; 81 c7 00 20
    add di, ax                                ; 01 c7
    mov dx, 0b800h                            ; ba 00 b8
    mov es, dx                                ; 8e c2
    cld                                       ; fc
    jcxz 0156eh                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsb                                 ; f3 a4
    pop DS                                    ; 1f
    jmp short 015a0h                          ; eb 30
    mov al, bh                                ; 88 f8
    xor ah, ah                                ; 30 e4
    mov cx, ax                                ; 89 c1
    mov al, bl                                ; 88 d8
    sar ax, 1                                 ; d1 f8
    mov dl, byte [bp+004h]                    ; 8a 56 04
    mov byte [bp-00ch], dl                    ; 88 56 f4
    mov byte [bp-00bh], ch                    ; 88 6e f5
    mov dx, word [bp-00ch]                    ; 8b 56 f4
    imul dx                                   ; f7 ea
    mov si, word [bp-008h]                    ; 8b 76 f8
    add si, ax                                ; 01 c6
    mov di, word [bp-00ah]                    ; 8b 7e f6
    add di, ax                                ; 01 c7
    mov dx, 0b800h                            ; ba 00 b8
    mov es, dx                                ; 8e c2
    cld                                       ; fc
    jcxz 015a0h                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsb                                 ; f3 a4
    pop DS                                    ; 1f
    db  0feh, 0c3h
    ; inc bl                                    ; fe c3
    jmp short 0152fh                          ; eb 8b
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00004h                               ; c2 04 00
vgamem_fill_cga_:                            ; 0xc15ad LB 0xa8
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 00006h                ; 83 ec 06
    mov byte [bp-006h], al                    ; 88 46 fa
    mov al, dl                                ; 88 d0
    mov byte [bp-008h], bl                    ; 88 5e f8
    mov bh, cl                                ; 88 cf
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+004h]                    ; 8a 46 04
    mov cx, ax                                ; 89 c1
    mov ax, dx                                ; 89 d0
    imul cx                                   ; f7 e9
    mov dl, bh                                ; 88 fa
    xor dh, dh                                ; 30 f6
    imul dx                                   ; f7 ea
    mov dx, ax                                ; 89 c2
    sar dx, 1                                 ; d1 fa
    mov al, byte [bp-006h]                    ; 8a 46 fa
    xor ah, ah                                ; 30 e4
    add dx, ax                                ; 01 c2
    mov word [bp-00ah], dx                    ; 89 56 f6
    xor bl, bl                                ; 30 db
    cmp bl, byte [bp+004h]                    ; 3a 5e 04
    jnc short 0164ch                          ; 73 65
    test bl, 001h                             ; f6 c3 01
    je short 0161dh                           ; 74 31
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    mov cx, ax                                ; 89 c1
    mov al, byte [bp+006h]                    ; 8a 46 06
    mov si, ax                                ; 89 c6
    mov al, bl                                ; 88 d8
    mov dx, ax                                ; 89 c2
    sar dx, 1                                 ; d1 fa
    mov al, bh                                ; 88 f8
    mov di, ax                                ; 89 c7
    mov ax, dx                                ; 89 d0
    imul di                                   ; f7 ef
    mov di, word [bp-00ah]                    ; 8b 7e f6
    add di, 02000h                            ; 81 c7 00 20
    add di, ax                                ; 01 c7
    mov ax, si                                ; 89 f0
    mov dx, 0b800h                            ; ba 00 b8
    mov es, dx                                ; 8e c2
    cld                                       ; fc
    jcxz 0161bh                               ; e3 02
    rep stosb                                 ; f3 aa
    jmp short 01648h                          ; eb 2b
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    mov cx, ax                                ; 89 c1
    mov al, byte [bp+006h]                    ; 8a 46 06
    mov si, ax                                ; 89 c6
    mov al, bl                                ; 88 d8
    mov dx, ax                                ; 89 c2
    sar dx, 1                                 ; d1 fa
    mov al, bh                                ; 88 f8
    mov di, ax                                ; 89 c7
    mov ax, dx                                ; 89 d0
    imul di                                   ; f7 ef
    mov di, word [bp-00ah]                    ; 8b 7e f6
    add di, ax                                ; 01 c7
    mov ax, si                                ; 89 f0
    mov dx, 0b800h                            ; ba 00 b8
    mov es, dx                                ; 8e c2
    cld                                       ; fc
    jcxz 01648h                               ; e3 02
    rep stosb                                 ; f3 aa
    db  0feh, 0c3h
    ; inc bl                                    ; fe c3
    jmp short 015e2h                          ; eb 96
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00004h                               ; c2 04 00
biosfn_scroll_:                              ; 0xc1655 LB 0x576
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0001eh                ; 83 ec 1e
    mov byte [bp-00ah], al                    ; 88 46 f6
    mov byte [bp-008h], dl                    ; 88 56 f8
    mov byte [bp-00eh], bl                    ; 88 5e f2
    mov byte [bp-00ch], cl                    ; 88 4e f4
    mov ch, byte [bp+006h]                    ; 8a 6e 06
    cmp bl, byte [bp+004h]                    ; 3a 5e 04
    jnbe short 0168ah                         ; 77 19
    cmp ch, cl                                ; 38 cd
    jc short 0168ah                           ; 72 15
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 1d 1b
    xor ah, ah                                ; 30 e4
    call 03170h                               ; e8 ed 1a
    mov byte [bp-010h], al                    ; 88 46 f0
    cmp AL, strict byte 0ffh                  ; 3c ff
    jne short 0168dh                          ; 75 03
    jmp near 01bc2h                           ; e9 35 05
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 05 1b
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    inc bx                                    ; 43
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 13 1b
    mov word [bp-018h], ax                    ; 89 46 e8
    cmp byte [bp+008h], 0ffh                  ; 80 7e 08 ff
    jne short 016b9h                          ; 75 0c
    mov dx, strict word 00062h                ; ba 62 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 e5 1a
    mov byte [bp+008h], al                    ; 88 46 08
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    cmp ax, bx                                ; 39 d8
    jc short 016c9h                           ; 72 07
    mov al, bl                                ; 88 d8
    db  0feh, 0c8h
    ; dec al                                    ; fe c8
    mov byte [bp+004h], al                    ; 88 46 04
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-018h]                    ; 3b 46 e8
    jc short 016d7h                           ; 72 05
    mov ch, byte [bp-018h]                    ; 8a 6e e8
    db  0feh, 0cdh
    ; dec ch                                    ; fe cd
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    xor ah, ah                                ; 30 e4
    cmp ax, bx                                ; 39 d8
    jbe short 016e3h                          ; 76 03
    mov byte [bp-00ah], ah                    ; 88 66 f6
    mov al, ch                                ; 88 e8
    sub al, byte [bp-00ch]                    ; 2a 46 f4
    db  0feh, 0c0h
    ; inc al                                    ; fe c0
    mov byte [bp-006h], al                    ; 88 46 fa
    mov al, byte [bp-010h]                    ; 8a 46 f0
    xor ah, ah                                ; 30 e4
    mov si, ax                                ; 89 c6
    mov CL, strict byte 003h                  ; b1 03
    mov di, ax                                ; 89 c7
    sal di, CL                                ; d3 e7
    mov ax, word [bp-018h]                    ; 8b 46 e8
    dec ax                                    ; 48
    mov word [bp-01ch], ax                    ; 89 46 e4
    lea ax, [bx-001h]                         ; 8d 47 ff
    mov word [bp-01eh], ax                    ; 89 46 e2
    mov ax, word [bp-018h]                    ; 8b 46 e8
    mul bx                                    ; f7 e3
    mov word [bp-01ah], ax                    ; 89 46 e6
    cmp byte [di+04630h], 000h                ; 80 bd 30 46 00
    jne short 01766h                          ; 75 50
    sal ax, 1                                 ; d1 e0
    or AL, strict byte 0ffh                   ; 0c ff
    mov bx, ax                                ; 89 c3
    mov al, byte [bp+008h]                    ; 8a 46 08
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    lea ax, [bx+001h]                         ; 8d 47 01
    mul dx                                    ; f7 e2
    mov bx, ax                                ; 89 c3
    cmp byte [bp-00ah], 000h                  ; 80 7e f6 00
    jne short 01769h                          ; 75 39
    cmp byte [bp-00eh], 000h                  ; 80 7e f2 00
    jne short 01769h                          ; 75 33
    cmp byte [bp-00ch], 000h                  ; 80 7e f4 00
    jne short 01769h                          ; 75 2d
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-01eh]                    ; 3b 46 e2
    jne short 01769h                          ; 75 23
    mov al, ch                                ; 88 e8
    cmp ax, word [bp-01ch]                    ; 3b 46 e4
    jne short 01769h                          ; 75 1c
    mov ah, byte [bp-008h]                    ; 8a 66 f8
    xor al, ch                                ; 30 e8
    add ax, strict word 00020h                ; 05 20 00
    mov es, [di+04633h]                       ; 8e 85 33 46
    mov cx, word [bp-01ah]                    ; 8b 4e e6
    mov di, bx                                ; 89 df
    cld                                       ; fc
    jcxz 01763h                               ; e3 02
    rep stosw                                 ; f3 ab
    jmp near 01bc2h                           ; e9 5c 04
    jmp near 018f7h                           ; e9 8e 01
    cmp byte [bp+00ah], 001h                  ; 80 7e 0a 01
    jne short 017d7h                          ; 75 68
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mov word [bp-016h], ax                    ; 89 46 ea
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jc short 017d9h                           ; 72 56
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    add ax, word [bp-016h]                    ; 03 46 ea
    cmp ax, dx                                ; 39 d0
    jnbe short 01793h                         ; 77 06
    cmp byte [bp-00ah], 000h                  ; 80 7e f6 00
    jne short 017dch                          ; 75 49
    mov al, byte [bp-006h]                    ; 8a 46 fa
    xor ah, ah                                ; 30 e4
    mov word [bp-022h], ax                    ; 89 46 de
    mov ah, byte [bp-008h]                    ; 8a 66 f8
    xor al, al                                ; 30 c0
    mov di, ax                                ; 89 c7
    add di, strict byte 00020h                ; 83 c7 20
    mov ax, word [bp-016h]                    ; 8b 46 ea
    mul word [bp-018h]                        ; f7 66 e8
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    xor ah, ah                                ; 30 e4
    add ax, dx                                ; 01 d0
    sal ax, 1                                 ; d1 e0
    mov dx, bx                                ; 89 da
    add dx, ax                                ; 01 c2
    mov al, byte [bp-010h]                    ; 8a 46 f0
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 003h                  ; b1 03
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    mov es, [si+04633h]                       ; 8e 84 33 46
    mov cx, word [bp-022h]                    ; 8b 4e de
    mov ax, di                                ; 89 f8
    mov di, dx                                ; 89 d7
    cld                                       ; fc
    jcxz 017d5h                               ; e3 02
    rep stosw                                 ; f3 ab
    jmp short 01827h                          ; eb 50
    jmp short 0182dh                          ; eb 54
    jmp near 01bc2h                           ; e9 e6 03
    mov dl, byte [bp-006h]                    ; 8a 56 fa
    mov di, dx                                ; 89 d7
    mul word [bp-018h]                        ; f7 66 e8
    mov dl, byte [bp-00ch]                    ; 8a 56 f4
    xor dh, dh                                ; 30 f6
    mov word [bp-014h], dx                    ; 89 56 ec
    add ax, dx                                ; 01 d0
    sal ax, 1                                 ; d1 e0
    mov word [bp-020h], ax                    ; 89 46 e0
    mov al, byte [bp-010h]                    ; 8a 46 f0
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 003h                  ; b1 03
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    mov ax, word [si+04633h]                  ; 8b 84 33 46
    mov word [bp-022h], ax                    ; 89 46 de
    mov ax, word [bp-016h]                    ; 8b 46 ea
    mul word [bp-018h]                        ; f7 66 e8
    add ax, word [bp-014h]                    ; 03 46 ec
    sal ax, 1                                 ; d1 e0
    add ax, bx                                ; 01 d8
    mov cx, di                                ; 89 f9
    mov si, word [bp-020h]                    ; 8b 76 e0
    mov dx, word [bp-022h]                    ; 8b 56 de
    mov di, ax                                ; 89 c7
    mov es, dx                                ; 8e c2
    cld                                       ; fc
    jcxz 01827h                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsw                                 ; f3 a5
    pop DS                                    ; 1f
    inc word [bp-016h]                        ; ff 46 ea
    jmp near 01777h                           ; e9 4a ff
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    mov word [bp-016h], ax                    ; 89 46 ea
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jnbe short 017d9h                         ; 77 9a
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    add ax, dx                                ; 01 d0
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jnbe short 01851h                         ; 77 06
    cmp byte [bp-00ah], 000h                  ; 80 7e f6 00
    jne short 01890h                          ; 75 3f
    mov al, byte [bp-006h]                    ; 8a 46 fa
    xor ah, ah                                ; 30 e4
    mov di, ax                                ; 89 c7
    mov ah, byte [bp-008h]                    ; 8a 66 f8
    mov AL, strict byte 020h                  ; b0 20
    mov word [bp-022h], ax                    ; 89 46 de
    mov ax, word [bp-016h]                    ; 8b 46 ea
    mul word [bp-018h]                        ; f7 66 e8
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    xor ah, ah                                ; 30 e4
    add dx, ax                                ; 01 c2
    sal dx, 1                                 ; d1 e2
    add dx, bx                                ; 01 da
    mov al, byte [bp-010h]                    ; 8a 46 f0
    mov CL, strict byte 003h                  ; b1 03
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    mov si, word [si+04633h]                  ; 8b b4 33 46
    mov cx, di                                ; 89 f9
    mov ax, word [bp-022h]                    ; 8b 46 de
    mov di, dx                                ; 89 d7
    mov es, si                                ; 8e c6
    cld                                       ; fc
    jcxz 0188eh                               ; e3 02
    rep stosw                                 ; f3 ab
    jmp short 018e7h                          ; eb 57
    mov al, byte [bp-006h]                    ; 8a 46 fa
    xor ah, ah                                ; 30 e4
    mov di, ax                                ; 89 c7
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    mov dx, word [bp-016h]                    ; 8b 56 ea
    sub dx, ax                                ; 29 c2
    mov ax, dx                                ; 89 d0
    mul word [bp-018h]                        ; f7 66 e8
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    xor ah, ah                                ; 30 e4
    mov word [bp-022h], ax                    ; 89 46 de
    add dx, ax                                ; 01 c2
    sal dx, 1                                 ; d1 e2
    mov word [bp-020h], dx                    ; 89 56 e0
    mov al, byte [bp-010h]                    ; 8a 46 f0
    mov CL, strict byte 003h                  ; b1 03
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    mov ax, word [si+04633h]                  ; 8b 84 33 46
    mov word [bp-014h], ax                    ; 89 46 ec
    mov ax, word [bp-016h]                    ; 8b 46 ea
    mul word [bp-018h]                        ; f7 66 e8
    add ax, word [bp-022h]                    ; 03 46 de
    sal ax, 1                                 ; d1 e0
    add ax, bx                                ; 01 d8
    mov cx, di                                ; 89 f9
    mov si, word [bp-020h]                    ; 8b 76 e0
    mov dx, word [bp-014h]                    ; 8b 56 ec
    mov di, ax                                ; 89 c7
    mov es, dx                                ; 8e c2
    cld                                       ; fc
    jcxz 018e7h                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsw                                 ; f3 a5
    pop DS                                    ; 1f
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jc short 0191ah                           ; 72 29
    dec word [bp-016h]                        ; ff 4e ea
    jmp near 01835h                           ; e9 3e ff
    mov al, byte [si+046afh]                  ; 8a 84 af 46
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 006h                  ; b1 06
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    mov al, byte [si+046c5h]                  ; 8a 84 c5 46
    mov byte [bp-012h], al                    ; 88 46 ee
    mov al, byte [di+04631h]                  ; 8a 85 31 46
    cmp AL, strict byte 004h                  ; 3c 04
    je short 0191dh                           ; 74 0b
    cmp AL, strict byte 003h                  ; 3c 03
    je short 0191dh                           ; 74 07
    cmp AL, strict byte 002h                  ; 3c 02
    je short 0194bh                           ; 74 31
    jmp near 01bc2h                           ; e9 a5 02
    cmp byte [bp-00ah], 000h                  ; 80 7e f6 00
    jne short 01989h                          ; 75 66
    cmp byte [bp-00eh], 000h                  ; 80 7e f2 00
    jne short 01989h                          ; 75 60
    cmp byte [bp-00ch], 000h                  ; 80 7e f4 00
    jne short 01989h                          ; 75 5a
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    lea ax, [bx-001h]                         ; 8d 47 ff
    cmp dx, ax                                ; 39 c2
    jne short 01989h                          ; 75 4c
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    mov dx, word [bp-018h]                    ; 8b 56 e8
    dec dx                                    ; 4a
    cmp ax, dx                                ; 39 d0
    je short 0194eh                           ; 74 05
    jmp short 01989h                          ; eb 3e
    jmp near 01a85h                           ; e9 37 01
    mov ax, 00205h                            ; b8 05 02
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    mov ax, bx                                ; 89 d8
    mul word [bp-018h]                        ; f7 66 e8
    mov dl, byte [bp-012h]                    ; 8a 56 ee
    xor dh, dh                                ; 30 f6
    mul dx                                    ; f7 e2
    mov dl, byte [bp-008h]                    ; 8a 56 f8
    xor dh, dh                                ; 30 f6
    mov bl, byte [bp-010h]                    ; 8a 5e f0
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    mov bx, word [bx+04633h]                  ; 8b 9f 33 46
    mov cx, ax                                ; 89 c1
    mov ax, dx                                ; 89 d0
    xor di, di                                ; 31 ff
    mov es, bx                                ; 8e c3
    cld                                       ; fc
    jcxz 01980h                               ; e3 02
    rep stosb                                 ; f3 aa
    mov ax, strict word 00005h                ; b8 05 00
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    jmp short 0191ah                          ; eb 91
    cmp byte [bp+00ah], 001h                  ; 80 7e 0a 01
    jne short 019d4h                          ; 75 45
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mov word [bp-016h], ax                    ; 89 46 ea
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jc short 01a05h                           ; 72 62
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    add ax, word [bp-016h]                    ; 03 46 ea
    cmp ax, dx                                ; 39 d0
    jnbe short 019b3h                         ; 77 06
    cmp byte [bp-00ah], 000h                  ; 80 7e f6 00
    jne short 019d6h                          ; 75 23
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp-012h]                    ; 8a 46 ee
    push ax                                   ; 50
    mov al, byte [bp-018h]                    ; 8a 46 e8
    mov cx, ax                                ; 89 c1
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    xor bh, bh                                ; 30 ff
    mov al, byte [bp-016h]                    ; 8a 46 ea
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    call 0146fh                               ; e8 9d fa
    jmp short 01a00h                          ; eb 2c
    jmp short 01a08h                          ; eb 32
    mov al, byte [bp-012h]                    ; 8a 46 ee
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp-018h]                    ; 8a 46 e8
    push ax                                   ; 50
    mov al, byte [bp-006h]                    ; 8a 46 fa
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-016h]                    ; 8a 46 ea
    mov bx, ax                                ; 89 c3
    add al, byte [bp-00ah]                    ; 02 46 f6
    mov dl, byte [bp-00ch]                    ; 8a 56 f4
    mov byte [bp-014h], dl                    ; 88 56 ec
    mov byte [bp-013h], ah                    ; 88 66 ed
    mov si, word [bp-014h]                    ; 8b 76 ec
    mov dx, ax                                ; 89 c2
    mov ax, si                                ; 89 f0
    call 013e0h                               ; e8 e0 f9
    inc word [bp-016h]                        ; ff 46 ea
    jmp short 01997h                          ; eb 92
    jmp near 01bc2h                           ; e9 ba 01
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    mov word [bp-016h], ax                    ; 89 46 ea
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jnbe short 01a05h                         ; 77 eb
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    add dx, ax                                ; 01 c2
    cmp dx, word [bp-016h]                    ; 3b 56 ea
    jnbe short 01a2ah                         ; 77 04
    test al, al                               ; 84 c0
    jne short 01a4bh                          ; 75 21
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp-012h]                    ; 8a 46 ee
    push ax                                   ; 50
    mov cl, byte [bp-018h]                    ; 8a 4e e8
    xor ch, ch                                ; 30 ed
    mov al, byte [bp-006h]                    ; 8a 46 fa
    mov bx, ax                                ; 89 c3
    mov al, byte [bp-016h]                    ; 8a 46 ea
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    call 0146fh                               ; e8 26 fa
    jmp short 01a76h                          ; eb 2b
    mov al, byte [bp-012h]                    ; 8a 46 ee
    push ax                                   ; 50
    mov al, byte [bp-018h]                    ; 8a 46 e8
    push ax                                   ; 50
    mov al, byte [bp-006h]                    ; 8a 46 fa
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-016h]                    ; 8a 46 ea
    sub al, byte [bp-00ah]                    ; 2a 46 f6
    mov bx, ax                                ; 89 c3
    mov al, byte [bp-016h]                    ; 8a 46 ea
    mov dl, byte [bp-00ch]                    ; 8a 56 f4
    mov byte [bp-014h], dl                    ; 88 56 ec
    mov byte [bp-013h], ah                    ; 88 66 ed
    mov si, word [bp-014h]                    ; 8b 76 ec
    mov dx, ax                                ; 89 c2
    mov ax, si                                ; 89 f0
    call 013e0h                               ; e8 6a f9
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jc short 01acch                           ; 72 4c
    dec word [bp-016h]                        ; ff 4e ea
    jmp short 01a10h                          ; eb 8b
    mov bl, byte [di+04632h]                  ; 8a 9d 32 46
    cmp byte [bp-00ah], 000h                  ; 80 7e f6 00
    jne short 01acfh                          ; 75 40
    cmp byte [bp-00eh], 000h                  ; 80 7e f2 00
    jne short 01acfh                          ; 75 3a
    cmp byte [bp-00ch], 000h                  ; 80 7e f4 00
    jne short 01acfh                          ; 75 34
    mov al, byte [bp+004h]                    ; 8a 46 04
    cmp ax, word [bp-01eh]                    ; 3b 46 e2
    jne short 01acfh                          ; 75 2c
    mov al, ch                                ; 88 e8
    cmp ax, word [bp-01ch]                    ; 3b 46 e4
    jne short 01acfh                          ; 75 25
    mov al, byte [bp-012h]                    ; 8a 46 ee
    mov dx, ax                                ; 89 c2
    mov ax, word [bp-01ah]                    ; 8b 46 e6
    mul dx                                    ; f7 e2
    xor bh, bh                                ; 30 ff
    mul bx                                    ; f7 e3
    mov dl, byte [bp-008h]                    ; 8a 56 f8
    xor dh, dh                                ; 30 f6
    mov es, [di+04633h]                       ; 8e 85 33 46
    mov cx, ax                                ; 89 c1
    mov ax, dx                                ; 89 d0
    xor di, di                                ; 31 ff
    cld                                       ; fc
    jcxz 01acch                               ; e3 02
    rep stosb                                 ; f3 aa
    jmp near 01bc2h                           ; e9 f3 00
    cmp bl, 002h                              ; 80 fb 02
    jne short 01addh                          ; 75 09
    sal byte [bp-00ch], 1                     ; d0 66 f4
    sal byte [bp-006h], 1                     ; d0 66 fa
    sal word [bp-018h], 1                     ; d1 66 e8
    cmp byte [bp+00ah], 001h                  ; 80 7e 0a 01
    jne short 01b4ch                          ; 75 69
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mov word [bp-016h], ax                    ; 89 46 ea
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jc short 01acch                           ; 72 d5
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    add ax, word [bp-016h]                    ; 03 46 ea
    cmp ax, dx                                ; 39 d0
    jnbe short 01b07h                         ; 77 06
    cmp byte [bp-00ah], 000h                  ; 80 7e f6 00
    jne short 01b28h                          ; 75 21
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp-012h]                    ; 8a 46 ee
    push ax                                   ; 50
    mov al, byte [bp-018h]                    ; 8a 46 e8
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-006h]                    ; 8a 46 fa
    mov bx, ax                                ; 89 c3
    mov al, byte [bp-016h]                    ; 8a 46 ea
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    call 015adh                               ; e8 87 fa
    jmp short 01b47h                          ; eb 1f
    mov al, byte [bp-012h]                    ; 8a 46 ee
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp-018h]                    ; 8a 46 e8
    push ax                                   ; 50
    mov al, byte [bp-006h]                    ; 8a 46 fa
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-016h]                    ; 8a 46 ea
    mov bx, ax                                ; 89 c3
    add al, byte [bp-00ah]                    ; 02 46 f6
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    call 014ebh                               ; e8 a4 f9
    inc word [bp-016h]                        ; ff 46 ea
    jmp short 01aebh                          ; eb 9f
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    mov word [bp-016h], ax                    ; 89 46 ea
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jnbe short 01bc2h                         ; 77 64
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    add ax, dx                                ; 01 d0
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jnbe short 01b70h                         ; 77 06
    cmp byte [bp-00ah], 000h                  ; 80 7e f6 00
    jne short 01b91h                          ; 75 21
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp-012h]                    ; 8a 46 ee
    push ax                                   ; 50
    mov al, byte [bp-018h]                    ; 8a 46 e8
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-006h]                    ; 8a 46 fa
    mov bx, ax                                ; 89 c3
    mov al, byte [bp-016h]                    ; 8a 46 ea
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    call 015adh                               ; e8 1e fa
    jmp short 01bb3h                          ; eb 22
    mov al, byte [bp-012h]                    ; 8a 46 ee
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp-018h]                    ; 8a 46 e8
    push ax                                   ; 50
    mov al, byte [bp-006h]                    ; 8a 46 fa
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-016h]                    ; 8a 46 ea
    sub al, byte [bp-00ah]                    ; 2a 46 f6
    mov bx, ax                                ; 89 c3
    mov al, byte [bp-016h]                    ; 8a 46 ea
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    call 014ebh                               ; e8 38 f9
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jc short 01bc2h                           ; 72 05
    dec word [bp-016h]                        ; ff 4e ea
    jmp short 01b54h                          ; eb 92
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00008h                               ; c2 08 00
write_gfx_char_pl4_:                         ; 0xc1bcb LB 0xf8
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0000eh                ; 83 ec 0e
    mov byte [bp-00ch], al                    ; 88 46 f4
    mov byte [bp-006h], dl                    ; 88 56 fa
    mov byte [bp-00ah], bl                    ; 88 5e f6
    mov al, cl                                ; 88 c8
    cmp byte [bp+006h], 010h                  ; 80 7e 06 10
    je short 01befh                           ; 74 0b
    cmp byte [bp+006h], 00eh                  ; 80 7e 06 0e
    jne short 01bf4h                          ; 75 0a
    mov di, 05bedh                            ; bf ed 5b
    jmp short 01bf7h                          ; eb 08
    mov di, 069edh                            ; bf ed 69
    jmp short 01bf7h                          ; eb 03
    mov di, 053edh                            ; bf ed 53
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov al, byte [bp+006h]                    ; 8a 46 06
    mov si, ax                                ; 89 c6
    mov ax, bx                                ; 89 d8
    imul si                                   ; f7 ee
    mov bl, byte [bp+004h]                    ; 8a 5e 04
    imul bx                                   ; f7 eb
    mov bx, ax                                ; 89 c3
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    xor ah, ah                                ; 30 e4
    add ax, bx                                ; 01 d8
    mov word [bp-010h], ax                    ; 89 46 f0
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    xor ah, ah                                ; 30 e4
    imul si                                   ; f7 ee
    mov word [bp-00eh], ax                    ; 89 46 f2
    mov ax, 00f02h                            ; b8 02 0f
    mov dx, 003c4h                            ; ba c4 03
    out DX, ax                                ; ef
    mov ax, 00205h                            ; b8 05 02
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    test byte [bp-006h], 080h                 ; f6 46 fa 80
    je short 01c39h                           ; 74 06
    mov ax, 01803h                            ; b8 03 18
    out DX, ax                                ; ef
    jmp short 01c3dh                          ; eb 04
    mov ax, strict word 00003h                ; b8 03 00
    out DX, ax                                ; ef
    xor ch, ch                                ; 30 ed
    cmp ch, byte [bp+006h]                    ; 3a 6e 06
    jnc short 01cabh                          ; 73 67
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    mov bl, byte [bp+004h]                    ; 8a 5e 04
    xor bh, bh                                ; 30 ff
    imul bx                                   ; f7 eb
    mov si, word [bp-010h]                    ; 8b 76 f0
    add si, ax                                ; 01 c6
    mov byte [bp-008h], bh                    ; 88 7e f8
    jmp short 01c6ch                          ; eb 13
    xor bx, bx                                ; 31 db
    mov dx, si                                ; 89 f2
    mov ax, 0a000h                            ; b8 00 a0
    call 031a9h                               ; e8 46 15
    inc byte [bp-008h]                        ; fe 46 f8
    cmp byte [bp-008h], 008h                  ; 80 7e f8 08
    jnc short 01ca7h                          ; 73 3b
    mov cl, byte [bp-008h]                    ; 8a 4e f8
    mov ax, 00080h                            ; b8 80 00
    sar ax, CL                                ; d3 f8
    xor ah, ah                                ; 30 e4
    mov word [bp-012h], ax                    ; 89 46 ee
    mov ah, byte [bp-012h]                    ; 8a 66 ee
    xor al, al                                ; 30 c0
    or AL, strict byte 008h                   ; 0c 08
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    mov dx, si                                ; 89 f2
    mov ax, 0a000h                            ; b8 00 a0
    call 0319bh                               ; e8 0f 15
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    mov bx, word [bp-00eh]                    ; 8b 5e f2
    add bx, ax                                ; 01 c3
    add bx, di                                ; 01 fb
    mov al, byte [bx]                         ; 8a 07
    test word [bp-012h], ax                   ; 85 46 ee
    je short 01c59h                           ; 74 bb
    mov al, byte [bp-006h]                    ; 8a 46 fa
    and AL, strict byte 00fh                  ; 24 0f
    mov bx, ax                                ; 89 c3
    jmp short 01c5bh                          ; eb b4
    db  0feh, 0c5h
    ; inc ch                                    ; fe c5
    jmp short 01c3fh                          ; eb 94
    mov ax, 0ff08h                            ; b8 08 ff
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    mov ax, strict word 00005h                ; b8 05 00
    out DX, ax                                ; ef
    mov ax, strict word 00003h                ; b8 03 00
    out DX, ax                                ; ef
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00004h                               ; c2 04 00
write_gfx_char_cga_:                         ; 0xc1cc3 LB 0x13a
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0000ah                ; 83 ec 0a
    mov byte [bp-008h], al                    ; 88 46 f8
    mov byte [bp-00ah], dl                    ; 88 56 f6
    mov si, 053edh                            ; be ed 53
    xor bh, bh                                ; 30 ff
    mov al, byte [bp+006h]                    ; 8a 46 06
    xor ah, ah                                ; 30 e4
    mov di, ax                                ; 89 c7
    mov ax, bx                                ; 89 d8
    imul di                                   ; f7 ef
    mov bx, ax                                ; 89 c3
    mov al, cl                                ; 88 c8
    xor ah, ah                                ; 30 e4
    mov cx, 00140h                            ; b9 40 01
    imul cx                                   ; f7 e9
    add bx, ax                                ; 01 c3
    mov word [bp-00eh], bx                    ; 89 5e f2
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 003h                  ; b1 03
    mov di, ax                                ; 89 c7
    sal di, CL                                ; d3 e7
    mov byte [bp-006h], ah                    ; 88 66 fa
    jmp near 01d54h                           ; e9 52 00
    xor al, al                                ; 30 c0
    xor ah, ah                                ; 30 e4
    jmp short 01d13h                          ; eb 0b
    or al, bl                                 ; 08 d8
    shr ch, 1                                 ; d0 ed
    db  0feh, 0c4h
    ; inc ah                                    ; fe c4
    cmp ah, 008h                              ; 80 fc 08
    jnc short 01d3eh                          ; 73 2b
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    xor bh, bh                                ; 30 ff
    add bx, di                                ; 01 fb
    add bx, si                                ; 01 f3
    mov bl, byte [bx]                         ; 8a 1f
    xor bh, bh                                ; 30 ff
    mov dx, bx                                ; 89 da
    mov bl, ch                                ; 88 eb
    test dx, bx                               ; 85 da
    je short 01d0ah                           ; 74 e2
    mov CL, strict byte 007h                  ; b1 07
    sub cl, ah                                ; 28 e1
    mov bl, byte [bp-00ah]                    ; 8a 5e f6
    and bl, 001h                              ; 80 e3 01
    sal bl, CL                                ; d2 e3
    test byte [bp-00ah], 080h                 ; f6 46 f6 80
    je short 01d08h                           ; 74 ce
    xor al, bl                                ; 30 d8
    jmp short 01d0ah                          ; eb cc
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, word [bp-00ch]                    ; 8b 56 f4
    mov ax, 0b800h                            ; b8 00 b8
    call 031a9h                               ; e8 5e 14
    inc byte [bp-006h]                        ; fe 46 fa
    cmp byte [bp-006h], 008h                  ; 80 7e fa 08
    jnc short 01da6h                          ; 73 52
    mov al, byte [bp-006h]                    ; 8a 46 fa
    xor ah, ah                                ; 30 e4
    sar ax, 1                                 ; d1 f8
    mov bx, strict word 00050h                ; bb 50 00
    imul bx                                   ; f7 eb
    mov dx, word [bp-00eh]                    ; 8b 56 f2
    add dx, ax                                ; 01 c2
    mov word [bp-00ch], dx                    ; 89 56 f4
    test byte [bp-006h], 001h                 ; f6 46 fa 01
    je short 01d72h                           ; 74 04
    add byte [bp-00bh], 020h                  ; 80 46 f5 20
    mov CH, strict byte 080h                  ; b5 80
    cmp byte [bp+006h], 001h                  ; 80 7e 06 01
    jne short 01d8bh                          ; 75 11
    test byte [bp-00ah], ch                   ; 84 6e f6
    je short 01d02h                           ; 74 83
    mov dx, word [bp-00ch]                    ; 8b 56 f4
    mov ax, 0b800h                            ; b8 00 b8
    call 0319bh                               ; e8 13 14
    jmp near 01d04h                           ; e9 79 ff
    test ch, ch                               ; 84 ed
    jbe short 01d4bh                          ; 76 bc
    test byte [bp-00ah], 080h                 ; f6 46 f6 80
    je short 01da0h                           ; 74 0b
    mov dx, word [bp-00ch]                    ; 8b 56 f4
    mov ax, 0b800h                            ; b8 00 b8
    call 0319bh                               ; e8 fd 13
    jmp short 01da2h                          ; eb 02
    xor al, al                                ; 30 c0
    xor ah, ah                                ; 30 e4
    jmp short 01dadh                          ; eb 07
    jmp short 01df4h                          ; eb 4c
    cmp ah, 004h                              ; 80 fc 04
    jnc short 01de2h                          ; 73 35
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    xor bh, bh                                ; 30 ff
    add bx, di                                ; 01 fb
    add bx, si                                ; 01 f3
    mov bl, byte [bx]                         ; 8a 1f
    xor bh, bh                                ; 30 ff
    mov dx, bx                                ; 89 da
    mov bl, ch                                ; 88 eb
    test dx, bx                               ; 85 da
    je short 01ddch                           ; 74 1a
    mov CL, strict byte 003h                  ; b1 03
    sub cl, ah                                ; 28 e1
    mov bl, byte [bp-00ah]                    ; 8a 5e f6
    and bl, 003h                              ; 80 e3 03
    sal cl, 1                                 ; d0 e1
    sal bl, CL                                ; d2 e3
    test byte [bp-00ah], 080h                 ; f6 46 f6 80
    je short 01ddah                           ; 74 04
    xor al, bl                                ; 30 d8
    jmp short 01ddch                          ; eb 02
    or al, bl                                 ; 08 d8
    shr ch, 1                                 ; d0 ed
    db  0feh, 0c4h
    ; inc ah                                    ; fe c4
    jmp short 01da8h                          ; eb c6
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, word [bp-00ch]                    ; 8b 56 f4
    mov ax, 0b800h                            ; b8 00 b8
    call 031a9h                               ; e8 ba 13
    inc word [bp-00ch]                        ; ff 46 f4
    jmp short 01d8bh                          ; eb 97
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00004h                               ; c2 04 00
write_gfx_char_lin_:                         ; 0xc1dfd LB 0xac
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0000ch                ; 83 ec 0c
    mov byte [bp-00ah], al                    ; 88 46 f6
    mov byte [bp-00ch], dl                    ; 88 56 f4
    mov byte [bp-006h], bl                    ; 88 5e fa
    mov al, cl                                ; 88 c8
    mov si, 053edh                            ; be ed 53
    xor ah, ah                                ; 30 e4
    mov bl, byte [bp+004h]                    ; 8a 5e 04
    xor bh, bh                                ; 30 ff
    imul bx                                   ; f7 eb
    mov CL, strict byte 006h                  ; b1 06
    sal ax, CL                                ; d3 e0
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    mov CL, strict byte 003h                  ; b1 03
    mov dx, bx                                ; 89 da
    sal dx, CL                                ; d3 e2
    add dx, ax                                ; 01 c2
    mov word [bp-00eh], dx                    ; 89 56 f2
    mov bl, byte [bp-00ah]                    ; 8a 5e f6
    mov di, bx                                ; 89 df
    sal di, CL                                ; d3 e7
    xor ch, ch                                ; 30 ed
    jmp short 01e7dh                          ; eb 44
    cmp cl, 008h                              ; 80 f9 08
    jnc short 01e76h                          ; 73 38
    xor dl, dl                                ; 30 d2
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    add ax, di                                ; 01 f8
    mov bx, si                                ; 89 f3
    add bx, ax                                ; 01 c3
    mov al, byte [bx]                         ; 8a 07
    xor ah, ah                                ; 30 e4
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    xor bh, bh                                ; 30 ff
    test ax, bx                               ; 85 d8
    je short 01e5ah                           ; 74 03
    mov dl, byte [bp-00ch]                    ; 8a 56 f4
    mov bl, dl                                ; 88 d3
    xor bh, bh                                ; 30 ff
    mov ax, bx                                ; 89 d8
    mov bl, cl                                ; 88 cb
    mov dx, word [bp-010h]                    ; 8b 56 f0
    add dx, bx                                ; 01 da
    mov bx, ax                                ; 89 c3
    mov ax, 0a000h                            ; b8 00 a0
    call 031a9h                               ; e8 3a 13
    shr byte [bp-008h], 1                     ; d0 6e f8
    db  0feh, 0c1h
    ; inc cl                                    ; fe c1
    jmp short 01e39h                          ; eb c3
    db  0feh, 0c5h
    ; inc ch                                    ; fe c5
    cmp ch, 008h                              ; 80 fd 08
    jnc short 01ea0h                          ; 73 23
    mov bl, ch                                ; 88 eb
    xor bh, bh                                ; 30 ff
    mov al, byte [bp+004h]                    ; 8a 46 04
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov ax, bx                                ; 89 d8
    imul dx                                   ; f7 ea
    mov CL, strict byte 003h                  ; b1 03
    sal ax, CL                                ; d3 e0
    mov dx, word [bp-00eh]                    ; 8b 56 f2
    add dx, ax                                ; 01 c2
    mov word [bp-010h], dx                    ; 89 56 f0
    mov byte [bp-008h], 080h                  ; c6 46 f8 80
    xor cl, cl                                ; 30 c9
    jmp short 01e3eh                          ; eb 9e
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00002h                               ; c2 02 00
biosfn_write_char_attr_:                     ; 0xc1ea9 LB 0x192
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0001ah                ; 83 ec 1a
    mov byte [bp-008h], al                    ; 88 46 f8
    mov byte [bp-012h], dl                    ; 88 56 ee
    mov byte [bp-006h], bl                    ; 88 5e fa
    mov si, cx                                ; 89 ce
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 d6 12
    xor ah, ah                                ; 30 e4
    call 03170h                               ; e8 a6 12
    mov cl, al                                ; 88 c1
    mov byte [bp-014h], al                    ; 88 46 ec
    cmp AL, strict byte 0ffh                  ; 3c ff
    jne short 01ed6h                          ; 75 03
    jmp near 02034h                           ; e9 5e 01
    mov al, byte [bp-012h]                    ; 8a 46 ee
    xor ah, ah                                ; 30 e4
    lea bx, [bp-01eh]                         ; 8d 5e e2
    lea dx, [bp-01ch]                         ; 8d 56 e4
    call 00a8ch                               ; e8 a8 eb
    mov al, byte [bp-01eh]                    ; 8a 46 e2
    mov byte [bp-00ch], al                    ; 88 46 f4
    mov ax, word [bp-01eh]                    ; 8b 46 e2
    mov byte [bp-00eh], ah                    ; 88 66 f2
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 a2 12
    xor ah, ah                                ; 30 e4
    inc ax                                    ; 40
    mov word [bp-01ah], ax                    ; 89 46 e6
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 af 12
    mov bx, ax                                ; 89 c3
    mov word [bp-016h], ax                    ; 89 46 ea
    mov al, cl                                ; 88 c8
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 003h                  ; b1 03
    mov di, ax                                ; 89 c7
    sal di, CL                                ; d3 e7
    cmp byte [di+04630h], 000h                ; 80 bd 30 46 00
    jne short 01f67h                          ; 75 49
    mov ax, bx                                ; 89 d8
    mul word [bp-01ah]                        ; f7 66 e6
    sal ax, 1                                 ; d1 e0
    or AL, strict byte 0ffh                   ; 0c ff
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-012h]                    ; 8a 46 ee
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov ax, cx                                ; 89 c8
    inc ax                                    ; 40
    mul dx                                    ; f7 e2
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mul bx                                    ; f7 e3
    mov bl, byte [bp-00ch]                    ; 8a 5e f4
    xor bh, bh                                ; 30 ff
    mov dx, ax                                ; 89 c2
    add dx, bx                                ; 01 da
    sal dx, 1                                 ; d1 e2
    add dx, cx                                ; 01 ca
    mov bh, byte [bp-006h]                    ; 8a 7e fa
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    mov word [bp-01ch], bx                    ; 89 5e e4
    mov ax, word [bp-01ch]                    ; 8b 46 e4
    mov es, [di+04633h]                       ; 8e 85 33 46
    mov cx, si                                ; 89 f1
    mov di, dx                                ; 89 d7
    cld                                       ; fc
    jcxz 01f64h                               ; e3 02
    rep stosw                                 ; f3 ab
    jmp near 02034h                           ; e9 cd 00
    mov bx, ax                                ; 89 c3
    mov al, byte [bx+046afh]                  ; 8a 87 af 46
    mov CL, strict byte 006h                  ; b1 06
    mov bx, ax                                ; 89 c3
    sal bx, CL                                ; d3 e3
    mov al, byte [bx+046c5h]                  ; 8a 87 c5 46
    mov byte [bp-010h], al                    ; 88 46 f0
    mov al, byte [di+04632h]                  ; 8a 85 32 46
    mov byte [bp-00ah], al                    ; 88 46 f6
    dec si                                    ; 4e
    cmp si, strict byte 0ffffh                ; 83 fe ff
    je short 01f91h                           ; 74 0a
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-016h]                    ; 3b 46 ea
    jc short 01f94h                           ; 72 03
    jmp near 02034h                           ; e9 a0 00
    mov al, byte [bp-014h]                    ; 8a 46 ec
    mov CL, strict byte 003h                  ; b1 03
    mov bx, ax                                ; 89 c3
    sal bx, CL                                ; d3 e3
    mov al, byte [bx+04631h]                  ; 8a 87 31 46
    cmp al, cl                                ; 38 c8
    jc short 01fb2h                           ; 72 0d
    jbe short 01fb8h                          ; 76 11
    cmp AL, strict byte 005h                  ; 3c 05
    je short 0200dh                           ; 74 62
    cmp AL, strict byte 004h                  ; 3c 04
    je short 01fb8h                           ; 74 09
    jmp near 0202eh                           ; e9 7c 00
    cmp AL, strict byte 002h                  ; 3c 02
    je short 01fe1h                           ; 74 2b
    jmp short 0202eh                          ; eb 76
    mov bl, byte [bp-010h]                    ; 8a 5e f0
    xor bh, bh                                ; 30 ff
    push bx                                   ; 53
    mov bl, byte [bp-016h]                    ; 8a 5e ea
    push bx                                   ; 53
    mov bl, byte [bp-00eh]                    ; 8a 5e f2
    mov cx, bx                                ; 89 d9
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-006h]                    ; 8a 46 fa
    mov di, ax                                ; 89 c7
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    mov ax, bx                                ; 89 d8
    mov bx, dx                                ; 89 d3
    mov dx, di                                ; 89 fa
    call 01bcbh                               ; e8 ec fb
    jmp short 0202eh                          ; eb 4d
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    push ax                                   ; 50
    mov al, byte [bp-016h]                    ; 8a 46 ea
    push ax                                   ; 50
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    mov cx, ax                                ; 89 c1
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    xor bh, bh                                ; 30 ff
    mov dx, bx                                ; 89 da
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    mov byte [bp-018h], bl                    ; 88 5e e8
    mov byte [bp-017h], ah                    ; 88 66 e9
    mov di, word [bp-018h]                    ; 8b 7e e8
    mov bx, ax                                ; 89 c3
    mov ax, di                                ; 89 f8
    call 01cc3h                               ; e8 b8 fc
    jmp short 0202eh                          ; eb 21
    mov bl, byte [bp-016h]                    ; 8a 5e ea
    xor bh, bh                                ; 30 ff
    push bx                                   ; 53
    mov bl, byte [bp-00eh]                    ; 8a 5e f2
    mov cx, bx                                ; 89 d9
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    mov dx, ax                                ; 89 c2
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    mov di, bx                                ; 89 df
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    mov ax, bx                                ; 89 d8
    mov bx, dx                                ; 89 d3
    mov dx, di                                ; 89 fa
    call 01dfdh                               ; e8 cf fd
    inc byte [bp-00ch]                        ; fe 46 f4
    jmp near 01f81h                           ; e9 4d ff
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_write_char_only_:                     ; 0xc203b LB 0x193
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 00018h                ; 83 ec 18
    mov byte [bp-006h], al                    ; 88 46 fa
    mov byte [bp-008h], dl                    ; 88 56 f8
    mov byte [bp-00ah], bl                    ; 88 5e f6
    mov si, cx                                ; 89 ce
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 44 11
    xor ah, ah                                ; 30 e4
    call 03170h                               ; e8 14 11
    mov cl, al                                ; 88 c1
    mov byte [bp-00ch], al                    ; 88 46 f4
    cmp AL, strict byte 0ffh                  ; 3c ff
    jne short 02068h                          ; 75 03
    jmp near 021c7h                           ; e9 5f 01
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    xor bh, bh                                ; 30 ff
    mov ax, bx                                ; 89 d8
    lea bx, [bp-01ch]                         ; 8d 5e e4
    lea dx, [bp-01ah]                         ; 8d 56 e6
    call 00a8ch                               ; e8 14 ea
    mov al, byte [bp-01ch]                    ; 8a 46 e4
    mov byte [bp-00eh], al                    ; 88 46 f2
    mov ax, word [bp-01ch]                    ; 8b 46 e4
    mov byte [bp-014h], ah                    ; 88 66 ec
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 0e 11
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    inc bx                                    ; 43
    mov word [bp-018h], bx                    ; 89 5e e8
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 19 11
    mov di, ax                                ; 89 c7
    mov word [bp-016h], ax                    ; 89 46 ea
    mov bl, cl                                ; 88 cb
    xor bh, bh                                ; 30 ff
    mov ax, bx                                ; 89 d8
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    cmp byte [bx+04630h], 000h                ; 80 bf 30 46 00
    jne short 02102h                          ; 75 4e
    mov ax, di                                ; 89 f8
    mul word [bp-018h]                        ; f7 66 e8
    sal ax, 1                                 ; d1 e0
    or AL, strict byte 0ffh                   ; 0c ff
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    xor bh, bh                                ; 30 ff
    inc ax                                    ; 40
    mul bx                                    ; f7 e3
    mov cx, ax                                ; 89 c1
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    mov ax, bx                                ; 89 d8
    mul di                                    ; f7 e7
    mov dl, byte [bp-00eh]                    ; 8a 56 f2
    xor dh, dh                                ; 30 f6
    add ax, dx                                ; 01 d0
    sal ax, 1                                 ; d1 e0
    mov di, cx                                ; 89 cf
    add di, ax                                ; 01 c7
    dec si                                    ; 4e
    cmp si, strict byte 0ffffh                ; 83 fe ff
    je short 02065h                           ; 74 84
    mov dl, byte [bp-006h]                    ; 8a 56 fa
    xor dh, dh                                ; 30 f6
    mov ax, dx                                ; 89 d0
    mov dl, byte [bp-00ch]                    ; 8a 56 f4
    mov CL, strict byte 003h                  ; b1 03
    mov bx, dx                                ; 89 d3
    sal bx, CL                                ; d3 e3
    mov cx, word [bx+04633h]                  ; 8b 8f 33 46
    mov bx, ax                                ; 89 c3
    mov dx, di                                ; 89 fa
    mov ax, cx                                ; 89 c8
    call 031a9h                               ; e8 ab 10
    inc di                                    ; 47
    inc di                                    ; 47
    jmp short 020dbh                          ; eb d9
    mov di, ax                                ; 89 c7
    mov dl, byte [di+046afh]                  ; 8a 95 af 46
    xor dh, dh                                ; 30 f6
    mov CL, strict byte 006h                  ; b1 06
    mov di, dx                                ; 89 d7
    sal di, CL                                ; d3 e7
    mov al, byte [di+046c5h]                  ; 8a 85 c5 46
    mov byte [bp-012h], al                    ; 88 46 ee
    mov al, byte [bx+04632h]                  ; 8a 87 32 46
    mov byte [bp-010h], al                    ; 88 46 f0
    dec si                                    ; 4e
    cmp si, strict byte 0ffffh                ; 83 fe ff
    je short 02179h                           ; 74 55
    mov dl, byte [bp-00eh]                    ; 8a 56 f2
    xor dh, dh                                ; 30 f6
    cmp dx, word [bp-016h]                    ; 3b 56 ea
    jnc short 02179h                          ; 73 4b
    mov dl, byte [bp-00ch]                    ; 8a 56 f4
    mov CL, strict byte 003h                  ; b1 03
    mov bx, dx                                ; 89 d3
    sal bx, CL                                ; d3 e3
    mov bl, byte [bx+04631h]                  ; 8a 9f 31 46
    cmp bl, cl                                ; 38 cb
    jc short 0214dh                           ; 72 0e
    jbe short 02154h                          ; 76 13
    cmp bl, 005h                              ; 80 fb 05
    je short 021a0h                           ; 74 5a
    cmp bl, 004h                              ; 80 fb 04
    je short 02154h                           ; 74 09
    jmp short 021c1h                          ; eb 74
    cmp bl, 002h                              ; 80 fb 02
    je short 0217bh                           ; 74 29
    jmp short 021c1h                          ; eb 6d
    mov dl, byte [bp-012h]                    ; 8a 56 ee
    xor dh, dh                                ; 30 f6
    push dx                                   ; 52
    mov bl, byte [bp-016h]                    ; 8a 5e ea
    xor bh, bh                                ; 30 ff
    push bx                                   ; 53
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    mov cx, bx                                ; 89 d9
    mov bl, byte [bp-00eh]                    ; 8a 5e f2
    mov dl, byte [bp-00ah]                    ; 8a 56 f6
    mov di, dx                                ; 89 d7
    mov dl, byte [bp-006h]                    ; 8a 56 fa
    mov ax, dx                                ; 89 d0
    mov dx, di                                ; 89 fa
    call 01bcbh                               ; e8 54 fa
    jmp short 021c1h                          ; eb 48
    jmp short 021c7h                          ; eb 4c
    mov bl, byte [bp-010h]                    ; 8a 5e f0
    xor bh, bh                                ; 30 ff
    push bx                                   ; 53
    mov bl, byte [bp-016h]                    ; 8a 5e ea
    push bx                                   ; 53
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    mov cx, bx                                ; 89 d9
    mov dl, byte [bp-00eh]                    ; 8a 56 f2
    mov bl, byte [bp-00ah]                    ; 8a 5e f6
    mov di, bx                                ; 89 df
    mov al, byte [bp-006h]                    ; 8a 46 fa
    xor ah, ah                                ; 30 e4
    mov bx, dx                                ; 89 d3
    mov dx, di                                ; 89 fa
    call 01cc3h                               ; e8 25 fb
    jmp short 021c1h                          ; eb 21
    mov bl, byte [bp-016h]                    ; 8a 5e ea
    xor bh, bh                                ; 30 ff
    push bx                                   ; 53
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    mov cx, bx                                ; 89 d9
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    xor ah, ah                                ; 30 e4
    mov di, ax                                ; 89 c7
    mov bl, byte [bp-00ah]                    ; 8a 5e f6
    mov dx, bx                                ; 89 da
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    mov ax, bx                                ; 89 d8
    mov bx, di                                ; 89 fb
    call 01dfdh                               ; e8 3c fc
    inc byte [bp-00eh]                        ; fe 46 f2
    jmp near 0211eh                           ; e9 57 ff
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_write_pixel_:                         ; 0xc21ce LB 0x17f
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    sub sp, strict byte 00008h                ; 83 ec 08
    mov byte [bp-004h], dl                    ; 88 56 fc
    mov word [bp-008h], bx                    ; 89 5e f8
    mov word [bp-00ah], cx                    ; 89 4e f6
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 b4 0f
    xor ah, ah                                ; 30 e4
    call 03170h                               ; e8 84 0f
    mov ch, al                                ; 88 c5
    cmp AL, strict byte 0ffh                  ; 3c ff
    je short 02219h                           ; 74 27
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 003h                  ; b1 03
    mov bx, ax                                ; 89 c3
    sal bx, CL                                ; d3 e3
    cmp byte [bx+04630h], 000h                ; 80 bf 30 46 00
    je short 02219h                           ; 74 18
    mov al, byte [bx+04631h]                  ; 8a 87 31 46
    cmp al, cl                                ; 38 c8
    jc short 02215h                           ; 72 0c
    jbe short 0221fh                          ; 76 14
    cmp AL, strict byte 005h                  ; 3c 05
    je short 0221ch                           ; 74 0d
    cmp AL, strict byte 004h                  ; 3c 04
    je short 0221fh                           ; 74 0c
    jmp short 02219h                          ; eb 04
    cmp AL, strict byte 002h                  ; 3c 02
    je short 0228ah                           ; 74 71
    jmp near 0231eh                           ; e9 02 01
    jmp near 02324h                           ; e9 05 01
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 8f 0f
    mov bx, ax                                ; 89 c3
    mov ax, word [bp-00ah]                    ; 8b 46 f6
    mul bx                                    ; f7 e3
    mov CL, strict byte 003h                  ; b1 03
    mov bx, word [bp-008h]                    ; 8b 5e f8
    shr bx, CL                                ; d3 eb
    add bx, ax                                ; 01 c3
    mov word [bp-006h], bx                    ; 89 5e fa
    mov cx, word [bp-008h]                    ; 8b 4e f8
    and cl, 007h                              ; 80 e1 07
    mov ax, 00080h                            ; b8 80 00
    sar ax, CL                                ; d3 f8
    mov ah, al                                ; 88 c4
    xor al, al                                ; 30 c0
    or AL, strict byte 008h                   ; 0c 08
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    mov ax, 00205h                            ; b8 05 02
    out DX, ax                                ; ef
    mov dx, bx                                ; 89 da
    mov ax, 0a000h                            ; b8 00 a0
    call 0319bh                               ; e8 3f 0f
    test byte [bp-004h], 080h                 ; f6 46 fc 80
    je short 02269h                           ; 74 07
    mov ax, 01803h                            ; b8 03 18
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    mov al, byte [bp-004h]                    ; 8a 46 fc
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, word [bp-006h]                    ; 8b 56 fa
    mov ax, 0a000h                            ; b8 00 a0
    call 031a9h                               ; e8 30 0f
    mov ax, 0ff08h                            ; b8 08 ff
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    mov ax, strict word 00005h                ; b8 05 00
    out DX, ax                                ; ef
    mov ax, strict word 00003h                ; b8 03 00
    out DX, ax                                ; ef
    jmp short 02219h                          ; eb 8f
    mov ax, word [bp-00ah]                    ; 8b 46 f6
    shr ax, 1                                 ; d1 e8
    mov si, strict word 00050h                ; be 50 00
    mul si                                    ; f7 e6
    cmp byte [bx+04632h], 002h                ; 80 bf 32 46 02
    jne short 022a4h                          ; 75 09
    mov bx, word [bp-008h]                    ; 8b 5e f8
    shr bx, 1                                 ; d1 eb
    shr bx, 1                                 ; d1 eb
    jmp short 022a9h                          ; eb 05
    mov bx, word [bp-008h]                    ; 8b 5e f8
    shr bx, CL                                ; d3 eb
    add bx, ax                                ; 01 c3
    mov word [bp-006h], bx                    ; 89 5e fa
    test byte [bp-00ah], 001h                 ; f6 46 f6 01
    je short 022b8h                           ; 74 04
    add byte [bp-005h], 020h                  ; 80 46 fb 20
    mov dx, word [bp-006h]                    ; 8b 56 fa
    mov ax, 0b800h                            ; b8 00 b8
    call 0319bh                               ; e8 da 0e
    mov bl, al                                ; 88 c3
    mov al, ch                                ; 88 e8
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 003h                  ; b1 03
    mov si, ax                                ; 89 c6
    sal si, CL                                ; d3 e6
    cmp byte [si+04632h], 002h                ; 80 bc 32 46 02
    jne short 022eeh                          ; 75 1a
    mov al, byte [bp-008h]                    ; 8a 46 f8
    and al, cl                                ; 20 c8
    mov ah, cl                                ; 88 cc
    sub ah, al                                ; 28 c4
    mov al, ah                                ; 88 e0
    sal al, 1                                 ; d0 e0
    mov bh, byte [bp-004h]                    ; 8a 7e fc
    and bh, cl                                ; 20 cf
    mov cl, al                                ; 88 c1
    sal bh, CL                                ; d2 e7
    mov AL, strict byte 003h                  ; b0 03
    jmp short 02301h                          ; eb 13
    mov al, byte [bp-008h]                    ; 8a 46 f8
    and AL, strict byte 007h                  ; 24 07
    mov CL, strict byte 007h                  ; b1 07
    sub cl, al                                ; 28 c1
    mov bh, byte [bp-004h]                    ; 8a 7e fc
    and bh, 001h                              ; 80 e7 01
    sal bh, CL                                ; d2 e7
    mov AL, strict byte 001h                  ; b0 01
    sal al, CL                                ; d2 e0
    test byte [bp-004h], 080h                 ; f6 46 fc 80
    je short 0230dh                           ; 74 04
    xor bl, bh                                ; 30 fb
    jmp short 02313h                          ; eb 06
    not al                                    ; f6 d0
    and bl, al                                ; 20 c3
    or bl, bh                                 ; 08 fb
    xor bh, bh                                ; 30 ff
    mov dx, word [bp-006h]                    ; 8b 56 fa
    mov ax, 0b800h                            ; b8 00 b8
    call 031a9h                               ; e8 8b 0e
    lea sp, [bp-002h]                         ; 8d 66 fe
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn                                      ; c3
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 8a 0e
    mov bx, ax                                ; 89 c3
    sal bx, CL                                ; d3 e3
    mov ax, word [bp-00ah]                    ; 8b 46 f6
    mul bx                                    ; f7 e3
    mov bx, word [bp-008h]                    ; 8b 5e f8
    add bx, ax                                ; 01 c3
    mov word [bp-006h], bx                    ; 89 5e fa
    mov al, byte [bp-004h]                    ; 8a 46 fc
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, word [bp-006h]                    ; 8b 56 fa
    mov ax, 0a000h                            ; b8 00 a0
    jmp short 0231bh                          ; eb ce
biosfn_write_teletype_:                      ; 0xc234d LB 0x25f
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0001ah                ; 83 ec 1a
    mov byte [bp-016h], al                    ; 88 46 ea
    mov byte [bp-014h], dl                    ; 88 56 ec
    mov byte [bp-00eh], bl                    ; 88 5e f2
    mov byte [bp-00ch], cl                    ; 88 4e f4
    cmp dl, 0ffh                              ; 80 fa ff
    jne short 02372h                          ; 75 0c
    mov dx, strict word 00062h                ; ba 62 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 2c 0e
    mov byte [bp-014h], al                    ; 88 46 ec
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 20 0e
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov ax, bx                                ; 89 d8
    call 03170h                               ; e8 ec 0d
    mov byte [bp-00ah], al                    ; 88 46 f6
    cmp AL, strict byte 0ffh                  ; 3c ff
    je short 023eeh                           ; 74 63
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    mov ax, bx                                ; 89 d8
    lea bx, [bp-01eh]                         ; 8d 5e e2
    lea dx, [bp-01ch]                         ; 8d 56 e4
    call 00a8ch                               ; e8 f3 e6
    mov al, byte [bp-01eh]                    ; 8a 46 e2
    mov byte [bp-006h], al                    ; 88 46 fa
    mov bx, word [bp-01eh]                    ; 8b 5e e2
    mov byte [bp-008h], bh                    ; 88 7e f8
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 ed 0d
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    inc bx                                    ; 43
    mov word [bp-018h], bx                    ; 89 5e e8
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 f8 0d
    mov word [bp-01ah], ax                    ; 89 46 e6
    mov al, byte [bp-016h]                    ; 8a 46 ea
    cmp AL, strict byte 008h                  ; 3c 08
    jc short 023d5h                           ; 72 0c
    jbe short 023dch                          ; 76 11
    cmp AL, strict byte 00dh                  ; 3c 0d
    je short 023e7h                           ; 74 18
    cmp AL, strict byte 00ah                  ; 3c 0a
    je short 023f1h                           ; 74 1e
    jmp short 023f4h                          ; eb 1f
    cmp AL, strict byte 007h                  ; 3c 07
    jne short 023f4h                          ; 75 1b
    jmp near 024eah                           ; e9 0e 01
    cmp byte [bp-006h], 000h                  ; 80 7e fa 00
    jbe short 023ebh                          ; 76 09
    dec byte [bp-006h]                        ; fe 4e fa
    jmp short 023ebh                          ; eb 04
    mov byte [bp-006h], 000h                  ; c6 46 fa 00
    jmp near 024eah                           ; e9 fc 00
    jmp near 025a5h                           ; e9 b4 01
    jmp near 024e7h                           ; e9 f3 00
    mov bl, byte [bp-00ah]                    ; 8a 5e f6
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    mov si, bx                                ; 89 de
    sal si, CL                                ; d3 e6
    cmp byte [si+04630h], 000h                ; 80 bc 30 46 00
    jne short 0244ch                          ; 75 46
    mov ax, word [bp-01ah]                    ; 8b 46 e6
    mul word [bp-018h]                        ; f7 66 e8
    sal ax, 1                                 ; d1 e0
    or AL, strict byte 0ffh                   ; 0c ff
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    inc ax                                    ; 40
    mul bx                                    ; f7 e3
    mov cx, ax                                ; 89 c1
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    mov ax, bx                                ; 89 d8
    mul word [bp-01ah]                        ; f7 66 e6
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    add ax, bx                                ; 01 d8
    sal ax, 1                                 ; d1 e0
    add cx, ax                                ; 01 c1
    mov bl, byte [bp-016h]                    ; 8a 5e ea
    mov ax, word [si+04633h]                  ; 8b 84 33 46
    mov dx, cx                                ; 89 ca
    call 031a9h                               ; e8 74 0d
    cmp byte [bp-00ch], 003h                  ; 80 7e f4 03
    jne short 02492h                          ; 75 57
    mov bl, byte [bp-00eh]                    ; 8a 5e f2
    xor bh, bh                                ; 30 ff
    mov dx, cx                                ; 89 ca
    inc dx                                    ; 42
    mov ax, word [si+04633h]                  ; 8b 84 33 46
    call 031a9h                               ; e8 5f 0d
    jmp short 02492h                          ; eb 46
    mov bl, byte [bx+046afh]                  ; 8a 9f af 46
    mov CL, strict byte 006h                  ; b1 06
    sal bx, CL                                ; d3 e3
    mov bl, byte [bx+046c5h]                  ; 8a 9f c5 46
    mov ah, byte [si+04632h]                  ; 8a a4 32 46
    mov al, byte [si+04631h]                  ; 8a 84 31 46
    cmp AL, strict byte 003h                  ; 3c 03
    jc short 02470h                           ; 72 0c
    jbe short 02476h                          ; 76 10
    cmp AL, strict byte 005h                  ; 3c 05
    je short 024b4h                           ; 74 4a
    cmp AL, strict byte 004h                  ; 3c 04
    je short 02476h                           ; 74 08
    jmp short 024d7h                          ; eb 67
    cmp AL, strict byte 002h                  ; 3c 02
    je short 02494h                           ; 74 20
    jmp short 024d7h                          ; eb 61
    xor bh, bh                                ; 30 ff
    push bx                                   ; 53
    mov al, byte [bp-01ah]                    ; 8a 46 e6
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov cl, byte [bp-008h]                    ; 8a 4e f8
    xor ch, ch                                ; 30 ed
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-016h]                    ; 8a 46 ea
    call 01bcbh                               ; e8 39 f7
    jmp short 024d7h                          ; eb 43
    mov al, ah                                ; 88 e0
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp-01ah]                    ; 8a 46 e6
    push ax                                   ; 50
    mov cl, byte [bp-008h]                    ; 8a 4e f8
    xor ch, ch                                ; 30 ed
    mov al, byte [bp-006h]                    ; 8a 46 fa
    mov bx, ax                                ; 89 c3
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    mov dx, ax                                ; 89 c2
    mov al, byte [bp-016h]                    ; 8a 46 ea
    call 01cc3h                               ; e8 11 f8
    jmp short 024d7h                          ; eb 23
    mov al, byte [bp-01ah]                    ; 8a 46 e6
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp-008h]                    ; 8a 46 f8
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    xor bh, bh                                ; 30 ff
    mov si, bx                                ; 89 de
    mov bl, byte [bp-00eh]                    ; 8a 5e f2
    mov dx, bx                                ; 89 da
    mov bl, byte [bp-016h]                    ; 8a 5e ea
    mov di, bx                                ; 89 df
    mov cx, ax                                ; 89 c1
    mov bx, si                                ; 89 f3
    mov ax, di                                ; 89 f8
    call 01dfdh                               ; e8 26 f9
    inc byte [bp-006h]                        ; fe 46 fa
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    xor bh, bh                                ; 30 ff
    cmp bx, word [bp-01ah]                    ; 3b 5e e6
    jne short 024eah                          ; 75 06
    mov byte [bp-006h], bh                    ; 88 7e fa
    inc byte [bp-008h]                        ; fe 46 f8
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    xor bh, bh                                ; 30 ff
    mov ax, word [bp-018h]                    ; 8b 46 e8
    cmp bx, ax                                ; 39 c3
    jne short 02567h                          ; 75 71
    mov bl, byte [bp-00ah]                    ; 8a 5e f6
    xor bh, ah                                ; 30 e7
    mov CL, strict byte 003h                  ; b1 03
    mov si, bx                                ; 89 de
    sal si, CL                                ; d3 e6
    mov al, byte [bp-018h]                    ; 8a 46 e8
    db  0feh, 0c8h
    ; dec al                                    ; fe c8
    mov byte [bp-010h], al                    ; 88 46 f0
    mov al, byte [bp-01ah]                    ; 8a 46 e6
    db  0feh, 0c8h
    ; dec al                                    ; fe c8
    mov byte [bp-012h], al                    ; 88 46 ee
    cmp byte [si+04630h], 000h                ; 80 bc 30 46 00
    jne short 02569h                          ; 75 51
    mov ax, word [bp-01ah]                    ; 8b 46 e6
    mul word [bp-018h]                        ; f7 66 e8
    sal ax, 1                                 ; d1 e0
    or AL, strict byte 0ffh                   ; 0c ff
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    xor bh, bh                                ; 30 ff
    inc ax                                    ; 40
    mul bx                                    ; f7 e3
    mov cx, ax                                ; 89 c1
    mov dl, byte [bp-008h]                    ; 8a 56 f8
    xor dh, dh                                ; 30 f6
    mov ax, dx                                ; 89 d0
    dec ax                                    ; 48
    mul word [bp-01ah]                        ; f7 66 e6
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    add ax, bx                                ; 01 d8
    sal ax, 1                                 ; d1 e0
    mov dx, cx                                ; 89 ca
    add dx, ax                                ; 01 c2
    inc dx                                    ; 42
    mov ax, word [si+04633h]                  ; 8b 84 33 46
    call 0319bh                               ; e8 51 0c
    mov dx, strict word 00001h                ; ba 01 00
    push dx                                   ; 52
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    push bx                                   ; 53
    mov bl, byte [bp-012h]                    ; 8a 5e ee
    push bx                                   ; 53
    mov bl, byte [bp-010h]                    ; 8a 5e f0
    push bx                                   ; 53
    mov bl, al                                ; 88 c3
    mov dx, bx                                ; 89 da
    xor cx, cx                                ; 31 c9
    xor bl, al                                ; 30 c3
    mov ax, strict word 00001h                ; b8 01 00
    jmp short 02581h                          ; eb 1a
    jmp short 02587h                          ; eb 1e
    mov ax, strict word 00001h                ; b8 01 00
    push ax                                   ; 50
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    xor bh, bh                                ; 30 ff
    push bx                                   ; 53
    mov bl, byte [bp-012h]                    ; 8a 5e ee
    push bx                                   ; 53
    mov bl, byte [bp-010h]                    ; 8a 5e f0
    push bx                                   ; 53
    xor cx, cx                                ; 31 c9
    xor bl, bl                                ; 30 db
    xor dx, dx                                ; 31 d2
    call 01655h                               ; e8 d1 f0
    dec byte [bp-008h]                        ; fe 4e f8
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    xor bh, bh                                ; 30 ff
    mov word [bp-01eh], bx                    ; 89 5e e2
    mov CL, strict byte 008h                  ; b1 08
    sal word [bp-01eh], CL                    ; d3 66 e2
    mov bl, byte [bp-006h]                    ; 8a 5e fa
    add word [bp-01eh], bx                    ; 01 5e e2
    mov dx, word [bp-01eh]                    ; 8b 56 e2
    mov bl, byte [bp-014h]                    ; 8a 5e ec
    mov ax, bx                                ; 89 d8
    call 00e91h                               ; e8 ec e8
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn                                      ; c3
get_font_access_:                            ; 0xc25ac LB 0x2c
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push dx                                   ; 52
    mov ax, 00100h                            ; b8 00 01
    mov dx, 003c4h                            ; ba c4 03
    out DX, ax                                ; ef
    mov ax, 00402h                            ; b8 02 04
    out DX, ax                                ; ef
    mov ax, 00704h                            ; b8 04 07
    out DX, ax                                ; ef
    mov ax, 00300h                            ; b8 00 03
    out DX, ax                                ; ef
    mov ax, 00204h                            ; b8 04 02
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    mov ax, strict word 00005h                ; b8 05 00
    out DX, ax                                ; ef
    mov ax, 00406h                            ; b8 06 04
    out DX, ax                                ; ef
    lea sp, [bp-002h]                         ; 8d 66 fe
    pop dx                                    ; 5a
    pop bp                                    ; 5d
    retn                                      ; c3
release_font_access_:                        ; 0xc25d8 LB 0x3f
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push dx                                   ; 52
    mov ax, 00100h                            ; b8 00 01
    mov dx, 003c4h                            ; ba c4 03
    out DX, ax                                ; ef
    mov ax, 00302h                            ; b8 02 03
    out DX, ax                                ; ef
    mov ax, 00304h                            ; b8 04 03
    out DX, ax                                ; ef
    mov ax, 00300h                            ; b8 00 03
    out DX, ax                                ; ef
    mov dx, 003cch                            ; ba cc 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    and ax, strict word 00001h                ; 25 01 00
    sal ax, 1                                 ; d1 e0
    sal ax, 1                                 ; d1 e0
    mov ah, al                                ; 88 c4
    or ah, 00ah                               ; 80 cc 0a
    xor al, al                                ; 30 c0
    or AL, strict byte 006h                   ; 0c 06
    mov dx, 003ceh                            ; ba ce 03
    out DX, ax                                ; ef
    mov ax, strict word 00004h                ; b8 04 00
    out DX, ax                                ; ef
    mov ax, 01005h                            ; b8 05 10
    out DX, ax                                ; ef
    lea sp, [bp-002h]                         ; 8d 66 fe
    pop dx                                    ; 5a
    pop bp                                    ; 5d
    retn                                      ; c3
set_scan_lines_:                             ; 0xc2617 LB 0xc8
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    push si                                   ; 56
    push ax                                   ; 50
    mov bl, al                                ; 88 c3
    mov dx, strict word 00063h                ; ba 63 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 8d 0b
    mov dx, ax                                ; 89 c2
    mov si, ax                                ; 89 c6
    mov AL, strict byte 009h                  ; b0 09
    out DX, AL                                ; ee
    inc dx                                    ; 42
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov ah, al                                ; 88 c4
    and ah, 0e0h                              ; 80 e4 e0
    mov al, bl                                ; 88 d8
    db  0feh, 0c8h
    ; dec al                                    ; fe c8
    or al, ah                                 ; 08 e0
    out DX, AL                                ; ee
    cmp bl, 008h                              ; 80 fb 08
    jne short 0264eh                          ; 75 08
    mov dx, strict word 00007h                ; ba 07 00
    mov ax, strict word 00006h                ; b8 06 00
    jmp short 0265bh                          ; eb 0d
    mov dl, bl                                ; 88 da
    sub dl, 003h                              ; 80 ea 03
    xor dh, dh                                ; 30 f6
    mov al, bl                                ; 88 d8
    sub AL, strict byte 004h                  ; 2c 04
    xor ah, ah                                ; 30 e4
    call 00ddeh                               ; e8 80 e7
    mov byte [bp-00ah], bl                    ; 88 5e f6
    mov byte [bp-009h], 000h                  ; c6 46 f7 00
    mov bx, word [bp-00ah]                    ; 8b 5e f6
    mov dx, 00085h                            ; ba 85 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 54 0b
    mov AL, strict byte 012h                  ; b0 12
    mov dx, si                                ; 89 f2
    out DX, AL                                ; ee
    lea cx, [si+001h]                         ; 8d 4c 01
    mov dx, cx                                ; 89 ca
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov bx, ax                                ; 89 c3
    mov AL, strict byte 007h                  ; b0 07
    mov dx, si                                ; 89 f2
    out DX, AL                                ; ee
    mov dx, cx                                ; 89 ca
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov dl, al                                ; 88 c2
    and dl, 002h                              ; 80 e2 02
    xor dh, ch                                ; 30 ee
    mov CL, strict byte 007h                  ; b1 07
    sal dx, CL                                ; d3 e2
    and AL, strict byte 040h                  ; 24 40
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 003h                  ; b1 03
    sal ax, CL                                ; d3 e0
    add ax, dx                                ; 01 d0
    inc ax                                    ; 40
    add ax, bx                                ; 01 d8
    xor dx, dx                                ; 31 d2
    div word [bp-00ah]                        ; f7 76 f6
    mov cx, ax                                ; 89 c1
    mov bl, al                                ; 88 c3
    db  0feh, 0cbh
    ; dec bl                                    ; fe cb
    xor bh, bh                                ; 30 ff
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 f1 0a
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 f6 0a
    mov dx, ax                                ; 89 c2
    mov al, cl                                ; 88 c8
    xor ah, ah                                ; 30 e4
    mul dx                                    ; f7 e2
    mov bx, ax                                ; 89 c3
    sal bx, 1                                 ; d1 e3
    mov dx, strict word 0004ch                ; ba 4c 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 ef 0a
    lea sp, [bp-008h]                         ; 8d 66 f8
    pop si                                    ; 5e
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_load_text_user_pat_:                  ; 0xc26df LB 0x85
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0000ah                ; 83 ec 0a
    mov byte [bp-006h], al                    ; 88 46 fa
    mov word [bp-00eh], dx                    ; 89 56 f2
    mov word [bp-00ah], bx                    ; 89 5e f6
    mov word [bp-00ch], cx                    ; 89 4e f4
    call 025ach                               ; e8 b6 fe
    mov al, byte [bp+006h]                    ; 8a 46 06
    and AL, strict byte 003h                  ; 24 03
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 00eh                  ; b1 0e
    mov bx, ax                                ; 89 c3
    sal bx, CL                                ; d3 e3
    mov al, byte [bp+006h]                    ; 8a 46 06
    and AL, strict byte 004h                  ; 24 04
    mov CL, strict byte 00bh                  ; b1 0b
    sal ax, CL                                ; d3 e0
    add bx, ax                                ; 01 c3
    mov word [bp-008h], bx                    ; 89 5e f8
    xor bx, bx                                ; 31 db
    cmp bx, word [bp-00ch]                    ; 3b 5e f4
    jnc short 0274ah                          ; 73 32
    mov al, byte [bp+008h]                    ; 8a 46 08
    xor ah, ah                                ; 30 e4
    mov si, ax                                ; 89 c6
    mov ax, bx                                ; 89 d8
    mul si                                    ; f7 e6
    add ax, word [bp-00ah]                    ; 03 46 f6
    mov di, word [bp+004h]                    ; 8b 7e 04
    add di, bx                                ; 01 df
    mov CL, strict byte 005h                  ; b1 05
    sal di, CL                                ; d3 e7
    add di, word [bp-008h]                    ; 03 7e f8
    mov cx, si                                ; 89 f1
    mov si, ax                                ; 89 c6
    mov dx, word [bp-00eh]                    ; 8b 56 f2
    mov ax, 0a000h                            ; b8 00 a0
    mov es, ax                                ; 8e c0
    cld                                       ; fc
    jcxz 02747h                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsb                                 ; f3 a4
    pop DS                                    ; 1f
    inc bx                                    ; 43
    jmp short 02713h                          ; eb c9
    call 025d8h                               ; e8 8b fe
    cmp byte [bp-006h], 010h                  ; 80 7e fa 10
    jc short 0275bh                           ; 72 08
    mov al, byte [bp+008h]                    ; 8a 46 08
    xor ah, ah                                ; 30 e4
    call 02617h                               ; e8 bc fe
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00006h                               ; c2 06 00
biosfn_load_text_8_14_pat_:                  ; 0xc2764 LB 0x76
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    push ax                                   ; 50
    mov byte [bp-00ah], al                    ; 88 46 f6
    call 025ach                               ; e8 39 fe
    mov al, dl                                ; 88 d0
    and AL, strict byte 003h                  ; 24 03
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 00eh                  ; b1 0e
    mov bx, ax                                ; 89 c3
    sal bx, CL                                ; d3 e3
    mov al, dl                                ; 88 d0
    and AL, strict byte 004h                  ; 24 04
    mov CL, strict byte 00bh                  ; b1 0b
    sal ax, CL                                ; d3 e0
    add bx, ax                                ; 01 c3
    mov word [bp-00ch], bx                    ; 89 5e f4
    xor bx, bx                                ; 31 db
    jmp short 02796h                          ; eb 06
    cmp bx, 00100h                            ; 81 fb 00 01
    jnc short 027c2h                          ; 73 2c
    mov ax, bx                                ; 89 d8
    mov si, strict word 0000eh                ; be 0e 00
    mul si                                    ; f7 e6
    mov CL, strict byte 005h                  ; b1 05
    mov di, bx                                ; 89 df
    sal di, CL                                ; d3 e7
    add di, word [bp-00ch]                    ; 03 7e f4
    mov si, 05bedh                            ; be ed 5b
    add si, ax                                ; 01 c6
    mov cx, strict word 0000eh                ; b9 0e 00
    mov dx, 0c000h                            ; ba 00 c0
    mov ax, 0a000h                            ; b8 00 a0
    mov es, ax                                ; 8e c0
    cld                                       ; fc
    jcxz 027bfh                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsb                                 ; f3 a4
    pop DS                                    ; 1f
    inc bx                                    ; 43
    jmp short 02790h                          ; eb ce
    call 025d8h                               ; e8 13 fe
    cmp byte [bp-00ah], 010h                  ; 80 7e f6 10
    jc short 027d1h                           ; 72 06
    mov ax, strict word 0000eh                ; b8 0e 00
    call 02617h                               ; e8 46 fe
    lea sp, [bp-008h]                         ; 8d 66 f8
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_load_text_8_8_pat_:                   ; 0xc27da LB 0x74
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    push ax                                   ; 50
    mov byte [bp-00ah], al                    ; 88 46 f6
    call 025ach                               ; e8 c3 fd
    mov al, dl                                ; 88 d0
    and AL, strict byte 003h                  ; 24 03
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 00eh                  ; b1 0e
    mov bx, ax                                ; 89 c3
    sal bx, CL                                ; d3 e3
    mov al, dl                                ; 88 d0
    and AL, strict byte 004h                  ; 24 04
    mov CL, strict byte 00bh                  ; b1 0b
    sal ax, CL                                ; d3 e0
    add bx, ax                                ; 01 c3
    mov word [bp-00ch], bx                    ; 89 5e f4
    xor bx, bx                                ; 31 db
    jmp short 0280ch                          ; eb 06
    cmp bx, 00100h                            ; 81 fb 00 01
    jnc short 02836h                          ; 73 2a
    mov CL, strict byte 003h                  ; b1 03
    mov si, bx                                ; 89 de
    sal si, CL                                ; d3 e6
    mov CL, strict byte 005h                  ; b1 05
    mov di, bx                                ; 89 df
    sal di, CL                                ; d3 e7
    add di, word [bp-00ch]                    ; 03 7e f4
    add si, 053edh                            ; 81 c6 ed 53
    mov cx, strict word 00008h                ; b9 08 00
    mov dx, 0c000h                            ; ba 00 c0
    mov ax, 0a000h                            ; b8 00 a0
    mov es, ax                                ; 8e c0
    cld                                       ; fc
    jcxz 02833h                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsb                                 ; f3 a4
    pop DS                                    ; 1f
    inc bx                                    ; 43
    jmp short 02806h                          ; eb d0
    call 025d8h                               ; e8 9f fd
    cmp byte [bp-00ah], 010h                  ; 80 7e f6 10
    jc short 02845h                           ; 72 06
    mov ax, strict word 00008h                ; b8 08 00
    call 02617h                               ; e8 d2 fd
    lea sp, [bp-008h]                         ; 8d 66 f8
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_load_text_8_16_pat_:                  ; 0xc284e LB 0x74
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    push ax                                   ; 50
    mov byte [bp-00ah], al                    ; 88 46 f6
    call 025ach                               ; e8 4f fd
    mov al, dl                                ; 88 d0
    and AL, strict byte 003h                  ; 24 03
    xor ah, ah                                ; 30 e4
    mov CL, strict byte 00eh                  ; b1 0e
    mov bx, ax                                ; 89 c3
    sal bx, CL                                ; d3 e3
    mov al, dl                                ; 88 d0
    and AL, strict byte 004h                  ; 24 04
    mov CL, strict byte 00bh                  ; b1 0b
    sal ax, CL                                ; d3 e0
    add bx, ax                                ; 01 c3
    mov word [bp-00ch], bx                    ; 89 5e f4
    xor bx, bx                                ; 31 db
    jmp short 02880h                          ; eb 06
    cmp bx, 00100h                            ; 81 fb 00 01
    jnc short 028aah                          ; 73 2a
    mov CL, strict byte 004h                  ; b1 04
    mov si, bx                                ; 89 de
    sal si, CL                                ; d3 e6
    mov CL, strict byte 005h                  ; b1 05
    mov di, bx                                ; 89 df
    sal di, CL                                ; d3 e7
    add di, word [bp-00ch]                    ; 03 7e f4
    add si, 069edh                            ; 81 c6 ed 69
    mov cx, strict word 00010h                ; b9 10 00
    mov dx, 0c000h                            ; ba 00 c0
    mov ax, 0a000h                            ; b8 00 a0
    mov es, ax                                ; 8e c0
    cld                                       ; fc
    jcxz 028a7h                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsb                                 ; f3 a4
    pop DS                                    ; 1f
    inc bx                                    ; 43
    jmp short 0287ah                          ; eb d0
    call 025d8h                               ; e8 2b fd
    cmp byte [bp-00ah], 010h                  ; 80 7e f6 10
    jc short 028b9h                           ; 72 06
    mov ax, strict word 00010h                ; b8 10 00
    call 02617h                               ; e8 5e fd
    lea sp, [bp-008h]                         ; 8d 66 f8
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_load_gfx_8_8_chars_:                  ; 0xc28c2 LB 0x5
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_load_gfx_user_chars_:                 ; 0xc28c7 LB 0x7
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    pop bp                                    ; 5d
    retn 00002h                               ; c2 02 00
biosfn_load_gfx_8_14_chars_:                 ; 0xc28ce LB 0x5
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_load_gfx_8_8_dd_chars_:               ; 0xc28d3 LB 0x5
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_load_gfx_8_16_chars_:                 ; 0xc28d8 LB 0x5
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_alternate_prtsc_:                     ; 0xc28dd LB 0x5
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_switch_video_interface_:              ; 0xc28e2 LB 0x5
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_enable_video_refresh_control_:        ; 0xc28e7 LB 0x5
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_write_string_:                        ; 0xc28ec LB 0x96
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0000ah                ; 83 ec 0a
    mov byte [bp-008h], al                    ; 88 46 f8
    mov byte [bp-00ah], dl                    ; 88 56 f6
    mov byte [bp-006h], bl                    ; 88 5e fa
    mov si, cx                                ; 89 ce
    mov di, word [bp+00ah]                    ; 8b 7e 0a
    mov al, dl                                ; 88 d0
    xor ah, ah                                ; 30 e4
    lea bx, [bp-00eh]                         ; 8d 5e f2
    lea dx, [bp-00ch]                         ; 8d 56 f4
    call 00a8ch                               ; e8 7d e1
    cmp byte [bp+004h], 0ffh                  ; 80 7e 04 ff
    jne short 02921h                          ; 75 0c
    mov al, byte [bp-00eh]                    ; 8a 46 f2
    mov byte [bp+006h], al                    ; 88 46 06
    mov ax, word [bp-00eh]                    ; 8b 46 f2
    mov byte [bp+004h], ah                    ; 88 66 04
    mov dh, byte [bp+004h]                    ; 8a 76 04
    mov dl, byte [bp+006h]                    ; 8a 56 06
    xor ah, ah                                ; 30 e4
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    call 00e91h                               ; e8 62 e5
    dec si                                    ; 4e
    cmp si, strict byte 0ffffh                ; 83 fe ff
    je short 02968h                           ; 74 33
    mov dx, di                                ; 89 fa
    inc di                                    ; 47
    mov ax, word [bp+008h]                    ; 8b 46 08
    call 0319bh                               ; e8 5d 08
    mov cl, al                                ; 88 c1
    test byte [bp-008h], 002h                 ; f6 46 f8 02
    je short 02952h                           ; 74 0c
    mov dx, di                                ; 89 fa
    inc di                                    ; 47
    mov ax, word [bp+008h]                    ; 8b 46 08
    call 0319bh                               ; e8 4c 08
    mov byte [bp-006h], al                    ; 88 46 fa
    mov al, byte [bp-006h]                    ; 8a 46 fa
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    mov dx, ax                                ; 89 c2
    mov al, cl                                ; 88 c8
    mov cx, strict word 00003h                ; b9 03 00
    call 0234dh                               ; e8 e7 f9
    jmp short 0292fh                          ; eb c7
    test byte [bp-008h], 001h                 ; f6 46 f8 01
    jne short 02979h                          ; 75 0b
    mov dx, word [bp-00eh]                    ; 8b 56 f2
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    xor ah, ah                                ; 30 e4
    call 00e91h                               ; e8 18 e5
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00008h                               ; c2 08 00
biosfn_read_state_info_:                     ; 0xc2982 LB 0x102
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    push dx                                   ; 52
    push bx                                   ; 53
    mov cx, ds                                ; 8c d9
    mov bx, 05383h                            ; bb 83 53
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031e5h                               ; e8 4d 08
    mov di, word [bp-00ah]                    ; 8b 7e f6
    add di, strict byte 00004h                ; 83 c7 04
    mov cx, strict word 0001eh                ; b9 1e 00
    mov si, strict word 00049h                ; be 49 00
    mov dx, strict word 00040h                ; ba 40 00
    mov es, [bp-008h]                         ; 8e 46 f8
    cld                                       ; fc
    jcxz 029b3h                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsb                                 ; f3 a4
    pop DS                                    ; 1f
    mov di, word [bp-00ah]                    ; 8b 7e f6
    add di, strict byte 00022h                ; 83 c7 22
    mov cx, strict word 00003h                ; b9 03 00
    mov si, 00084h                            ; be 84 00
    mov dx, strict word 00040h                ; ba 40 00
    mov es, [bp-008h]                         ; 8e 46 f8
    cld                                       ; fc
    jcxz 029ceh                               ; e3 06
    push DS                                   ; 1e
    mov ds, dx                                ; 8e da
    rep movsb                                 ; f3 a4
    pop DS                                    ; 1f
    mov dx, 0008ah                            ; ba 8a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 c4 07
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 00025h                ; 83 c2 25
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 c2 07
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 00026h                ; 83 c2 26
    xor bx, bx                                ; 31 db
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 b4 07
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 00027h                ; 83 c2 27
    mov bx, strict word 00010h                ; bb 10 00
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 a5 07
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 00028h                ; 83 c2 28
    xor bx, bx                                ; 31 db
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 97 07
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 00029h                ; 83 c2 29
    mov bx, strict word 00008h                ; bb 08 00
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 88 07
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 0002ah                ; 83 c2 2a
    mov bx, strict word 00002h                ; bb 02 00
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 79 07
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 0002bh                ; 83 c2 2b
    xor bx, bx                                ; 31 db
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 6b 07
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 0002ch                ; 83 c2 2c
    xor bx, bx                                ; 31 db
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 5d 07
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 00031h                ; 83 c2 31
    mov bx, strict word 00003h                ; bb 03 00
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 4e 07
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, strict byte 00032h                ; 83 c2 32
    xor bx, bx                                ; 31 db
    mov ax, word [bp-008h]                    ; 8b 46 f8
    call 031a9h                               ; e8 40 07
    mov di, word [bp-00ah]                    ; 8b 7e f6
    add di, strict byte 00033h                ; 83 c7 33
    mov cx, strict word 0000dh                ; b9 0d 00
    xor ax, ax                                ; 31 c0
    mov es, [bp-008h]                         ; 8e 46 f8
    cld                                       ; fc
    jcxz 02a7ch                               ; e3 02
    rep stosb                                 ; f3 aa
    lea sp, [bp-006h]                         ; 8d 66 fa
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_read_video_state_size2_:              ; 0xc2a84 LB 0x23
    push dx                                   ; 52
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov dx, ax                                ; 89 c2
    xor ax, ax                                ; 31 c0
    test dl, 001h                             ; f6 c2 01
    je short 02a94h                           ; 74 03
    mov ax, strict word 00046h                ; b8 46 00
    test dl, 002h                             ; f6 c2 02
    je short 02a9ch                           ; 74 03
    add ax, strict word 0002ah                ; 05 2a 00
    test dl, 004h                             ; f6 c2 04
    je short 02aa4h                           ; 74 03
    add ax, 00304h                            ; 05 04 03
    pop bp                                    ; 5d
    pop dx                                    ; 5a
    retn                                      ; c3
vga_get_video_state_size_:                   ; 0xc2aa7 LB 0x12
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    mov bx, dx                                ; 89 d3
    call 02a84h                               ; e8 d4 ff
    mov word [ss:bx], ax                      ; 36 89 07
    lea sp, [bp-002h]                         ; 8d 66 fe
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_save_video_state_:                    ; 0xc2ab9 LB 0x381
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    push ax                                   ; 50
    push ax                                   ; 50
    mov si, dx                                ; 89 d6
    mov cx, bx                                ; 89 d9
    mov dx, strict word 00063h                ; ba 63 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 e8 06
    mov di, ax                                ; 89 c7
    test byte [bp-00ch], 001h                 ; f6 46 f4 01
    je short 02b45h                           ; 74 6e
    mov dx, 003c4h                            ; ba c4 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 c1 06
    inc cx                                    ; 41
    mov dx, di                                ; 89 fa
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 b0 06
    inc cx                                    ; 41
    mov dx, 003ceh                            ; ba ce 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 9e 06
    inc cx                                    ; 41
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov dx, 003c0h                            ; ba c0 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov word [bp-008h], ax                    ; 89 46 f8
    mov al, byte [bp-008h]                    ; 8a 46 f8
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 80 06
    inc cx                                    ; 41
    mov dx, 003cah                            ; ba ca 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 6e 06
    mov ax, strict word 00001h                ; b8 01 00
    mov word [bp-00ah], ax                    ; 89 46 f6
    add cx, ax                                ; 01 c1
    jmp short 02b4eh                          ; eb 09
    jmp near 02c49h                           ; e9 01 01
    cmp word [bp-00ah], strict byte 00004h    ; 83 7e f6 04
    jnbe short 02b6ch                         ; 77 1e
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    mov dx, 003c5h                            ; ba c5 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 43 06
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02b48h                          ; eb dc
    xor al, al                                ; 30 c0
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    mov dx, 003c5h                            ; ba c5 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 26 06
    mov word [bp-00ah], strict word 00000h    ; c7 46 f6 00 00
    inc cx                                    ; 41
    jmp short 02b91h                          ; eb 06
    cmp word [bp-00ah], strict byte 00018h    ; 83 7e f6 18
    jnbe short 02baeh                         ; 77 1d
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    mov dx, di                                ; 89 fa
    out DX, AL                                ; ee
    lea dx, [di+001h]                         ; 8d 55 01
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 01 06
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02b8bh                          ; eb dd
    mov word [bp-00ah], strict word 00000h    ; c7 46 f6 00 00
    jmp short 02bbbh                          ; eb 06
    cmp word [bp-00ah], strict byte 00013h    ; 83 7e f6 13
    jnbe short 02be5h                         ; 77 2a
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov ax, word [bp-008h]                    ; 8b 46 f8
    and ax, strict word 00020h                ; 25 20 00
    or ax, word [bp-00ah]                     ; 0b 46 f6
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    mov dx, 003c1h                            ; ba c1 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 ca 05
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02bb5h                          ; eb d0
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov word [bp-00ah], strict word 00000h    ; c7 46 f6 00 00
    jmp short 02bf8h                          ; eb 06
    cmp word [bp-00ah], strict byte 00008h    ; 83 7e f6 08
    jnbe short 02c16h                         ; 77 1e
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    mov dx, 003ceh                            ; ba ce 03
    out DX, AL                                ; ee
    mov dx, 003cfh                            ; ba cf 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 99 05
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02bf2h                          ; eb dc
    mov bx, di                                ; 89 fb
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 a6 05
    inc cx                                    ; 41
    inc cx                                    ; 41
    xor bx, bx                                ; 31 db
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 7f 05
    inc cx                                    ; 41
    xor bx, bx                                ; 31 db
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 75 05
    inc cx                                    ; 41
    xor bx, bx                                ; 31 db
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 6b 05
    inc cx                                    ; 41
    xor bx, bx                                ; 31 db
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 61 05
    inc cx                                    ; 41
    test byte [bp-00ch], 002h                 ; f6 46 f4 02
    jne short 02c52h                          ; 75 03
    jmp near 02dbfh                           ; e9 6d 01
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 40 05
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 43 05
    inc cx                                    ; 41
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 47 05
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 4c 05
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, strict word 0004ch                ; ba 4c 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 33 05
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 38 05
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, strict word 00063h                ; ba 63 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 1f 05
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 24 05
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 ef 04
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 f2 04
    inc cx                                    ; 41
    mov dx, 00085h                            ; ba 85 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 f6 04
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 fb 04
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, 00087h                            ; ba 87 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 c6 04
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 c9 04
    inc cx                                    ; 41
    mov dx, 00088h                            ; ba 88 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 b1 04
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 b4 04
    inc cx                                    ; 41
    mov dx, 00089h                            ; ba 89 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 9c 04
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 9f 04
    inc cx                                    ; 41
    mov dx, strict word 00060h                ; ba 60 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 a3 04
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 a8 04
    mov word [bp-00ah], strict word 00000h    ; c7 46 f6 00 00
    inc cx                                    ; 41
    inc cx                                    ; 41
    jmp short 02d2ch                          ; eb 06
    cmp word [bp-00ah], strict byte 00008h    ; 83 7e f6 08
    jnc short 02d4ah                          ; 73 1e
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    sal dx, 1                                 ; d1 e2
    add dx, strict byte 00050h                ; 83 c2 50
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 7d 04
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 82 04
    inc cx                                    ; 41
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02d26h                          ; eb dc
    mov dx, strict word 0004eh                ; ba 4e 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031b7h                               ; e8 64 04
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 69 04
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, strict word 00062h                ; ba 62 00
    mov ax, strict word 00040h                ; b8 40 00
    call 0319bh                               ; e8 34 04
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 37 04
    inc cx                                    ; 41
    mov dx, strict word 0007ch                ; ba 7c 00
    xor ax, ax                                ; 31 c0
    call 031b7h                               ; e8 3c 04
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 41 04
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, strict word 0007eh                ; ba 7e 00
    xor ax, ax                                ; 31 c0
    call 031b7h                               ; e8 29 04
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 2e 04
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, 0010ch                            ; ba 0c 01
    xor ax, ax                                ; 31 c0
    call 031b7h                               ; e8 16 04
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 1b 04
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, 0010eh                            ; ba 0e 01
    xor ax, ax                                ; 31 c0
    call 031b7h                               ; e8 03 04
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 08 04
    inc cx                                    ; 41
    inc cx                                    ; 41
    test byte [bp-00ch], 004h                 ; f6 46 f4 04
    je short 02e30h                           ; 74 6b
    mov dx, 003c7h                            ; ba c7 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 d3 03
    inc cx                                    ; 41
    mov dx, 003c8h                            ; ba c8 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 c1 03
    inc cx                                    ; 41
    mov dx, 003c6h                            ; ba c6 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 af 03
    inc cx                                    ; 41
    xor al, al                                ; 30 c0
    mov dx, 003c8h                            ; ba c8 03
    out DX, AL                                ; ee
    xor ah, ah                                ; 30 e4
    mov word [bp-00ah], ax                    ; 89 46 f6
    jmp short 02e0fh                          ; eb 07
    cmp word [bp-00ah], 00300h                ; 81 7e f6 00 03
    jnc short 02e26h                          ; 73 17
    mov dx, 003c9h                            ; ba c9 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 89 03
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02e08h                          ; eb e2
    xor bx, bx                                ; 31 db
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 7a 03
    inc cx                                    ; 41
    mov ax, cx                                ; 89 c8
    lea sp, [bp-006h]                         ; 8d 66 fa
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bp                                    ; 5d
    retn                                      ; c3
biosfn_restore_video_state_:                 ; 0xc2e3a LB 0x336
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 00006h                ; 83 ec 06
    push ax                                   ; 50
    mov si, dx                                ; 89 d6
    mov cx, bx                                ; 89 d9
    test byte [bp-00eh], 001h                 ; f6 46 f2 01
    je short 02ea5h                           ; 74 57
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    lea dx, [bx+040h]                         ; 8d 57 40
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 5b 03
    mov di, ax                                ; 89 c7
    mov word [bp-00ah], strict word 00001h    ; c7 46 f6 01 00
    lea cx, [bx+005h]                         ; 8d 4f 05
    jmp short 02e6eh                          ; eb 06
    cmp word [bp-00ah], strict byte 00004h    ; 83 7e f6 04
    jnbe short 02e86h                         ; 77 18
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 1f 03
    mov dx, 003c5h                            ; ba c5 03
    out DX, AL                                ; ee
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02e68h                          ; eb e2
    xor al, al                                ; 30 c0
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 08 03
    mov dx, 003c5h                            ; ba c5 03
    out DX, AL                                ; ee
    inc cx                                    ; 41
    mov ax, strict word 00011h                ; b8 11 00
    mov dx, di                                ; 89 fa
    out DX, ax                                ; ef
    mov word [bp-00ah], strict word 00000h    ; c7 46 f6 00 00
    jmp short 02eaeh                          ; eb 09
    jmp near 02f9bh                           ; e9 f3 00
    cmp word [bp-00ah], strict byte 00018h    ; 83 7e f6 18
    jnbe short 02ecbh                         ; 77 1d
    cmp word [bp-00ah], strict byte 00011h    ; 83 7e f6 11
    je short 02ec5h                           ; 74 11
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    mov dx, di                                ; 89 fa
    out DX, AL                                ; ee
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 da 02
    lea dx, [di+001h]                         ; 8d 55 01
    out DX, AL                                ; ee
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02ea8h                          ; eb dd
    mov dx, 003cch                            ; ba cc 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    and AL, strict byte 0feh                  ; 24 fe
    mov word [bp-008h], ax                    ; 89 46 f8
    cmp di, 003d4h                            ; 81 ff d4 03
    jne short 02ee0h                          ; 75 04
    or byte [bp-008h], 001h                   ; 80 4e f8 01
    mov al, byte [bp-008h]                    ; 8a 46 f8
    mov dx, 003c2h                            ; ba c2 03
    out DX, AL                                ; ee
    mov AL, strict byte 011h                  ; b0 11
    mov dx, di                                ; 89 fa
    out DX, AL                                ; ee
    mov dx, cx                                ; 89 ca
    add dx, strict byte 0fff9h                ; 83 c2 f9
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 a5 02
    lea dx, [di+001h]                         ; 8d 55 01
    out DX, AL                                ; ee
    lea dx, [bx+003h]                         ; 8d 57 03
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 99 02
    xor ah, ah                                ; 30 e4
    mov word [bp-00ch], ax                    ; 89 46 f4
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov word [bp-00ah], strict word 00000h    ; c7 46 f6 00 00
    jmp short 02f1ah                          ; eb 06
    cmp word [bp-00ah], strict byte 00013h    ; 83 7e f6 13
    jnbe short 02f38h                         ; 77 1e
    mov ax, word [bp-00ch]                    ; 8b 46 f4
    and ax, strict word 00020h                ; 25 20 00
    or ax, word [bp-00ah]                     ; 0b 46 f6
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 6d 02
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02f14h                          ; eb dc
    mov al, byte [bp-00ch]                    ; 8a 46 f4
    mov dx, 003c0h                            ; ba c0 03
    out DX, AL                                ; ee
    mov dx, 003dah                            ; ba da 03
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    mov word [bp-00ah], strict word 00000h    ; c7 46 f6 00 00
    jmp short 02f52h                          ; eb 06
    cmp word [bp-00ah], strict byte 00008h    ; 83 7e f6 08
    jnbe short 02f6ah                         ; 77 18
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    mov dx, 003ceh                            ; ba ce 03
    out DX, AL                                ; ee
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 3b 02
    mov dx, 003cfh                            ; ba cf 03
    out DX, AL                                ; ee
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 02f4ch                          ; eb e2
    add cx, strict byte 00006h                ; 83 c1 06
    mov dx, bx                                ; 89 da
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 27 02
    mov dx, 003c4h                            ; ba c4 03
    out DX, AL                                ; ee
    inc bx                                    ; 43
    mov dx, bx                                ; 89 da
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 1b 02
    mov dx, di                                ; 89 fa
    out DX, AL                                ; ee
    inc bx                                    ; 43
    mov dx, bx                                ; 89 da
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 10 02
    mov dx, 003ceh                            ; ba ce 03
    out DX, AL                                ; ee
    lea dx, [bx+002h]                         ; 8d 57 02
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 04 02
    lea dx, [di+006h]                         ; 8d 55 06
    out DX, AL                                ; ee
    test byte [bp-00eh], 002h                 ; f6 46 f2 02
    jne short 02fa4h                          ; 75 03
    jmp near 03119h                           ; e9 75 01
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 f0 01
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, strict word 00049h                ; ba 49 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 f1 01
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 f7 01
    mov bx, ax                                ; 89 c3
    mov dx, strict word 0004ah                ; ba 4a 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 fa 01
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 e3 01
    mov bx, ax                                ; 89 c3
    mov dx, strict word 0004ch                ; ba 4c 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 e6 01
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 cf 01
    mov bx, ax                                ; 89 c3
    mov dx, strict word 00063h                ; ba 63 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 d2 01
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 9f 01
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, 00084h                            ; ba 84 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 a0 01
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 a6 01
    mov bx, ax                                ; 89 c3
    mov dx, 00085h                            ; ba 85 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 a9 01
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 76 01
    mov dl, al                                ; 88 c2
    xor dh, dh                                ; 30 f6
    mov bx, dx                                ; 89 d3
    mov dx, 00087h                            ; ba 87 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 75 01
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 5f 01
    mov dl, al                                ; 88 c2
    xor dh, dh                                ; 30 f6
    mov bx, dx                                ; 89 d3
    mov dx, 00088h                            ; ba 88 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 5e 01
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 48 01
    mov dl, al                                ; 88 c2
    xor dh, dh                                ; 30 f6
    mov bx, dx                                ; 89 d3
    mov dx, 00089h                            ; ba 89 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 47 01
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 4d 01
    mov bx, ax                                ; 89 c3
    mov dx, strict word 00060h                ; ba 60 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 50 01
    mov word [bp-00ah], strict word 00000h    ; c7 46 f6 00 00
    inc cx                                    ; 41
    inc cx                                    ; 41
    jmp short 03084h                          ; eb 06
    cmp word [bp-00ah], strict byte 00008h    ; 83 7e f6 08
    jnc short 030a2h                          ; 73 1e
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 2c 01
    mov bx, ax                                ; 89 c3
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    sal dx, 1                                 ; d1 e2
    add dx, strict byte 00050h                ; 83 c2 50
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 2a 01
    inc cx                                    ; 41
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 0307eh                          ; eb dc
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 0e 01
    mov bx, ax                                ; 89 c3
    mov dx, strict word 0004eh                ; ba 4e 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 11 01
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 de 00
    mov dl, al                                ; 88 c2
    xor dh, dh                                ; 30 f6
    mov bx, dx                                ; 89 d3
    mov dx, strict word 00062h                ; ba 62 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 dd 00
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 e3 00
    mov bx, ax                                ; 89 c3
    mov dx, strict word 0007ch                ; ba 7c 00
    xor ax, ax                                ; 31 c0
    call 031c5h                               ; e8 e7 00
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 d0 00
    mov bx, ax                                ; 89 c3
    mov dx, strict word 0007eh                ; ba 7e 00
    xor ax, ax                                ; 31 c0
    call 031c5h                               ; e8 d4 00
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 bd 00
    mov bx, ax                                ; 89 c3
    mov dx, 0010ch                            ; ba 0c 01
    xor ax, ax                                ; 31 c0
    call 031c5h                               ; e8 c1 00
    inc cx                                    ; 41
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 031b7h                               ; e8 aa 00
    mov bx, ax                                ; 89 c3
    mov dx, 0010eh                            ; ba 0e 01
    xor ax, ax                                ; 31 c0
    call 031c5h                               ; e8 ae 00
    inc cx                                    ; 41
    inc cx                                    ; 41
    test byte [bp-00eh], 004h                 ; f6 46 f2 04
    je short 03166h                           ; 74 47
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 74 00
    xor ah, ah                                ; 30 e4
    mov word [bp-008h], ax                    ; 89 46 f8
    inc cx                                    ; 41
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 67 00
    mov dx, 003c6h                            ; ba c6 03
    out DX, AL                                ; ee
    inc cx                                    ; 41
    xor al, al                                ; 30 c0
    mov dx, 003c8h                            ; ba c8 03
    out DX, AL                                ; ee
    xor ah, ah                                ; 30 e4
    mov word [bp-00ah], ax                    ; 89 46 f6
    jmp short 0314dh                          ; eb 07
    cmp word [bp-00ah], 00300h                ; 81 7e f6 00 03
    jnc short 0315eh                          ; 73 11
    mov dx, cx                                ; 89 ca
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 47 00
    mov dx, 003c9h                            ; ba c9 03
    out DX, AL                                ; ee
    inc cx                                    ; 41
    inc word [bp-00ah]                        ; ff 46 f6
    jmp short 03146h                          ; eb e8
    inc cx                                    ; 41
    mov al, byte [bp-008h]                    ; 8a 46 f8
    mov dx, 003c8h                            ; ba c8 03
    out DX, AL                                ; ee
    mov ax, cx                                ; 89 c8
    lea sp, [bp-006h]                         ; 8d 66 fa
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bp                                    ; 5d
    retn                                      ; c3
find_vga_entry_:                             ; 0xc3170 LB 0x2b
    push bx                                   ; 53
    push cx                                   ; 51
    push dx                                   ; 52
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov dl, al                                ; 88 c2
    mov AH, strict byte 0ffh                  ; b4 ff
    xor al, al                                ; 30 c0
    jmp short 03184h                          ; eb 06
    db  0feh, 0c0h
    ; inc al                                    ; fe c0
    cmp AL, strict byte 00fh                  ; 3c 0f
    jnbe short 03194h                         ; 77 10
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov CL, strict byte 003h                  ; b1 03
    sal bx, CL                                ; d3 e3
    cmp dl, byte [bx+0462fh]                  ; 3a 97 2f 46
    jne short 0317eh                          ; 75 ec
    mov ah, al                                ; 88 c4
    mov al, ah                                ; 88 e0
    pop bp                                    ; 5d
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop bx                                    ; 5b
    retn                                      ; c3
read_byte_:                                  ; 0xc319b LB 0xe
    push bx                                   ; 53
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov bx, dx                                ; 89 d3
    mov es, ax                                ; 8e c0
    mov al, byte [es:bx]                      ; 26 8a 07
    pop bp                                    ; 5d
    pop bx                                    ; 5b
    retn                                      ; c3
write_byte_:                                 ; 0xc31a9 LB 0xe
    push si                                   ; 56
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov si, dx                                ; 89 d6
    mov es, ax                                ; 8e c0
    mov byte [es:si], bl                      ; 26 88 1c
    pop bp                                    ; 5d
    pop si                                    ; 5e
    retn                                      ; c3
read_word_:                                  ; 0xc31b7 LB 0xe
    push bx                                   ; 53
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov bx, dx                                ; 89 d3
    mov es, ax                                ; 8e c0
    mov ax, word [es:bx]                      ; 26 8b 07
    pop bp                                    ; 5d
    pop bx                                    ; 5b
    retn                                      ; c3
write_word_:                                 ; 0xc31c5 LB 0xe
    push si                                   ; 56
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov si, dx                                ; 89 d6
    mov es, ax                                ; 8e c0
    mov word [es:si], bx                      ; 26 89 1c
    pop bp                                    ; 5d
    pop si                                    ; 5e
    retn                                      ; c3
read_dword_:                                 ; 0xc31d3 LB 0x12
    push bx                                   ; 53
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov bx, dx                                ; 89 d3
    mov es, ax                                ; 8e c0
    mov ax, word [es:bx]                      ; 26 8b 07
    mov dx, word [es:bx+002h]                 ; 26 8b 57 02
    pop bp                                    ; 5d
    pop bx                                    ; 5b
    retn                                      ; c3
write_dword_:                                ; 0xc31e5 LB 0x7f
    push si                                   ; 56
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov si, dx                                ; 89 d6
    mov es, ax                                ; 8e c0
    mov word [es:si], bx                      ; 26 89 1c
    mov word [es:si+002h], cx                 ; 26 89 4c 02
    pop bp                                    ; 5d
    pop si                                    ; 5e
    retn                                      ; c3
    dec di                                    ; 4f
    sbb AL, strict byte 01bh                  ; 1c 1b
    adc dx, word [bp+si]                      ; 13 12
    adc word [bx+si], dx                      ; 11 10
    push CS                                   ; 0e
    or ax, 00a0ch                             ; 0d 0c 0a
    or word [bx+si], cx                       ; 09 08
    pop ES                                    ; 07
    push ES                                   ; 06
    add ax, 00304h                            ; 05 04 03
    add al, byte [bx+di]                      ; 02 01
    add bl, ch                                ; 00 eb
    xor ax, 0328fh                            ; 35 8f 32
    int3                                      ; cc
    db  032h, 0dch
    ; xor bl, ah                                ; 32 dc
    db  032h, 0e9h
    ; xor ch, cl                                ; 32 e9
    db  032h, 0f9h
    ; xor bh, cl                                ; 32 f9
    xor cl, byte [bx+di]                      ; 32 09
    xor dx, word [bp+si]                      ; 33 12
    xor ax, word [si+033h]                    ; 33 44 33
    imul si, word [bp+di], 03377h             ; 69 33 77 33
    db  08fh, 033h
    ; pop word [bp+di]                          ; 8f 33
    cmpsw                                     ; a7
    db  033h, 0c3h
    ; xor ax, bx                                ; 33 c3
    db  033h, 0d7h
    ; xor dx, di                                ; 33 d7
    db  033h, 0edh
    ; xor bp, bp                                ; 33 ed
    db  033h, 0f9h
    ; xor di, cx                                ; 33 f9
    xor di, word [di-00dcch]                  ; 33 bd 34 f2
    xor AL, strict byte 017h                  ; 34 17
    xor ax, 0352ch                            ; 35 2c 35
    outsb                                     ; 6e
    xor ax, 02430h                            ; 35 30 24
    and sp, word [bp+si]                      ; 23 22
    and word [bx+si], sp                      ; 21 20
    adc AL, strict byte 012h                  ; 14 12
    adc word [bx+si], dx                      ; 11 10
    add AL, strict byte 002h                  ; 04 02
    add word [bx+si], ax                      ; 01 00
    jmp short 0327dh                          ; eb 35
    sbb byte [si], dh                         ; 18 34
    db  036h, 034h, 045h
    ; ss xor AL, strict byte 045h               ; 36 34 45
    xor AL, strict byte 054h                  ; 34 54
    xor AL, strict byte 018h                  ; 34 18
    xor AL, strict byte 036h                  ; 34 36
    xor AL, strict byte 045h                  ; 34 45
    xor AL, strict byte 054h                  ; 34 54
    xor AL, strict byte 063h                  ; 34 63
    xor AL, strict byte 06fh                  ; 34 6f
    xor AL, strict byte 088h                  ; 34 88
    xor AL, strict byte 092h                  ; 34 92
    xor AL, strict byte 09ch                  ; 34 9c
    xor AL, strict byte 0a6h                  ; 34 a6
    db  034h
_int10_func:                                 ; 0xc3264 LB 0x38e
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    mov si, word [bp+004h]                    ; 8b 76 04
    mov al, byte [bp+013h]                    ; 8a 46 13
    xor ah, ah                                ; 30 e4
    cmp ax, strict word 0004fh                ; 3d 4f 00
    jnbe short 032d9h                         ; 77 62
    push CS                                   ; 0e
    pop ES                                    ; 07
    mov cx, strict word 00016h                ; b9 16 00
    mov di, 031f7h                            ; bf f7 31
    repne scasb                               ; f2 ae
    sal cx, 1                                 ; d1 e1
    mov di, cx                                ; 89 cf
    mov ax, word [cs:di+0320ch]               ; 2e 8b 85 0c 32
    mov cl, byte [bp+012h]                    ; 8a 4e 12
    jmp ax                                    ; ff e0
    mov al, byte [bp+012h]                    ; 8a 46 12
    xor ah, ah                                ; 30 e4
    call 01019h                               ; e8 82 dd
    mov ax, word [bp+012h]                    ; 8b 46 12
    and ax, strict word 0007fh                ; 25 7f 00
    cmp ax, strict word 00007h                ; 3d 07 00
    je short 032b7h                           ; 74 15
    cmp ax, strict word 00006h                ; 3d 06 00
    je short 032aeh                           ; 74 07
    cmp ax, strict word 00005h                ; 3d 05 00
    jbe short 032b7h                          ; 76 0b
    jmp short 032c0h                          ; eb 12
    mov ax, word [bp+012h]                    ; 8b 46 12
    xor al, al                                ; 30 c0
    or AL, strict byte 03fh                   ; 0c 3f
    jmp short 032c7h                          ; eb 10
    mov ax, word [bp+012h]                    ; 8b 46 12
    xor al, al                                ; 30 c0
    or AL, strict byte 030h                   ; 0c 30
    jmp short 032c7h                          ; eb 07
    mov ax, word [bp+012h]                    ; 8b 46 12
    xor al, al                                ; 30 c0
    or AL, strict byte 020h                   ; 0c 20
    mov word [bp+012h], ax                    ; 89 46 12
    jmp short 032d9h                          ; eb 0d
    mov al, byte [bp+010h]                    ; 8a 46 10
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+011h]                    ; 8a 46 11
    call 00ddeh                               ; e8 05 db
    jmp near 035ebh                           ; e9 0f 03
    mov dx, word [bp+00eh]                    ; 8b 56 0e
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    xor ah, ah                                ; 30 e4
    call 00e91h                               ; e8 aa db
    jmp short 032d9h                          ; eb f0
    lea bx, [bp+00eh]                         ; 8d 5e 0e
    lea dx, [bp+010h]                         ; 8d 56 10
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    xor ah, ah                                ; 30 e4
    call 00a8ch                               ; e8 95 d7
    jmp short 032d9h                          ; eb e0
    xor ax, ax                                ; 31 c0
    mov word [bp+012h], ax                    ; 89 46 12
    mov word [bp+00ch], ax                    ; 89 46 0c
    mov word [bp+010h], ax                    ; 89 46 10
    mov word [bp+00eh], ax                    ; 89 46 0e
    jmp short 032d9h                          ; eb d0
    mov al, cl                                ; 88 c8
    xor ah, ah                                ; 30 e4
    call 00f34h                               ; e8 24 dc
    jmp short 032d9h                          ; eb c7
    mov ax, strict word 00001h                ; b8 01 00
    push ax                                   ; 50
    mov ax, 000ffh                            ; b8 ff 00
    push ax                                   ; 50
    mov al, byte [bp+00eh]                    ; 8a 46 0e
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp+00fh]                    ; 8a 46 0f
    push ax                                   ; 50
    mov al, byte [bp+010h]                    ; 8a 46 10
    mov cx, ax                                ; 89 c1
    mov bl, byte [bp+011h]                    ; 8a 5e 11
    xor bh, bh                                ; 30 ff
    mov dl, byte [bp+00dh]                    ; 8a 56 0d
    xor dh, dh                                ; 30 f6
    mov al, byte [bp+012h]                    ; 8a 46 12
    mov byte [bp-006h], al                    ; 88 46 fa
    mov byte [bp-005h], ah                    ; 88 66 fb
    mov ax, word [bp-006h]                    ; 8b 46 fa
    call 01655h                               ; e8 13 e3
    jmp short 032d9h                          ; eb 95
    xor ax, ax                                ; 31 c0
    push ax                                   ; 50
    mov ax, 000ffh                            ; b8 ff 00
    push ax                                   ; 50
    mov al, byte [bp+00eh]                    ; 8a 46 0e
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp+00fh]                    ; 8a 46 0f
    push ax                                   ; 50
    mov al, byte [bp+010h]                    ; 8a 46 10
    mov cx, ax                                ; 89 c1
    mov bl, byte [bp+011h]                    ; 8a 5e 11
    xor bh, bh                                ; 30 ff
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+012h]                    ; 8a 46 12
    jmp short 0333fh                          ; eb d6
    lea dx, [bp+012h]                         ; 8d 56 12
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    xor ah, ah                                ; 30 e4
    call 00ad2h                               ; e8 5e d7
    jmp near 035ebh                           ; e9 74 02
    mov cx, word [bp+010h]                    ; 8b 4e 10
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+012h]                    ; 8a 46 12
    call 01ea9h                               ; e8 1d eb
    jmp near 035ebh                           ; e9 5c 02
    mov cx, word [bp+010h]                    ; 8b 4e 10
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+012h]                    ; 8a 46 12
    call 0203bh                               ; e8 97 ec
    jmp near 035ebh                           ; e9 44 02
    mov cx, word [bp+00eh]                    ; 8b 4e 0e
    mov bx, word [bp+010h]                    ; 8b 5e 10
    mov dl, byte [bp+012h]                    ; 8a 56 12
    xor dh, dh                                ; 30 f6
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    xor ah, ah                                ; 30 e4
    mov word [bp-006h], ax                    ; 89 46 fa
    mov al, byte [bp-006h]                    ; 8a 46 fa
    call 021ceh                               ; e8 0e ee
    jmp near 035ebh                           ; e9 28 02
    lea cx, [bp+012h]                         ; 8d 4e 12
    mov bx, word [bp+00eh]                    ; 8b 5e 0e
    mov dx, word [bp+010h]                    ; 8b 56 10
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    xor ah, ah                                ; 30 e4
    call 00bfch                               ; e8 28 d8
    jmp near 035ebh                           ; e9 14 02
    mov cx, strict word 00002h                ; b9 02 00
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    xor ah, ah                                ; 30 e4
    mov bx, ax                                ; 89 c3
    mov dx, 000ffh                            ; ba ff 00
    mov al, byte [bp+012h]                    ; 8a 46 12
    call 0234dh                               ; e8 63 ef
    jmp near 035ebh                           ; e9 fe 01
    mov dx, word [bp+010h]                    ; 8b 56 10
    mov ax, word [bp+00ch]                    ; 8b 46 0c
    call 00d3fh                               ; e8 49 d9
    jmp near 035ebh                           ; e9 f2 01
    mov ax, word [bp+012h]                    ; 8b 46 12
    xor ah, ah                                ; 30 e4
    cmp ax, strict word 00030h                ; 3d 30 00
    jnbe short 0346ch                         ; 77 69
    push CS                                   ; 0e
    pop ES                                    ; 07
    mov cx, strict word 0000fh                ; b9 0f 00
    mov di, 03238h                            ; bf 38 32
    repne scasb                               ; f2 ae
    sal cx, 1                                 ; d1 e1
    mov di, cx                                ; 89 cf
    mov ax, word [cs:di+03246h]               ; 2e 8b 85 46 32
    jmp ax                                    ; ff e0
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    push ax                                   ; 50
    push word [bp+00eh]                       ; ff 76 0e
    mov al, byte [bp+012h]                    ; 8a 46 12
    mov cx, word [bp+010h]                    ; 8b 4e 10
    mov bx, word [bp+008h]                    ; 8b 5e 08
    mov dx, word [bp+016h]                    ; 8b 56 16
    call 026dfh                               ; e8 ab f2
    jmp short 0346ch                          ; eb 36
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+012h]                    ; 8a 46 12
    call 02764h                               ; e8 21 f3
    jmp short 0346ch                          ; eb 27
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+012h]                    ; 8a 46 12
    call 027dah                               ; e8 88 f3
    jmp short 0346ch                          ; eb 18
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    xor ah, ah                                ; 30 e4
    mov dx, ax                                ; 89 c2
    mov al, byte [bp+012h]                    ; 8a 46 12
    call 0284eh                               ; e8 ed f3
    jmp short 0346ch                          ; eb 09
    mov dx, word [bp+008h]                    ; 8b 56 08
    mov ax, word [bp+016h]                    ; 8b 46 16
    call 028c2h                               ; e8 56 f4
    jmp near 035ebh                           ; e9 7c 01
    mov al, byte [bp+00eh]                    ; 8a 46 0e
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    mov cx, ax                                ; 89 c1
    mov bx, word [bp+010h]                    ; 8b 5e 10
    mov dx, word [bp+008h]                    ; 8b 56 08
    mov ax, word [bp+016h]                    ; 8b 46 16
    call 028c7h                               ; e8 41 f4
    jmp short 0346ch                          ; eb e4
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    xor ah, ah                                ; 30 e4
    call 028ceh                               ; e8 3e f4
    jmp short 0346ch                          ; eb da
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    xor ah, ah                                ; 30 e4
    call 028d3h                               ; e8 39 f4
    jmp short 0346ch                          ; eb d0
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    xor ah, ah                                ; 30 e4
    call 028d8h                               ; e8 34 f4
    jmp short 0346ch                          ; eb c6
    lea ax, [bp+00eh]                         ; 8d 46 0e
    push ax                                   ; 50
    lea cx, [bp+010h]                         ; 8d 4e 10
    lea bx, [bp+008h]                         ; 8d 5e 08
    lea dx, [bp+016h]                         ; 8d 56 16
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    xor ah, ah                                ; 30 e4
    call 00b81h                               ; e8 c6 d6
    jmp short 0346ch                          ; eb af
    mov ax, word [bp+00ch]                    ; 8b 46 0c
    xor ah, ah                                ; 30 e4
    cmp ax, strict word 00036h                ; 3d 36 00
    je short 034ebh                           ; 74 24
    cmp ax, strict word 00035h                ; 3d 35 00
    je short 034d6h                           ; 74 0a
    cmp ax, strict word 00020h                ; 3d 20 00
    jne short 03514h                          ; 75 43
    call 028ddh                               ; e8 09 f4
    jmp short 03514h                          ; eb 3e
    mov al, cl                                ; 88 c8
    mov bx, word [bp+00eh]                    ; 8b 5e 0e
    mov dx, word [bp+016h]                    ; 8b 56 16
    call 028e2h                               ; e8 01 f4
    mov ax, word [bp+012h]                    ; 8b 46 12
    xor al, al                                ; 30 c0
    or AL, strict byte 012h                   ; 0c 12
    jmp near 032c7h                           ; e9 dc fd
    mov al, cl                                ; 88 c8
    call 028e7h                               ; e8 f7 f3
    jmp short 034e1h                          ; eb ef
    push word [bp+008h]                       ; ff 76 08
    push word [bp+016h]                       ; ff 76 16
    mov al, byte [bp+00eh]                    ; 8a 46 0e
    xor ah, ah                                ; 30 e4
    push ax                                   ; 50
    mov al, byte [bp+00fh]                    ; 8a 46 0f
    push ax                                   ; 50
    mov al, byte [bp+00ch]                    ; 8a 46 0c
    mov bx, ax                                ; 89 c3
    mov al, byte [bp+00dh]                    ; 8a 46 0d
    mov dx, ax                                ; 89 c2
    mov al, cl                                ; 88 c8
    mov cx, word [bp+010h]                    ; 8b 4e 10
    call 028ech                               ; e8 d8 f3
    jmp near 035ebh                           ; e9 d4 00
    mov bx, si                                ; 89 f3
    mov dx, word [bp+016h]                    ; 8b 56 16
    mov ax, word [bp+00ch]                    ; 8b 46 0c
    call 02982h                               ; e8 60 f4
    mov ax, word [bp+012h]                    ; 8b 46 12
    xor al, al                                ; 30 c0
    or AL, strict byte 01bh                   ; 0c 1b
    jmp near 032c7h                           ; e9 9b fd
    mov ax, word [bp+012h]                    ; 8b 46 12
    xor ah, ah                                ; 30 e4
    cmp ax, strict word 00002h                ; 3d 02 00
    je short 03558h                           ; 74 22
    cmp ax, strict word 00001h                ; 3d 01 00
    je short 0354ah                           ; 74 0f
    test ax, ax                               ; 85 c0
    jne short 03564h                          ; 75 25
    lea dx, [bp+00ch]                         ; 8d 56 0c
    mov ax, word [bp+010h]                    ; 8b 46 10
    call 02aa7h                               ; e8 5f f5
    jmp short 03564h                          ; eb 1a
    mov bx, word [bp+00ch]                    ; 8b 5e 0c
    mov dx, word [bp+016h]                    ; 8b 56 16
    mov ax, word [bp+010h]                    ; 8b 46 10
    call 02ab9h                               ; e8 63 f5
    jmp short 03564h                          ; eb 0c
    mov bx, word [bp+00ch]                    ; 8b 5e 0c
    mov dx, word [bp+016h]                    ; 8b 56 16
    mov ax, word [bp+010h]                    ; 8b 46 10
    call 02e3ah                               ; e8 d6 f8
    mov ax, word [bp+012h]                    ; 8b 46 12
    xor al, al                                ; 30 c0
    or AL, strict byte 01ch                   ; 0c 1c
    jmp near 032c7h                           ; e9 59 fd
    call 00833h                               ; e8 c2 d2
    test ax, ax                               ; 85 c0
    je short 035c8h                           ; 74 53
    mov ax, word [bp+012h]                    ; 8b 46 12
    xor ah, ah                                ; 30 e4
    cmp ax, strict word 00002h                ; 3d 02 00
    jc short 03592h                           ; 72 13
    jbe short 035b8h                          ; 76 37
    cmp ax, strict word 0000ah                ; 3d 0a 00
    je short 035dfh                           ; 74 59
    cmp ax, strict word 00009h                ; 3d 09 00
    je short 035dfh                           ; 74 54
    cmp ax, strict word 00004h                ; 3d 04 00
    je short 035cah                           ; 74 3a
    jmp short 035dfh                          ; eb 4d
    cmp ax, strict word 00001h                ; 3d 01 00
    je short 035a8h                           ; 74 11
    test ax, ax                               ; 85 c0
    jne short 035dfh                          ; 75 44
    mov bx, si                                ; 89 f3
    mov dx, word [bp+016h]                    ; 8b 56 16
    lea ax, [bp+012h]                         ; 8d 46 12
    call 03724h                               ; e8 7e 01
    jmp short 035ebh                          ; eb 43
    mov cx, si                                ; 89 f1
    mov bx, word [bp+016h]                    ; 8b 5e 16
    mov dx, word [bp+010h]                    ; 8b 56 10
    lea ax, [bp+012h]                         ; 8d 46 12
    call 03853h                               ; e8 9d 02
    jmp short 035ebh                          ; eb 33
    mov cx, si                                ; 89 f1
    mov bx, word [bp+016h]                    ; 8b 5e 16
    mov dx, word [bp+00ch]                    ; 8b 56 0c
    lea ax, [bp+012h]                         ; 8d 46 12
    call 03910h                               ; e8 4a 03
    jmp short 035ebh                          ; eb 23
    jmp short 035e6h                          ; eb 1c
    lea ax, [bp+00ch]                         ; 8d 46 0c
    push ax                                   ; 50
    mov cx, word [bp+016h]                    ; 8b 4e 16
    mov bx, word [bp+00eh]                    ; 8b 5e 0e
    mov dx, word [bp+010h]                    ; 8b 56 10
    lea ax, [bp+012h]                         ; 8d 46 12
    call 03af9h                               ; e8 1c 05
    jmp short 035ebh                          ; eb 0c
    mov word [bp+012h], 00100h                ; c7 46 12 00 01
    jmp short 035ebh                          ; eb 05
    mov word [bp+012h], 00100h                ; c7 46 12 00 01
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn                                      ; c3
dispi_set_xres_:                             ; 0xc35f2 LB 0x1f
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push dx                                   ; 52
    mov bx, ax                                ; 89 c3
    mov ax, strict word 00001h                ; b8 01 00
    mov dx, 001ceh                            ; ba ce 01
    call 005a0h                               ; e8 9e cf
    mov ax, bx                                ; 89 d8
    mov dx, 001cfh                            ; ba cf 01
    call 005a0h                               ; e8 96 cf
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
dispi_set_yres_:                             ; 0xc3611 LB 0x1f
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push dx                                   ; 52
    mov bx, ax                                ; 89 c3
    mov ax, strict word 00002h                ; b8 02 00
    mov dx, 001ceh                            ; ba ce 01
    call 005a0h                               ; e8 7f cf
    mov ax, bx                                ; 89 d8
    mov dx, 001cfh                            ; ba cf 01
    call 005a0h                               ; e8 77 cf
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
dispi_set_bpp_:                              ; 0xc3630 LB 0x1f
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push dx                                   ; 52
    mov bx, ax                                ; 89 c3
    mov ax, strict word 00003h                ; b8 03 00
    mov dx, 001ceh                            ; ba ce 01
    call 005a0h                               ; e8 60 cf
    mov ax, bx                                ; 89 d8
    mov dx, 001cfh                            ; ba cf 01
    call 005a0h                               ; e8 58 cf
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
in_word_:                                    ; 0xc364f LB 0x12
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    mov bx, ax                                ; 89 c3
    mov ax, dx                                ; 89 d0
    mov dx, bx                                ; 89 da
    out DX, ax                                ; ef
    in ax, DX                                 ; ed
    lea sp, [bp-002h]                         ; 8d 66 fe
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
in_byte_:                                    ; 0xc3661 LB 0x14
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    mov bx, ax                                ; 89 c3
    mov ax, dx                                ; 89 d0
    mov dx, bx                                ; 89 da
    out DX, ax                                ; ef
    in AL, DX                                 ; ec
    db  02ah, 0e4h
    ; sub ah, ah                                ; 2a e4
    lea sp, [bp-002h]                         ; 8d 66 fe
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
dispi_get_id_:                               ; 0xc3675 LB 0x14
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push dx                                   ; 52
    xor ax, ax                                ; 31 c0
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov dx, 001cfh                            ; ba cf 01
    in ax, DX                                 ; ed
    lea sp, [bp-002h]                         ; 8d 66 fe
    pop dx                                    ; 5a
    pop bp                                    ; 5d
    retn                                      ; c3
dispi_set_id_:                               ; 0xc3689 LB 0x1a
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push dx                                   ; 52
    mov bx, ax                                ; 89 c3
    xor ax, ax                                ; 31 c0
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov ax, bx                                ; 89 d8
    mov dx, 001cfh                            ; ba cf 01
    out DX, ax                                ; ef
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
vbe_init_:                                   ; 0xc36a3 LB 0x2c
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push dx                                   ; 52
    mov ax, 0b0c0h                            ; b8 c0 b0
    call 03689h                               ; e8 db ff
    call 03675h                               ; e8 c4 ff
    cmp ax, 0b0c0h                            ; 3d c0 b0
    jne short 036c8h                          ; 75 12
    mov bx, strict word 00001h                ; bb 01 00
    mov dx, 000b9h                            ; ba b9 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 e7 fa
    mov ax, 0b0c4h                            ; b8 c4 b0
    call 03689h                               ; e8 c1 ff
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop dx                                    ; 5a
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
mode_info_find_mode_:                        ; 0xc36cf LB 0x55
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    mov di, ax                                ; 89 c7
    mov si, dx                                ; 89 d6
    xor dx, dx                                ; 31 d2
    mov ax, 003b6h                            ; b8 b6 03
    call 0364fh                               ; e8 6d ff
    cmp ax, 077cch                            ; 3d cc 77
    jne short 03719h                          ; 75 32
    mov bx, strict word 00004h                ; bb 04 00
    mov dx, bx                                ; 89 da
    mov ax, 003b6h                            ; b8 b6 03
    call 0364fh                               ; e8 5d ff
    mov cx, ax                                ; 89 c1
    cmp cx, strict byte 0ffffh                ; 83 f9 ff
    je short 03719h                           ; 74 20
    lea dx, [bx+002h]                         ; 8d 57 02
    mov ax, 003b6h                            ; b8 b6 03
    call 0364fh                               ; e8 4d ff
    lea dx, [bx+044h]                         ; 8d 57 44
    cmp cx, di                                ; 39 f9
    jne short 03715h                          ; 75 0c
    test si, si                               ; 85 f6
    jne short 03711h                          ; 75 04
    mov ax, bx                                ; 89 d8
    jmp short 0371bh                          ; eb 0a
    test AL, strict byte 080h                 ; a8 80
    jne short 0370dh                          ; 75 f8
    mov bx, dx                                ; 89 d3
    jmp short 036ech                          ; eb d3
    xor ax, ax                                ; 31 c0
    lea sp, [bp-008h]                         ; 8d 66 f8
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
vbe_biosfn_return_controller_information_: ; 0xc3724 LB 0x12f
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 0000ah                ; 83 ec 0a
    mov si, ax                                ; 89 c6
    mov di, dx                                ; 89 d7
    mov word [bp-00ah], bx                    ; 89 5e f6
    mov word [bp-00ch], strict word 00022h    ; c7 46 f4 22 00
    call 005eah                               ; e8 ae ce
    mov word [bp-010h], ax                    ; 89 46 f0
    mov bx, word [bp-00ah]                    ; 8b 5e f6
    mov word [bp-008h], di                    ; 89 7e f8
    xor dx, dx                                ; 31 d2
    mov ax, 003b6h                            ; b8 b6 03
    call 0364fh                               ; e8 02 ff
    cmp ax, 077cch                            ; 3d cc 77
    je short 0375ch                           ; 74 0a
    push SS                                   ; 16
    pop ES                                    ; 07
    mov word [es:si], 00100h                  ; 26 c7 04 00 01
    jmp near 0384bh                           ; e9 ef 00
    mov cx, strict word 00004h                ; b9 04 00
    mov word [bp-00eh], strict word 00000h    ; c7 46 f2 00 00
    mov es, [bp-008h]                         ; 8e 46 f8
    cmp word [es:bx+002h], 03245h             ; 26 81 7f 02 45 32
    jne short 03776h                          ; 75 07
    cmp word [es:bx], 04256h                  ; 26 81 3f 56 42
    je short 03785h                           ; 74 0f
    cmp word [es:bx+002h], 04153h             ; 26 81 7f 02 53 41
    jne short 0378ah                          ; 75 0c
    cmp word [es:bx], 04556h                  ; 26 81 3f 56 45
    jne short 0378ah                          ; 75 05
    mov word [bp-00eh], strict word 00001h    ; c7 46 f2 01 00
    mov es, [bp-008h]                         ; 8e 46 f8
    mov word [es:bx], 04556h                  ; 26 c7 07 56 45
    mov word [es:bx+002h], 04153h             ; 26 c7 47 02 53 41
    mov word [es:bx+004h], 00200h             ; 26 c7 47 04 00 02
    mov word [es:bx+006h], 07c5eh             ; 26 c7 47 06 5e 7c
    mov [es:bx+008h], ds                      ; 26 8c 5f 08
    mov word [es:bx+00ah], strict word 00001h ; 26 c7 47 0a 01 00
    mov word [es:bx+00ch], strict word 00000h ; 26 c7 47 0c 00 00
    mov word [es:bx+010h], di                 ; 26 89 7f 10
    mov ax, word [bp-00ah]                    ; 8b 46 f6
    add ax, strict word 00022h                ; 05 22 00
    mov word [es:bx+00eh], ax                 ; 26 89 47 0e
    mov dx, strict word 0ffffh                ; ba ff ff
    mov ax, 003b6h                            ; b8 b6 03
    call 0364fh                               ; e8 84 fe
    mov es, [bp-008h]                         ; 8e 46 f8
    mov word [es:bx+012h], ax                 ; 26 89 47 12
    cmp word [bp-00eh], strict byte 00000h    ; 83 7e f2 00
    je short 037fch                           ; 74 24
    mov word [es:bx+014h], strict word 00003h ; 26 c7 47 14 03 00
    mov word [es:bx+016h], 07c73h             ; 26 c7 47 16 73 7c
    mov [es:bx+018h], ds                      ; 26 8c 5f 18
    mov word [es:bx+01ah], 07c86h             ; 26 c7 47 1a 86 7c
    mov [es:bx+01ch], ds                      ; 26 8c 5f 1c
    mov word [es:bx+01eh], 07ca7h             ; 26 c7 47 1e a7 7c
    mov [es:bx+020h], ds                      ; 26 8c 5f 20
    mov dx, cx                                ; 89 ca
    add dx, strict byte 0001bh                ; 83 c2 1b
    mov ax, 003b6h                            ; b8 b6 03
    call 03661h                               ; e8 5a fe
    xor ah, ah                                ; 30 e4
    cmp ax, word [bp-010h]                    ; 3b 46 f0
    jnbe short 03827h                         ; 77 19
    mov dx, cx                                ; 89 ca
    mov ax, 003b6h                            ; b8 b6 03
    call 0364fh                               ; e8 39 fe
    mov bx, ax                                ; 89 c3
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, word [bp-00ch]                    ; 03 56 f4
    mov ax, di                                ; 89 f8
    call 031c5h                               ; e8 a2 f9
    add word [bp-00ch], strict byte 00002h    ; 83 46 f4 02
    add cx, strict byte 00044h                ; 83 c1 44
    mov dx, cx                                ; 89 ca
    mov ax, 003b6h                            ; b8 b6 03
    call 0364fh                               ; e8 1d fe
    mov bx, ax                                ; 89 c3
    cmp ax, strict word 0ffffh                ; 3d ff ff
    jne short 037fch                          ; 75 c3
    mov dx, word [bp-00ah]                    ; 8b 56 f6
    add dx, word [bp-00ch]                    ; 03 56 f4
    mov ax, di                                ; 89 f8
    call 031c5h                               ; e8 81 f9
    push SS                                   ; 16
    pop ES                                    ; 07
    mov word [es:si], strict word 0004fh      ; 26 c7 04 4f 00
    lea sp, [bp-006h]                         ; 8d 66 fa
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bp                                    ; 5d
    retn                                      ; c3
vbe_biosfn_return_mode_information_:         ; 0xc3853 LB 0xbd
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    push ax                                   ; 50
    push ax                                   ; 50
    mov ax, dx                                ; 89 d0
    mov si, bx                                ; 89 de
    mov word [bp-006h], cx                    ; 89 4e fa
    test dh, 040h                             ; f6 c6 40
    je short 0386ch                           ; 74 05
    mov dx, strict word 00001h                ; ba 01 00
    jmp short 0386eh                          ; eb 02
    xor dx, dx                                ; 31 d2
    and ah, 001h                              ; 80 e4 01
    call 036cfh                               ; e8 5b fe
    mov word [bp-008h], ax                    ; 89 46 f8
    test ax, ax                               ; 85 c0
    je short 038b1h                           ; 74 36
    mov cx, 00100h                            ; b9 00 01
    xor ax, ax                                ; 31 c0
    mov di, word [bp-006h]                    ; 8b 7e fa
    mov es, si                                ; 8e c6
    cld                                       ; fc
    jcxz 0388ah                               ; e3 02
    rep stosb                                 ; f3 aa
    xor cx, cx                                ; 31 c9
    jmp short 03893h                          ; eb 05
    cmp cx, strict byte 00042h                ; 83 f9 42
    jnc short 038b3h                          ; 73 20
    mov dx, word [bp-008h]                    ; 8b 56 f8
    inc dx                                    ; 42
    inc dx                                    ; 42
    add dx, cx                                ; 01 ca
    mov ax, 003b6h                            ; b8 b6 03
    call 03661h                               ; e8 c1 fd
    mov bl, al                                ; 88 c3
    xor bh, bh                                ; 30 ff
    mov dx, word [bp-006h]                    ; 8b 56 fa
    add dx, cx                                ; 01 ca
    mov ax, si                                ; 89 f0
    call 031a9h                               ; e8 fb f8
    inc cx                                    ; 41
    jmp short 0388eh                          ; eb dd
    jmp short 038feh                          ; eb 4b
    mov dx, word [bp-006h]                    ; 8b 56 fa
    inc dx                                    ; 42
    inc dx                                    ; 42
    mov ax, si                                ; 89 f0
    call 0319bh                               ; e8 de f8
    test AL, strict byte 001h                 ; a8 01
    je short 038ddh                           ; 74 1c
    mov dx, word [bp-006h]                    ; 8b 56 fa
    add dx, strict byte 0000ch                ; 83 c2 0c
    mov bx, 0065ch                            ; bb 5c 06
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 f6 f8
    mov dx, word [bp-006h]                    ; 8b 56 fa
    add dx, strict byte 0000eh                ; 83 c2 0e
    mov bx, 0c000h                            ; bb 00 c0
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 e8 f8
    mov ax, strict word 0000bh                ; b8 0b 00
    mov dx, 001ceh                            ; ba ce 01
    call 005a0h                               ; e8 ba cc
    mov dx, 001cfh                            ; ba cf 01
    call 005a7h                               ; e8 bb cc
    mov dx, word [bp-006h]                    ; 8b 56 fa
    add dx, strict byte 0002ah                ; 83 c2 2a
    mov bx, ax                                ; 89 c3
    mov ax, si                                ; 89 f0
    call 031c5h                               ; e8 cc f8
    mov ax, strict word 0004fh                ; b8 4f 00
    jmp short 03901h                          ; eb 03
    mov ax, 00100h                            ; b8 00 01
    push SS                                   ; 16
    pop ES                                    ; 07
    mov bx, word [bp-00ah]                    ; 8b 5e f6
    mov word [es:bx], ax                      ; 26 89 07
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn                                      ; c3
vbe_biosfn_set_mode_:                        ; 0xc3910 LB 0xeb
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    sub sp, strict byte 00006h                ; 83 ec 06
    mov si, ax                                ; 89 c6
    mov word [bp-00ah], dx                    ; 89 56 f6
    test byte [bp-009h], 040h                 ; f6 46 f7 40
    je short 03928h                           ; 74 05
    mov ax, strict word 00001h                ; b8 01 00
    jmp short 0392ah                          ; eb 02
    xor ax, ax                                ; 31 c0
    mov dx, ax                                ; 89 c2
    test ax, ax                               ; 85 c0
    je short 03933h                           ; 74 03
    mov ax, strict word 00040h                ; b8 40 00
    mov byte [bp-006h], al                    ; 88 46 fa
    test byte [bp-009h], 080h                 ; f6 46 f7 80
    je short 03941h                           ; 74 05
    mov ax, 00080h                            ; b8 80 00
    jmp short 03943h                          ; eb 02
    xor ax, ax                                ; 31 c0
    mov byte [bp-008h], al                    ; 88 46 f8
    and byte [bp-009h], 001h                  ; 80 66 f7 01
    cmp word [bp-00ah], 00100h                ; 81 7e f6 00 01
    jnc short 03964h                          ; 73 13
    xor ax, ax                                ; 31 c0
    call 00610h                               ; e8 ba cc
    mov al, byte [bp-00ah]                    ; 8a 46 f6
    xor ah, ah                                ; 30 e4
    call 01019h                               ; e8 bb d6
    mov ax, strict word 0004fh                ; b8 4f 00
    jmp near 039f1h                           ; e9 8d 00
    mov ax, word [bp-00ah]                    ; 8b 46 f6
    call 036cfh                               ; e8 65 fd
    mov bx, ax                                ; 89 c3
    test ax, ax                               ; 85 c0
    jne short 03973h                          ; 75 03
    jmp near 039eeh                           ; e9 7b 00
    lea dx, [bx+014h]                         ; 8d 57 14
    mov ax, 003b6h                            ; b8 b6 03
    call 0364fh                               ; e8 d3 fc
    mov cx, ax                                ; 89 c1
    lea dx, [bx+016h]                         ; 8d 57 16
    mov ax, 003b6h                            ; b8 b6 03
    call 0364fh                               ; e8 c8 fc
    mov di, ax                                ; 89 c7
    lea dx, [bx+01bh]                         ; 8d 57 1b
    mov ax, 003b6h                            ; b8 b6 03
    call 03661h                               ; e8 cf fc
    mov bl, al                                ; 88 c3
    mov dl, al                                ; 88 c2
    xor ax, ax                                ; 31 c0
    call 00610h                               ; e8 75 cc
    cmp bl, 004h                              ; 80 fb 04
    jne short 039a6h                          ; 75 06
    mov ax, strict word 0006ah                ; b8 6a 00
    call 01019h                               ; e8 73 d6
    mov al, dl                                ; 88 d0
    xor ah, ah                                ; 30 e4
    call 03630h                               ; e8 83 fc
    mov ax, cx                                ; 89 c8
    call 035f2h                               ; e8 40 fc
    mov ax, di                                ; 89 f8
    call 03611h                               ; e8 5a fc
    xor ax, ax                                ; 31 c0
    call 00636h                               ; e8 7a cc
    mov al, byte [bp-008h]                    ; 8a 46 f8
    or AL, strict byte 001h                   ; 0c 01
    xor ah, ah                                ; 30 e4
    mov dl, byte [bp-006h]                    ; 8a 56 fa
    or al, dl                                 ; 08 d0
    call 00610h                               ; e8 45 cc
    call 00743h                               ; e8 75 cd
    mov bx, word [bp-00ah]                    ; 8b 5e f6
    mov dx, 000bah                            ; ba ba 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031c5h                               ; e8 eb f7
    mov bl, byte [bp-008h]                    ; 8a 5e f8
    or bl, 060h                               ; 80 cb 60
    xor bh, bh                                ; 30 ff
    mov dx, 00087h                            ; ba 87 00
    mov ax, strict word 00040h                ; b8 40 00
    call 031a9h                               ; e8 be f7
    jmp near 0395eh                           ; e9 70 ff
    mov ax, 00100h                            ; b8 00 01
    mov word [ss:si], ax                      ; 36 89 04
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn                                      ; c3
vbe_biosfn_read_video_state_size_:           ; 0xc39fb LB 0x8
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    mov ax, strict word 00012h                ; b8 12 00
    pop bp                                    ; 5d
    retn                                      ; c3
vbe_biosfn_save_video_state_:                ; 0xc3a03 LB 0x5b
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    mov di, ax                                ; 89 c7
    mov cx, dx                                ; 89 d1
    mov ax, strict word 00004h                ; b8 04 00
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov dx, 001cfh                            ; ba cf 01
    in ax, DX                                 ; ed
    mov word [bp-00ah], ax                    ; 89 46 f6
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, di                                ; 89 f8
    call 031c5h                               ; e8 9f f7
    inc cx                                    ; 41
    inc cx                                    ; 41
    test byte [bp-00ah], 001h                 ; f6 46 f6 01
    je short 03a55h                           ; 74 27
    mov si, strict word 00001h                ; be 01 00
    jmp short 03a38h                          ; eb 05
    cmp si, strict byte 00009h                ; 83 fe 09
    jnbe short 03a55h                         ; 77 1d
    cmp si, strict byte 00004h                ; 83 fe 04
    je short 03a52h                           ; 74 15
    mov ax, si                                ; 89 f0
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov dx, 001cfh                            ; ba cf 01
    in ax, DX                                 ; ed
    mov bx, ax                                ; 89 c3
    mov dx, cx                                ; 89 ca
    mov ax, di                                ; 89 f8
    call 031c5h                               ; e8 75 f7
    inc cx                                    ; 41
    inc cx                                    ; 41
    inc si                                    ; 46
    jmp short 03a33h                          ; eb de
    lea sp, [bp-008h]                         ; 8d 66 f8
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
vbe_biosfn_restore_video_state_:             ; 0xc3a5e LB 0x9b
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push bx                                   ; 53
    push cx                                   ; 51
    push si                                   ; 56
    push ax                                   ; 50
    mov cx, ax                                ; 89 c1
    mov bx, dx                                ; 89 d3
    call 031b7h                               ; e8 4b f7
    mov word [bp-008h], ax                    ; 89 46 f8
    inc bx                                    ; 43
    inc bx                                    ; 43
    test byte [bp-008h], 001h                 ; f6 46 f8 01
    jne short 03a87h                          ; 75 10
    mov ax, strict word 00004h                ; b8 04 00
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov ax, word [bp-008h]                    ; 8b 46 f8
    mov dx, 001cfh                            ; ba cf 01
    out DX, ax                                ; ef
    jmp short 03af1h                          ; eb 6a
    mov ax, strict word 00001h                ; b8 01 00
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov dx, bx                                ; 89 da
    mov ax, cx                                ; 89 c8
    call 031b7h                               ; e8 22 f7
    mov dx, 001cfh                            ; ba cf 01
    out DX, ax                                ; ef
    inc bx                                    ; 43
    inc bx                                    ; 43
    mov ax, strict word 00002h                ; b8 02 00
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov dx, bx                                ; 89 da
    mov ax, cx                                ; 89 c8
    call 031b7h                               ; e8 0e f7
    mov dx, 001cfh                            ; ba cf 01
    out DX, ax                                ; ef
    inc bx                                    ; 43
    inc bx                                    ; 43
    mov ax, strict word 00003h                ; b8 03 00
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov dx, bx                                ; 89 da
    mov ax, cx                                ; 89 c8
    call 031b7h                               ; e8 fa f6
    mov dx, 001cfh                            ; ba cf 01
    out DX, ax                                ; ef
    inc bx                                    ; 43
    inc bx                                    ; 43
    mov ax, strict word 00004h                ; b8 04 00
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov ax, word [bp-008h]                    ; 8b 46 f8
    mov dx, 001cfh                            ; ba cf 01
    out DX, ax                                ; ef
    mov si, strict word 00005h                ; be 05 00
    jmp short 03adbh                          ; eb 05
    cmp si, strict byte 00009h                ; 83 fe 09
    jnbe short 03af1h                         ; 77 16
    mov ax, si                                ; 89 f0
    mov dx, 001ceh                            ; ba ce 01
    out DX, ax                                ; ef
    mov dx, bx                                ; 89 da
    mov ax, cx                                ; 89 c8
    call 031b7h                               ; e8 cf f6
    mov dx, 001cfh                            ; ba cf 01
    out DX, ax                                ; ef
    inc bx                                    ; 43
    inc bx                                    ; 43
    inc si                                    ; 46
    jmp short 03ad6h                          ; eb e5
    lea sp, [bp-006h]                         ; 8d 66 fa
    pop si                                    ; 5e
    pop cx                                    ; 59
    pop bx                                    ; 5b
    pop bp                                    ; 5d
    retn                                      ; c3
vbe_biosfn_save_restore_state_:              ; 0xc3af9 LB 0x8d
    push bp                                   ; 55
    mov bp, sp                                ; 89 e5
    push si                                   ; 56
    push di                                   ; 57
    push ax                                   ; 50
    mov si, ax                                ; 89 c6
    mov word [bp-006h], dx                    ; 89 56 fa
    mov ax, bx                                ; 89 d8
    mov bx, word [bp+004h]                    ; 8b 5e 04
    mov di, strict word 0004fh                ; bf 4f 00
    xor ah, ah                                ; 30 e4
    cmp ax, strict word 00002h                ; 3d 02 00
    je short 03b59h                           ; 74 46
    cmp ax, strict word 00001h                ; 3d 01 00
    je short 03b3dh                           ; 74 25
    test ax, ax                               ; 85 c0
    jne short 03b75h                          ; 75 59
    mov ax, word [bp-006h]                    ; 8b 46 fa
    call 02a84h                               ; e8 62 ef
    mov cx, ax                                ; 89 c1
    test byte [bp-006h], 008h                 ; f6 46 fa 08
    je short 03b2fh                           ; 74 05
    call 039fbh                               ; e8 ce fe
    add ax, cx                                ; 01 c8
    add ax, strict word 0003fh                ; 05 3f 00
    mov CL, strict byte 006h                  ; b1 06
    shr ax, CL                                ; d3 e8
    push SS                                   ; 16
    pop ES                                    ; 07
    mov word [es:bx], ax                      ; 26 89 07
    jmp short 03b78h                          ; eb 3b
    push SS                                   ; 16
    pop ES                                    ; 07
    mov bx, word [es:bx]                      ; 26 8b 1f
    mov dx, cx                                ; 89 ca
    mov ax, word [bp-006h]                    ; 8b 46 fa
    call 02ab9h                               ; e8 6f ef
    test byte [bp-006h], 008h                 ; f6 46 fa 08
    je short 03b78h                           ; 74 28
    mov dx, ax                                ; 89 c2
    mov ax, cx                                ; 89 c8
    call 03a03h                               ; e8 ac fe
    jmp short 03b78h                          ; eb 1f
    push SS                                   ; 16
    pop ES                                    ; 07
    mov bx, word [es:bx]                      ; 26 8b 1f
    mov dx, cx                                ; 89 ca
    mov ax, word [bp-006h]                    ; 8b 46 fa
    call 02e3ah                               ; e8 d4 f2
    test byte [bp-006h], 008h                 ; f6 46 fa 08
    je short 03b78h                           ; 74 0c
    mov dx, ax                                ; 89 c2
    mov ax, cx                                ; 89 c8
    call 03a5eh                               ; e8 eb fe
    jmp short 03b78h                          ; eb 03
    mov di, 00100h                            ; bf 00 01
    push SS                                   ; 16
    pop ES                                    ; 07
    mov word [es:si], di                      ; 26 89 3c
    lea sp, [bp-004h]                         ; 8d 66 fc
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop bp                                    ; 5d
    retn 00002h                               ; c2 02 00

  ; Padding 0x87a bytes at 0xc3b86
  times 2170 db 0

section VBE32 progbits vstart=0x4400 align=1 ; size=0x115 class=CODE group=AUTO
vesa_pm_start:                               ; 0xc4400 LB 0x114
    sbb byte [bx+si], al                      ; 18 00
    dec di                                    ; 4f
    add byte [bx+si], dl                      ; 00 10
    add word [bx+si], cx                      ; 01 08
    add dh, cl                                ; 00 ce
    add di, cx                                ; 01 cf
    add di, cx                                ; 01 cf
    add ax, dx                                ; 01 d0
    add word [bp-048fdh], si                  ; 01 b6 03 b7
    db  003h, 0ffh
    ; add di, di                                ; 03 ff
    db  0ffh
    db  0ffh
    jmp word [bp-07dh]                        ; ff 66 83
    sti                                       ; fb
    add byte [si+005h], dh                    ; 00 74 05
    mov eax, strict dword 066c30100h          ; 66 b8 00 01 c3 66
    db  08bh, 0c2h
    ; mov ax, dx                                ; 8b c2
    push edx                                  ; 66 52
    push eax                                  ; 66 50
    mov edx, strict dword 0b86601ceh          ; 66 ba ce 01 66 b8
    add ax, 06600h                            ; 05 00 66
    out DX, ax                                ; ef
    pop eax                                   ; 66 58
    mov edx, strict dword 0ef6601cfh          ; 66 ba cf 01 66 ef
    in eax, DX                                ; 66 ed
    pop edx                                   ; 66 5a
    db  066h, 03bh, 0d0h
    ; cmp edx, eax                              ; 66 3b d0
    jne short 0444ah                          ; 75 05
    mov eax, strict dword 066c3004fh          ; 66 b8 4f 00 c3 66
    mov ax, 0014fh                            ; b8 4f 01
    retn                                      ; c3
    cmp bl, 080h                              ; 80 fb 80
    je short 0445eh                           ; 74 0a
    cmp bl, 000h                              ; 80 fb 00
    je short 0446eh                           ; 74 15
    mov eax, strict dword 052c30100h          ; 66 b8 00 01 c3 52
    mov edx, strict dword 0a8ec03dah          ; 66 ba da 03 ec a8
    or byte [di-005h], dh                     ; 08 75 fb
    in AL, DX                                 ; ec
    test AL, strict byte 008h                 ; a8 08
    je short 04468h                           ; 74 fb
    pop dx                                    ; 5a
    push ax                                   ; 50
    push cx                                   ; 51
    push dx                                   ; 52
    push si                                   ; 56
    push di                                   ; 57
    sal dx, 010h                              ; c1 e2 10
    and cx, strict word 0ffffh                ; 81 e1 ff ff
    add byte [bx+si], al                      ; 00 00
    db  00bh, 0cah
    ; or cx, dx                                 ; 0b ca
    sal cx, 002h                              ; c1 e1 02
    db  08bh, 0c1h
    ; mov ax, cx                                ; 8b c1
    push ax                                   ; 50
    mov edx, strict dword 0b86601ceh          ; 66 ba ce 01 66 b8
    push ES                                   ; 06
    add byte [bp-011h], ah                    ; 00 66 ef
    mov edx, strict dword 0ed6601cfh          ; 66 ba cf 01 66 ed
    db  00fh, 0b7h, 0c8h
    ; movzx cx, ax                              ; 0f b7 c8
    mov edx, strict dword 0b86601ceh          ; 66 ba ce 01 66 b8
    add ax, word [bx+si]                      ; 03 00
    out DX, eax                               ; 66 ef
    mov edx, strict dword 0ed6601cfh          ; 66 ba cf 01 66 ed
    db  00fh, 0b7h, 0f0h
    ; movzx si, ax                              ; 0f b7 f0
    pop ax                                    ; 58
    cmp si, strict byte 00004h                ; 83 fe 04
    je short 044c7h                           ; 74 17
    add si, strict byte 00007h                ; 83 c6 07
    shr si, 003h                              ; c1 ee 03
    imul cx, si                               ; 0f af ce
    db  033h, 0d2h
    ; xor dx, dx                                ; 33 d2
    div cx                                    ; f7 f1
    db  08bh, 0f8h
    ; mov di, ax                                ; 8b f8
    db  08bh, 0c2h
    ; mov ax, dx                                ; 8b c2
    db  033h, 0d2h
    ; xor dx, dx                                ; 33 d2
    div si                                    ; f7 f6
    jmp short 044d3h                          ; eb 0c
    shr cx, 1                                 ; d1 e9
    db  033h, 0d2h
    ; xor dx, dx                                ; 33 d2
    div cx                                    ; f7 f1
    db  08bh, 0f8h
    ; mov di, ax                                ; 8b f8
    db  08bh, 0c2h
    ; mov ax, dx                                ; 8b c2
    sal ax, 1                                 ; d1 e0
    push edx                                  ; 66 52
    push eax                                  ; 66 50
    mov edx, strict dword 0b86601ceh          ; 66 ba ce 01 66 b8
    or byte [bx+si], al                       ; 08 00
    out DX, eax                               ; 66 ef
    pop eax                                   ; 66 58
    mov edx, strict dword 0ef6601cfh          ; 66 ba cf 01 66 ef
    pop edx                                   ; 66 5a
    db  066h, 08bh, 0c7h
    ; mov eax, edi                              ; 66 8b c7
    push edx                                  ; 66 52
    push eax                                  ; 66 50
    mov edx, strict dword 0b86601ceh          ; 66 ba ce 01 66 b8
    or word [bx+si], ax                       ; 09 00
    out DX, eax                               ; 66 ef
    pop eax                                   ; 66 58
    mov edx, strict dword 0ef6601cfh          ; 66 ba cf 01 66 ef
    pop edx                                   ; 66 5a
    pop di                                    ; 5f
    pop si                                    ; 5e
    pop dx                                    ; 5a
    pop cx                                    ; 59
    pop ax                                    ; 58
    mov eax, strict dword 066c3004fh          ; 66 b8 4f 00 c3 66
    mov ax, 0014fh                            ; b8 4f 01
vesa_pm_end:                                 ; 0xc4514 LB 0x1
    retn                                      ; c3

  ; Padding 0xeb bytes at 0xc4515
  times 235 db 0

section _DATA progbits vstart=0x4600 align=1 ; size=0x371f class=DATA group=DGROUP
_msg_vga_init:                               ; 0xc4600 LB 0x2f
    db  'Oracle VM VirtualBox Version 5.0.51 VGA BIOS', 00dh, 00ah, 000h
_vga_modes:                                  ; 0xc462f LB 0x80
    db  000h, 000h, 000h, 004h, 000h, 0b8h, 0ffh, 002h, 001h, 000h, 000h, 004h, 000h, 0b8h, 0ffh, 002h
    db  002h, 000h, 000h, 004h, 000h, 0b8h, 0ffh, 002h, 003h, 000h, 000h, 004h, 000h, 0b8h, 0ffh, 002h
    db  004h, 001h, 002h, 002h, 000h, 0b8h, 0ffh, 001h, 005h, 001h, 002h, 002h, 000h, 0b8h, 0ffh, 001h
    db  006h, 001h, 002h, 001h, 000h, 0b8h, 0ffh, 001h, 007h, 000h, 001h, 004h, 000h, 0b0h, 0ffh, 000h
    db  00dh, 001h, 004h, 004h, 000h, 0a0h, 0ffh, 001h, 00eh, 001h, 004h, 004h, 000h, 0a0h, 0ffh, 001h
    db  00fh, 001h, 003h, 001h, 000h, 0a0h, 0ffh, 000h, 010h, 001h, 004h, 004h, 000h, 0a0h, 0ffh, 002h
    db  011h, 001h, 003h, 001h, 000h, 0a0h, 0ffh, 002h, 012h, 001h, 004h, 004h, 000h, 0a0h, 0ffh, 002h
    db  013h, 001h, 005h, 008h, 000h, 0a0h, 0ffh, 003h, 06ah, 001h, 004h, 004h, 000h, 0a0h, 0ffh, 002h
_line_to_vpti:                               ; 0xc46af LB 0x10
    db  017h, 017h, 018h, 018h, 004h, 005h, 006h, 007h, 00dh, 00eh, 011h, 012h, 01ah, 01bh, 01ch, 01dh
_dac_regs:                                   ; 0xc46bf LB 0x4
    dd  0ff3f3f3fh
_video_param_table:                          ; 0xc46c3 LB 0x780
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  028h, 018h, 008h, 000h, 008h, 009h, 003h, 000h, 002h, 063h, 02dh, 027h, 028h, 090h, 02bh, 080h
    db  0bfh, 01fh, 000h, 0c1h, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 014h, 000h, 096h
    db  0b9h, 0a2h, 0ffh, 000h, 013h, 015h, 017h, 002h, 004h, 006h, 007h, 010h, 011h, 012h, 013h, 014h
    db  015h, 016h, 017h, 001h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 030h, 00fh, 00fh, 0ffh
    db  028h, 018h, 008h, 000h, 008h, 009h, 003h, 000h, 002h, 063h, 02dh, 027h, 028h, 090h, 02bh, 080h
    db  0bfh, 01fh, 000h, 0c1h, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 014h, 000h, 096h
    db  0b9h, 0a2h, 0ffh, 000h, 013h, 015h, 017h, 002h, 004h, 006h, 007h, 010h, 011h, 012h, 013h, 014h
    db  015h, 016h, 017h, 001h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 030h, 00fh, 00fh, 0ffh
    db  050h, 018h, 008h, 000h, 010h, 001h, 001h, 000h, 006h, 063h, 05fh, 04fh, 050h, 082h, 054h, 080h
    db  0bfh, 01fh, 000h, 0c1h, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 028h, 000h, 096h
    db  0b9h, 0c2h, 0ffh, 000h, 017h, 017h, 017h, 017h, 017h, 017h, 017h, 017h, 017h, 017h, 017h, 017h
    db  017h, 017h, 017h, 001h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00dh, 00fh, 0ffh
    db  050h, 018h, 010h, 000h, 010h, 000h, 003h, 000h, 002h, 066h, 05fh, 04fh, 050h, 082h, 055h, 081h
    db  0bfh, 01fh, 000h, 04fh, 00dh, 00eh, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 028h, 00fh, 096h
    db  0b9h, 0a3h, 0ffh, 000h, 008h, 008h, 008h, 008h, 008h, 008h, 008h, 010h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 00eh, 000h, 00fh, 008h, 000h, 000h, 000h, 000h, 000h, 010h, 00ah, 00fh, 0ffh
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  028h, 018h, 008h, 000h, 020h, 009h, 00fh, 000h, 006h, 063h, 02dh, 027h, 028h, 090h, 02bh, 080h
    db  0bfh, 01fh, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 014h, 000h, 096h
    db  0b9h, 0e3h, 0ffh, 000h, 001h, 002h, 003h, 004h, 005h, 006h, 007h, 010h, 011h, 012h, 013h, 014h
    db  015h, 016h, 017h, 001h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 00fh, 0ffh
    db  050h, 018h, 008h, 000h, 040h, 001h, 00fh, 000h, 006h, 063h, 05fh, 04fh, 050h, 082h, 054h, 080h
    db  0bfh, 01fh, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 028h, 000h, 096h
    db  0b9h, 0e3h, 0ffh, 000h, 001h, 002h, 003h, 004h, 005h, 006h, 007h, 010h, 011h, 012h, 013h, 014h
    db  015h, 016h, 017h, 001h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 00fh, 0ffh
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  050h, 018h, 00eh, 000h, 080h, 001h, 00fh, 000h, 006h, 0a3h, 05fh, 04fh, 050h, 082h, 054h, 080h
    db  0bfh, 01fh, 000h, 040h, 000h, 000h, 000h, 000h, 000h, 000h, 083h, 085h, 05dh, 028h, 00fh, 063h
    db  0bah, 0e3h, 0ffh, 000h, 008h, 000h, 000h, 018h, 018h, 000h, 000h, 000h, 008h, 000h, 000h, 000h
    db  018h, 000h, 000h, 001h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 00fh, 0ffh
    db  050h, 018h, 00eh, 000h, 080h, 001h, 00fh, 000h, 006h, 0a3h, 05fh, 04fh, 050h, 082h, 054h, 080h
    db  0bfh, 01fh, 000h, 040h, 000h, 000h, 000h, 000h, 000h, 000h, 083h, 085h, 05dh, 028h, 00fh, 063h
    db  0bah, 0e3h, 0ffh, 000h, 001h, 002h, 003h, 004h, 005h, 014h, 007h, 038h, 039h, 03ah, 03bh, 03ch
    db  03dh, 03eh, 03fh, 001h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 00fh, 0ffh
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  050h, 018h, 00eh, 000h, 010h, 000h, 003h, 000h, 002h, 067h, 05fh, 04fh, 050h, 082h, 055h, 081h
    db  0bfh, 01fh, 000h, 04fh, 00dh, 00eh, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 028h, 01fh, 096h
    db  0b9h, 0a3h, 0ffh, 000h, 001h, 002h, 003h, 004h, 005h, 014h, 007h, 038h, 039h, 03ah, 03bh, 03ch
    db  03dh, 03eh, 03fh, 00ch, 000h, 00fh, 008h, 000h, 000h, 000h, 000h, 000h, 010h, 00eh, 00fh, 0ffh
    db  028h, 018h, 010h, 000h, 008h, 008h, 003h, 000h, 002h, 067h, 02dh, 027h, 028h, 090h, 02bh, 0a0h
    db  0bfh, 01fh, 000h, 04fh, 00dh, 00eh, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 014h, 01fh, 096h
    db  0b9h, 0a3h, 0ffh, 000h, 001h, 002h, 003h, 004h, 005h, 014h, 007h, 038h, 039h, 03ah, 03bh, 03ch
    db  03dh, 03eh, 03fh, 00ch, 000h, 00fh, 008h, 000h, 000h, 000h, 000h, 000h, 010h, 00eh, 00fh, 0ffh
    db  050h, 018h, 010h, 000h, 010h, 000h, 003h, 000h, 002h, 067h, 05fh, 04fh, 050h, 082h, 055h, 081h
    db  0bfh, 01fh, 000h, 04fh, 00dh, 00eh, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 028h, 01fh, 096h
    db  0b9h, 0a3h, 0ffh, 000h, 001h, 002h, 003h, 004h, 005h, 014h, 007h, 038h, 039h, 03ah, 03bh, 03ch
    db  03dh, 03eh, 03fh, 00ch, 000h, 00fh, 008h, 000h, 000h, 000h, 000h, 000h, 010h, 00eh, 00fh, 0ffh
    db  050h, 018h, 010h, 000h, 010h, 000h, 003h, 000h, 002h, 066h, 05fh, 04fh, 050h, 082h, 055h, 081h
    db  0bfh, 01fh, 000h, 04fh, 00dh, 00eh, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 028h, 00fh, 096h
    db  0b9h, 0a3h, 0ffh, 000h, 008h, 008h, 008h, 008h, 008h, 008h, 008h, 010h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 00eh, 000h, 00fh, 008h, 000h, 000h, 000h, 000h, 000h, 010h, 00ah, 00fh, 0ffh
    db  050h, 01dh, 010h, 000h, 000h, 001h, 00fh, 000h, 006h, 0e3h, 05fh, 04fh, 050h, 082h, 054h, 080h
    db  00bh, 03eh, 000h, 040h, 000h, 000h, 000h, 000h, 000h, 000h, 0eah, 08ch, 0dfh, 028h, 000h, 0e7h
    db  004h, 0e3h, 0ffh, 000h, 03fh, 000h, 03fh, 000h, 03fh, 000h, 03fh, 000h, 03fh, 000h, 03fh, 000h
    db  03fh, 000h, 03fh, 001h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 00fh, 0ffh
    db  050h, 01dh, 010h, 000h, 000h, 001h, 00fh, 000h, 006h, 0e3h, 05fh, 04fh, 050h, 082h, 054h, 080h
    db  00bh, 03eh, 000h, 040h, 000h, 000h, 000h, 000h, 000h, 000h, 0eah, 08ch, 0dfh, 028h, 000h, 0e7h
    db  004h, 0e3h, 0ffh, 000h, 001h, 002h, 003h, 004h, 005h, 014h, 007h, 038h, 039h, 03ah, 03bh, 03ch
    db  03dh, 03eh, 03fh, 001h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 00fh, 0ffh
    db  028h, 018h, 008h, 000h, 000h, 001h, 00fh, 000h, 00eh, 063h, 05fh, 04fh, 050h, 082h, 054h, 080h
    db  0bfh, 01fh, 000h, 041h, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 08eh, 08fh, 028h, 040h, 096h
    db  0b9h, 0a3h, 0ffh, 000h, 001h, 002h, 003h, 004h, 005h, 006h, 007h, 008h, 009h, 00ah, 00bh, 00ch
    db  00dh, 00eh, 00fh, 041h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 040h, 005h, 00fh, 0ffh
    db  064h, 024h, 010h, 000h, 000h, 001h, 00fh, 000h, 006h, 0e3h, 07fh, 063h, 063h, 083h, 06bh, 01bh
    db  072h, 0f0h, 000h, 060h, 000h, 000h, 000h, 000h, 000h, 000h, 059h, 08dh, 057h, 032h, 000h, 057h
    db  073h, 0e3h, 0ffh, 000h, 001h, 002h, 003h, 004h, 005h, 014h, 007h, 038h, 039h, 03ah, 03bh, 03ch
    db  03dh, 03eh, 03fh, 001h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 005h, 00fh, 0ffh
_palette0:                                   ; 0xc4e43 LB 0xc0
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah
    db  02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah
    db  02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah
    db  02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh
    db  03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah
    db  02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah
    db  02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah
    db  02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh
    db  03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh, 03fh
_palette1:                                   ; 0xc4f03 LB 0xc0
    db  000h, 000h, 000h, 000h, 000h, 02ah, 000h, 02ah, 000h, 000h, 02ah, 02ah, 02ah, 000h, 000h, 02ah
    db  000h, 02ah, 02ah, 015h, 000h, 02ah, 02ah, 02ah, 000h, 000h, 000h, 000h, 000h, 02ah, 000h, 02ah
    db  000h, 000h, 02ah, 02ah, 02ah, 000h, 000h, 02ah, 000h, 02ah, 02ah, 015h, 000h, 02ah, 02ah, 02ah
    db  015h, 015h, 015h, 015h, 015h, 03fh, 015h, 03fh, 015h, 015h, 03fh, 03fh, 03fh, 015h, 015h, 03fh
    db  015h, 03fh, 03fh, 03fh, 015h, 03fh, 03fh, 03fh, 015h, 015h, 015h, 015h, 015h, 03fh, 015h, 03fh
    db  015h, 015h, 03fh, 03fh, 03fh, 015h, 015h, 03fh, 015h, 03fh, 03fh, 03fh, 015h, 03fh, 03fh, 03fh
    db  000h, 000h, 000h, 000h, 000h, 02ah, 000h, 02ah, 000h, 000h, 02ah, 02ah, 02ah, 000h, 000h, 02ah
    db  000h, 02ah, 02ah, 015h, 000h, 02ah, 02ah, 02ah, 000h, 000h, 000h, 000h, 000h, 02ah, 000h, 02ah
    db  000h, 000h, 02ah, 02ah, 02ah, 000h, 000h, 02ah, 000h, 02ah, 02ah, 015h, 000h, 02ah, 02ah, 02ah
    db  015h, 015h, 015h, 015h, 015h, 03fh, 015h, 03fh, 015h, 015h, 03fh, 03fh, 03fh, 015h, 015h, 03fh
    db  015h, 03fh, 03fh, 03fh, 015h, 03fh, 03fh, 03fh, 015h, 015h, 015h, 015h, 015h, 03fh, 015h, 03fh
    db  015h, 015h, 03fh, 03fh, 03fh, 015h, 015h, 03fh, 015h, 03fh, 03fh, 03fh, 015h, 03fh, 03fh, 03fh
_palette2:                                   ; 0xc4fc3 LB 0xc0
    db  000h, 000h, 000h, 000h, 000h, 02ah, 000h, 02ah, 000h, 000h, 02ah, 02ah, 02ah, 000h, 000h, 02ah
    db  000h, 02ah, 02ah, 02ah, 000h, 02ah, 02ah, 02ah, 000h, 000h, 015h, 000h, 000h, 03fh, 000h, 02ah
    db  015h, 000h, 02ah, 03fh, 02ah, 000h, 015h, 02ah, 000h, 03fh, 02ah, 02ah, 015h, 02ah, 02ah, 03fh
    db  000h, 015h, 000h, 000h, 015h, 02ah, 000h, 03fh, 000h, 000h, 03fh, 02ah, 02ah, 015h, 000h, 02ah
    db  015h, 02ah, 02ah, 03fh, 000h, 02ah, 03fh, 02ah, 000h, 015h, 015h, 000h, 015h, 03fh, 000h, 03fh
    db  015h, 000h, 03fh, 03fh, 02ah, 015h, 015h, 02ah, 015h, 03fh, 02ah, 03fh, 015h, 02ah, 03fh, 03fh
    db  015h, 000h, 000h, 015h, 000h, 02ah, 015h, 02ah, 000h, 015h, 02ah, 02ah, 03fh, 000h, 000h, 03fh
    db  000h, 02ah, 03fh, 02ah, 000h, 03fh, 02ah, 02ah, 015h, 000h, 015h, 015h, 000h, 03fh, 015h, 02ah
    db  015h, 015h, 02ah, 03fh, 03fh, 000h, 015h, 03fh, 000h, 03fh, 03fh, 02ah, 015h, 03fh, 02ah, 03fh
    db  015h, 015h, 000h, 015h, 015h, 02ah, 015h, 03fh, 000h, 015h, 03fh, 02ah, 03fh, 015h, 000h, 03fh
    db  015h, 02ah, 03fh, 03fh, 000h, 03fh, 03fh, 02ah, 015h, 015h, 015h, 015h, 015h, 03fh, 015h, 03fh
    db  015h, 015h, 03fh, 03fh, 03fh, 015h, 015h, 03fh, 015h, 03fh, 03fh, 03fh, 015h, 03fh, 03fh, 03fh
_palette3:                                   ; 0xc5083 LB 0x300
    db  000h, 000h, 000h, 000h, 000h, 02ah, 000h, 02ah, 000h, 000h, 02ah, 02ah, 02ah, 000h, 000h, 02ah
    db  000h, 02ah, 02ah, 015h, 000h, 02ah, 02ah, 02ah, 015h, 015h, 015h, 015h, 015h, 03fh, 015h, 03fh
    db  015h, 015h, 03fh, 03fh, 03fh, 015h, 015h, 03fh, 015h, 03fh, 03fh, 03fh, 015h, 03fh, 03fh, 03fh
    db  000h, 000h, 000h, 005h, 005h, 005h, 008h, 008h, 008h, 00bh, 00bh, 00bh, 00eh, 00eh, 00eh, 011h
    db  011h, 011h, 014h, 014h, 014h, 018h, 018h, 018h, 01ch, 01ch, 01ch, 020h, 020h, 020h, 024h, 024h
    db  024h, 028h, 028h, 028h, 02dh, 02dh, 02dh, 032h, 032h, 032h, 038h, 038h, 038h, 03fh, 03fh, 03fh
    db  000h, 000h, 03fh, 010h, 000h, 03fh, 01fh, 000h, 03fh, 02fh, 000h, 03fh, 03fh, 000h, 03fh, 03fh
    db  000h, 02fh, 03fh, 000h, 01fh, 03fh, 000h, 010h, 03fh, 000h, 000h, 03fh, 010h, 000h, 03fh, 01fh
    db  000h, 03fh, 02fh, 000h, 03fh, 03fh, 000h, 02fh, 03fh, 000h, 01fh, 03fh, 000h, 010h, 03fh, 000h
    db  000h, 03fh, 000h, 000h, 03fh, 010h, 000h, 03fh, 01fh, 000h, 03fh, 02fh, 000h, 03fh, 03fh, 000h
    db  02fh, 03fh, 000h, 01fh, 03fh, 000h, 010h, 03fh, 01fh, 01fh, 03fh, 027h, 01fh, 03fh, 02fh, 01fh
    db  03fh, 037h, 01fh, 03fh, 03fh, 01fh, 03fh, 03fh, 01fh, 037h, 03fh, 01fh, 02fh, 03fh, 01fh, 027h
    db  03fh, 01fh, 01fh, 03fh, 027h, 01fh, 03fh, 02fh, 01fh, 03fh, 037h, 01fh, 03fh, 03fh, 01fh, 037h
    db  03fh, 01fh, 02fh, 03fh, 01fh, 027h, 03fh, 01fh, 01fh, 03fh, 01fh, 01fh, 03fh, 027h, 01fh, 03fh
    db  02fh, 01fh, 03fh, 037h, 01fh, 03fh, 03fh, 01fh, 037h, 03fh, 01fh, 02fh, 03fh, 01fh, 027h, 03fh
    db  02dh, 02dh, 03fh, 031h, 02dh, 03fh, 036h, 02dh, 03fh, 03ah, 02dh, 03fh, 03fh, 02dh, 03fh, 03fh
    db  02dh, 03ah, 03fh, 02dh, 036h, 03fh, 02dh, 031h, 03fh, 02dh, 02dh, 03fh, 031h, 02dh, 03fh, 036h
    db  02dh, 03fh, 03ah, 02dh, 03fh, 03fh, 02dh, 03ah, 03fh, 02dh, 036h, 03fh, 02dh, 031h, 03fh, 02dh
    db  02dh, 03fh, 02dh, 02dh, 03fh, 031h, 02dh, 03fh, 036h, 02dh, 03fh, 03ah, 02dh, 03fh, 03fh, 02dh
    db  03ah, 03fh, 02dh, 036h, 03fh, 02dh, 031h, 03fh, 000h, 000h, 01ch, 007h, 000h, 01ch, 00eh, 000h
    db  01ch, 015h, 000h, 01ch, 01ch, 000h, 01ch, 01ch, 000h, 015h, 01ch, 000h, 00eh, 01ch, 000h, 007h
    db  01ch, 000h, 000h, 01ch, 007h, 000h, 01ch, 00eh, 000h, 01ch, 015h, 000h, 01ch, 01ch, 000h, 015h
    db  01ch, 000h, 00eh, 01ch, 000h, 007h, 01ch, 000h, 000h, 01ch, 000h, 000h, 01ch, 007h, 000h, 01ch
    db  00eh, 000h, 01ch, 015h, 000h, 01ch, 01ch, 000h, 015h, 01ch, 000h, 00eh, 01ch, 000h, 007h, 01ch
    db  00eh, 00eh, 01ch, 011h, 00eh, 01ch, 015h, 00eh, 01ch, 018h, 00eh, 01ch, 01ch, 00eh, 01ch, 01ch
    db  00eh, 018h, 01ch, 00eh, 015h, 01ch, 00eh, 011h, 01ch, 00eh, 00eh, 01ch, 011h, 00eh, 01ch, 015h
    db  00eh, 01ch, 018h, 00eh, 01ch, 01ch, 00eh, 018h, 01ch, 00eh, 015h, 01ch, 00eh, 011h, 01ch, 00eh
    db  00eh, 01ch, 00eh, 00eh, 01ch, 011h, 00eh, 01ch, 015h, 00eh, 01ch, 018h, 00eh, 01ch, 01ch, 00eh
    db  018h, 01ch, 00eh, 015h, 01ch, 00eh, 011h, 01ch, 014h, 014h, 01ch, 016h, 014h, 01ch, 018h, 014h
    db  01ch, 01ah, 014h, 01ch, 01ch, 014h, 01ch, 01ch, 014h, 01ah, 01ch, 014h, 018h, 01ch, 014h, 016h
    db  01ch, 014h, 014h, 01ch, 016h, 014h, 01ch, 018h, 014h, 01ch, 01ah, 014h, 01ch, 01ch, 014h, 01ah
    db  01ch, 014h, 018h, 01ch, 014h, 016h, 01ch, 014h, 014h, 01ch, 014h, 014h, 01ch, 016h, 014h, 01ch
    db  018h, 014h, 01ch, 01ah, 014h, 01ch, 01ch, 014h, 01ah, 01ch, 014h, 018h, 01ch, 014h, 016h, 01ch
    db  000h, 000h, 010h, 004h, 000h, 010h, 008h, 000h, 010h, 00ch, 000h, 010h, 010h, 000h, 010h, 010h
    db  000h, 00ch, 010h, 000h, 008h, 010h, 000h, 004h, 010h, 000h, 000h, 010h, 004h, 000h, 010h, 008h
    db  000h, 010h, 00ch, 000h, 010h, 010h, 000h, 00ch, 010h, 000h, 008h, 010h, 000h, 004h, 010h, 000h
    db  000h, 010h, 000h, 000h, 010h, 004h, 000h, 010h, 008h, 000h, 010h, 00ch, 000h, 010h, 010h, 000h
    db  00ch, 010h, 000h, 008h, 010h, 000h, 004h, 010h, 008h, 008h, 010h, 00ah, 008h, 010h, 00ch, 008h
    db  010h, 00eh, 008h, 010h, 010h, 008h, 010h, 010h, 008h, 00eh, 010h, 008h, 00ch, 010h, 008h, 00ah
    db  010h, 008h, 008h, 010h, 00ah, 008h, 010h, 00ch, 008h, 010h, 00eh, 008h, 010h, 010h, 008h, 00eh
    db  010h, 008h, 00ch, 010h, 008h, 00ah, 010h, 008h, 008h, 010h, 008h, 008h, 010h, 00ah, 008h, 010h
    db  00ch, 008h, 010h, 00eh, 008h, 010h, 010h, 008h, 00eh, 010h, 008h, 00ch, 010h, 008h, 00ah, 010h
    db  00bh, 00bh, 010h, 00ch, 00bh, 010h, 00dh, 00bh, 010h, 00fh, 00bh, 010h, 010h, 00bh, 010h, 010h
    db  00bh, 00fh, 010h, 00bh, 00dh, 010h, 00bh, 00ch, 010h, 00bh, 00bh, 010h, 00ch, 00bh, 010h, 00dh
    db  00bh, 010h, 00fh, 00bh, 010h, 010h, 00bh, 00fh, 010h, 00bh, 00dh, 010h, 00bh, 00ch, 010h, 00bh
    db  00bh, 010h, 00bh, 00bh, 010h, 00ch, 00bh, 010h, 00dh, 00bh, 010h, 00fh, 00bh, 010h, 010h, 00bh
    db  00fh, 010h, 00bh, 00dh, 010h, 00bh, 00ch, 010h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_static_functionality:                       ; 0xc5383 LB 0x10
    db  0ffh, 0e0h, 00fh, 000h, 000h, 000h, 000h, 007h, 002h, 008h, 0e7h, 00ch, 000h, 000h, 000h, 000h
_dcc_table:                                  ; 0xc5393 LB 0x24
    db  010h, 001h, 007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h
_secondary_save_area:                        ; 0xc53b7 LB 0x1a
    db  01ah, 000h, 093h, 053h, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_video_save_pointer_table:                   ; 0xc53d1 LB 0x1c
    db  0c3h, 046h, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  0b7h, 053h, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_vgafont8:                                   ; 0xc53ed LB 0x800
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 07eh, 081h, 0a5h, 081h, 0bdh, 099h, 081h, 07eh
    db  07eh, 0ffh, 0dbh, 0ffh, 0c3h, 0e7h, 0ffh, 07eh, 06ch, 0feh, 0feh, 0feh, 07ch, 038h, 010h, 000h
    db  010h, 038h, 07ch, 0feh, 07ch, 038h, 010h, 000h, 038h, 07ch, 038h, 0feh, 0feh, 07ch, 038h, 07ch
    db  010h, 010h, 038h, 07ch, 0feh, 07ch, 038h, 07ch, 000h, 000h, 018h, 03ch, 03ch, 018h, 000h, 000h
    db  0ffh, 0ffh, 0e7h, 0c3h, 0c3h, 0e7h, 0ffh, 0ffh, 000h, 03ch, 066h, 042h, 042h, 066h, 03ch, 000h
    db  0ffh, 0c3h, 099h, 0bdh, 0bdh, 099h, 0c3h, 0ffh, 00fh, 007h, 00fh, 07dh, 0cch, 0cch, 0cch, 078h
    db  03ch, 066h, 066h, 066h, 03ch, 018h, 07eh, 018h, 03fh, 033h, 03fh, 030h, 030h, 070h, 0f0h, 0e0h
    db  07fh, 063h, 07fh, 063h, 063h, 067h, 0e6h, 0c0h, 099h, 05ah, 03ch, 0e7h, 0e7h, 03ch, 05ah, 099h
    db  080h, 0e0h, 0f8h, 0feh, 0f8h, 0e0h, 080h, 000h, 002h, 00eh, 03eh, 0feh, 03eh, 00eh, 002h, 000h
    db  018h, 03ch, 07eh, 018h, 018h, 07eh, 03ch, 018h, 066h, 066h, 066h, 066h, 066h, 000h, 066h, 000h
    db  07fh, 0dbh, 0dbh, 07bh, 01bh, 01bh, 01bh, 000h, 03eh, 063h, 038h, 06ch, 06ch, 038h, 0cch, 078h
    db  000h, 000h, 000h, 000h, 07eh, 07eh, 07eh, 000h, 018h, 03ch, 07eh, 018h, 07eh, 03ch, 018h, 0ffh
    db  018h, 03ch, 07eh, 018h, 018h, 018h, 018h, 000h, 018h, 018h, 018h, 018h, 07eh, 03ch, 018h, 000h
    db  000h, 018h, 00ch, 0feh, 00ch, 018h, 000h, 000h, 000h, 030h, 060h, 0feh, 060h, 030h, 000h, 000h
    db  000h, 000h, 0c0h, 0c0h, 0c0h, 0feh, 000h, 000h, 000h, 024h, 066h, 0ffh, 066h, 024h, 000h, 000h
    db  000h, 018h, 03ch, 07eh, 0ffh, 0ffh, 000h, 000h, 000h, 0ffh, 0ffh, 07eh, 03ch, 018h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 030h, 078h, 078h, 030h, 030h, 000h, 030h, 000h
    db  06ch, 06ch, 06ch, 000h, 000h, 000h, 000h, 000h, 06ch, 06ch, 0feh, 06ch, 0feh, 06ch, 06ch, 000h
    db  030h, 07ch, 0c0h, 078h, 00ch, 0f8h, 030h, 000h, 000h, 0c6h, 0cch, 018h, 030h, 066h, 0c6h, 000h
    db  038h, 06ch, 038h, 076h, 0dch, 0cch, 076h, 000h, 060h, 060h, 0c0h, 000h, 000h, 000h, 000h, 000h
    db  018h, 030h, 060h, 060h, 060h, 030h, 018h, 000h, 060h, 030h, 018h, 018h, 018h, 030h, 060h, 000h
    db  000h, 066h, 03ch, 0ffh, 03ch, 066h, 000h, 000h, 000h, 030h, 030h, 0fch, 030h, 030h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 030h, 030h, 060h, 000h, 000h, 000h, 0fch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 030h, 030h, 000h, 006h, 00ch, 018h, 030h, 060h, 0c0h, 080h, 000h
    db  07ch, 0c6h, 0ceh, 0deh, 0f6h, 0e6h, 07ch, 000h, 030h, 070h, 030h, 030h, 030h, 030h, 0fch, 000h
    db  078h, 0cch, 00ch, 038h, 060h, 0cch, 0fch, 000h, 078h, 0cch, 00ch, 038h, 00ch, 0cch, 078h, 000h
    db  01ch, 03ch, 06ch, 0cch, 0feh, 00ch, 01eh, 000h, 0fch, 0c0h, 0f8h, 00ch, 00ch, 0cch, 078h, 000h
    db  038h, 060h, 0c0h, 0f8h, 0cch, 0cch, 078h, 000h, 0fch, 0cch, 00ch, 018h, 030h, 030h, 030h, 000h
    db  078h, 0cch, 0cch, 078h, 0cch, 0cch, 078h, 000h, 078h, 0cch, 0cch, 07ch, 00ch, 018h, 070h, 000h
    db  000h, 030h, 030h, 000h, 000h, 030h, 030h, 000h, 000h, 030h, 030h, 000h, 000h, 030h, 030h, 060h
    db  018h, 030h, 060h, 0c0h, 060h, 030h, 018h, 000h, 000h, 000h, 0fch, 000h, 000h, 0fch, 000h, 000h
    db  060h, 030h, 018h, 00ch, 018h, 030h, 060h, 000h, 078h, 0cch, 00ch, 018h, 030h, 000h, 030h, 000h
    db  07ch, 0c6h, 0deh, 0deh, 0deh, 0c0h, 078h, 000h, 030h, 078h, 0cch, 0cch, 0fch, 0cch, 0cch, 000h
    db  0fch, 066h, 066h, 07ch, 066h, 066h, 0fch, 000h, 03ch, 066h, 0c0h, 0c0h, 0c0h, 066h, 03ch, 000h
    db  0f8h, 06ch, 066h, 066h, 066h, 06ch, 0f8h, 000h, 0feh, 062h, 068h, 078h, 068h, 062h, 0feh, 000h
    db  0feh, 062h, 068h, 078h, 068h, 060h, 0f0h, 000h, 03ch, 066h, 0c0h, 0c0h, 0ceh, 066h, 03eh, 000h
    db  0cch, 0cch, 0cch, 0fch, 0cch, 0cch, 0cch, 000h, 078h, 030h, 030h, 030h, 030h, 030h, 078h, 000h
    db  01eh, 00ch, 00ch, 00ch, 0cch, 0cch, 078h, 000h, 0e6h, 066h, 06ch, 078h, 06ch, 066h, 0e6h, 000h
    db  0f0h, 060h, 060h, 060h, 062h, 066h, 0feh, 000h, 0c6h, 0eeh, 0feh, 0feh, 0d6h, 0c6h, 0c6h, 000h
    db  0c6h, 0e6h, 0f6h, 0deh, 0ceh, 0c6h, 0c6h, 000h, 038h, 06ch, 0c6h, 0c6h, 0c6h, 06ch, 038h, 000h
    db  0fch, 066h, 066h, 07ch, 060h, 060h, 0f0h, 000h, 078h, 0cch, 0cch, 0cch, 0dch, 078h, 01ch, 000h
    db  0fch, 066h, 066h, 07ch, 06ch, 066h, 0e6h, 000h, 078h, 0cch, 0e0h, 070h, 01ch, 0cch, 078h, 000h
    db  0fch, 0b4h, 030h, 030h, 030h, 030h, 078h, 000h, 0cch, 0cch, 0cch, 0cch, 0cch, 0cch, 0fch, 000h
    db  0cch, 0cch, 0cch, 0cch, 0cch, 078h, 030h, 000h, 0c6h, 0c6h, 0c6h, 0d6h, 0feh, 0eeh, 0c6h, 000h
    db  0c6h, 0c6h, 06ch, 038h, 038h, 06ch, 0c6h, 000h, 0cch, 0cch, 0cch, 078h, 030h, 030h, 078h, 000h
    db  0feh, 0c6h, 08ch, 018h, 032h, 066h, 0feh, 000h, 078h, 060h, 060h, 060h, 060h, 060h, 078h, 000h
    db  0c0h, 060h, 030h, 018h, 00ch, 006h, 002h, 000h, 078h, 018h, 018h, 018h, 018h, 018h, 078h, 000h
    db  010h, 038h, 06ch, 0c6h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh
    db  030h, 030h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 078h, 00ch, 07ch, 0cch, 076h, 000h
    db  0e0h, 060h, 060h, 07ch, 066h, 066h, 0dch, 000h, 000h, 000h, 078h, 0cch, 0c0h, 0cch, 078h, 000h
    db  01ch, 00ch, 00ch, 07ch, 0cch, 0cch, 076h, 000h, 000h, 000h, 078h, 0cch, 0fch, 0c0h, 078h, 000h
    db  038h, 06ch, 060h, 0f0h, 060h, 060h, 0f0h, 000h, 000h, 000h, 076h, 0cch, 0cch, 07ch, 00ch, 0f8h
    db  0e0h, 060h, 06ch, 076h, 066h, 066h, 0e6h, 000h, 030h, 000h, 070h, 030h, 030h, 030h, 078h, 000h
    db  00ch, 000h, 00ch, 00ch, 00ch, 0cch, 0cch, 078h, 0e0h, 060h, 066h, 06ch, 078h, 06ch, 0e6h, 000h
    db  070h, 030h, 030h, 030h, 030h, 030h, 078h, 000h, 000h, 000h, 0cch, 0feh, 0feh, 0d6h, 0c6h, 000h
    db  000h, 000h, 0f8h, 0cch, 0cch, 0cch, 0cch, 000h, 000h, 000h, 078h, 0cch, 0cch, 0cch, 078h, 000h
    db  000h, 000h, 0dch, 066h, 066h, 07ch, 060h, 0f0h, 000h, 000h, 076h, 0cch, 0cch, 07ch, 00ch, 01eh
    db  000h, 000h, 0dch, 076h, 066h, 060h, 0f0h, 000h, 000h, 000h, 07ch, 0c0h, 078h, 00ch, 0f8h, 000h
    db  010h, 030h, 07ch, 030h, 030h, 034h, 018h, 000h, 000h, 000h, 0cch, 0cch, 0cch, 0cch, 076h, 000h
    db  000h, 000h, 0cch, 0cch, 0cch, 078h, 030h, 000h, 000h, 000h, 0c6h, 0d6h, 0feh, 0feh, 06ch, 000h
    db  000h, 000h, 0c6h, 06ch, 038h, 06ch, 0c6h, 000h, 000h, 000h, 0cch, 0cch, 0cch, 07ch, 00ch, 0f8h
    db  000h, 000h, 0fch, 098h, 030h, 064h, 0fch, 000h, 01ch, 030h, 030h, 0e0h, 030h, 030h, 01ch, 000h
    db  018h, 018h, 018h, 000h, 018h, 018h, 018h, 000h, 0e0h, 030h, 030h, 01ch, 030h, 030h, 0e0h, 000h
    db  076h, 0dch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 010h, 038h, 06ch, 0c6h, 0c6h, 0feh, 000h
    db  078h, 0cch, 0c0h, 0cch, 078h, 018h, 00ch, 078h, 000h, 0cch, 000h, 0cch, 0cch, 0cch, 07eh, 000h
    db  01ch, 000h, 078h, 0cch, 0fch, 0c0h, 078h, 000h, 07eh, 0c3h, 03ch, 006h, 03eh, 066h, 03fh, 000h
    db  0cch, 000h, 078h, 00ch, 07ch, 0cch, 07eh, 000h, 0e0h, 000h, 078h, 00ch, 07ch, 0cch, 07eh, 000h
    db  030h, 030h, 078h, 00ch, 07ch, 0cch, 07eh, 000h, 000h, 000h, 078h, 0c0h, 0c0h, 078h, 00ch, 038h
    db  07eh, 0c3h, 03ch, 066h, 07eh, 060h, 03ch, 000h, 0cch, 000h, 078h, 0cch, 0fch, 0c0h, 078h, 000h
    db  0e0h, 000h, 078h, 0cch, 0fch, 0c0h, 078h, 000h, 0cch, 000h, 070h, 030h, 030h, 030h, 078h, 000h
    db  07ch, 0c6h, 038h, 018h, 018h, 018h, 03ch, 000h, 0e0h, 000h, 070h, 030h, 030h, 030h, 078h, 000h
    db  0c6h, 038h, 06ch, 0c6h, 0feh, 0c6h, 0c6h, 000h, 030h, 030h, 000h, 078h, 0cch, 0fch, 0cch, 000h
    db  01ch, 000h, 0fch, 060h, 078h, 060h, 0fch, 000h, 000h, 000h, 07fh, 00ch, 07fh, 0cch, 07fh, 000h
    db  03eh, 06ch, 0cch, 0feh, 0cch, 0cch, 0ceh, 000h, 078h, 0cch, 000h, 078h, 0cch, 0cch, 078h, 000h
    db  000h, 0cch, 000h, 078h, 0cch, 0cch, 078h, 000h, 000h, 0e0h, 000h, 078h, 0cch, 0cch, 078h, 000h
    db  078h, 0cch, 000h, 0cch, 0cch, 0cch, 07eh, 000h, 000h, 0e0h, 000h, 0cch, 0cch, 0cch, 07eh, 000h
    db  000h, 0cch, 000h, 0cch, 0cch, 07ch, 00ch, 0f8h, 0c3h, 018h, 03ch, 066h, 066h, 03ch, 018h, 000h
    db  0cch, 000h, 0cch, 0cch, 0cch, 0cch, 078h, 000h, 018h, 018h, 07eh, 0c0h, 0c0h, 07eh, 018h, 018h
    db  038h, 06ch, 064h, 0f0h, 060h, 0e6h, 0fch, 000h, 0cch, 0cch, 078h, 0fch, 030h, 0fch, 030h, 030h
    db  0f8h, 0cch, 0cch, 0fah, 0c6h, 0cfh, 0c6h, 0c7h, 00eh, 01bh, 018h, 03ch, 018h, 018h, 0d8h, 070h
    db  01ch, 000h, 078h, 00ch, 07ch, 0cch, 07eh, 000h, 038h, 000h, 070h, 030h, 030h, 030h, 078h, 000h
    db  000h, 01ch, 000h, 078h, 0cch, 0cch, 078h, 000h, 000h, 01ch, 000h, 0cch, 0cch, 0cch, 07eh, 000h
    db  000h, 0f8h, 000h, 0f8h, 0cch, 0cch, 0cch, 000h, 0fch, 000h, 0cch, 0ech, 0fch, 0dch, 0cch, 000h
    db  03ch, 06ch, 06ch, 03eh, 000h, 07eh, 000h, 000h, 038h, 06ch, 06ch, 038h, 000h, 07ch, 000h, 000h
    db  030h, 000h, 030h, 060h, 0c0h, 0cch, 078h, 000h, 000h, 000h, 000h, 0fch, 0c0h, 0c0h, 000h, 000h
    db  000h, 000h, 000h, 0fch, 00ch, 00ch, 000h, 000h, 0c3h, 0c6h, 0cch, 0deh, 033h, 066h, 0cch, 00fh
    db  0c3h, 0c6h, 0cch, 0dbh, 037h, 06fh, 0cfh, 003h, 018h, 018h, 000h, 018h, 018h, 018h, 018h, 000h
    db  000h, 033h, 066h, 0cch, 066h, 033h, 000h, 000h, 000h, 0cch, 066h, 033h, 066h, 0cch, 000h, 000h
    db  022h, 088h, 022h, 088h, 022h, 088h, 022h, 088h, 055h, 0aah, 055h, 0aah, 055h, 0aah, 055h, 0aah
    db  0dbh, 077h, 0dbh, 0eeh, 0dbh, 077h, 0dbh, 0eeh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 0f8h, 018h, 018h, 018h, 018h, 018h, 0f8h, 018h, 0f8h, 018h, 018h, 018h
    db  036h, 036h, 036h, 036h, 0f6h, 036h, 036h, 036h, 000h, 000h, 000h, 000h, 0feh, 036h, 036h, 036h
    db  000h, 000h, 0f8h, 018h, 0f8h, 018h, 018h, 018h, 036h, 036h, 0f6h, 006h, 0f6h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 000h, 000h, 0feh, 006h, 0f6h, 036h, 036h, 036h
    db  036h, 036h, 0f6h, 006h, 0feh, 000h, 000h, 000h, 036h, 036h, 036h, 036h, 0feh, 000h, 000h, 000h
    db  018h, 018h, 0f8h, 018h, 0f8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0f8h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 01fh, 000h, 000h, 000h, 018h, 018h, 018h, 018h, 0ffh, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 0ffh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 01fh, 018h, 018h, 018h
    db  000h, 000h, 000h, 000h, 0ffh, 000h, 000h, 000h, 018h, 018h, 018h, 018h, 0ffh, 018h, 018h, 018h
    db  018h, 018h, 01fh, 018h, 01fh, 018h, 018h, 018h, 036h, 036h, 036h, 036h, 037h, 036h, 036h, 036h
    db  036h, 036h, 037h, 030h, 03fh, 000h, 000h, 000h, 000h, 000h, 03fh, 030h, 037h, 036h, 036h, 036h
    db  036h, 036h, 0f7h, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0f7h, 036h, 036h, 036h
    db  036h, 036h, 037h, 030h, 037h, 036h, 036h, 036h, 000h, 000h, 0ffh, 000h, 0ffh, 000h, 000h, 000h
    db  036h, 036h, 0f7h, 000h, 0f7h, 036h, 036h, 036h, 018h, 018h, 0ffh, 000h, 0ffh, 000h, 000h, 000h
    db  036h, 036h, 036h, 036h, 0ffh, 000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh, 018h, 018h, 018h
    db  000h, 000h, 000h, 000h, 0ffh, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 03fh, 000h, 000h, 000h
    db  018h, 018h, 01fh, 018h, 01fh, 000h, 000h, 000h, 000h, 000h, 01fh, 018h, 01fh, 018h, 018h, 018h
    db  000h, 000h, 000h, 000h, 03fh, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 0ffh, 036h, 036h, 036h
    db  018h, 018h, 0ffh, 018h, 0ffh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 0f8h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 01fh, 018h, 018h, 018h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db  000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h
    db  00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h
    db  000h, 000h, 076h, 0dch, 0c8h, 0dch, 076h, 000h, 000h, 078h, 0cch, 0f8h, 0cch, 0f8h, 0c0h, 0c0h
    db  000h, 0fch, 0cch, 0c0h, 0c0h, 0c0h, 0c0h, 000h, 000h, 0feh, 06ch, 06ch, 06ch, 06ch, 06ch, 000h
    db  0fch, 0cch, 060h, 030h, 060h, 0cch, 0fch, 000h, 000h, 000h, 07eh, 0d8h, 0d8h, 0d8h, 070h, 000h
    db  000h, 066h, 066h, 066h, 066h, 07ch, 060h, 0c0h, 000h, 076h, 0dch, 018h, 018h, 018h, 018h, 000h
    db  0fch, 030h, 078h, 0cch, 0cch, 078h, 030h, 0fch, 038h, 06ch, 0c6h, 0feh, 0c6h, 06ch, 038h, 000h
    db  038h, 06ch, 0c6h, 0c6h, 06ch, 06ch, 0eeh, 000h, 01ch, 030h, 018h, 07ch, 0cch, 0cch, 078h, 000h
    db  000h, 000h, 07eh, 0dbh, 0dbh, 07eh, 000h, 000h, 006h, 00ch, 07eh, 0dbh, 0dbh, 07eh, 060h, 0c0h
    db  038h, 060h, 0c0h, 0f8h, 0c0h, 060h, 038h, 000h, 078h, 0cch, 0cch, 0cch, 0cch, 0cch, 0cch, 000h
    db  000h, 0fch, 000h, 0fch, 000h, 0fch, 000h, 000h, 030h, 030h, 0fch, 030h, 030h, 000h, 0fch, 000h
    db  060h, 030h, 018h, 030h, 060h, 000h, 0fch, 000h, 018h, 030h, 060h, 030h, 018h, 000h, 0fch, 000h
    db  00eh, 01bh, 01bh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 0d8h, 0d8h, 070h
    db  030h, 030h, 000h, 0fch, 000h, 030h, 030h, 000h, 000h, 076h, 0dch, 000h, 076h, 0dch, 000h, 000h
    db  038h, 06ch, 06ch, 038h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 018h, 000h, 000h, 000h, 00fh, 00ch, 00ch, 00ch, 0ech, 06ch, 03ch, 01ch
    db  078h, 06ch, 06ch, 06ch, 06ch, 000h, 000h, 000h, 070h, 018h, 030h, 060h, 078h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 03ch, 03ch, 03ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_vgafont14:                                  ; 0xc5bed LB 0xe00
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  07eh, 081h, 0a5h, 081h, 081h, 0bdh, 099h, 081h, 07eh, 000h, 000h, 000h, 000h, 000h, 07eh, 0ffh
    db  0dbh, 0ffh, 0ffh, 0c3h, 0e7h, 0ffh, 07eh, 000h, 000h, 000h, 000h, 000h, 000h, 06ch, 0feh, 0feh
    db  0feh, 0feh, 07ch, 038h, 010h, 000h, 000h, 000h, 000h, 000h, 000h, 010h, 038h, 07ch, 0feh, 07ch
    db  038h, 010h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 03ch, 03ch, 0e7h, 0e7h, 0e7h, 018h, 018h
    db  03ch, 000h, 000h, 000h, 000h, 000h, 018h, 03ch, 07eh, 0ffh, 0ffh, 07eh, 018h, 018h, 03ch, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 03ch, 03ch, 018h, 000h, 000h, 000h, 000h, 000h
    db  0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0e7h, 0c3h, 0c3h, 0e7h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h
    db  000h, 000h, 03ch, 066h, 042h, 042h, 066h, 03ch, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh
    db  0c3h, 099h, 0bdh, 0bdh, 099h, 0c3h, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 01eh, 00eh, 01ah, 032h
    db  078h, 0cch, 0cch, 0cch, 078h, 000h, 000h, 000h, 000h, 000h, 03ch, 066h, 066h, 066h, 03ch, 018h
    db  07eh, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 03fh, 033h, 03fh, 030h, 030h, 030h, 070h, 0f0h
    db  0e0h, 000h, 000h, 000h, 000h, 000h, 07fh, 063h, 07fh, 063h, 063h, 063h, 067h, 0e7h, 0e6h, 0c0h
    db  000h, 000h, 000h, 000h, 018h, 018h, 0dbh, 03ch, 0e7h, 03ch, 0dbh, 018h, 018h, 000h, 000h, 000h
    db  000h, 000h, 080h, 0c0h, 0e0h, 0f8h, 0feh, 0f8h, 0e0h, 0c0h, 080h, 000h, 000h, 000h, 000h, 000h
    db  002h, 006h, 00eh, 03eh, 0feh, 03eh, 00eh, 006h, 002h, 000h, 000h, 000h, 000h, 000h, 018h, 03ch
    db  07eh, 018h, 018h, 018h, 07eh, 03ch, 018h, 000h, 000h, 000h, 000h, 000h, 066h, 066h, 066h, 066h
    db  066h, 066h, 000h, 066h, 066h, 000h, 000h, 000h, 000h, 000h, 07fh, 0dbh, 0dbh, 0dbh, 07bh, 01bh
    db  01bh, 01bh, 01bh, 000h, 000h, 000h, 000h, 07ch, 0c6h, 060h, 038h, 06ch, 0c6h, 0c6h, 06ch, 038h
    db  00ch, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0feh, 0feh, 0feh, 000h
    db  000h, 000h, 000h, 000h, 018h, 03ch, 07eh, 018h, 018h, 018h, 07eh, 03ch, 018h, 07eh, 000h, 000h
    db  000h, 000h, 018h, 03ch, 07eh, 018h, 018h, 018h, 018h, 018h, 018h, 000h, 000h, 000h, 000h, 000h
    db  018h, 018h, 018h, 018h, 018h, 018h, 07eh, 03ch, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  018h, 00ch, 0feh, 00ch, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 030h, 060h
    db  0feh, 060h, 030h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c0h, 0c0h, 0c0h
    db  0feh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 06ch, 0feh, 06ch, 028h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 010h, 038h, 038h, 07ch, 07ch, 0feh, 0feh, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0feh, 0feh, 07ch, 07ch, 038h, 038h, 010h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  018h, 03ch, 03ch, 03ch, 018h, 018h, 000h, 018h, 018h, 000h, 000h, 000h, 000h, 066h, 066h, 066h
    db  024h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 06ch, 06ch, 0feh, 06ch
    db  06ch, 06ch, 0feh, 06ch, 06ch, 000h, 000h, 000h, 018h, 018h, 07ch, 0c6h, 0c2h, 0c0h, 07ch, 006h
    db  086h, 0c6h, 07ch, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 0c2h, 0c6h, 00ch, 018h, 030h, 066h
    db  0c6h, 000h, 000h, 000h, 000h, 000h, 038h, 06ch, 06ch, 038h, 076h, 0dch, 0cch, 0cch, 076h, 000h
    db  000h, 000h, 000h, 030h, 030h, 030h, 060h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 00ch, 018h, 030h, 030h, 030h, 030h, 030h, 018h, 00ch, 000h, 000h, 000h, 000h, 000h
    db  030h, 018h, 00ch, 00ch, 00ch, 00ch, 00ch, 018h, 030h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  066h, 03ch, 0ffh, 03ch, 066h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h
    db  07eh, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  018h, 018h, 018h, 030h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0feh, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 000h
    db  000h, 000h, 000h, 000h, 002h, 006h, 00ch, 018h, 030h, 060h, 0c0h, 080h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0ceh, 0deh, 0f6h, 0e6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h
    db  018h, 038h, 078h, 018h, 018h, 018h, 018h, 018h, 07eh, 000h, 000h, 000h, 000h, 000h, 07ch, 0c6h
    db  006h, 00ch, 018h, 030h, 060h, 0c6h, 0feh, 000h, 000h, 000h, 000h, 000h, 07ch, 0c6h, 006h, 006h
    db  03ch, 006h, 006h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h, 00ch, 01ch, 03ch, 06ch, 0cch, 0feh
    db  00ch, 00ch, 01eh, 000h, 000h, 000h, 000h, 000h, 0feh, 0c0h, 0c0h, 0c0h, 0fch, 006h, 006h, 0c6h
    db  07ch, 000h, 000h, 000h, 000h, 000h, 038h, 060h, 0c0h, 0c0h, 0fch, 0c6h, 0c6h, 0c6h, 07ch, 000h
    db  000h, 000h, 000h, 000h, 0feh, 0c6h, 006h, 00ch, 018h, 030h, 030h, 030h, 030h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 07ch, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h
    db  07ch, 0c6h, 0c6h, 0c6h, 07eh, 006h, 006h, 00ch, 078h, 000h, 000h, 000h, 000h, 000h, 000h, 018h
    db  018h, 000h, 000h, 000h, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 000h
    db  000h, 000h, 018h, 018h, 030h, 000h, 000h, 000h, 000h, 000h, 006h, 00ch, 018h, 030h, 060h, 030h
    db  018h, 00ch, 006h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 07eh, 000h, 000h, 07eh, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 060h, 030h, 018h, 00ch, 006h, 00ch, 018h, 030h, 060h, 000h
    db  000h, 000h, 000h, 000h, 07ch, 0c6h, 0c6h, 00ch, 018h, 018h, 000h, 018h, 018h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0c6h, 0deh, 0deh, 0deh, 0dch, 0c0h, 07ch, 000h, 000h, 000h, 000h, 000h
    db  010h, 038h, 06ch, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h, 000h, 000h, 0fch, 066h
    db  066h, 066h, 07ch, 066h, 066h, 066h, 0fch, 000h, 000h, 000h, 000h, 000h, 03ch, 066h, 0c2h, 0c0h
    db  0c0h, 0c0h, 0c2h, 066h, 03ch, 000h, 000h, 000h, 000h, 000h, 0f8h, 06ch, 066h, 066h, 066h, 066h
    db  066h, 06ch, 0f8h, 000h, 000h, 000h, 000h, 000h, 0feh, 066h, 062h, 068h, 078h, 068h, 062h, 066h
    db  0feh, 000h, 000h, 000h, 000h, 000h, 0feh, 066h, 062h, 068h, 078h, 068h, 060h, 060h, 0f0h, 000h
    db  000h, 000h, 000h, 000h, 03ch, 066h, 0c2h, 0c0h, 0c0h, 0deh, 0c6h, 066h, 03ah, 000h, 000h, 000h
    db  000h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h, 000h, 000h
    db  03ch, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h, 000h, 01eh, 00ch
    db  00ch, 00ch, 00ch, 00ch, 0cch, 0cch, 078h, 000h, 000h, 000h, 000h, 000h, 0e6h, 066h, 06ch, 06ch
    db  078h, 06ch, 06ch, 066h, 0e6h, 000h, 000h, 000h, 000h, 000h, 0f0h, 060h, 060h, 060h, 060h, 060h
    db  062h, 066h, 0feh, 000h, 000h, 000h, 000h, 000h, 0c6h, 0eeh, 0feh, 0feh, 0d6h, 0c6h, 0c6h, 0c6h
    db  0c6h, 000h, 000h, 000h, 000h, 000h, 0c6h, 0e6h, 0f6h, 0feh, 0deh, 0ceh, 0c6h, 0c6h, 0c6h, 000h
    db  000h, 000h, 000h, 000h, 038h, 06ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 06ch, 038h, 000h, 000h, 000h
    db  000h, 000h, 0fch, 066h, 066h, 066h, 07ch, 060h, 060h, 060h, 0f0h, 000h, 000h, 000h, 000h, 000h
    db  07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0d6h, 0deh, 07ch, 00ch, 00eh, 000h, 000h, 000h, 000h, 0fch, 066h
    db  066h, 066h, 07ch, 06ch, 066h, 066h, 0e6h, 000h, 000h, 000h, 000h, 000h, 07ch, 0c6h, 0c6h, 060h
    db  038h, 00ch, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h, 07eh, 07eh, 05ah, 018h, 018h, 018h
    db  018h, 018h, 03ch, 000h, 000h, 000h, 000h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h
    db  07ch, 000h, 000h, 000h, 000h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 06ch, 038h, 010h, 000h
    db  000h, 000h, 000h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 0d6h, 0d6h, 0feh, 07ch, 06ch, 000h, 000h, 000h
    db  000h, 000h, 0c6h, 0c6h, 06ch, 038h, 038h, 038h, 06ch, 0c6h, 0c6h, 000h, 000h, 000h, 000h, 000h
    db  066h, 066h, 066h, 066h, 03ch, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h, 000h, 0feh, 0c6h
    db  08ch, 018h, 030h, 060h, 0c2h, 0c6h, 0feh, 000h, 000h, 000h, 000h, 000h, 03ch, 030h, 030h, 030h
    db  030h, 030h, 030h, 030h, 03ch, 000h, 000h, 000h, 000h, 000h, 080h, 0c0h, 0e0h, 070h, 038h, 01ch
    db  00eh, 006h, 002h, 000h, 000h, 000h, 000h, 000h, 03ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch
    db  03ch, 000h, 000h, 000h, 010h, 038h, 06ch, 0c6h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 000h
    db  030h, 030h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 078h, 00ch, 07ch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h, 000h, 0e0h, 060h
    db  060h, 078h, 06ch, 066h, 066h, 066h, 07ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 07ch
    db  0c6h, 0c0h, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h, 01ch, 00ch, 00ch, 03ch, 06ch, 0cch
    db  0cch, 0cch, 076h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 07ch, 0c6h, 0feh, 0c0h, 0c6h
    db  07ch, 000h, 000h, 000h, 000h, 000h, 038h, 06ch, 064h, 060h, 0f0h, 060h, 060h, 060h, 0f0h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 076h, 0cch, 0cch, 0cch, 07ch, 00ch, 0cch, 078h, 000h
    db  000h, 000h, 0e0h, 060h, 060h, 06ch, 076h, 066h, 066h, 066h, 0e6h, 000h, 000h, 000h, 000h, 000h
    db  018h, 018h, 000h, 038h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h, 000h, 006h, 006h
    db  000h, 00eh, 006h, 006h, 006h, 006h, 066h, 066h, 03ch, 000h, 000h, 000h, 0e0h, 060h, 060h, 066h
    db  06ch, 078h, 06ch, 066h, 0e6h, 000h, 000h, 000h, 000h, 000h, 038h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 03ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ech, 0feh, 0d6h, 0d6h, 0d6h
    db  0c6h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0dch, 066h, 066h, 066h, 066h, 066h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0dch, 066h, 066h, 066h, 07ch, 060h, 060h, 0f0h, 000h, 000h, 000h
    db  000h, 000h, 000h, 076h, 0cch, 0cch, 0cch, 07ch, 00ch, 00ch, 01eh, 000h, 000h, 000h, 000h, 000h
    db  000h, 0dch, 076h, 066h, 060h, 060h, 0f0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 07ch
    db  0c6h, 070h, 01ch, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h, 010h, 030h, 030h, 0fch, 030h, 030h
    db  030h, 036h, 01ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0cch, 0cch, 0cch, 0cch, 0cch
    db  076h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 066h, 066h, 066h, 066h, 03ch, 018h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c6h, 0c6h, 0d6h, 0d6h, 0feh, 06ch, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0c6h, 06ch, 038h, 038h, 06ch, 0c6h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 07eh, 006h, 00ch, 0f8h, 000h, 000h, 000h, 000h, 000h
    db  000h, 0feh, 0cch, 018h, 030h, 066h, 0feh, 000h, 000h, 000h, 000h, 000h, 00eh, 018h, 018h, 018h
    db  070h, 018h, 018h, 018h, 00eh, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 018h, 018h, 000h, 018h
    db  018h, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 070h, 018h, 018h, 018h, 00eh, 018h, 018h, 018h
    db  070h, 000h, 000h, 000h, 000h, 000h, 076h, 0dch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 010h, 038h, 06ch, 0c6h, 0c6h, 0feh, 000h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 066h, 0c2h, 0c0h, 0c0h, 0c2h, 066h, 03ch, 00ch, 006h, 07ch, 000h, 000h, 000h
    db  0cch, 0cch, 000h, 0cch, 0cch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h, 00ch, 018h, 030h
    db  000h, 07ch, 0c6h, 0feh, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 010h, 038h, 06ch, 000h, 078h
    db  00ch, 07ch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h, 000h, 0cch, 0cch, 000h, 078h, 00ch, 07ch
    db  0cch, 0cch, 076h, 000h, 000h, 000h, 000h, 060h, 030h, 018h, 000h, 078h, 00ch, 07ch, 0cch, 0cch
    db  076h, 000h, 000h, 000h, 000h, 038h, 06ch, 038h, 000h, 078h, 00ch, 07ch, 0cch, 0cch, 076h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 03ch, 066h, 060h, 066h, 03ch, 00ch, 006h, 03ch, 000h, 000h
    db  000h, 010h, 038h, 06ch, 000h, 07ch, 0c6h, 0feh, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h
    db  0cch, 0cch, 000h, 07ch, 0c6h, 0feh, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 060h, 030h, 018h
    db  000h, 07ch, 0c6h, 0feh, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h, 066h, 066h, 000h, 038h
    db  018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h, 018h, 03ch, 066h, 000h, 038h, 018h, 018h
    db  018h, 018h, 03ch, 000h, 000h, 000h, 000h, 060h, 030h, 018h, 000h, 038h, 018h, 018h, 018h, 018h
    db  03ch, 000h, 000h, 000h, 000h, 0c6h, 0c6h, 010h, 038h, 06ch, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 000h
    db  000h, 000h, 038h, 06ch, 038h, 000h, 038h, 06ch, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 000h, 000h, 000h
    db  018h, 030h, 060h, 000h, 0feh, 066h, 060h, 07ch, 060h, 066h, 0feh, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0cch, 076h, 036h, 07eh, 0d8h, 0d8h, 06eh, 000h, 000h, 000h, 000h, 000h, 03eh, 06ch
    db  0cch, 0cch, 0feh, 0cch, 0cch, 0cch, 0ceh, 000h, 000h, 000h, 000h, 010h, 038h, 06ch, 000h, 07ch
    db  0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h, 0c6h, 0c6h, 000h, 07ch, 0c6h, 0c6h
    db  0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 060h, 030h, 018h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h
    db  07ch, 000h, 000h, 000h, 000h, 030h, 078h, 0cch, 000h, 0cch, 0cch, 0cch, 0cch, 0cch, 076h, 000h
    db  000h, 000h, 000h, 060h, 030h, 018h, 000h, 0cch, 0cch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h
    db  000h, 000h, 0c6h, 0c6h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 07eh, 006h, 00ch, 078h, 000h, 000h, 0c6h
    db  0c6h, 038h, 06ch, 0c6h, 0c6h, 0c6h, 0c6h, 06ch, 038h, 000h, 000h, 000h, 000h, 0c6h, 0c6h, 000h
    db  0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 018h, 018h, 03ch, 066h, 060h
    db  060h, 066h, 03ch, 018h, 018h, 000h, 000h, 000h, 000h, 038h, 06ch, 064h, 060h, 0f0h, 060h, 060h
    db  060h, 0e6h, 0fch, 000h, 000h, 000h, 000h, 000h, 066h, 066h, 03ch, 018h, 07eh, 018h, 07eh, 018h
    db  018h, 000h, 000h, 000h, 000h, 0f8h, 0cch, 0cch, 0f8h, 0c4h, 0cch, 0deh, 0cch, 0cch, 0c6h, 000h
    db  000h, 000h, 000h, 00eh, 01bh, 018h, 018h, 018h, 07eh, 018h, 018h, 018h, 018h, 0d8h, 070h, 000h
    db  000h, 018h, 030h, 060h, 000h, 078h, 00ch, 07ch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h, 00ch
    db  018h, 030h, 000h, 038h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h, 018h, 030h, 060h
    db  000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 018h, 030h, 060h, 000h, 0cch
    db  0cch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h, 000h, 076h, 0dch, 000h, 0dch, 066h, 066h
    db  066h, 066h, 066h, 000h, 000h, 000h, 076h, 0dch, 000h, 0c6h, 0e6h, 0f6h, 0feh, 0deh, 0ceh, 0c6h
    db  0c6h, 000h, 000h, 000h, 000h, 03ch, 06ch, 06ch, 03eh, 000h, 07eh, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 038h, 06ch, 06ch, 038h, 000h, 07ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 030h, 030h, 000h, 030h, 030h, 060h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 0feh, 0c0h, 0c0h, 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0feh, 006h, 006h, 006h, 000h, 000h, 000h, 000h, 000h, 0c0h, 0c0h, 0c6h, 0cch, 0d8h
    db  030h, 060h, 0dch, 086h, 00ch, 018h, 03eh, 000h, 000h, 0c0h, 0c0h, 0c6h, 0cch, 0d8h, 030h, 066h
    db  0ceh, 09eh, 03eh, 006h, 006h, 000h, 000h, 000h, 018h, 018h, 000h, 018h, 018h, 03ch, 03ch, 03ch
    db  018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 036h, 06ch, 0d8h, 06ch, 036h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 0d8h, 06ch, 036h, 06ch, 0d8h, 000h, 000h, 000h, 000h, 000h
    db  011h, 044h, 011h, 044h, 011h, 044h, 011h, 044h, 011h, 044h, 011h, 044h, 011h, 044h, 055h, 0aah
    db  055h, 0aah, 055h, 0aah, 055h, 0aah, 055h, 0aah, 055h, 0aah, 055h, 0aah, 0ddh, 077h, 0ddh, 077h
    db  0ddh, 077h, 0ddh, 077h, 0ddh, 077h, 0ddh, 077h, 0ddh, 077h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 0f8h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 0f8h, 018h, 0f8h, 018h, 018h
    db  018h, 018h, 018h, 018h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 0f6h, 036h, 036h, 036h, 036h
    db  036h, 036h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0feh, 036h, 036h, 036h, 036h, 036h, 036h
    db  000h, 000h, 000h, 000h, 000h, 0f8h, 018h, 0f8h, 018h, 018h, 018h, 018h, 018h, 018h, 036h, 036h
    db  036h, 036h, 036h, 0f6h, 006h, 0f6h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 000h, 000h, 000h, 000h, 000h, 0feh
    db  006h, 0f6h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 0f6h, 006h, 0feh
    db  000h, 000h, 000h, 000h, 000h, 000h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 0feh, 000h, 000h
    db  000h, 000h, 000h, 000h, 018h, 018h, 018h, 018h, 018h, 0f8h, 018h, 0f8h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0f8h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 01fh, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 0ffh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 01fh, 018h, 018h, 018h, 018h, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh
    db  000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 0ffh, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 01fh, 018h, 01fh, 018h, 018h, 018h, 018h
    db  018h, 018h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 037h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 037h, 030h, 03fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 03fh, 030h, 037h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 0f7h, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh
    db  000h, 0f7h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 037h, 030h, 037h
    db  036h, 036h, 036h, 036h, 036h, 036h, 000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh, 000h, 000h
    db  000h, 000h, 000h, 000h, 036h, 036h, 036h, 036h, 036h, 0f7h, 000h, 0f7h, 036h, 036h, 036h, 036h
    db  036h, 036h, 018h, 018h, 018h, 018h, 018h, 0ffh, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 0ffh, 000h, 0ffh, 018h, 018h, 018h, 018h, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 0ffh, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 03fh, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 018h, 018h, 018h, 01fh, 018h, 01fh
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01fh, 018h, 01fh, 018h, 018h
    db  018h, 018h, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03fh, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 0ffh, 036h, 036h, 036h, 036h, 036h, 036h
    db  018h, 018h, 018h, 018h, 018h, 0ffh, 018h, 0ffh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 0f8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 01fh, 018h, 018h, 018h, 018h, 018h, 018h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db  0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh
    db  0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h
    db  0f0h, 0f0h, 0f0h, 0f0h, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh
    db  00fh, 00fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 076h, 0dch, 0d8h, 0d8h, 0dch, 076h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0fch, 0c6h, 0c6h, 0fch, 0c0h, 0c0h, 040h, 000h, 000h, 000h, 0feh, 0c6h
    db  0c6h, 0c0h, 0c0h, 0c0h, 0c0h, 0c0h, 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0feh, 06ch
    db  06ch, 06ch, 06ch, 06ch, 06ch, 000h, 000h, 000h, 000h, 000h, 0feh, 0c6h, 060h, 030h, 018h, 030h
    db  060h, 0c6h, 0feh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 07eh, 0d8h, 0d8h, 0d8h, 0d8h
    db  070h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 066h, 066h, 066h, 066h, 07ch, 060h, 060h, 0c0h
    db  000h, 000h, 000h, 000h, 000h, 000h, 076h, 0dch, 018h, 018h, 018h, 018h, 018h, 000h, 000h, 000h
    db  000h, 000h, 07eh, 018h, 03ch, 066h, 066h, 066h, 03ch, 018h, 07eh, 000h, 000h, 000h, 000h, 000h
    db  038h, 06ch, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 06ch, 038h, 000h, 000h, 000h, 000h, 000h, 038h, 06ch
    db  0c6h, 0c6h, 0c6h, 06ch, 06ch, 06ch, 0eeh, 000h, 000h, 000h, 000h, 000h, 01eh, 030h, 018h, 00ch
    db  03eh, 066h, 066h, 066h, 03ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 07eh, 0dbh, 0dbh
    db  07eh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 006h, 07eh, 0dbh, 0dbh, 0f3h, 07eh, 060h
    db  0c0h, 000h, 000h, 000h, 000h, 000h, 01ch, 030h, 060h, 060h, 07ch, 060h, 060h, 030h, 01ch, 000h
    db  000h, 000h, 000h, 000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h
    db  000h, 000h, 000h, 0feh, 000h, 000h, 0feh, 000h, 000h, 0feh, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 018h, 018h, 07eh, 018h, 018h, 000h, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 030h, 018h
    db  00ch, 006h, 00ch, 018h, 030h, 000h, 07eh, 000h, 000h, 000h, 000h, 000h, 00ch, 018h, 030h, 060h
    db  030h, 018h, 00ch, 000h, 07eh, 000h, 000h, 000h, 000h, 000h, 00eh, 01bh, 01bh, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 0d8h, 0d8h
    db  070h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 000h, 07eh, 000h, 018h, 018h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 076h, 0dch, 000h, 076h, 0dch, 000h, 000h, 000h, 000h, 000h
    db  000h, 038h, 06ch, 06ch, 038h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00fh, 00ch, 00ch, 00ch, 00ch
    db  00ch, 0ech, 06ch, 03ch, 01ch, 000h, 000h, 000h, 000h, 0d8h, 06ch, 06ch, 06ch, 06ch, 06ch, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 070h, 0d8h, 030h, 060h, 0c8h, 0f8h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 07ch, 07ch, 07ch, 07ch, 07ch, 07ch, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_vgafont16:                                  ; 0xc69ed LB 0x1000
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07eh, 081h, 0a5h, 081h, 081h, 0bdh, 099h, 081h, 081h, 07eh, 000h, 000h, 000h, 000h
    db  000h, 000h, 07eh, 0ffh, 0dbh, 0ffh, 0ffh, 0c3h, 0e7h, 0ffh, 0ffh, 07eh, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 06ch, 0feh, 0feh, 0feh, 0feh, 07ch, 038h, 010h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 010h, 038h, 07ch, 0feh, 07ch, 038h, 010h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 018h, 03ch, 03ch, 0e7h, 0e7h, 0e7h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 018h, 03ch, 07eh, 0ffh, 0ffh, 07eh, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 018h, 03ch, 03ch, 018h, 000h, 000h, 000h, 000h, 000h, 000h
    db  0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0e7h, 0c3h, 0c3h, 0e7h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db  000h, 000h, 000h, 000h, 000h, 03ch, 066h, 042h, 042h, 066h, 03ch, 000h, 000h, 000h, 000h, 000h
    db  0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c3h, 099h, 0bdh, 0bdh, 099h, 0c3h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db  000h, 000h, 01eh, 00eh, 01ah, 032h, 078h, 0cch, 0cch, 0cch, 0cch, 078h, 000h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 066h, 066h, 066h, 066h, 03ch, 018h, 07eh, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 03fh, 033h, 03fh, 030h, 030h, 030h, 030h, 070h, 0f0h, 0e0h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07fh, 063h, 07fh, 063h, 063h, 063h, 063h, 067h, 0e7h, 0e6h, 0c0h, 000h, 000h, 000h
    db  000h, 000h, 000h, 018h, 018h, 0dbh, 03ch, 0e7h, 03ch, 0dbh, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 080h, 0c0h, 0e0h, 0f0h, 0f8h, 0feh, 0f8h, 0f0h, 0e0h, 0c0h, 080h, 000h, 000h, 000h, 000h
    db  000h, 002h, 006h, 00eh, 01eh, 03eh, 0feh, 03eh, 01eh, 00eh, 006h, 002h, 000h, 000h, 000h, 000h
    db  000h, 000h, 018h, 03ch, 07eh, 018h, 018h, 018h, 07eh, 03ch, 018h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 066h, 066h, 066h, 066h, 066h, 066h, 066h, 000h, 066h, 066h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07fh, 0dbh, 0dbh, 0dbh, 07bh, 01bh, 01bh, 01bh, 01bh, 01bh, 000h, 000h, 000h, 000h
    db  000h, 07ch, 0c6h, 060h, 038h, 06ch, 0c6h, 0c6h, 06ch, 038h, 00ch, 0c6h, 07ch, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0feh, 0feh, 0feh, 0feh, 000h, 000h, 000h, 000h
    db  000h, 000h, 018h, 03ch, 07eh, 018h, 018h, 018h, 07eh, 03ch, 018h, 07eh, 000h, 000h, 000h, 000h
    db  000h, 000h, 018h, 03ch, 07eh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 07eh, 03ch, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 018h, 00ch, 0feh, 00ch, 018h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 030h, 060h, 0feh, 060h, 030h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 0c0h, 0c0h, 0c0h, 0feh, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 024h, 066h, 0ffh, 066h, 024h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 010h, 038h, 038h, 07ch, 07ch, 0feh, 0feh, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 0feh, 0feh, 07ch, 07ch, 038h, 038h, 010h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 018h, 03ch, 03ch, 03ch, 018h, 018h, 018h, 000h, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 066h, 066h, 066h, 024h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 06ch, 06ch, 0feh, 06ch, 06ch, 06ch, 0feh, 06ch, 06ch, 000h, 000h, 000h, 000h
    db  018h, 018h, 07ch, 0c6h, 0c2h, 0c0h, 07ch, 006h, 006h, 086h, 0c6h, 07ch, 018h, 018h, 000h, 000h
    db  000h, 000h, 000h, 000h, 0c2h, 0c6h, 00ch, 018h, 030h, 060h, 0c6h, 086h, 000h, 000h, 000h, 000h
    db  000h, 000h, 038h, 06ch, 06ch, 038h, 076h, 0dch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 030h, 030h, 030h, 060h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 00ch, 018h, 030h, 030h, 030h, 030h, 030h, 030h, 018h, 00ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 030h, 018h, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 018h, 030h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 066h, 03ch, 0ffh, 03ch, 066h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 018h, 018h, 07eh, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 018h, 030h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 0feh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 002h, 006h, 00ch, 018h, 030h, 060h, 0c0h, 080h, 000h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 066h, 0c3h, 0c3h, 0dbh, 0dbh, 0c3h, 0c3h, 066h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 018h, 038h, 078h, 018h, 018h, 018h, 018h, 018h, 018h, 07eh, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 006h, 00ch, 018h, 030h, 060h, 0c0h, 0c6h, 0feh, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 006h, 006h, 03ch, 006h, 006h, 006h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 00ch, 01ch, 03ch, 06ch, 0cch, 0feh, 00ch, 00ch, 00ch, 01eh, 000h, 000h, 000h, 000h
    db  000h, 000h, 0feh, 0c0h, 0c0h, 0c0h, 0fch, 006h, 006h, 006h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 038h, 060h, 0c0h, 0c0h, 0fch, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0feh, 0c6h, 006h, 006h, 00ch, 018h, 030h, 030h, 030h, 030h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 07eh, 006h, 006h, 006h, 00ch, 078h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 018h, 018h, 000h, 000h, 000h, 018h, 018h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 018h, 018h, 000h, 000h, 000h, 018h, 018h, 030h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 006h, 00ch, 018h, 030h, 060h, 030h, 018h, 00ch, 006h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 07eh, 000h, 000h, 07eh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 060h, 030h, 018h, 00ch, 006h, 00ch, 018h, 030h, 060h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0c6h, 00ch, 018h, 018h, 018h, 000h, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 07ch, 0c6h, 0c6h, 0deh, 0deh, 0deh, 0dch, 0c0h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 010h, 038h, 06ch, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0fch, 066h, 066h, 066h, 07ch, 066h, 066h, 066h, 066h, 0fch, 000h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 066h, 0c2h, 0c0h, 0c0h, 0c0h, 0c0h, 0c2h, 066h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0f8h, 06ch, 066h, 066h, 066h, 066h, 066h, 066h, 06ch, 0f8h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0feh, 066h, 062h, 068h, 078h, 068h, 060h, 062h, 066h, 0feh, 000h, 000h, 000h, 000h
    db  000h, 000h, 0feh, 066h, 062h, 068h, 078h, 068h, 060h, 060h, 060h, 0f0h, 000h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 066h, 0c2h, 0c0h, 0c0h, 0deh, 0c6h, 0c6h, 066h, 03ah, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 01eh, 00ch, 00ch, 00ch, 00ch, 00ch, 0cch, 0cch, 0cch, 078h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0e6h, 066h, 066h, 06ch, 078h, 078h, 06ch, 066h, 066h, 0e6h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0f0h, 060h, 060h, 060h, 060h, 060h, 060h, 062h, 066h, 0feh, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c3h, 0e7h, 0ffh, 0ffh, 0dbh, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c6h, 0e6h, 0f6h, 0feh, 0deh, 0ceh, 0c6h, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0fch, 066h, 066h, 066h, 07ch, 060h, 060h, 060h, 060h, 0f0h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0d6h, 0deh, 07ch, 00ch, 00eh, 000h, 000h
    db  000h, 000h, 0fch, 066h, 066h, 066h, 07ch, 06ch, 066h, 066h, 066h, 0e6h, 000h, 000h, 000h, 000h
    db  000h, 000h, 07ch, 0c6h, 0c6h, 060h, 038h, 00ch, 006h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0ffh, 0dbh, 099h, 018h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 066h, 03ch, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 0dbh, 0dbh, 0ffh, 066h, 066h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c3h, 0c3h, 066h, 03ch, 018h, 018h, 03ch, 066h, 0c3h, 0c3h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c3h, 0c3h, 0c3h, 066h, 03ch, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0ffh, 0c3h, 086h, 00ch, 018h, 030h, 060h, 0c1h, 0c3h, 0ffh, 000h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 030h, 030h, 030h, 030h, 030h, 030h, 030h, 030h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 080h, 0c0h, 0e0h, 070h, 038h, 01ch, 00eh, 006h, 002h, 000h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 00ch, 03ch, 000h, 000h, 000h, 000h
    db  010h, 038h, 06ch, 0c6h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 000h
    db  030h, 030h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 078h, 00ch, 07ch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0e0h, 060h, 060h, 078h, 06ch, 066h, 066h, 066h, 066h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 07ch, 0c6h, 0c0h, 0c0h, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 01ch, 00ch, 00ch, 03ch, 06ch, 0cch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 07ch, 0c6h, 0feh, 0c0h, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 038h, 06ch, 064h, 060h, 0f0h, 060h, 060h, 060h, 060h, 0f0h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 076h, 0cch, 0cch, 0cch, 0cch, 0cch, 07ch, 00ch, 0cch, 078h, 000h
    db  000h, 000h, 0e0h, 060h, 060h, 06ch, 076h, 066h, 066h, 066h, 066h, 0e6h, 000h, 000h, 000h, 000h
    db  000h, 000h, 018h, 018h, 000h, 038h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 006h, 006h, 000h, 00eh, 006h, 006h, 006h, 006h, 006h, 006h, 066h, 066h, 03ch, 000h
    db  000h, 000h, 0e0h, 060h, 060h, 066h, 06ch, 078h, 078h, 06ch, 066h, 0e6h, 000h, 000h, 000h, 000h
    db  000h, 000h, 038h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0e6h, 0ffh, 0dbh, 0dbh, 0dbh, 0dbh, 0dbh, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0dch, 066h, 066h, 066h, 066h, 066h, 066h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0dch, 066h, 066h, 066h, 066h, 066h, 07ch, 060h, 060h, 0f0h, 000h
    db  000h, 000h, 000h, 000h, 000h, 076h, 0cch, 0cch, 0cch, 0cch, 0cch, 07ch, 00ch, 00ch, 01eh, 000h
    db  000h, 000h, 000h, 000h, 000h, 0dch, 076h, 066h, 060h, 060h, 060h, 0f0h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 07ch, 0c6h, 060h, 038h, 00ch, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 010h, 030h, 030h, 0fch, 030h, 030h, 030h, 030h, 036h, 01ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0cch, 0cch, 0cch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0c3h, 0c3h, 0c3h, 0c3h, 066h, 03ch, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0c3h, 0c3h, 0c3h, 0dbh, 0dbh, 0ffh, 066h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0c3h, 066h, 03ch, 018h, 03ch, 066h, 0c3h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07eh, 006h, 00ch, 0f8h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0feh, 0cch, 018h, 030h, 060h, 0c6h, 0feh, 000h, 000h, 000h, 000h
    db  000h, 000h, 00eh, 018h, 018h, 018h, 070h, 018h, 018h, 018h, 018h, 00eh, 000h, 000h, 000h, 000h
    db  000h, 000h, 018h, 018h, 018h, 018h, 000h, 018h, 018h, 018h, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 070h, 018h, 018h, 018h, 00eh, 018h, 018h, 018h, 018h, 070h, 000h, 000h, 000h, 000h
    db  000h, 000h, 076h, 0dch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 010h, 038h, 06ch, 0c6h, 0c6h, 0c6h, 0feh, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 03ch, 066h, 0c2h, 0c0h, 0c0h, 0c0h, 0c2h, 066h, 03ch, 00ch, 006h, 07ch, 000h, 000h
    db  000h, 000h, 0cch, 000h, 000h, 0cch, 0cch, 0cch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 00ch, 018h, 030h, 000h, 07ch, 0c6h, 0feh, 0c0h, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 010h, 038h, 06ch, 000h, 078h, 00ch, 07ch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0cch, 000h, 000h, 078h, 00ch, 07ch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 060h, 030h, 018h, 000h, 078h, 00ch, 07ch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 038h, 06ch, 038h, 000h, 078h, 00ch, 07ch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 03ch, 066h, 060h, 060h, 066h, 03ch, 00ch, 006h, 03ch, 000h, 000h, 000h
    db  000h, 010h, 038h, 06ch, 000h, 07ch, 0c6h, 0feh, 0c0h, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c6h, 000h, 000h, 07ch, 0c6h, 0feh, 0c0h, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 060h, 030h, 018h, 000h, 07ch, 0c6h, 0feh, 0c0h, 0c0h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 066h, 000h, 000h, 038h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 018h, 03ch, 066h, 000h, 038h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 060h, 030h, 018h, 000h, 038h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 0c6h, 000h, 010h, 038h, 06ch, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h, 000h
    db  038h, 06ch, 038h, 000h, 038h, 06ch, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h, 000h
    db  018h, 030h, 060h, 000h, 0feh, 066h, 060h, 07ch, 060h, 060h, 066h, 0feh, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 06eh, 03bh, 01bh, 07eh, 0d8h, 0dch, 077h, 000h, 000h, 000h, 000h
    db  000h, 000h, 03eh, 06ch, 0cch, 0cch, 0feh, 0cch, 0cch, 0cch, 0cch, 0ceh, 000h, 000h, 000h, 000h
    db  000h, 010h, 038h, 06ch, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c6h, 000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 060h, 030h, 018h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 030h, 078h, 0cch, 000h, 0cch, 0cch, 0cch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 060h, 030h, 018h, 000h, 0cch, 0cch, 0cch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c6h, 000h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07eh, 006h, 00ch, 078h, 000h
    db  000h, 0c6h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 0c6h, 000h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 018h, 018h, 07eh, 0c3h, 0c0h, 0c0h, 0c0h, 0c3h, 07eh, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 038h, 06ch, 064h, 060h, 0f0h, 060h, 060h, 060h, 060h, 0e6h, 0fch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0c3h, 066h, 03ch, 018h, 0ffh, 018h, 0ffh, 018h, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 0fch, 066h, 066h, 07ch, 062h, 066h, 06fh, 066h, 066h, 066h, 0f3h, 000h, 000h, 000h, 000h
    db  000h, 00eh, 01bh, 018h, 018h, 018h, 07eh, 018h, 018h, 018h, 018h, 018h, 0d8h, 070h, 000h, 000h
    db  000h, 018h, 030h, 060h, 000h, 078h, 00ch, 07ch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 00ch, 018h, 030h, 000h, 038h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 018h, 030h, 060h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 018h, 030h, 060h, 000h, 0cch, 0cch, 0cch, 0cch, 0cch, 0cch, 076h, 000h, 000h, 000h, 000h
    db  000h, 000h, 076h, 0dch, 000h, 0dch, 066h, 066h, 066h, 066h, 066h, 066h, 000h, 000h, 000h, 000h
    db  076h, 0dch, 000h, 0c6h, 0e6h, 0f6h, 0feh, 0deh, 0ceh, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h, 000h
    db  000h, 03ch, 06ch, 06ch, 03eh, 000h, 07eh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 038h, 06ch, 06ch, 038h, 000h, 07ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 030h, 030h, 000h, 030h, 030h, 060h, 0c0h, 0c6h, 0c6h, 07ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 0feh, 0c0h, 0c0h, 0c0h, 0c0h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 0feh, 006h, 006h, 006h, 006h, 000h, 000h, 000h, 000h, 000h
    db  000h, 0c0h, 0c0h, 0c2h, 0c6h, 0cch, 018h, 030h, 060h, 0ceh, 09bh, 006h, 00ch, 01fh, 000h, 000h
    db  000h, 0c0h, 0c0h, 0c2h, 0c6h, 0cch, 018h, 030h, 066h, 0ceh, 096h, 03eh, 006h, 006h, 000h, 000h
    db  000h, 000h, 018h, 018h, 000h, 018h, 018h, 018h, 03ch, 03ch, 03ch, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 036h, 06ch, 0d8h, 06ch, 036h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0d8h, 06ch, 036h, 06ch, 0d8h, 000h, 000h, 000h, 000h, 000h, 000h
    db  011h, 044h, 011h, 044h, 011h, 044h, 011h, 044h, 011h, 044h, 011h, 044h, 011h, 044h, 011h, 044h
    db  055h, 0aah, 055h, 0aah, 055h, 0aah, 055h, 0aah, 055h, 0aah, 055h, 0aah, 055h, 0aah, 055h, 0aah
    db  0ddh, 077h, 0ddh, 077h, 0ddh, 077h, 0ddh, 077h, 0ddh, 077h, 0ddh, 077h, 0ddh, 077h, 0ddh, 077h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 0f8h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 0f8h, 018h, 0f8h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 0f6h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 0feh, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  000h, 000h, 000h, 000h, 000h, 0f8h, 018h, 0f8h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  036h, 036h, 036h, 036h, 036h, 0f6h, 006h, 0f6h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  000h, 000h, 000h, 000h, 000h, 0feh, 006h, 0f6h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 0f6h, 006h, 0feh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 0feh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  018h, 018h, 018h, 018h, 018h, 0f8h, 018h, 0f8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 0f8h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 01fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 01fh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 0ffh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 01fh, 018h, 01fh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 037h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 037h, 030h, 03fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 03fh, 030h, 037h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 0f7h, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0f7h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 037h, 030h, 037h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  036h, 036h, 036h, 036h, 036h, 0f7h, 000h, 0f7h, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  018h, 018h, 018h, 018h, 018h, 0ffh, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 03fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  018h, 018h, 018h, 018h, 018h, 01fh, 018h, 01fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 01fh, 018h, 01fh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 03fh, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  036h, 036h, 036h, 036h, 036h, 036h, 036h, 0ffh, 036h, 036h, 036h, 036h, 036h, 036h, 036h, 036h
    db  018h, 018h, 018h, 018h, 018h, 0ffh, 018h, 0ffh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 0f8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 01fh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db  0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h, 0f0h
    db  00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh, 00fh
    db  0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 076h, 0dch, 0d8h, 0d8h, 0d8h, 0dch, 076h, 000h, 000h, 000h, 000h
    db  000h, 000h, 078h, 0cch, 0cch, 0cch, 0d8h, 0cch, 0c6h, 0c6h, 0c6h, 0cch, 000h, 000h, 000h, 000h
    db  000h, 000h, 0feh, 0c6h, 0c6h, 0c0h, 0c0h, 0c0h, 0c0h, 0c0h, 0c0h, 0c0h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 0feh, 06ch, 06ch, 06ch, 06ch, 06ch, 06ch, 06ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 0feh, 0c6h, 060h, 030h, 018h, 030h, 060h, 0c6h, 0feh, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 07eh, 0d8h, 0d8h, 0d8h, 0d8h, 0d8h, 070h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 066h, 066h, 066h, 066h, 066h, 07ch, 060h, 060h, 0c0h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 076h, 0dch, 018h, 018h, 018h, 018h, 018h, 018h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 07eh, 018h, 03ch, 066h, 066h, 066h, 03ch, 018h, 07eh, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 038h, 06ch, 0c6h, 0c6h, 0feh, 0c6h, 0c6h, 06ch, 038h, 000h, 000h, 000h, 000h
    db  000h, 000h, 038h, 06ch, 0c6h, 0c6h, 0c6h, 06ch, 06ch, 06ch, 06ch, 0eeh, 000h, 000h, 000h, 000h
    db  000h, 000h, 01eh, 030h, 018h, 00ch, 03eh, 066h, 066h, 066h, 066h, 03ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 07eh, 0dbh, 0dbh, 0dbh, 07eh, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 003h, 006h, 07eh, 0dbh, 0dbh, 0f3h, 07eh, 060h, 0c0h, 000h, 000h, 000h, 000h
    db  000h, 000h, 01ch, 030h, 060h, 060h, 07ch, 060h, 060h, 060h, 030h, 01ch, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 07ch, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 0c6h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 0feh, 000h, 000h, 0feh, 000h, 000h, 0feh, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 018h, 018h, 07eh, 018h, 018h, 000h, 000h, 0ffh, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 030h, 018h, 00ch, 006h, 00ch, 018h, 030h, 000h, 07eh, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 00ch, 018h, 030h, 060h, 030h, 018h, 00ch, 000h, 07eh, 000h, 000h, 000h, 000h
    db  000h, 000h, 00eh, 01bh, 01bh, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h
    db  018h, 018h, 018h, 018h, 018h, 018h, 018h, 018h, 0d8h, 0d8h, 0d8h, 070h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 018h, 018h, 000h, 07eh, 000h, 018h, 018h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 076h, 0dch, 000h, 076h, 0dch, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 038h, 06ch, 06ch, 038h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 00fh, 00ch, 00ch, 00ch, 00ch, 00ch, 0ech, 06ch, 06ch, 03ch, 01ch, 000h, 000h, 000h, 000h
    db  000h, 0d8h, 06ch, 06ch, 06ch, 06ch, 06ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 070h, 0d8h, 030h, 060h, 0c8h, 0f8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 07ch, 07ch, 07ch, 07ch, 07ch, 07ch, 07ch, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
_vgafont14alt:                               ; 0xc79ed LB 0x12d
    db  01dh, 000h, 000h, 000h, 000h, 024h, 066h, 0ffh, 066h, 024h, 000h, 000h, 000h, 000h, 000h, 022h
    db  000h, 063h, 063h, 063h, 022h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 02bh, 000h
    db  000h, 000h, 018h, 018h, 018h, 0ffh, 018h, 018h, 018h, 000h, 000h, 000h, 000h, 02dh, 000h, 000h
    db  000h, 000h, 000h, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 04dh, 000h, 000h, 0c3h
    db  0e7h, 0ffh, 0dbh, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 000h, 000h, 000h, 054h, 000h, 000h, 0ffh, 0dbh
    db  099h, 018h, 018h, 018h, 018h, 018h, 03ch, 000h, 000h, 000h, 056h, 000h, 000h, 0c3h, 0c3h, 0c3h
    db  0c3h, 0c3h, 0c3h, 066h, 03ch, 018h, 000h, 000h, 000h, 057h, 000h, 000h, 0c3h, 0c3h, 0c3h, 0c3h
    db  0dbh, 0dbh, 0ffh, 066h, 066h, 000h, 000h, 000h, 058h, 000h, 000h, 0c3h, 0c3h, 066h, 03ch, 018h
    db  03ch, 066h, 0c3h, 0c3h, 000h, 000h, 000h, 059h, 000h, 000h, 0c3h, 0c3h, 0c3h, 066h, 03ch, 018h
    db  018h, 018h, 03ch, 000h, 000h, 000h, 05ah, 000h, 000h, 0ffh, 0c3h, 086h, 00ch, 018h, 030h, 061h
    db  0c3h, 0ffh, 000h, 000h, 000h, 06dh, 000h, 000h, 000h, 000h, 000h, 0e6h, 0ffh, 0dbh, 0dbh, 0dbh
    db  0dbh, 000h, 000h, 000h, 076h, 000h, 000h, 000h, 000h, 000h, 0c3h, 0c3h, 0c3h, 066h, 03ch, 018h
    db  000h, 000h, 000h, 077h, 000h, 000h, 000h, 000h, 000h, 0c3h, 0c3h, 0dbh, 0dbh, 0ffh, 066h, 000h
    db  000h, 000h, 091h, 000h, 000h, 000h, 000h, 06eh, 03bh, 01bh, 07eh, 0d8h, 0dch, 077h, 000h, 000h
    db  000h, 09bh, 000h, 018h, 018h, 07eh, 0c3h, 0c0h, 0c0h, 0c3h, 07eh, 018h, 018h, 000h, 000h, 000h
    db  09dh, 000h, 000h, 0c3h, 066h, 03ch, 018h, 0ffh, 018h, 0ffh, 018h, 018h, 000h, 000h, 000h, 09eh
    db  000h, 0fch, 066h, 066h, 07ch, 062h, 066h, 06fh, 066h, 066h, 0f3h, 000h, 000h, 000h, 0f1h, 000h
    db  000h, 018h, 018h, 018h, 0ffh, 018h, 018h, 018h, 000h, 0ffh, 000h, 000h, 000h, 0f6h, 000h, 000h
    db  018h, 018h, 000h, 000h, 0ffh, 000h, 000h, 018h, 018h, 000h, 000h, 000h, 000h
_vgafont16alt:                               ; 0xc7b1a LB 0x144
    db  01dh, 000h, 000h, 000h, 000h, 000h, 024h, 066h, 0ffh, 066h, 024h, 000h, 000h, 000h, 000h, 000h
    db  000h, 030h, 000h, 000h, 03ch, 066h, 0c3h, 0c3h, 0dbh, 0dbh, 0c3h, 0c3h, 066h, 03ch, 000h, 000h
    db  000h, 000h, 04dh, 000h, 000h, 0c3h, 0e7h, 0ffh, 0ffh, 0dbh, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 000h
    db  000h, 000h, 000h, 054h, 000h, 000h, 0ffh, 0dbh, 099h, 018h, 018h, 018h, 018h, 018h, 018h, 03ch
    db  000h, 000h, 000h, 000h, 056h, 000h, 000h, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 066h, 03ch
    db  018h, 000h, 000h, 000h, 000h, 057h, 000h, 000h, 0c3h, 0c3h, 0c3h, 0c3h, 0c3h, 0dbh, 0dbh, 0ffh
    db  066h, 066h, 000h, 000h, 000h, 000h, 058h, 000h, 000h, 0c3h, 0c3h, 066h, 03ch, 018h, 018h, 03ch
    db  066h, 0c3h, 0c3h, 000h, 000h, 000h, 000h, 059h, 000h, 000h, 0c3h, 0c3h, 0c3h, 066h, 03ch, 018h
    db  018h, 018h, 018h, 03ch, 000h, 000h, 000h, 000h, 05ah, 000h, 000h, 0ffh, 0c3h, 086h, 00ch, 018h
    db  030h, 060h, 0c1h, 0c3h, 0ffh, 000h, 000h, 000h, 000h, 06dh, 000h, 000h, 000h, 000h, 000h, 0e6h
    db  0ffh, 0dbh, 0dbh, 0dbh, 0dbh, 0dbh, 000h, 000h, 000h, 000h, 076h, 000h, 000h, 000h, 000h, 000h
    db  0c3h, 0c3h, 0c3h, 0c3h, 066h, 03ch, 018h, 000h, 000h, 000h, 000h, 077h, 000h, 000h, 000h, 000h
    db  000h, 0c3h, 0c3h, 0c3h, 0dbh, 0dbh, 0ffh, 066h, 000h, 000h, 000h, 000h, 078h, 000h, 000h, 000h
    db  000h, 000h, 0c3h, 066h, 03ch, 018h, 03ch, 066h, 0c3h, 000h, 000h, 000h, 000h, 091h, 000h, 000h
    db  000h, 000h, 000h, 06eh, 03bh, 01bh, 07eh, 0d8h, 0dch, 077h, 000h, 000h, 000h, 000h, 09bh, 000h
    db  018h, 018h, 07eh, 0c3h, 0c0h, 0c0h, 0c0h, 0c3h, 07eh, 018h, 018h, 000h, 000h, 000h, 000h, 09dh
    db  000h, 000h, 0c3h, 066h, 03ch, 018h, 0ffh, 018h, 0ffh, 018h, 018h, 018h, 000h, 000h, 000h, 000h
    db  09eh, 000h, 0fch, 066h, 066h, 07ch, 062h, 066h, 06fh, 066h, 066h, 066h, 0f3h, 000h, 000h, 000h
    db  000h, 0abh, 000h, 0c0h, 0c0h, 0c2h, 0c6h, 0cch, 018h, 030h, 060h, 0ceh, 09bh, 006h, 00ch, 01fh
    db  000h, 000h, 0ach, 000h, 0c0h, 0c0h, 0c2h, 0c6h, 0cch, 018h, 030h, 066h, 0ceh, 096h, 03eh, 006h
    db  006h, 000h, 000h, 000h
_vbebios_copyright:                          ; 0xc7c5e LB 0x15
    db  'VirtualBox VESA BIOS', 000h
_vbebios_vendor_name:                        ; 0xc7c73 LB 0x13
    db  'Oracle Corporation', 000h
_vbebios_product_name:                       ; 0xc7c86 LB 0x21
    db  'Oracle VM VirtualBox VBE Adapter', 000h
_vbebios_product_revision:                   ; 0xc7ca7 LB 0x24
    db  'Oracle VM VirtualBox Version 5.0.51', 000h
_vbebios_info_string:                        ; 0xc7ccb LB 0x2b
    db  'VirtualBox VBE Display Adapter enabled', 00dh, 00ah, 00dh, 00ah, 000h
_no_vbebios_info_string:                     ; 0xc7cf6 LB 0x29
    db  'No VirtualBox VBE support available!', 00dh, 00ah, 00dh, 00ah, 000h

  ; Padding 0x1 bytes at 0xc7d1f
    db  001h

section CONST progbits vstart=0x7d20 align=1 ; size=0x0 class=DATA group=DGROUP

section CONST2 progbits vstart=0x7d20 align=1 ; size=0x0 class=DATA group=DGROUP

  ; Padding 0x2e0 bytes at 0xc7d20
    db  000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 045h, 03ah, 05ch, 076h, 062h
    db  06fh, 078h, 05ch, 073h, 076h, 06eh, 05ch, 074h, 072h, 075h, 06eh, 06bh, 05ch, 06fh, 075h, 074h
    db  05ch, 077h, 069h, 06eh, 02eh, 061h, 06dh, 064h, 036h, 034h, 05ch, 072h, 065h, 06ch, 065h, 061h
    db  073h, 065h, 05ch, 06fh, 062h, 06ah, 05ch, 056h, 042h, 06fh, 078h, 056h, 067h, 061h, 042h, 069h
    db  06fh, 073h, 038h, 030h, 038h, 036h, 05ch, 056h, 042h, 06fh, 078h, 056h, 067h, 061h, 042h, 069h
    db  06fh, 073h, 038h, 030h, 038h, 036h, 02eh, 073h, 079h, 06dh, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db  000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 071h