4C 8B FF
40 53                 									- push rbx
48 83 EC 20           									- sub rsp,0x20
BA 01 00 00 00           								- mov edx,0x1
48 8D 0D 93 00 00 00    								- lea rcx,["E:\Dump\a.txt"]
FF 15 02 00 00 00 EB 08 A0 99 9A E7 FE 7F 00 00 		- call KERNEL32.lopen						;_lopen("E:\\Dump\\a.txt", OF_WRITE);
8B D8                 									- mov ebx,eax		
83 F8 FF              									- cmp eax,									;if (file == -1)
75 11                 									- jne [call KERNEL32.llseek]				;如果文件存在就直接去下面
33 D2                 									- xor edx,edx		
48 8D 0D 73 00 00 00     								- lea rcx,["E:\Dump\a.txt"]		
FF 15 02 00 00 00 EB 08 30 99 9A E7 FE 7F 00 00 		- call KERNEL32.lcreat						;_lcreat("E:\\Dump\\a.txt", 0);
8B D8                 									- mov ebx,eax           		
33 D2                 									- xor edx,edx           		
8B CB                 									- mov ecx,ebx           		
44 8D 42 02           									- lea r8d,[rdx+0x02]      		
FF 15 02 00 00 00 EB 08 90 7C 95 E7 FE 7F 00 00 		- call KERNEL32.llseek						;_llseek(file, 0, FILE_END);
41 B8 00 10 00 00        								- mov r8d,0x1000							;输出字节数
49 8D 17	     										- lea rdx,[r15]								;想要获取的字节地址 寄存器表在下面
8B CB                 									- mov ecx,ebx		
FF 15 02 00 00 00 EB 08 20 9A 9A E7 FE 7F 00 00 		- call KERNEL32.hwrite						;_lwrite(file, rsp, size);
48 63 CB              									- movsxd  rcx,ebx		
FF 15 02 00 00 00 EB 08 C0 4C 96 E7 FE 7F 00 00 		- call KERNEL32.FlushFileBuffers    		;写入硬盘
8B CB                 									- mov ecx,ebx                       		
FF 15 02 00 00 00 EB 08 30 C6 95 E7 FE 7F 00 00			- call KERNEL32.lclose              		;关闭文件流
33 C0                 									- xor eax,eax		
48 83 C4 20           									- add rsp,0x20		
5B                    									- pop rbx		
EB FE													- while(true)								;ザ　ワールド！

45 3A 5C 44 75 6D 70 5C 61 2E 74 78 74 00 00 00			- "E:\Dump\a.txt"

;占用的寄存器rax rbx rcx rdx r9 r10 r11

49 8D 10 lea rdx,[r8]
49 8D 11 lea rdx,[r9]
49 8D 12 lea rdx,[r10]
49 8D 13 lea rdx,[r11]
49 8D 14 lea rdx,[r12]
49 8D 15 lea rdx,[r13]
49 8D 16 lea rdx,[r14]
49 8D 17 lea rdx,[r15]

48 83 EA 10 sub rdx,10

4C 8B F9 mov r15,rcx
4C 8B FF mov r15,rdi


50 F9 1B 00 01 00 00 00
01001bf950

DecryptInit
81FFE
8B61B
73D53
1BAFB
2F9CB
1B73D
89E525

Bypass
0001B1CC 48 83 E8 02 41 0F 94 C1		To		E9 12 FE FF FF 90 90 90
0089D921 49 8B CC						To		EB 06 90
0089D778 45 8B E9						To		EB 16 90
0089D81B 72 15							To		EB 15
0089D897 48 8D 8C 24 D8 00 00 00		To		EB 0E 90 90 90 90 90 90
0089DA12 48 8B 0D 8F ED 3E 01			To		EB 11 90 90 90 90 90
0089DABF 4C 8D 44 24 60					To		EB 18 90 90 90