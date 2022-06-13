40 53                 									- push rbx
48 83 EC 20           									- sub rsp,0x20
BA 01 00 00 00           								- mov edx,0x1
48 8D 0D 9E 00 00 00     								- lea rcx,["E:\Dump\a.txt"]
FF 15 02 00 00 00 EB 08 A0 99 D4 45 FF 7F 00 00 		- call KERNEL32.lopen						;_lopen("E:\\Dump\\a.txt", OF_WRITE);
8B D8                 									- mov ebx,eax		
83 F8 FF              									- cmp eax,									;if (file == -1)
75 11                 									- jne [call KERNEL32.llseek]				;如果文件存在就直接去下面
33 D2                 									- xor edx,edx		
48 8D 0D 7E 00 00 00     								- lea rcx,["E:\Dump\a.txt"]		
FF 15 02 00 00 00 EB 08 30 99 D4 45 FF 7F 00 00 		- call KERNEL32.lcreat						;_lcreat("E:\\Dump\\a.txt", 0);
8B D8                 									- mov ebx,eax           		
33 D2                 									- xor edx,edx           		
8B CB                 									- mov ecx,ebx           		
44 8D 42 02           									- lea r8d,[rdx+0x02]      		
FF 15 02 00 00 00 EB 08 90 7C CF 45 FF 7F 00 00 		- call KERNEL32.llseek						;_llseek(file, 0, FILE_END);
41 B8 00 10 00 00        								- mov r8d,0x1000							;输出字节数
48 8D 11	     										- lea rdx,[rcx]								;想要获取的字节地址
8B CB                 									- mov ecx,ebx		
FF 15 02 00 00 00 EB 08 20 9A D4 45 FF 7F 00 00 		- call KERNEL32.hwrite						;_lwrite(file, rsp, size);
48 63 CB              									- movsxd  rcx,ebx		
FF 15 02 00 00 00 EB 08 C0 4C D0 45 FF 7F 00 00 		- call KERNEL32.FlushFileBuffers    		;写入硬盘
8B CB                 									- mov ecx,ebx                       		
FF 15 02 00 00 00 EB 08 30 C6 CF 45 FF 7F 00 00 		- call KERNEL32.lclose              		;关闭文件流
33 C0                 									- xor eax,eax		
48 83 C4 20           									- add rsp,0x20		
5B                    									- pop rbx		
EB FE													- while(true)								;ザ　ワールド！

45 3A 5C 44 75 6D 70 5C 61 2E 74 78 74 00 00 00			- "E:\Dump\a.txt"