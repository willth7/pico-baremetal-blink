;   Copyright 2022 Will Thomas
;
;   Licensed under the Apache License, Version 2.0 (the "License");
;   you may not use this file except in compliance with the License.
;   You may obtain a copy of the License at
;
;       http:;www.apache.org/licenses/LICENSE-2.0;
;
;   Unless required by applicable law or agreed to in writing, software
;   distributed under the License is distributed on an "AS IS" BASIS,
;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;   See the License for the specific language governing permissions and
;   limitations under the License.	
	
	ldr r0, *rst_clr
	mov r1, 32
	str r1, r0, 0
	
*rst
	ldr r0, *rst_base
	ldr r1, r0, 2
	cmp r1, 0
	beq *rst
	
	ldr r0, *ctrl
	mov r1, 5
	str r1, r0, 0
	
	mov r1, 1
	lsl r1, r1, 25
	
	ldr r0, *sio_base
	str r1, r0, 9
	
*loop
	str r1, r0, 5
	ldr r3, *mil
	bl *del
	
	str r1, r0, 6
	ldr r3, *mil
	bl *del
	
	b *loop
	
*del
	sub r3, 1
	bne *del
	
	bx lr

*rst_base
	~byt4 0x4000c000
	
*rst_clr
	~byt4 0x4000f000
	
*ctrl
	~byt4 0x400140cc
	
*sio_base
	~byt4 0xd0000000
	
*mil
	~byt4 0x000f0000
