
a.out:	file format Mach-O 64-bit x86-64

Disassembly of section __TEXT,__text:
__text:
100000860:	41 57 	pushq	%r15
100000862:	b9 01 00 00 00 	movl	$1, %ecx
100000867:	ba 01 00 00 00 	movl	$1, %edx
10000086c:	41 56 	pushq	%r14
10000086e:	41 55 	pushq	%r13
100000870:	41 54 	pushq	%r12
100000872:	55 	pushq	%rbp
100000873:	53 	pushq	%rbx
100000874:	48 81 ec 88 00 00 00 	subq	$136, %rsp
10000087b:	4c 8b 3f 	movq	(%rdi), %r15
10000087e:	4c 8b 67 18 	movq	24(%rdi), %r12
100000882:	48 8d 6c 24 78 	leaq	120(%rsp), %rbp
100000887:	48 8d 5c 24 70 	leaq	112(%rsp), %rbx
10000088c:	4c 8b 77 10 	movq	16(%rdi), %r14
100000890:	4c 8b 6f 08 	movq	8(%rdi), %r13
100000894:	49 89 e9 	movq	%rbp, %r9
100000897:	31 ff 	xorl	%edi, %edi
100000899:	49 89 d8 	movq	%rbx, %r8
10000089c:	4c 89 fe 	movq	%r15, %rsi
10000089f:	e8 7c 14 00 00 	callq	5244 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D44B>
1000008a4:	84 c0 	testb	%al, %al
1000008a6:	0f 84 f1 05 00 00 	je	1521 <_main._omp_fn.0+0x63D>
1000008ac:	4d 8d 47 ff 	leaq	-1(%r15), %r8
1000008b0:	49 83 e0 f8 	andq	$-8, %r8
1000008b4:	49 83 c0 08 	addq	$8, %r8
1000008b8:	4c 8b 4c 24 70 	movq	112(%rsp), %r9
1000008bd:	4c 8b 54 24 78 	movq	120(%rsp), %r10
1000008c2:	4d 85 ff 	testq	%r15, %r15
1000008c5:	0f 8e b7 05 00 00 	jle	1463 <_main._omp_fn.0+0x622>
1000008cb:	4c 89 ff 	movq	%r15, %rdi
1000008ce:	49 0f af f9 	imulq	%r9, %rdi
1000008d2:	48 85 ff 	testq	%rdi, %rdi
1000008d5:	48 8d 47 07 	leaq	7(%rdi), %rax
1000008d9:	c4 81 7b 12 34 cc 	vmovddup	(%r12,%r9,8), %xmm6
1000008df:	48 0f 49 c7 	cmovnsq	%rdi, %rax
1000008e3:	31 c9 	xorl	%ecx, %ecx
1000008e5:	48 c1 f8 03 	sarq	$3, %rax
1000008e9:	49 8d 74 05 00 	leaq	(%r13,%rax), %rsi
1000008ee:	66 90 	nop
1000008f0:	48 89 c8 	movq	%rcx, %rax
1000008f3:	c5 f9 28 ce 	vmovapd	%xmm6, %xmm1
1000008f7:	c5 f9 28 c6 	vmovapd	%xmm6, %xmm0
1000008fb:	c5 f8 29 34 24 	vmovaps	%xmm6, (%rsp)
100000900:	48 d1 f8 	sarq	%rax
100000903:	c5 79 28 e6 	vmovapd	%xmm6, %xmm12
100000907:	48 c1 e0 04 	shlq	$4, %rax
10000090b:	4c 01 f0 	addq	%r14, %rax
10000090e:	c5 79 28 08 	vmovapd	(%rax), %xmm9
100000912:	c5 79 28 40 10 	vmovapd	16(%rax), %xmm8
100000917:	c5 f9 28 78 20 	vmovapd	32(%rax), %xmm7
10000091c:	c5 f9 28 68 30 	vmovapd	48(%rax), %xmm5
100000921:	b8 06 00 00 00 	movl	$6, %eax
100000926:	c4 41 79 28 e8 	vmovapd	%xmm8, %xmm13
10000092b:	c5 79 29 ca 	vmovapd	%xmm9, %xmm2
10000092f:	c5 f9 28 e5 	vmovapd	%xmm5, %xmm4
100000933:	c5 f9 28 df 	vmovapd	%xmm7, %xmm3
100000937:	c5 79 28 3c 24 	vmovapd	(%rsp), %xmm15
10000093c:	c4 41 19 59 d5 	vmulpd	%xmm13, %xmm12, %xmm10
100000941:	c4 42 b9 98 ed 	vfmadd132pd	%xmm13, %xmm8, %xmm13
100000946:	c4 41 69 59 df 	vmulpd	%xmm15, %xmm2, %xmm11
10000094b:	c4 e2 b1 98 d2 	vfmadd132pd	%xmm2, %xmm9, %xmm2
100000950:	c4 41 29 58 d2 	vaddpd	%xmm10, %xmm10, %xmm10
100000955:	c4 42 91 9c e4 	vfnmadd132pd	%xmm12, %xmm13, %xmm12
10000095a:	c5 79 28 f2 	vmovapd	%xmm2, %xmm14
10000095e:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100000963:	c5 f9 59 d3 	vmulpd	%xmm3, %xmm0, %xmm2
100000967:	c4 e2 c1 98 db 	vfmadd132pd	%xmm3, %xmm7, %xmm3
10000096c:	c5 29 58 d6 	vaddpd	%xmm6, %xmm10, %xmm10
100000970:	c4 42 81 bc f7 	vfnmadd231pd	%xmm15, %xmm15, %xmm14
100000975:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100000979:	c4 e2 e1 9c c0 	vfnmadd132pd	%xmm0, %xmm3, %xmm0
10000097e:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000982:	c5 f1 59 dc 	vmulpd	%xmm4, %xmm1, %xmm3
100000986:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
10000098b:	c4 41 21 59 ee 	vmulpd	%xmm14, %xmm11, %xmm13
100000990:	c4 42 b1 98 f6 	vfmadd132pd	%xmm14, %xmm9, %xmm14
100000995:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000999:	c5 69 59 f8 	vmulpd	%xmm0, %xmm2, %xmm15
10000099d:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
1000009a2:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000009a6:	c4 c1 29 59 e4 	vmulpd	%xmm12, %xmm10, %xmm4
1000009ab:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
1000009b0:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
1000009b5:	c4 e2 c1 98 c0 	vfmadd132pd	%xmm0, %xmm7, %xmm0
1000009ba:	c4 42 89 9c db 	vfnmadd132pd	%xmm11, %xmm14, %xmm11
1000009bf:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000009c3:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
1000009c7:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
1000009cc:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
1000009d0:	c4 42 99 9c d2 	vfnmadd132pd	%xmm10, %xmm12, %xmm10
1000009d5:	c4 41 11 59 f3 	vmulpd	%xmm11, %xmm13, %xmm14
1000009da:	c4 42 b1 98 db 	vfmadd132pd	%xmm11, %xmm9, %xmm11
1000009df:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
1000009e3:	c5 59 58 e6 	vaddpd	%xmm6, %xmm4, %xmm12
1000009e7:	c5 f9 28 e2 	vmovapd	%xmm2, %xmm4
1000009eb:	c4 e2 f9 9c e2 	vfnmadd132pd	%xmm2, %xmm0, %xmm4
1000009f0:	c5 e1 59 d1 	vmulpd	%xmm1, %xmm3, %xmm2
1000009f4:	c4 e2 d1 98 c9 	vfmadd132pd	%xmm1, %xmm5, %xmm1
1000009f9:	c5 79 29 e0 	vmovapd	%xmm12, %xmm0
1000009fd:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100000a02:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
100000a06:	c4 e2 f1 9c db 	vfnmadd132pd	%xmm3, %xmm1, %xmm3
100000a0b:	c5 79 29 e9 	vmovapd	%xmm13, %xmm1
100000a0f:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000a13:	c4 c2 a1 9c cd 	vfnmadd132pd	%xmm13, %xmm11, %xmm1
100000a18:	c4 41 19 59 ea 	vmulpd	%xmm10, %xmm12, %xmm13
100000a1d:	c4 42 b9 98 d2 	vfmadd132pd	%xmm10, %xmm8, %xmm10
100000a22:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000a26:	c5 69 59 db 	vmulpd	%xmm3, %xmm2, %xmm11
100000a2a:	c4 e2 d1 98 db 	vfmadd132pd	%xmm3, %xmm5, %xmm3
100000a2f:	c4 c2 a9 9c c4 	vfnmadd132pd	%xmm12, %xmm10, %xmm0
100000a34:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100000a39:	c5 01 59 e4 	vmulpd	%xmm4, %xmm15, %xmm12
100000a3d:	c4 e2 c1 98 e4 	vfmadd132pd	%xmm4, %xmm7, %xmm4
100000a42:	c5 09 59 d1 	vmulpd	%xmm1, %xmm14, %xmm10
100000a46:	c4 e2 b1 98 c9 	vfmadd132pd	%xmm1, %xmm9, %xmm1
100000a4b:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
100000a4f:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100000a54:	c4 e2 e1 9c d2 	vfnmadd132pd	%xmm2, %xmm3, %xmm2
100000a59:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100000a5e:	c4 42 d9 9c ff 	vfnmadd132pd	%xmm15, %xmm4, %xmm15
100000a63:	c5 91 59 e0 	vmulpd	%xmm0, %xmm13, %xmm4
100000a67:	c4 e2 b9 98 c0 	vfmadd132pd	%xmm0, %xmm8, %xmm0
100000a6c:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100000a70:	c4 41 29 58 d2 	vaddpd	%xmm10, %xmm10, %xmm10
100000a75:	c4 42 f1 9c f6 	vfnmadd132pd	%xmm14, %xmm1, %xmm14
100000a7a:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
100000a7e:	c5 a1 59 ca 	vmulpd	%xmm2, %xmm11, %xmm1
100000a82:	c4 e2 d1 98 d2 	vfmadd132pd	%xmm2, %xmm5, %xmm2
100000a87:	c5 29 58 d6 	vaddpd	%xmm6, %xmm10, %xmm10
100000a8b:	c4 c1 19 59 df 	vmulpd	%xmm15, %xmm12, %xmm3
100000a90:	c4 42 f9 9c ed 	vfnmadd132pd	%xmm13, %xmm0, %xmm13
100000a95:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100000a99:	c4 42 c1 98 ff 	vfmadd132pd	%xmm15, %xmm7, %xmm15
100000a9e:	c4 c1 29 59 c6 	vmulpd	%xmm14, %xmm10, %xmm0
100000aa3:	c4 42 b1 98 f6 	vfmadd132pd	%xmm14, %xmm9, %xmm14
100000aa8:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100000aac:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100000ab0:	c4 42 e9 9c db 	vfnmadd132pd	%xmm11, %xmm2, %xmm11
100000ab5:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
100000ab9:	c4 42 81 9c e4 	vfnmadd132pd	%xmm12, %xmm15, %xmm12
100000abe:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
100000ac2:	c4 41 59 59 fd 	vmulpd	%xmm13, %xmm4, %xmm15
100000ac7:	c4 42 b9 98 ed 	vfmadd132pd	%xmm13, %xmm8, %xmm13
100000acc:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100000ad0:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
100000ad4:	c4 42 89 9c d2 	vfnmadd132pd	%xmm10, %xmm14, %xmm10
100000ad9:	c4 c1 71 59 d3 	vmulpd	%xmm11, %xmm1, %xmm2
100000ade:	c4 42 d1 98 db 	vfmadd132pd	%xmm11, %xmm5, %xmm11
100000ae3:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100000ae7:	c4 e2 91 9c e4 	vfnmadd132pd	%xmm4, %xmm13, %xmm4
100000aec:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100000af1:	c4 41 61 59 ec 	vmulpd	%xmm12, %xmm3, %xmm13
100000af6:	c4 42 c1 98 e4 	vfmadd132pd	%xmm12, %xmm7, %xmm12
100000afb:	c4 41 79 59 f2 	vmulpd	%xmm10, %xmm0, %xmm14
100000b00:	c4 e2 a1 9c c9 	vfnmadd132pd	%xmm1, %xmm11, %xmm1
100000b05:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000b09:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100000b0d:	c4 42 b1 98 d2 	vfmadd132pd	%xmm10, %xmm9, %xmm10
100000b12:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000b16:	c5 01 59 dc 	vmulpd	%xmm4, %xmm15, %xmm11
100000b1a:	c4 e2 99 9c db 	vfnmadd132pd	%xmm3, %xmm12, %xmm3
100000b1f:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100000b24:	c4 e2 b9 98 e4 	vfmadd132pd	%xmm4, %xmm8, %xmm4
100000b29:	c4 41 79 28 e7 	vmovapd	%xmm15, %xmm12
100000b2e:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100000b33:	c4 e2 a9 9c c0 	vfnmadd132pd	%xmm0, %xmm10, %xmm0
100000b38:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
100000b3c:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
100000b40:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100000b45:	c4 42 d9 9c e7 	vfnmadd132pd	%xmm15, %xmm4, %xmm12
100000b4a:	c4 41 79 28 d5 	vmovapd	%xmm13, %xmm10
100000b4f:	c4 c1 61 59 e5 	vmulpd	%xmm13, %xmm3, %xmm4
100000b54:	c4 e2 c1 98 db 	vfmadd132pd	%xmm3, %xmm7, %xmm3
100000b59:	c5 69 59 f9 	vmulpd	%xmm1, %xmm2, %xmm15
100000b5d:	c4 e2 d1 98 c9 	vfmadd132pd	%xmm1, %xmm5, %xmm1
100000b62:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100000b66:	c4 42 e1 9c d5 	vfnmadd132pd	%xmm13, %xmm3, %xmm10
100000b6b:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100000b6f:	c4 41 79 59 ee 	vmulpd	%xmm14, %xmm0, %xmm13
100000b74:	c4 e2 b1 98 c0 	vfmadd132pd	%xmm0, %xmm9, %xmm0
100000b79:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100000b7e:	c4 c1 19 59 db 	vmulpd	%xmm11, %xmm12, %xmm3
100000b83:	c4 e2 f1 9c d2 	vfnmadd132pd	%xmm2, %xmm1, %xmm2
100000b88:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
100000b8d:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100000b91:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100000b95:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100000b9a:	c4 42 f9 9c f6 	vfnmadd132pd	%xmm14, %xmm0, %xmm14
100000b9f:	c4 c1 69 59 cf 	vmulpd	%xmm15, %xmm2, %xmm1
100000ba4:	c4 e2 d1 98 d2 	vfmadd132pd	%xmm2, %xmm5, %xmm2
100000ba9:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
100000bad:	c5 a9 59 c4 	vmulpd	%xmm4, %xmm10, %xmm0
100000bb1:	c4 42 99 9c db 	vfnmadd132pd	%xmm11, %xmm12, %xmm11
100000bb6:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
100000bba:	c4 42 c1 98 d2 	vfmadd132pd	%xmm10, %xmm7, %xmm10
100000bbf:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
100000bc3:	c4 41 11 59 e5 	vmulpd	%xmm13, %xmm13, %xmm12
100000bc8:	c4 42 e9 9c ff 	vfnmadd132pd	%xmm15, %xmm2, %xmm15
100000bcd:	c5 79 29 f2 	vmovapd	%xmm14, %xmm2
100000bd1:	c4 41 11 59 ee 	vmulpd	%xmm14, %xmm13, %xmm13
100000bd6:	c4 c2 b1 98 d6 	vfmadd132pd	%xmm14, %xmm9, %xmm2
100000bdb:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100000bdf:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100000be3:	c4 e2 a9 9c e4 	vfnmadd132pd	%xmm4, %xmm10, %xmm4
100000be8:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100000bec:	c5 78 29 64 24 10 	vmovaps	%xmm12, 16(%rsp)
100000bf2:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
100000bf6:	c4 62 89 a8 74 24 10 	vfmadd213pd	16(%rsp), %xmm14, %xmm14
100000bfd:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100000c02:	c4 c1 69 5c d4 	vsubpd	%xmm12, %xmm2, %xmm2
100000c07:	c5 11 58 e6 	vaddpd	%xmm6, %xmm13, %xmm12
100000c0b:	c5 61 59 eb 	vmulpd	%xmm3, %xmm3, %xmm13
100000c0f:	c4 c1 61 59 db 	vmulpd	%xmm11, %xmm3, %xmm3
100000c14:	c5 78 29 24 24 	vmovaps	%xmm12, (%rsp)
100000c19:	c4 41 21 59 e3 	vmulpd	%xmm11, %xmm11, %xmm12
100000c1e:	c5 59 59 dc 	vmulpd	%xmm4, %xmm4, %xmm11
100000c22:	c4 41 79 28 d5 	vmovapd	%xmm13, %xmm10
100000c27:	c5 78 29 6c 24 30 	vmovaps	%xmm13, 48(%rsp)
100000c2d:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
100000c31:	c4 41 39 58 ec 	vaddpd	%xmm12, %xmm8, %xmm13
100000c36:	c5 78 29 64 24 20 	vmovaps	%xmm12, 32(%rsp)
100000c3c:	c5 61 58 e6 	vaddpd	%xmm6, %xmm3, %xmm12
100000c40:	c5 f9 59 d8 	vmulpd	%xmm0, %xmm0, %xmm3
100000c44:	c5 d9 59 c0 	vmulpd	%xmm0, %xmm4, %xmm0
100000c48:	c4 c1 01 59 e7 	vmulpd	%xmm15, %xmm15, %xmm4
100000c4d:	c4 41 11 5c ea 	vsubpd	%xmm10, %xmm13, %xmm13
100000c52:	c4 41 71 59 ff 	vmulpd	%xmm15, %xmm1, %xmm15
100000c57:	c5 79 28 d3 	vmovapd	%xmm3, %xmm10
100000c5b:	c5 f8 29 5c 24 40 	vmovaps	%xmm3, 64(%rsp)
100000c61:	c5 a1 58 df 	vaddpd	%xmm7, %xmm11, %xmm3
100000c65:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100000c69:	c5 f8 29 64 24 50 	vmovaps	%xmm4, 80(%rsp)
100000c6f:	c5 d1 58 e4 	vaddpd	%xmm4, %xmm5, %xmm4
100000c73:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100000c78:	c4 c1 61 5c da 	vsubpd	%xmm10, %xmm3, %xmm3
100000c7d:	c5 71 59 d1 	vmulpd	%xmm1, %xmm1, %xmm10
100000c81:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100000c85:	c5 81 58 ce 	vaddpd	%xmm6, %xmm15, %xmm1
100000c89:	c5 7b 10 3d 3f 11 00 00 	vmovsd	4415(%rip), %xmm15
100000c91:	c4 41 79 2e fe 	vucomisd	%xmm14, %xmm15
100000c96:	c5 78 29 54 24 60 	vmovaps	%xmm10, 96(%rsp)
100000c9c:	c4 c1 59 5c e2 	vsubpd	%xmm10, %xmm4, %xmm4
100000ca1:	73 6d 	jae	109 <_main._omp_fn.0+0x4B0>
100000ca3:	c4 41 09 15 f6 	vunpckhpd	%xmm14, %xmm14, %xmm14
100000ca8:	c4 41 79 2e fe 	vucomisd	%xmm14, %xmm15
100000cad:	73 61 	jae	97 <_main._omp_fn.0+0x4B0>
100000caf:	c5 79 28 74 24 20 	vmovapd	32(%rsp), %xmm14
100000cb5:	c5 09 58 54 24 30 	vaddpd	48(%rsp), %xmm14, %xmm10
100000cbb:	c4 41 79 2e fa 	vucomisd	%xmm10, %xmm15
100000cc0:	73 4e 	jae	78 <_main._omp_fn.0+0x4B0>
100000cc2:	c4 41 29 15 d2 	vunpckhpd	%xmm10, %xmm10, %xmm10
100000cc7:	c4 41 79 2e fa 	vucomisd	%xmm10, %xmm15
100000ccc:	73 42 	jae	66 <_main._omp_fn.0+0x4B0>
100000cce:	c5 21 58 5c 24 40 	vaddpd	64(%rsp), %xmm11, %xmm11
100000cd4:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100000cd9:	73 35 	jae	53 <_main._omp_fn.0+0x4B0>
100000cdb:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100000ce0:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100000ce5:	73 29 	jae	41 <_main._omp_fn.0+0x4B0>
100000ce7:	c5 79 28 74 24 50 	vmovapd	80(%rsp), %xmm14
100000ced:	c5 09 58 54 24 60 	vaddpd	96(%rsp), %xmm14, %xmm10
100000cf3:	c4 41 79 2e fa 	vucomisd	%xmm10, %xmm15
100000cf8:	73 16 	jae	22 <_main._omp_fn.0+0x4B0>
100000cfa:	c4 41 29 15 d2 	vunpckhpd	%xmm10, %xmm10, %xmm10
100000cff:	c4 41 79 2e fa 	vucomisd	%xmm10, %xmm15
100000d04:	0f 82 aa 01 00 00 	jb	426 <_main._omp_fn.0+0x654>
100000d0a:	66 0f 1f 44 00 00 	nopw	(%rax,%rax)
100000d10:	48 83 e8 01 	subq	$1, %rax
100000d14:	0f 85 1d fc ff ff 	jne	-995 <_main._omp_fn.0+0xD7>
100000d1a:	c5 79 28 3c 24 	vmovapd	(%rsp), %xmm15
100000d1f:	c5 79 28 f2 	vmovapd	%xmm2, %xmm14
100000d23:	c4 42 91 b8 c5 	vfmadd231pd	%xmm13, %xmm13, %xmm8
100000d28:	c4 41 79 28 d4 	vmovapd	%xmm12, %xmm10
100000d2d:	c4 42 b1 98 f6 	vfmadd132pd	%xmm14, %xmm9, %xmm14
100000d32:	c5 7b 10 0d 96 10 00 00 	vmovsd	4246(%rip), %xmm9
100000d3a:	c4 e2 e1 b8 fb 	vfmadd231pd	%xmm3, %xmm3, %xmm7
100000d3f:	c4 c1 69 59 d7 	vmulpd	%xmm15, %xmm2, %xmm2
100000d44:	c4 42 b9 9c d4 	vfnmadd132pd	%xmm12, %xmm8, %xmm10
100000d49:	c4 41 79 28 de 	vmovapd	%xmm14, %xmm11
100000d4e:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000d52:	c4 42 81 bc df 	vfnmadd231pd	%xmm15, %xmm15, %xmm11
100000d57:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000d5b:	c4 41 29 59 d2 	vmulpd	%xmm10, %xmm10, %xmm10
100000d60:	c5 e9 59 d2 	vmulpd	%xmm2, %xmm2, %xmm2
100000d64:	c4 42 e9 98 db 	vfmadd132pd	%xmm11, %xmm2, %xmm11
100000d69:	c4 c1 11 59 d4 	vmulpd	%xmm12, %xmm13, %xmm2
100000d6e:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100000d73:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000d77:	48 19 c0 	sbbq	%rax, %rax
100000d7a:	48 83 e0 80 	andq	$-128, %rax
100000d7e:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000d82:	48 05 bf 00 00 00 	addq	$191, %rax
100000d88:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100000d8d:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100000d92:	c4 62 e9 b8 d2 	vfmadd231pd	%xmm2, %xmm2, %xmm10
100000d97:	c5 f9 59 d3 	vmulpd	%xmm3, %xmm0, %xmm2
100000d9b:	c4 e2 c1 9c c0 	vfnmadd132pd	%xmm0, %xmm7, %xmm0
100000da0:	48 19 d2 	sbbq	%rdx, %rdx
100000da3:	48 83 e2 80 	andq	$-128, %rdx
100000da7:	48 81 c2 ff 00 00 00 	addq	$255, %rdx
100000dae:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100000db3:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000db7:	c5 f9 59 c0 	vmulpd	%xmm0, %xmm0, %xmm0
100000dbb:	48 0f 43 c2 	cmovaeq	%rdx, %rax
100000dbf:	48 89 c2 	movq	%rax, %rdx
100000dc2:	81 e2 df 00 00 00 	andl	$223, %edx
100000dc8:	c4 41 79 2e ca 	vucomisd	%xmm10, %xmm9
100000dcd:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000dd1:	c4 41 29 15 d2 	vunpckhpd	%xmm10, %xmm10, %xmm10
100000dd6:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000dda:	c4 e2 e9 b8 c2 	vfmadd231pd	%xmm2, %xmm2, %xmm0
100000ddf:	48 89 c2 	movq	%rax, %rdx
100000de2:	81 e2 ef 00 00 00 	andl	$239, %edx
100000de8:	c4 41 79 2e ca 	vucomisd	%xmm10, %xmm9
100000ded:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000df1:	48 89 c2 	movq	%rax, %rdx
100000df4:	81 e2 f7 00 00 00 	andl	$247, %edx
100000dfa:	c5 79 2e c8 	vucomisd	%xmm0, %xmm9
100000dfe:	c5 f9 15 c0 	vunpckhpd	%xmm0, %xmm0, %xmm0
100000e02:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000e06:	48 89 c2 	movq	%rax, %rdx
100000e09:	81 e2 fb 00 00 00 	andl	$251, %edx
100000e0f:	c5 79 2e c8 	vucomisd	%xmm0, %xmm9
100000e13:	c5 d9 59 c1 	vmulpd	%xmm1, %xmm4, %xmm0
100000e17:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
100000e1c:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000e20:	48 89 c2 	movq	%rax, %rdx
100000e23:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
100000e28:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100000e2c:	81 e2 fd 00 00 00 	andl	$253, %edx
100000e32:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100000e36:	c5 f1 59 c9 	vmulpd	%xmm1, %xmm1, %xmm1
100000e3a:	c4 e2 f9 b8 c8 	vfmadd231pd	%xmm0, %xmm0, %xmm1
100000e3f:	c5 79 2e c9 	vucomisd	%xmm1, %xmm9
100000e43:	c5 f1 15 c9 	vunpckhpd	%xmm1, %xmm1, %xmm1
100000e47:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000e4b:	48 89 c2 	movq	%rax, %rdx
100000e4e:	81 e2 fe 00 00 00 	andl	$254, %edx
100000e54:	c5 79 2e c9 	vucomisd	%xmm1, %xmm9
100000e58:	0f 42 c2 	cmovbl	%edx, %eax
100000e5b:	48 89 ca 	movq	%rcx, %rdx
100000e5e:	48 83 c1 08 	addq	$8, %rcx
100000e62:	48 c1 fa 03 	sarq	$3, %rdx
100000e66:	88 04 16 	movb	%al, (%rsi,%rdx)
100000e69:	4c 39 c1 	cmpq	%r8, %rcx
100000e6c:	0f 85 7e fa ff ff 	jne	-1410 <_main._omp_fn.0+0x90>
100000e72:	49 83 c1 01 	addq	$1, %r9
100000e76:	4c 01 ff 	addq	%r15, %rdi
100000e79:	4d 39 ca 	cmpq	%r9, %r10
100000e7c:	0f 8f 50 fa ff ff 	jg	-1456 <_main._omp_fn.0+0x72>
100000e82:	48 89 ee 	movq	%rbp, %rsi
100000e85:	48 89 df 	movq	%rbx, %rdi
100000e88:	4c 89 04 24 	movq	%r8, (%rsp)
100000e8c:	e8 89 0e 00 00 	callq	3721 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D445>
100000e91:	4c 8b 04 24 	movq	(%rsp), %r8
100000e95:	84 c0 	testb	%al, %al
100000e97:	0f 85 1b fa ff ff 	jne	-1509 <_main._omp_fn.0+0x58>
100000e9d:	e8 72 0e 00 00 	callq	3698 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D43F>
100000ea2:	48 81 c4 88 00 00 00 	addq	$136, %rsp
100000ea9:	5b 	popq	%rbx
100000eaa:	5d 	popq	%rbp
100000eab:	41 5c 	popq	%r12
100000ead:	41 5d 	popq	%r13
100000eaf:	41 5e 	popq	%r14
100000eb1:	41 5f 	popq	%r15
100000eb3:	c3 	retq
100000eb4:	31 c0 	xorl	%eax, %eax
100000eb6:	eb a3 	jmp	-93 <_main._omp_fn.0+0x5FB>
100000eb8:	0f 1f 84 00 00 00 00 00 	nopl	(%rax,%rax)
100000ec0:	41 57 	pushq	%r15
100000ec2:	b9 01 00 00 00 	movl	$1, %ecx
100000ec7:	ba 01 00 00 00 	movl	$1, %edx
100000ecc:	41 56 	pushq	%r14
100000ece:	41 55 	pushq	%r13
100000ed0:	41 54 	pushq	%r12
100000ed2:	55 	pushq	%rbp
100000ed3:	53 	pushq	%rbx
100000ed4:	48 81 ec a8 00 00 00 	subq	$168, %rsp
100000edb:	48 8b 47 10 	movq	16(%rdi), %rax
100000edf:	48 8b 2f 	movq	(%rdi), %rbp
100000ee2:	48 8d 9c 24 98 00 00 00 	leaq	152(%rsp), %rbx
100000eea:	4c 8d bc 24 90 00 00 00 	leaq	144(%rsp), %r15
100000ef2:	4c 8b 6f 18 	movq	24(%rdi), %r13
100000ef6:	48 89 44 24 70 	movq	%rax, 112(%rsp)
100000efb:	48 8b 47 08 	movq	8(%rdi), %rax
100000eff:	49 89 d9 	movq	%rbx, %r9
100000f02:	31 ff 	xorl	%edi, %edi
100000f04:	4d 89 f8 	movq	%r15, %r8
100000f07:	48 89 ee 	movq	%rbp, %rsi
100000f0a:	48 89 44 24 78 	movq	%rax, 120(%rsp)
100000f0f:	e8 0c 0e 00 00 	callq	3596 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D44B>
100000f14:	84 c0 	testb	%al, %al
100000f16:	0f 84 2f 06 00 00 	je	1583 <_main._omp_fn.1+0x68B>
100000f1c:	49 bc 00 00 00 00 00 00 00 fe 	movabsq	$-144115188075855872, %r12
100000f26:	48 8b 84 24 98 00 00 00 	movq	152(%rsp), %rax
100000f2e:	4c 8b 8c 24 90 00 00 00 	movq	144(%rsp), %r9
100000f36:	48 89 84 24 80 00 00 00 	movq	%rax, 128(%rsp)
100000f3e:	48 85 ed 	testq	%rbp, %rbp
100000f41:	0f 8e f1 05 00 00 	jle	1521 <_main._omp_fn.1+0x678>
100000f47:	48 8d 45 ff 	leaq	-1(%rbp), %rax
100000f4b:	49 89 e8 	movq	%rbp, %r8
100000f4e:	48 83 e0 c0 	andq	$-64, %rax
100000f52:	4d 0f af c1 	imulq	%r9, %r8
100000f56:	48 83 c0 40 	addq	$64, %rax
100000f5a:	48 89 84 24 88 00 00 00 	movq	%rax, 136(%rsp)
100000f62:	4d 85 c0 	testq	%r8, %r8
100000f65:	4d 8d 50 3f 	leaq	63(%r8), %r10
100000f69:	c4 81 7b 12 74 cd 00 	vmovddup	(%r13,%r9,8), %xmm6
100000f70:	4d 0f 49 d0 	cmovnsq	%r8, %r10
100000f74:	31 ff 	xorl	%edi, %edi
100000f76:	49 c1 fa 06 	sarq	$6, %r10
100000f7a:	66 0f 1f 44 00 00 	nopw	(%rax,%rax)
100000f80:	48 89 fa 	movq	%rdi, %rdx
100000f83:	48 89 f8 	movq	%rdi, %rax
100000f86:	48 8b 74 24 78 	movq	120(%rsp), %rsi
100000f8b:	31 c9 	xorl	%ecx, %ecx
100000f8d:	48 d1 fa 	sarq	%rdx
100000f90:	48 c1 f8 06 	sarq	$6, %rax
100000f94:	48 c1 e2 04 	shlq	$4, %rdx
100000f98:	4c 01 d0 	addq	%r10, %rax
100000f9b:	48 03 54 24 70 	addq	112(%rsp), %rdx
100000fa0:	4c 8d 1c c6 	leaq	(%rsi,%rax,8), %r11
100000fa4:	48 8d b2 00 02 00 00 	leaq	512(%rdx), %rsi
100000fab:	0f 1f 44 00 00 	nopl	(%rax,%rax)
100000fb0:	c5 79 28 12 	vmovapd	(%rdx), %xmm10
100000fb4:	c5 f9 28 ce 	vmovapd	%xmm6, %xmm1
100000fb8:	c5 f9 28 c6 	vmovapd	%xmm6, %xmm0
100000fbc:	c5 79 28 f6 	vmovapd	%xmm6, %xmm14
100000fc0:	c5 79 28 4a 10 	vmovapd	16(%rdx), %xmm9
100000fc5:	c5 79 28 42 20 	vmovapd	32(%rdx), %xmm8
100000fca:	b8 06 00 00 00 	movl	$6, %eax
100000fcf:	c5 f9 28 de 	vmovapd	%xmm6, %xmm3
100000fd3:	c5 f9 28 7a 30 	vmovapd	48(%rdx), %xmm7
100000fd8:	c4 41 79 28 e2 	vmovapd	%xmm10, %xmm12
100000fdd:	c5 79 29 c4 	vmovapd	%xmm8, %xmm4
100000fe1:	c5 79 29 ca 	vmovapd	%xmm9, %xmm2
100000fe5:	c5 f9 28 ef 	vmovapd	%xmm7, %xmm5
100000fe9:	c5 19 59 db 	vmulpd	%xmm3, %xmm12, %xmm11
100000fed:	c4 42 a9 98 e4 	vfmadd132pd	%xmm12, %xmm10, %xmm12
100000ff2:	c5 79 59 ec 	vmulpd	%xmm4, %xmm0, %xmm13
100000ff6:	c4 e2 b9 98 e4 	vfmadd132pd	%xmm4, %xmm8, %xmm4
100000ffb:	c4 62 e1 bc e3 	vfnmadd231pd	%xmm3, %xmm3, %xmm12
100001000:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100001005:	c5 89 59 da 	vmulpd	%xmm2, %xmm14, %xmm3
100001009:	c4 e2 b1 98 d2 	vfmadd132pd	%xmm2, %xmm9, %xmm2
10000100e:	c4 e2 d9 9c c0 	vfnmadd132pd	%xmm0, %xmm4, %xmm0
100001013:	c4 c1 11 58 e5 	vaddpd	%xmm13, %xmm13, %xmm4
100001018:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
10000101c:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100001020:	c4 41 21 59 ec 	vmulpd	%xmm12, %xmm11, %xmm13
100001025:	c4 c2 89 bc d6 	vfnmadd231pd	%xmm14, %xmm14, %xmm2
10000102a:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
10000102e:	c5 51 59 f1 	vmulpd	%xmm1, %xmm5, %xmm14
100001032:	c4 42 a9 98 e4 	vfmadd132pd	%xmm12, %xmm10, %xmm12
100001037:	c5 59 59 f8 	vmulpd	%xmm0, %xmm4, %xmm15
10000103b:	c4 e2 c1 98 ed 	vfmadd132pd	%xmm5, %xmm7, %xmm5
100001040:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
100001044:	c4 e2 b9 98 c0 	vfmadd132pd	%xmm0, %xmm8, %xmm0
100001049:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
10000104e:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100001053:	c4 42 99 9c db 	vfnmadd132pd	%xmm11, %xmm12, %xmm11
100001058:	c5 61 59 e2 	vmulpd	%xmm2, %xmm3, %xmm12
10000105c:	c4 e2 d1 9c c9 	vfnmadd132pd	%xmm1, %xmm5, %xmm1
100001061:	c5 f9 28 eb 	vmovapd	%xmm3, %xmm5
100001065:	c4 e2 b1 98 d2 	vfmadd132pd	%xmm2, %xmm9, %xmm2
10000106a:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
10000106e:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100001073:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
100001077:	c4 e2 f9 9c e4 	vfnmadd132pd	%xmm4, %xmm0, %xmm4
10000107c:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100001080:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100001085:	c4 e2 e9 9c eb 	vfnmadd132pd	%xmm3, %xmm2, %xmm5
10000108a:	c5 79 29 f2 	vmovapd	%xmm14, %xmm2
10000108e:	c5 89 59 d9 	vmulpd	%xmm1, %xmm14, %xmm3
100001092:	c4 e2 c1 98 c9 	vfmadd132pd	%xmm1, %xmm7, %xmm1
100001097:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
10000109b:	c5 79 29 e0 	vmovapd	%xmm12, %xmm0
10000109f:	c4 c2 f1 9c d6 	vfnmadd132pd	%xmm14, %xmm1, %xmm2
1000010a4:	c5 79 29 e9 	vmovapd	%xmm13, %xmm1
1000010a8:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000010ac:	c4 41 11 59 f3 	vmulpd	%xmm11, %xmm13, %xmm14
1000010b1:	c4 42 a9 98 db 	vfmadd132pd	%xmm11, %xmm10, %xmm11
1000010b6:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000010ba:	c4 c2 a1 9c cd 	vfnmadd132pd	%xmm13, %xmm11, %xmm1
1000010bf:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
1000010c4:	c5 19 59 ed 	vmulpd	%xmm5, %xmm12, %xmm13
1000010c8:	c4 e2 b1 98 ed 	vfmadd132pd	%xmm5, %xmm9, %xmm5
1000010cd:	c5 61 59 da 	vmulpd	%xmm2, %xmm3, %xmm11
1000010d1:	c4 e2 c1 98 d2 	vfmadd132pd	%xmm2, %xmm7, %xmm2
1000010d6:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
1000010da:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
1000010df:	c4 c2 d1 9c c4 	vfnmadd132pd	%xmm12, %xmm5, %xmm0
1000010e4:	c5 01 59 e4 	vmulpd	%xmm4, %xmm15, %xmm12
1000010e8:	c4 e2 b9 98 e4 	vfmadd132pd	%xmm4, %xmm8, %xmm4
1000010ed:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
1000010f2:	c5 89 59 e9 	vmulpd	%xmm1, %xmm14, %xmm5
1000010f6:	c4 e2 e9 9c db 	vfnmadd132pd	%xmm3, %xmm2, %xmm3
1000010fb:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
1000010ff:	c4 e2 a9 98 c9 	vfmadd132pd	%xmm1, %xmm10, %xmm1
100001104:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100001108:	c4 42 d9 9c ff 	vfnmadd132pd	%xmm15, %xmm4, %xmm15
10000110d:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100001112:	c5 91 59 e0 	vmulpd	%xmm0, %xmm13, %xmm4
100001116:	c4 e2 b1 98 c0 	vfmadd132pd	%xmm0, %xmm9, %xmm0
10000111b:	c5 d1 58 ed 	vaddpd	%xmm5, %xmm5, %xmm5
10000111f:	c4 42 f1 9c f6 	vfnmadd132pd	%xmm14, %xmm1, %xmm14
100001124:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
100001128:	c5 a1 59 cb 	vmulpd	%xmm3, %xmm11, %xmm1
10000112c:	c4 e2 c1 98 db 	vfmadd132pd	%xmm3, %xmm7, %xmm3
100001131:	c5 d1 58 ee 	vaddpd	%xmm6, %xmm5, %xmm5
100001135:	c4 c1 19 59 d7 	vmulpd	%xmm15, %xmm12, %xmm2
10000113a:	c4 42 f9 9c ed 	vfnmadd132pd	%xmm13, %xmm0, %xmm13
10000113f:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100001143:	c4 c1 51 59 c6 	vmulpd	%xmm14, %xmm5, %xmm0
100001148:	c4 42 b9 98 ff 	vfmadd132pd	%xmm15, %xmm8, %xmm15
10000114d:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100001151:	c4 42 a9 98 f6 	vfmadd132pd	%xmm14, %xmm10, %xmm14
100001156:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
10000115a:	c4 42 e1 9c db 	vfnmadd132pd	%xmm11, %xmm3, %xmm11
10000115f:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001163:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
100001167:	c4 42 81 9c e4 	vfnmadd132pd	%xmm12, %xmm15, %xmm12
10000116c:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100001170:	c4 41 59 59 fd 	vmulpd	%xmm13, %xmm4, %xmm15
100001175:	c4 42 b1 98 ed 	vfmadd132pd	%xmm13, %xmm9, %xmm13
10000117a:	c4 c1 71 59 db 	vmulpd	%xmm11, %xmm1, %xmm3
10000117f:	c4 42 c1 98 db 	vfmadd132pd	%xmm11, %xmm7, %xmm11
100001184:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001188:	c4 e2 89 9c ed 	vfnmadd132pd	%xmm5, %xmm14, %xmm5
10000118d:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100001191:	c4 41 69 59 f4 	vmulpd	%xmm12, %xmm2, %xmm14
100001196:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
10000119b:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
1000011a0:	c4 e2 91 9c e4 	vfnmadd132pd	%xmm4, %xmm13, %xmm4
1000011a5:	c4 e2 a1 9c c9 	vfnmadd132pd	%xmm1, %xmm11, %xmm1
1000011aa:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000011ae:	c5 79 59 ed 	vmulpd	%xmm5, %xmm0, %xmm13
1000011b2:	c4 e2 a9 98 ed 	vfmadd132pd	%xmm5, %xmm10, %xmm5
1000011b7:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
1000011bb:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
1000011c0:	c4 e2 99 9c d2 	vfnmadd132pd	%xmm2, %xmm12, %xmm2
1000011c5:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000011c9:	c5 01 59 dc 	vmulpd	%xmm4, %xmm15, %xmm11
1000011cd:	c4 e2 b1 98 e4 	vfmadd132pd	%xmm4, %xmm9, %xmm4
1000011d2:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
1000011d6:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
1000011db:	c4 e2 d1 9c c0 	vfnmadd132pd	%xmm0, %xmm5, %xmm0
1000011e0:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
1000011e4:	c5 79 29 f5 	vmovapd	%xmm14, %xmm5
1000011e8:	c4 42 d9 9c ff 	vfnmadd132pd	%xmm15, %xmm4, %xmm15
1000011ed:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
1000011f2:	c5 89 59 e2 	vmulpd	%xmm2, %xmm14, %xmm4
1000011f6:	c4 e2 b9 98 d2 	vfmadd132pd	%xmm2, %xmm8, %xmm2
1000011fb:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
1000011ff:	c4 41 79 28 e7 	vmovapd	%xmm15, %xmm12
100001204:	c5 61 59 f9 	vmulpd	%xmm1, %xmm3, %xmm15
100001208:	c4 e2 c1 98 c9 	vfmadd132pd	%xmm1, %xmm7, %xmm1
10000120d:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100001211:	c4 c2 e9 9c ee 	vfnmadd132pd	%xmm14, %xmm2, %xmm5
100001216:	c5 11 59 f0 	vmulpd	%xmm0, %xmm13, %xmm14
10000121a:	c4 e2 a9 98 c0 	vfmadd132pd	%xmm0, %xmm10, %xmm0
10000121f:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100001223:	c4 c1 21 59 d4 	vmulpd	%xmm12, %xmm11, %xmm2
100001228:	c4 42 b1 98 e4 	vfmadd132pd	%xmm12, %xmm9, %xmm12
10000122d:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100001232:	c4 e2 f1 9c db 	vfnmadd132pd	%xmm3, %xmm1, %xmm3
100001237:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
10000123c:	c4 42 f9 9c ed 	vfnmadd132pd	%xmm13, %xmm0, %xmm13
100001241:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100001245:	c5 d9 59 c5 	vmulpd	%xmm5, %xmm4, %xmm0
100001249:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
10000124d:	c4 e2 b9 98 ed 	vfmadd132pd	%xmm5, %xmm8, %xmm5
100001252:	c4 42 99 9c db 	vfnmadd132pd	%xmm11, %xmm12, %xmm11
100001257:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
10000125b:	c5 81 59 cb 	vmulpd	%xmm3, %xmm15, %xmm1
10000125f:	c4 e2 c1 98 db 	vfmadd132pd	%xmm3, %xmm7, %xmm3
100001264:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001268:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
10000126c:	c4 e2 d1 9c e4 	vfnmadd132pd	%xmm4, %xmm5, %xmm4
100001271:	c4 c1 09 59 ee 	vmulpd	%xmm14, %xmm14, %xmm5
100001276:	c4 41 09 59 f5 	vmulpd	%xmm13, %xmm14, %xmm14
10000127b:	c4 42 e1 9c ff 	vfnmadd132pd	%xmm15, %xmm3, %xmm15
100001280:	c5 79 29 eb 	vmovapd	%xmm13, %xmm3
100001284:	c4 c2 a9 98 dd 	vfmadd132pd	%xmm13, %xmm10, %xmm3
100001289:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
10000128d:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100001291:	c5 f8 29 6c 24 10 	vmovaps	%xmm5, 16(%rsp)
100001297:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
10000129b:	c4 62 91 a8 6c 24 10 	vfmadd213pd	16(%rsp), %xmm13, %xmm13
1000012a2:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
1000012a7:	c5 61 5c e5 	vsubpd	%xmm5, %xmm3, %xmm12
1000012ab:	c5 e9 59 ea 	vmulpd	%xmm2, %xmm2, %xmm5
1000012af:	c5 89 58 de 	vaddpd	%xmm6, %xmm14, %xmm3
1000012b3:	c4 41 21 59 f3 	vmulpd	%xmm11, %xmm11, %xmm14
1000012b8:	c4 41 69 59 db 	vmulpd	%xmm11, %xmm2, %xmm11
1000012bd:	c5 f8 29 6c 24 30 	vmovaps	%xmm5, 48(%rsp)
1000012c3:	c4 c1 31 58 d6 	vaddpd	%xmm14, %xmm9, %xmm2
1000012c8:	c5 78 29 74 24 20 	vmovaps	%xmm14, 32(%rsp)
1000012ce:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
1000012d3:	c5 e9 5c d5 	vsubpd	%xmm5, %xmm2, %xmm2
1000012d7:	c5 f9 59 e8 	vmulpd	%xmm0, %xmm0, %xmm5
1000012db:	c5 21 58 f6 	vaddpd	%xmm6, %xmm11, %xmm14
1000012df:	c5 59 59 dc 	vmulpd	%xmm4, %xmm4, %xmm11
1000012e3:	c5 f9 59 c4 	vmulpd	%xmm4, %xmm0, %xmm0
1000012e7:	c5 f8 29 6c 24 50 	vmovaps	%xmm5, 80(%rsp)
1000012ed:	c4 c1 39 58 e3 	vaddpd	%xmm11, %xmm8, %xmm4
1000012f2:	c5 78 29 5c 24 40 	vmovaps	%xmm11, 64(%rsp)
1000012f8:	c4 41 01 59 df 	vmulpd	%xmm15, %xmm15, %xmm11
1000012fd:	c4 41 71 59 ff 	vmulpd	%xmm15, %xmm1, %xmm15
100001302:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100001306:	c5 d9 5c e5 	vsubpd	%xmm5, %xmm4, %xmm4
10000130a:	c5 f1 59 e9 	vmulpd	%xmm1, %xmm1, %xmm5
10000130e:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100001312:	c5 78 29 5c 24 60 	vmovaps	%xmm11, 96(%rsp)
100001318:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
10000131d:	c5 f8 29 2c 24 	vmovaps	%xmm5, (%rsp)
100001322:	c4 c1 41 58 eb 	vaddpd	%xmm11, %xmm7, %xmm5
100001327:	c5 d1 5c 2c 24 	vsubpd	(%rsp), %xmm5, %xmm5
10000132c:	c5 81 58 ce 	vaddpd	%xmm6, %xmm15, %xmm1
100001330:	c5 7b 10 3d 98 0a 00 00 	vmovsd	2712(%rip), %xmm15
100001338:	c4 41 79 2e fd 	vucomisd	%xmm13, %xmm15
10000133d:	73 71 	jae	113 <_main._omp_fn.1+0x4F0>
10000133f:	c4 41 11 15 ed 	vunpckhpd	%xmm13, %xmm13, %xmm13
100001344:	c4 41 79 2e fd 	vucomisd	%xmm13, %xmm15
100001349:	73 65 	jae	101 <_main._omp_fn.1+0x4F0>
10000134b:	c5 79 28 6c 24 20 	vmovapd	32(%rsp), %xmm13
100001351:	c5 11 58 5c 24 30 	vaddpd	48(%rsp), %xmm13, %xmm11
100001357:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
10000135c:	73 52 	jae	82 <_main._omp_fn.1+0x4F0>
10000135e:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100001363:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100001368:	73 46 	jae	70 <_main._omp_fn.1+0x4F0>
10000136a:	c5 79 28 6c 24 40 	vmovapd	64(%rsp), %xmm13
100001370:	c5 11 58 5c 24 50 	vaddpd	80(%rsp), %xmm13, %xmm11
100001376:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
10000137b:	73 33 	jae	51 <_main._omp_fn.1+0x4F0>
10000137d:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100001382:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100001387:	73 27 	jae	39 <_main._omp_fn.1+0x4F0>
100001389:	c5 79 28 6c 24 60 	vmovapd	96(%rsp), %xmm13
10000138f:	c5 11 58 1c 24 	vaddpd	(%rsp), %xmm13, %xmm11
100001394:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100001399:	73 15 	jae	21 <_main._omp_fn.1+0x4F0>
10000139b:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
1000013a0:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
1000013a5:	0f 82 b7 01 00 00 	jb	439 <_main._omp_fn.1+0x6A2>
1000013ab:	0f 1f 44 00 00 	nopl	(%rax,%rax)
1000013b0:	48 83 e8 01 	subq	$1, %rax
1000013b4:	0f 85 2f fc ff ff 	jne	-977 <_main._omp_fn.1+0x129>
1000013ba:	c4 41 79 28 ec 	vmovapd	%xmm12, %xmm13
1000013bf:	c4 62 d9 b8 c4 	vfmadd231pd	%xmm4, %xmm4, %xmm8
1000013c4:	c5 79 28 fa 	vmovapd	%xmm2, %xmm15
1000013c8:	c5 91 59 d3 	vmulpd	%xmm3, %xmm13, %xmm2
1000013cc:	c4 42 a9 98 ed 	vfmadd132pd	%xmm13, %xmm10, %xmm13
1000013d1:	c4 42 81 b8 cf 	vfmadd231pd	%xmm15, %xmm15, %xmm9
1000013d6:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
1000013da:	c4 62 e1 bc eb 	vfnmadd231pd	%xmm3, %xmm3, %xmm13
1000013df:	c5 fb 10 1d e9 09 00 00 	vmovsd	2537(%rip), %xmm3
1000013e7:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
1000013eb:	c5 e9 59 d2 	vmulpd	%xmm2, %xmm2, %xmm2
1000013ef:	c4 42 e9 98 ed 	vfmadd132pd	%xmm13, %xmm2, %xmm13
1000013f4:	c4 c1 09 59 d7 	vmulpd	%xmm15, %xmm14, %xmm2
1000013f9:	c4 42 b1 9c f6 	vfnmadd132pd	%xmm14, %xmm9, %xmm14
1000013fe:	c4 c1 79 2e dd 	vucomisd	%xmm13, %xmm3
100001403:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001407:	c4 41 09 59 de 	vmulpd	%xmm14, %xmm14, %xmm11
10000140c:	48 19 c0 	sbbq	%rax, %rax
10000140f:	48 83 e0 80 	andq	$-128, %rax
100001413:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001417:	48 05 bf 00 00 00 	addq	$191, %rax
10000141d:	c4 c1 79 2e dd 	vucomisd	%xmm13, %xmm3
100001422:	c4 41 11 15 ed 	vunpckhpd	%xmm13, %xmm13, %xmm13
100001427:	c4 62 e9 b8 da 	vfmadd231pd	%xmm2, %xmm2, %xmm11
10000142c:	c5 f9 59 d4 	vmulpd	%xmm4, %xmm0, %xmm2
100001430:	c4 e2 b9 9c c0 	vfnmadd132pd	%xmm0, %xmm8, %xmm0
100001435:	4d 19 f6 	sbbq	%r14, %r14
100001438:	49 83 e6 80 	andq	$-128, %r14
10000143c:	49 81 c6 ff 00 00 00 	addq	$255, %r14
100001443:	c4 c1 79 2e dd 	vucomisd	%xmm13, %xmm3
100001448:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
10000144c:	c5 f9 59 c0 	vmulpd	%xmm0, %xmm0, %xmm0
100001450:	49 0f 43 c6 	cmovaeq	%r14, %rax
100001454:	49 89 c6 	movq	%rax, %r14
100001457:	41 81 e6 df 00 00 00 	andl	$223, %r14d
10000145e:	c4 c1 79 2e db 	vucomisd	%xmm11, %xmm3
100001463:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001467:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
10000146c:	49 0f 42 c6 	cmovbq	%r14, %rax
100001470:	c4 e2 e9 b8 c2 	vfmadd231pd	%xmm2, %xmm2, %xmm0
100001475:	49 89 c6 	movq	%rax, %r14
100001478:	41 81 e6 ef 00 00 00 	andl	$239, %r14d
10000147f:	c4 c1 79 2e db 	vucomisd	%xmm11, %xmm3
100001484:	49 0f 42 c6 	cmovbq	%r14, %rax
100001488:	49 89 c6 	movq	%rax, %r14
10000148b:	41 81 e6 f7 00 00 00 	andl	$247, %r14d
100001492:	c5 f9 2e d8 	vucomisd	%xmm0, %xmm3
100001496:	c5 f9 15 c0 	vunpckhpd	%xmm0, %xmm0, %xmm0
10000149a:	49 0f 42 c6 	cmovbq	%r14, %rax
10000149e:	49 89 c6 	movq	%rax, %r14
1000014a1:	41 81 e6 fb 00 00 00 	andl	$251, %r14d
1000014a8:	c5 f9 2e d8 	vucomisd	%xmm0, %xmm3
1000014ac:	c5 d1 59 c1 	vmulpd	%xmm1, %xmm5, %xmm0
1000014b0:	c4 e2 c1 98 ed 	vfmadd132pd	%xmm5, %xmm7, %xmm5
1000014b5:	49 0f 42 c6 	cmovbq	%r14, %rax
1000014b9:	49 89 c6 	movq	%rax, %r14
1000014bc:	c4 e2 d1 9c c9 	vfnmadd132pd	%xmm1, %xmm5, %xmm1
1000014c1:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
1000014c5:	41 81 e6 fd 00 00 00 	andl	$253, %r14d
1000014cc:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
1000014d0:	c5 f1 59 c9 	vmulpd	%xmm1, %xmm1, %xmm1
1000014d4:	c4 e2 f9 b8 c8 	vfmadd231pd	%xmm0, %xmm0, %xmm1
1000014d9:	c5 f9 2e d9 	vucomisd	%xmm1, %xmm3
1000014dd:	c5 f1 15 c1 	vunpckhpd	%xmm1, %xmm1, %xmm0
1000014e1:	49 0f 42 c6 	cmovbq	%r14, %rax
1000014e5:	49 89 c6 	movq	%rax, %r14
1000014e8:	49 c1 e6 38 	shlq	$56, %r14
1000014ec:	4c 89 f0 	movq	%r14, %rax
1000014ef:	4c 21 e0 	andq	%r12, %rax
1000014f2:	c5 f9 2e d8 	vucomisd	%xmm0, %xmm3
1000014f6:	49 0f 43 c6 	cmovaeq	%r14, %rax
1000014fa:	48 c1 e9 08 	shrq	$8, %rcx
1000014fe:	48 83 c2 40 	addq	$64, %rdx
100001502:	48 09 c1 	orq	%rax, %rcx
100001505:	48 39 f2 	cmpq	%rsi, %rdx
100001508:	0f 85 a2 fa ff ff 	jne	-1374 <_main._omp_fn.1+0xF0>
10000150e:	49 89 0b 	movq	%rcx, (%r11)
100001511:	48 83 c7 40 	addq	$64, %rdi
100001515:	48 3b bc 24 88 00 00 00 	cmpq	136(%rsp), %rdi
10000151d:	0f 85 5d fa ff ff 	jne	-1443 <_main._omp_fn.1+0xC0>
100001523:	49 83 c1 01 	addq	$1, %r9
100001527:	49 01 e8 	addq	%rbp, %r8
10000152a:	4c 39 8c 24 80 00 00 00 	cmpq	%r9, 128(%rsp)
100001532:	0f 8f 2a fa ff ff 	jg	-1494 <_main._omp_fn.1+0xA2>
100001538:	48 89 de 	movq	%rbx, %rsi
10000153b:	4c 89 ff 	movq	%r15, %rdi
10000153e:	e8 d7 07 00 00 	callq	2007 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D445>
100001543:	84 c0 	testb	%al, %al
100001545:	0f 85 db f9 ff ff 	jne	-1573 <_main._omp_fn.1+0x66>
10000154b:	e8 c4 07 00 00 	callq	1988 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D43F>
100001550:	48 81 c4 a8 00 00 00 	addq	$168, %rsp
100001557:	5b 	popq	%rbx
100001558:	5d 	popq	%rbp
100001559:	41 5c 	popq	%r12
10000155b:	41 5d 	popq	%r13
10000155d:	41 5e 	popq	%r14
10000155f:	41 5f 	popq	%r15
100001561:	c3 	retq
100001562:	31 c0 	xorl	%eax, %eax
100001564:	eb 94 	jmp	-108 <_main._omp_fn.1+0x63A>
100001566:	66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
100001570:	31 c9 	xorl	%ecx, %ecx
100001572:	48 85 ff 	testq	%rdi, %rdi
100001575:	74 33 	je	51 <_numDigits+0x3A>
100001577:	48 be 67 66 66 66 66 66 66 66 	movabsq	$7378697629483820647, %rsi
100001581:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
100001590:	48 89 f8 	movq	%rdi, %rax
100001593:	48 c1 ff 3f 	sarq	$63, %rdi
100001597:	48 83 c1 01 	addq	$1, %rcx
10000159b:	48 f7 ee 	imulq	%rsi
10000159e:	48 c1 fa 02 	sarq	$2, %rdx
1000015a2:	48 29 fa 	subq	%rdi, %rdx
1000015a5:	48 89 d7 	movq	%rdx, %rdi
1000015a8:	75 e6 	jne	-26 <_numDigits+0x20>
1000015aa:	48 89 c8 	movq	%rcx, %rax
1000015ad:	c3 	retq
1000015ae:	66 90 	nop
1000015b0:	c5 f9 28 f0 	vmovapd	%xmm0, %xmm6
1000015b4:	48 8d b7 00 02 00 00 	leaq	512(%rdi), %rsi
1000015bb:	31 c0 	xorl	%eax, %eax
1000015bd:	0f 1f 00 	nopl	(%rax)
1000015c0:	c5 79 28 0f 	vmovapd	(%rdi), %xmm9
1000015c4:	c5 f9 28 ce 	vmovapd	%xmm6, %xmm1
1000015c8:	c5 f9 28 c6 	vmovapd	%xmm6, %xmm0
1000015cc:	c5 79 28 e6 	vmovapd	%xmm6, %xmm12
1000015d0:	c5 79 28 47 10 	vmovapd	16(%rdi), %xmm8
1000015d5:	c5 f9 28 7f 20 	vmovapd	32(%rdi), %xmm7
1000015da:	ba 06 00 00 00 	movl	$6, %edx
1000015df:	c5 f9 28 de 	vmovapd	%xmm6, %xmm3
1000015e3:	c5 f9 28 6f 30 	vmovapd	48(%rdi), %xmm5
1000015e8:	c4 41 79 28 d1 	vmovapd	%xmm9, %xmm10
1000015ed:	c5 79 28 f7 	vmovapd	%xmm7, %xmm14
1000015f1:	c4 41 79 28 f8 	vmovapd	%xmm8, %xmm15
1000015f6:	c5 f9 28 e5 	vmovapd	%xmm5, %xmm4
1000015fa:	c5 29 59 db 	vmulpd	%xmm3, %xmm10, %xmm11
1000015fe:	c4 42 b1 98 d2 	vfmadd132pd	%xmm10, %xmm9, %xmm10
100001603:	c5 d9 59 d1 	vmulpd	%xmm1, %xmm4, %xmm2
100001607:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
10000160c:	c4 41 79 28 ea 	vmovapd	%xmm10, %xmm13
100001611:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100001616:	c4 62 e1 bc eb 	vfnmadd231pd	%xmm3, %xmm3, %xmm13
10000161b:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
100001620:	c5 e9 58 e2 	vaddpd	%xmm2, %xmm2, %xmm4
100001624:	c4 c1 01 59 dc 	vmulpd	%xmm12, %xmm15, %xmm3
100001629:	c4 42 b9 98 ff 	vfmadd132pd	%xmm15, %xmm8, %xmm15
10000162e:	c5 09 59 d0 	vmulpd	%xmm0, %xmm14, %xmm10
100001632:	c4 42 c1 98 f6 	vfmadd132pd	%xmm14, %xmm7, %xmm14
100001637:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
10000163b:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
10000163f:	c4 c1 21 59 d5 	vmulpd	%xmm13, %xmm11, %xmm2
100001644:	c4 42 b1 98 ed 	vfmadd132pd	%xmm13, %xmm9, %xmm13
100001649:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
10000164d:	c4 42 81 9c e4 	vfnmadd132pd	%xmm12, %xmm15, %xmm12
100001652:	c4 e2 89 9c c0 	vfnmadd132pd	%xmm0, %xmm14, %xmm0
100001657:	c4 41 29 58 d2 	vaddpd	%xmm10, %xmm10, %xmm10
10000165c:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
100001660:	c5 29 58 d6 	vaddpd	%xmm6, %xmm10, %xmm10
100001664:	c4 42 91 9c db 	vfnmadd132pd	%xmm11, %xmm13, %xmm11
100001669:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
10000166d:	c4 41 61 59 f4 	vmulpd	%xmm12, %xmm3, %xmm14
100001672:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
100001677:	c5 29 59 e8 	vmulpd	%xmm0, %xmm10, %xmm13
10000167b:	c4 e2 c1 98 c0 	vfmadd132pd	%xmm0, %xmm7, %xmm0
100001680:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001684:	c4 41 69 59 fb 	vmulpd	%xmm11, %xmm2, %xmm15
100001689:	c4 42 b1 98 db 	vfmadd132pd	%xmm11, %xmm9, %xmm11
10000168e:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100001693:	c4 62 e1 bc e3 	vfnmadd231pd	%xmm3, %xmm3, %xmm12
100001698:	c5 d9 59 d9 	vmulpd	%xmm1, %xmm4, %xmm3
10000169c:	c4 e2 d1 98 c9 	vfmadd132pd	%xmm1, %xmm5, %xmm1
1000016a1:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
1000016a6:	c4 42 f9 9c d2 	vfnmadd132pd	%xmm10, %xmm0, %xmm10
1000016ab:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
1000016af:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
1000016b3:	c4 e2 a1 9c d2 	vfnmadd132pd	%xmm2, %xmm11, %xmm2
1000016b8:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
1000016bd:	c4 e2 f1 9c e4 	vfnmadd132pd	%xmm4, %xmm1, %xmm4
1000016c2:	c5 79 29 f0 	vmovapd	%xmm14, %xmm0
1000016c6:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000016ca:	c4 c1 09 59 cc 	vmulpd	%xmm12, %xmm14, %xmm1
1000016cf:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
1000016d4:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
1000016d8:	c4 41 11 59 da 	vmulpd	%xmm10, %xmm13, %xmm11
1000016dd:	c4 42 c1 98 d2 	vfmadd132pd	%xmm10, %xmm7, %xmm10
1000016e2:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000016e6:	c4 c2 99 9c c6 	vfnmadd132pd	%xmm14, %xmm12, %xmm0
1000016eb:	c5 71 58 f1 	vaddpd	%xmm1, %xmm1, %xmm14
1000016ef:	c5 79 29 e9 	vmovapd	%xmm13, %xmm1
1000016f3:	c5 61 59 e4 	vmulpd	%xmm4, %xmm3, %xmm12
1000016f7:	c4 c2 a9 9c cd 	vfnmadd132pd	%xmm13, %xmm10, %xmm1
1000016fc:	c4 41 21 58 eb 	vaddpd	%xmm11, %xmm11, %xmm13
100001701:	c5 01 59 da 	vmulpd	%xmm2, %xmm15, %xmm11
100001705:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
10000170a:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
10000170e:	c4 e2 b1 98 d2 	vfmadd132pd	%xmm2, %xmm9, %xmm2
100001713:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
100001717:	c5 09 59 d0 	vmulpd	%xmm0, %xmm14, %xmm10
10000171b:	c4 e2 b9 98 c0 	vfmadd132pd	%xmm0, %xmm8, %xmm0
100001720:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100001725:	c4 e2 d9 9c db 	vfnmadd132pd	%xmm3, %xmm4, %xmm3
10000172a:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
10000172f:	c5 91 59 e1 	vmulpd	%xmm1, %xmm13, %xmm4
100001733:	c4 e2 c1 98 c9 	vfmadd132pd	%xmm1, %xmm7, %xmm1
100001738:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
10000173c:	c4 42 e9 9c ff 	vfnmadd132pd	%xmm15, %xmm2, %xmm15
100001741:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100001745:	c4 41 29 58 d2 	vaddpd	%xmm10, %xmm10, %xmm10
10000174a:	c4 42 f9 9c f6 	vfnmadd132pd	%xmm14, %xmm0, %xmm14
10000174f:	c5 99 59 d3 	vmulpd	%xmm3, %xmm12, %xmm2
100001753:	c4 e2 d1 98 db 	vfmadd132pd	%xmm3, %xmm5, %xmm3
100001758:	c4 42 f1 9c ed 	vfnmadd132pd	%xmm13, %xmm1, %xmm13
10000175d:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100001761:	c5 29 58 d6 	vaddpd	%xmm6, %xmm10, %xmm10
100001765:	c4 c1 21 59 c7 	vmulpd	%xmm15, %xmm11, %xmm0
10000176a:	c4 42 b1 98 ff 	vfmadd132pd	%xmm15, %xmm9, %xmm15
10000176f:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100001773:	c4 c1 29 59 ce 	vmulpd	%xmm14, %xmm10, %xmm1
100001778:	c4 42 b9 98 f6 	vfmadd132pd	%xmm14, %xmm8, %xmm14
10000177d:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001781:	c4 42 e1 9c e4 	vfnmadd132pd	%xmm12, %xmm3, %xmm12
100001786:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
10000178a:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
10000178e:	c4 42 81 9c db 	vfnmadd132pd	%xmm11, %xmm15, %xmm11
100001793:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100001797:	c4 42 89 9c d2 	vfnmadd132pd	%xmm10, %xmm14, %xmm10
10000179c:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
1000017a0:	c5 99 59 da 	vmulpd	%xmm2, %xmm12, %xmm3
1000017a4:	c4 42 d1 98 e4 	vfmadd132pd	%xmm12, %xmm5, %xmm12
1000017a9:	c5 71 58 f6 	vaddpd	%xmm6, %xmm1, %xmm14
1000017ad:	c4 c1 59 59 cd 	vmulpd	%xmm13, %xmm4, %xmm1
1000017b2:	c4 42 c1 98 ed 	vfmadd132pd	%xmm13, %xmm7, %xmm13
1000017b7:	c4 41 29 59 fe 	vmulpd	%xmm14, %xmm10, %xmm15
1000017bc:	c4 42 b9 98 d2 	vfmadd132pd	%xmm10, %xmm8, %xmm10
1000017c1:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000017c5:	c4 e2 99 9c d2 	vfnmadd132pd	%xmm2, %xmm12, %xmm2
1000017ca:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
1000017ce:	c5 21 59 e0 	vmulpd	%xmm0, %xmm11, %xmm12
1000017d2:	c4 e2 91 9c e4 	vfnmadd132pd	%xmm4, %xmm13, %xmm4
1000017d7:	c4 42 b1 98 db 	vfmadd132pd	%xmm11, %xmm9, %xmm11
1000017dc:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000017e0:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
1000017e4:	c4 42 89 bc d6 	vfnmadd231pd	%xmm14, %xmm14, %xmm10
1000017e9:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
1000017ee:	c5 69 59 eb 	vmulpd	%xmm3, %xmm2, %xmm13
1000017f2:	c4 e2 d1 98 d2 	vfmadd132pd	%xmm2, %xmm5, %xmm2
1000017f7:	c5 59 59 f1 	vmulpd	%xmm1, %xmm4, %xmm14
1000017fb:	c4 e2 c1 98 e4 	vfmadd132pd	%xmm4, %xmm7, %xmm4
100001800:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100001804:	c4 e2 a1 9c c0 	vfnmadd132pd	%xmm0, %xmm11, %xmm0
100001809:	c4 41 19 58 dc 	vaddpd	%xmm12, %xmm12, %xmm11
10000180e:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100001813:	c4 e2 e9 9c db 	vfnmadd132pd	%xmm3, %xmm2, %xmm3
100001818:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
10000181c:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100001821:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
100001826:	c5 79 29 fc 	vmovapd	%xmm15, %xmm4
10000182a:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
10000182e:	c4 41 79 59 e3 	vmulpd	%xmm11, %xmm0, %xmm12
100001833:	c4 e2 b1 98 c0 	vfmadd132pd	%xmm0, %xmm9, %xmm0
100001838:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
10000183c:	c4 c1 71 59 d6 	vmulpd	%xmm14, %xmm1, %xmm2
100001841:	c4 e2 c1 98 c9 	vfmadd132pd	%xmm1, %xmm7, %xmm1
100001846:	c4 42 f9 9c db 	vfnmadd132pd	%xmm11, %xmm0, %xmm11
10000184b:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100001850:	c4 c1 01 59 c2 	vmulpd	%xmm10, %xmm15, %xmm0
100001855:	c4 42 b9 98 d2 	vfmadd132pd	%xmm10, %xmm8, %xmm10
10000185a:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
10000185e:	c4 42 f1 9c f6 	vfnmadd132pd	%xmm14, %xmm1, %xmm14
100001863:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001867:	c4 c1 61 59 cd 	vmulpd	%xmm13, %xmm3, %xmm1
10000186c:	c4 e2 d1 98 db 	vfmadd132pd	%xmm3, %xmm5, %xmm3
100001871:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100001875:	c4 c2 a9 9c e7 	vfnmadd132pd	%xmm15, %xmm10, %xmm4
10000187a:	c4 41 19 59 fc 	vmulpd	%xmm12, %xmm12, %xmm15
10000187f:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001883:	c4 41 19 59 e3 	vmulpd	%xmm11, %xmm12, %xmm12
100001888:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
10000188c:	c4 42 e1 9c ed 	vfnmadd132pd	%xmm13, %xmm3, %xmm13
100001891:	c5 79 29 db 	vmovapd	%xmm11, %xmm3
100001895:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100001899:	c4 c2 b1 98 db 	vfmadd132pd	%xmm11, %xmm9, %xmm3
10000189e:	c5 78 29 7c 24 98 	vmovaps	%xmm15, -104(%rsp)
1000018a4:	c4 62 a1 a8 5c 24 98 	vfmadd213pd	-104(%rsp), %xmm11, %xmm11
1000018ab:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
1000018b0:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
1000018b4:	c4 41 61 5c d7 	vsubpd	%xmm15, %xmm3, %xmm10
1000018b9:	c5 79 59 f8 	vmulpd	%xmm0, %xmm0, %xmm15
1000018bd:	c5 99 58 de 	vaddpd	%xmm6, %xmm12, %xmm3
1000018c1:	c5 f9 59 c4 	vmulpd	%xmm4, %xmm0, %xmm0
1000018c5:	c5 59 59 e4 	vmulpd	%xmm4, %xmm4, %xmm12
1000018c9:	c4 c1 09 59 e6 	vmulpd	%xmm14, %xmm14, %xmm4
1000018ce:	c5 78 29 7c 24 88 	vmovaps	%xmm15, -120(%rsp)
1000018d4:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
1000018d8:	c4 41 39 58 fc 	vaddpd	%xmm12, %xmm8, %xmm15
1000018dd:	c5 78 29 64 24 a8 	vmovaps	%xmm12, -88(%rsp)
1000018e3:	c5 01 5c 7c 24 88 	vsubpd	-120(%rsp), %xmm15, %xmm15
1000018e9:	c5 f8 29 64 24 b8 	vmovaps	%xmm4, -72(%rsp)
1000018ef:	c5 79 58 e6 	vaddpd	%xmm6, %xmm0, %xmm12
1000018f3:	c5 e9 59 c2 	vmulpd	%xmm2, %xmm2, %xmm0
1000018f7:	c5 89 59 d2 	vmulpd	%xmm2, %xmm14, %xmm2
1000018fb:	c5 41 58 f4 	vaddpd	%xmm4, %xmm7, %xmm14
1000018ff:	c4 c1 11 59 e5 	vmulpd	%xmm13, %xmm13, %xmm4
100001904:	c4 41 71 59 ed 	vmulpd	%xmm13, %xmm1, %xmm13
100001909:	c5 f8 29 44 24 c8 	vmovaps	%xmm0, -56(%rsp)
10000190f:	c5 09 5c f0 	vsubpd	%xmm0, %xmm14, %xmm14
100001913:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001917:	c5 f8 29 64 24 d8 	vmovaps	%xmm4, -40(%rsp)
10000191d:	c5 d1 58 e4 	vaddpd	%xmm4, %xmm5, %xmm4
100001921:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100001926:	c5 e9 58 c6 	vaddpd	%xmm6, %xmm2, %xmm0
10000192a:	c5 f1 59 d1 	vmulpd	%xmm1, %xmm1, %xmm2
10000192e:	c5 91 58 ce 	vaddpd	%xmm6, %xmm13, %xmm1
100001932:	c5 7b 10 2d 96 04 00 00 	vmovsd	1174(%rip), %xmm13
10000193a:	c4 41 79 2e eb 	vucomisd	%xmm11, %xmm13
10000193f:	c5 f8 29 54 24 e8 	vmovaps	%xmm2, -24(%rsp)
100001945:	c5 d9 5c e2 	vsubpd	%xmm2, %xmm4, %xmm4
100001949:	73 65 	jae	101 <_mand64+0x400>
10000194b:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100001950:	c4 41 79 2e eb 	vucomisd	%xmm11, %xmm13
100001955:	73 59 	jae	89 <_mand64+0x400>
100001957:	c5 f9 28 54 24 a8 	vmovapd	-88(%rsp), %xmm2
10000195d:	c5 e9 58 54 24 88 	vaddpd	-120(%rsp), %xmm2, %xmm2
100001963:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
100001967:	73 47 	jae	71 <_mand64+0x400>
100001969:	c5 e9 15 d2 	vunpckhpd	%xmm2, %xmm2, %xmm2
10000196d:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
100001971:	73 3d 	jae	61 <_mand64+0x400>
100001973:	c5 f9 28 54 24 b8 	vmovapd	-72(%rsp), %xmm2
100001979:	c5 e9 58 54 24 c8 	vaddpd	-56(%rsp), %xmm2, %xmm2
10000197f:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
100001983:	73 2b 	jae	43 <_mand64+0x400>
100001985:	c5 e9 15 d2 	vunpckhpd	%xmm2, %xmm2, %xmm2
100001989:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
10000198d:	73 21 	jae	33 <_mand64+0x400>
10000198f:	c5 f9 28 54 24 d8 	vmovapd	-40(%rsp), %xmm2
100001995:	c5 e9 58 54 24 e8 	vaddpd	-24(%rsp), %xmm2, %xmm2
10000199b:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
10000199f:	73 0f 	jae	15 <_mand64+0x400>
1000019a1:	c5 e9 15 d2 	vunpckhpd	%xmm2, %xmm2, %xmm2
1000019a5:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
1000019a9:	0f 82 6e 01 00 00 	jb	366 <_mand64+0x56D>
1000019af:	90 	nop
1000019b0:	48 83 ea 01 	subq	$1, %rdx
1000019b4:	0f 85 40 fc ff ff 	jne	-960 <_mand64+0x4A>
1000019ba:	c5 a9 59 d3 	vmulpd	%xmm3, %xmm10, %xmm2
1000019be:	c4 41 79 28 da 	vmovapd	%xmm10, %xmm11
1000019c3:	c4 41 79 28 ef 	vmovapd	%xmm15, %xmm13
1000019c8:	c5 78 29 74 24 88 	vmovaps	%xmm14, -120(%rsp)
1000019ce:	c4 42 b1 98 da 	vfmadd132pd	%xmm10, %xmm9, %xmm11
1000019d3:	c4 42 91 b8 c5 	vfmadd231pd	%xmm13, %xmm13, %xmm8
1000019d8:	c4 41 79 28 d4 	vmovapd	%xmm12, %xmm10
1000019dd:	c5 7b 10 0d eb 03 00 00 	vmovsd	1003(%rip), %xmm9
1000019e5:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
1000019e9:	c4 62 e1 bc db 	vfnmadd231pd	%xmm3, %xmm3, %xmm11
1000019ee:	c4 42 b9 9c d4 	vfnmadd132pd	%xmm12, %xmm8, %xmm10
1000019f3:	c5 f9 28 5c 24 88 	vmovapd	-120(%rsp), %xmm3
1000019f9:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
1000019fd:	c4 e2 e1 b8 fb 	vfmadd231pd	%xmm3, %xmm3, %xmm7
100001a02:	c5 e9 59 d2 	vmulpd	%xmm2, %xmm2, %xmm2
100001a06:	c4 41 29 59 d2 	vmulpd	%xmm10, %xmm10, %xmm10
100001a0b:	c4 42 e9 98 db 	vfmadd132pd	%xmm11, %xmm2, %xmm11
100001a10:	c4 c1 11 59 d4 	vmulpd	%xmm12, %xmm13, %xmm2
100001a15:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100001a1a:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001a1e:	48 19 d2 	sbbq	%rdx, %rdx
100001a21:	48 83 e2 80 	andq	$-128, %rdx
100001a25:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001a29:	48 81 c2 bf 00 00 00 	addq	$191, %rdx
100001a30:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100001a35:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100001a3a:	c4 62 e9 b8 d2 	vfmadd231pd	%xmm2, %xmm2, %xmm10
100001a3f:	c5 f9 59 d3 	vmulpd	%xmm3, %xmm0, %xmm2
100001a43:	c4 e2 c1 9c c0 	vfnmadd132pd	%xmm0, %xmm7, %xmm0
100001a48:	48 19 c9 	sbbq	%rcx, %rcx
100001a4b:	48 83 e1 80 	andq	$-128, %rcx
100001a4f:	48 81 c1 ff 00 00 00 	addq	$255, %rcx
100001a56:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100001a5b:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001a5f:	c5 f9 59 c0 	vmulpd	%xmm0, %xmm0, %xmm0
100001a63:	48 0f 43 d1 	cmovaeq	%rcx, %rdx
100001a67:	48 89 d1 	movq	%rdx, %rcx
100001a6a:	81 e1 df 00 00 00 	andl	$223, %ecx
100001a70:	c4 41 79 2e ca 	vucomisd	%xmm10, %xmm9
100001a75:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001a79:	c4 41 29 15 d2 	vunpckhpd	%xmm10, %xmm10, %xmm10
100001a7e:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001a82:	c4 e2 e9 b8 c2 	vfmadd231pd	%xmm2, %xmm2, %xmm0
100001a87:	48 89 d1 	movq	%rdx, %rcx
100001a8a:	81 e1 ef 00 00 00 	andl	$239, %ecx
100001a90:	c4 41 79 2e ca 	vucomisd	%xmm10, %xmm9
100001a95:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001a99:	48 89 d1 	movq	%rdx, %rcx
100001a9c:	81 e1 f7 00 00 00 	andl	$247, %ecx
100001aa2:	c5 79 2e c8 	vucomisd	%xmm0, %xmm9
100001aa6:	c5 f9 15 c0 	vunpckhpd	%xmm0, %xmm0, %xmm0
100001aaa:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001aae:	48 89 d1 	movq	%rdx, %rcx
100001ab1:	81 e1 fb 00 00 00 	andl	$251, %ecx
100001ab7:	c5 79 2e c8 	vucomisd	%xmm0, %xmm9
100001abb:	c5 d9 59 c1 	vmulpd	%xmm1, %xmm4, %xmm0
100001abf:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
100001ac4:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001ac8:	48 89 d1 	movq	%rdx, %rcx
100001acb:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
100001ad0:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100001ad4:	81 e1 fd 00 00 00 	andl	$253, %ecx
100001ada:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100001ade:	c5 f1 59 c9 	vmulpd	%xmm1, %xmm1, %xmm1
100001ae2:	c4 e2 f9 b8 c8 	vfmadd231pd	%xmm0, %xmm0, %xmm1
100001ae7:	c5 79 2e c9 	vucomisd	%xmm1, %xmm9
100001aeb:	c5 f1 15 c9 	vunpckhpd	%xmm1, %xmm1, %xmm1
100001aef:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001af3:	48 89 d1 	movq	%rdx, %rcx
100001af6:	81 e1 fe 00 00 00 	andl	$254, %ecx
100001afc:	c5 79 2e c9 	vucomisd	%xmm1, %xmm9
100001b00:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001b04:	48 c1 e8 08 	shrq	$8, %rax
100001b08:	48 83 c7 40 	addq	$64, %rdi
100001b0c:	48 c1 e2 38 	shlq	$56, %rdx
100001b10:	48 09 d0 	orq	%rdx, %rax
100001b13:	48 39 f7 	cmpq	%rsi, %rdi
100001b16:	0f 85 a4 fa ff ff 	jne	-1372 <_mand64+0x10>
100001b1c:	c3 	retq
100001b1d:	31 d2 	xorl	%edx, %edx
100001b1f:	eb e3 	jmp	-29 <_mand64+0x554>

_main._omp_fn.0:
100000860:	41 57 	pushq	%r15
100000862:	b9 01 00 00 00 	movl	$1, %ecx
100000867:	ba 01 00 00 00 	movl	$1, %edx
10000086c:	41 56 	pushq	%r14
10000086e:	41 55 	pushq	%r13
100000870:	41 54 	pushq	%r12
100000872:	55 	pushq	%rbp
100000873:	53 	pushq	%rbx
100000874:	48 81 ec 88 00 00 00 	subq	$136, %rsp
10000087b:	4c 8b 3f 	movq	(%rdi), %r15
10000087e:	4c 8b 67 18 	movq	24(%rdi), %r12
100000882:	48 8d 6c 24 78 	leaq	120(%rsp), %rbp
100000887:	48 8d 5c 24 70 	leaq	112(%rsp), %rbx
10000088c:	4c 8b 77 10 	movq	16(%rdi), %r14
100000890:	4c 8b 6f 08 	movq	8(%rdi), %r13
100000894:	49 89 e9 	movq	%rbp, %r9
100000897:	31 ff 	xorl	%edi, %edi
100000899:	49 89 d8 	movq	%rbx, %r8
10000089c:	4c 89 fe 	movq	%r15, %rsi
10000089f:	e8 7c 14 00 00 	callq	5244 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D44B>
1000008a4:	84 c0 	testb	%al, %al
1000008a6:	0f 84 f1 05 00 00 	je	1521 <_main._omp_fn.0+0x63D>
1000008ac:	4d 8d 47 ff 	leaq	-1(%r15), %r8
1000008b0:	49 83 e0 f8 	andq	$-8, %r8
1000008b4:	49 83 c0 08 	addq	$8, %r8
1000008b8:	4c 8b 4c 24 70 	movq	112(%rsp), %r9
1000008bd:	4c 8b 54 24 78 	movq	120(%rsp), %r10
1000008c2:	4d 85 ff 	testq	%r15, %r15
1000008c5:	0f 8e b7 05 00 00 	jle	1463 <_main._omp_fn.0+0x622>
1000008cb:	4c 89 ff 	movq	%r15, %rdi
1000008ce:	49 0f af f9 	imulq	%r9, %rdi
1000008d2:	48 85 ff 	testq	%rdi, %rdi
1000008d5:	48 8d 47 07 	leaq	7(%rdi), %rax
1000008d9:	c4 81 7b 12 34 cc 	vmovddup	(%r12,%r9,8), %xmm6
1000008df:	48 0f 49 c7 	cmovnsq	%rdi, %rax
1000008e3:	31 c9 	xorl	%ecx, %ecx
1000008e5:	48 c1 f8 03 	sarq	$3, %rax
1000008e9:	49 8d 74 05 00 	leaq	(%r13,%rax), %rsi
1000008ee:	66 90 	nop
1000008f0:	48 89 c8 	movq	%rcx, %rax
1000008f3:	c5 f9 28 ce 	vmovapd	%xmm6, %xmm1
1000008f7:	c5 f9 28 c6 	vmovapd	%xmm6, %xmm0
1000008fb:	c5 f8 29 34 24 	vmovaps	%xmm6, (%rsp)
100000900:	48 d1 f8 	sarq	%rax
100000903:	c5 79 28 e6 	vmovapd	%xmm6, %xmm12
100000907:	48 c1 e0 04 	shlq	$4, %rax
10000090b:	4c 01 f0 	addq	%r14, %rax
10000090e:	c5 79 28 08 	vmovapd	(%rax), %xmm9
100000912:	c5 79 28 40 10 	vmovapd	16(%rax), %xmm8
100000917:	c5 f9 28 78 20 	vmovapd	32(%rax), %xmm7
10000091c:	c5 f9 28 68 30 	vmovapd	48(%rax), %xmm5
100000921:	b8 06 00 00 00 	movl	$6, %eax
100000926:	c4 41 79 28 e8 	vmovapd	%xmm8, %xmm13
10000092b:	c5 79 29 ca 	vmovapd	%xmm9, %xmm2
10000092f:	c5 f9 28 e5 	vmovapd	%xmm5, %xmm4
100000933:	c5 f9 28 df 	vmovapd	%xmm7, %xmm3
100000937:	c5 79 28 3c 24 	vmovapd	(%rsp), %xmm15
10000093c:	c4 41 19 59 d5 	vmulpd	%xmm13, %xmm12, %xmm10
100000941:	c4 42 b9 98 ed 	vfmadd132pd	%xmm13, %xmm8, %xmm13
100000946:	c4 41 69 59 df 	vmulpd	%xmm15, %xmm2, %xmm11
10000094b:	c4 e2 b1 98 d2 	vfmadd132pd	%xmm2, %xmm9, %xmm2
100000950:	c4 41 29 58 d2 	vaddpd	%xmm10, %xmm10, %xmm10
100000955:	c4 42 91 9c e4 	vfnmadd132pd	%xmm12, %xmm13, %xmm12
10000095a:	c5 79 28 f2 	vmovapd	%xmm2, %xmm14
10000095e:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100000963:	c5 f9 59 d3 	vmulpd	%xmm3, %xmm0, %xmm2
100000967:	c4 e2 c1 98 db 	vfmadd132pd	%xmm3, %xmm7, %xmm3
10000096c:	c5 29 58 d6 	vaddpd	%xmm6, %xmm10, %xmm10
100000970:	c4 42 81 bc f7 	vfnmadd231pd	%xmm15, %xmm15, %xmm14
100000975:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100000979:	c4 e2 e1 9c c0 	vfnmadd132pd	%xmm0, %xmm3, %xmm0
10000097e:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000982:	c5 f1 59 dc 	vmulpd	%xmm4, %xmm1, %xmm3
100000986:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
10000098b:	c4 41 21 59 ee 	vmulpd	%xmm14, %xmm11, %xmm13
100000990:	c4 42 b1 98 f6 	vfmadd132pd	%xmm14, %xmm9, %xmm14
100000995:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000999:	c5 69 59 f8 	vmulpd	%xmm0, %xmm2, %xmm15
10000099d:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
1000009a2:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000009a6:	c4 c1 29 59 e4 	vmulpd	%xmm12, %xmm10, %xmm4
1000009ab:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
1000009b0:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
1000009b5:	c4 e2 c1 98 c0 	vfmadd132pd	%xmm0, %xmm7, %xmm0
1000009ba:	c4 42 89 9c db 	vfnmadd132pd	%xmm11, %xmm14, %xmm11
1000009bf:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000009c3:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
1000009c7:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
1000009cc:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
1000009d0:	c4 42 99 9c d2 	vfnmadd132pd	%xmm10, %xmm12, %xmm10
1000009d5:	c4 41 11 59 f3 	vmulpd	%xmm11, %xmm13, %xmm14
1000009da:	c4 42 b1 98 db 	vfmadd132pd	%xmm11, %xmm9, %xmm11
1000009df:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
1000009e3:	c5 59 58 e6 	vaddpd	%xmm6, %xmm4, %xmm12
1000009e7:	c5 f9 28 e2 	vmovapd	%xmm2, %xmm4
1000009eb:	c4 e2 f9 9c e2 	vfnmadd132pd	%xmm2, %xmm0, %xmm4
1000009f0:	c5 e1 59 d1 	vmulpd	%xmm1, %xmm3, %xmm2
1000009f4:	c4 e2 d1 98 c9 	vfmadd132pd	%xmm1, %xmm5, %xmm1
1000009f9:	c5 79 29 e0 	vmovapd	%xmm12, %xmm0
1000009fd:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100000a02:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
100000a06:	c4 e2 f1 9c db 	vfnmadd132pd	%xmm3, %xmm1, %xmm3
100000a0b:	c5 79 29 e9 	vmovapd	%xmm13, %xmm1
100000a0f:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000a13:	c4 c2 a1 9c cd 	vfnmadd132pd	%xmm13, %xmm11, %xmm1
100000a18:	c4 41 19 59 ea 	vmulpd	%xmm10, %xmm12, %xmm13
100000a1d:	c4 42 b9 98 d2 	vfmadd132pd	%xmm10, %xmm8, %xmm10
100000a22:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000a26:	c5 69 59 db 	vmulpd	%xmm3, %xmm2, %xmm11
100000a2a:	c4 e2 d1 98 db 	vfmadd132pd	%xmm3, %xmm5, %xmm3
100000a2f:	c4 c2 a9 9c c4 	vfnmadd132pd	%xmm12, %xmm10, %xmm0
100000a34:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100000a39:	c5 01 59 e4 	vmulpd	%xmm4, %xmm15, %xmm12
100000a3d:	c4 e2 c1 98 e4 	vfmadd132pd	%xmm4, %xmm7, %xmm4
100000a42:	c5 09 59 d1 	vmulpd	%xmm1, %xmm14, %xmm10
100000a46:	c4 e2 b1 98 c9 	vfmadd132pd	%xmm1, %xmm9, %xmm1
100000a4b:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
100000a4f:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100000a54:	c4 e2 e1 9c d2 	vfnmadd132pd	%xmm2, %xmm3, %xmm2
100000a59:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100000a5e:	c4 42 d9 9c ff 	vfnmadd132pd	%xmm15, %xmm4, %xmm15
100000a63:	c5 91 59 e0 	vmulpd	%xmm0, %xmm13, %xmm4
100000a67:	c4 e2 b9 98 c0 	vfmadd132pd	%xmm0, %xmm8, %xmm0
100000a6c:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100000a70:	c4 41 29 58 d2 	vaddpd	%xmm10, %xmm10, %xmm10
100000a75:	c4 42 f1 9c f6 	vfnmadd132pd	%xmm14, %xmm1, %xmm14
100000a7a:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
100000a7e:	c5 a1 59 ca 	vmulpd	%xmm2, %xmm11, %xmm1
100000a82:	c4 e2 d1 98 d2 	vfmadd132pd	%xmm2, %xmm5, %xmm2
100000a87:	c5 29 58 d6 	vaddpd	%xmm6, %xmm10, %xmm10
100000a8b:	c4 c1 19 59 df 	vmulpd	%xmm15, %xmm12, %xmm3
100000a90:	c4 42 f9 9c ed 	vfnmadd132pd	%xmm13, %xmm0, %xmm13
100000a95:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100000a99:	c4 42 c1 98 ff 	vfmadd132pd	%xmm15, %xmm7, %xmm15
100000a9e:	c4 c1 29 59 c6 	vmulpd	%xmm14, %xmm10, %xmm0
100000aa3:	c4 42 b1 98 f6 	vfmadd132pd	%xmm14, %xmm9, %xmm14
100000aa8:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100000aac:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100000ab0:	c4 42 e9 9c db 	vfnmadd132pd	%xmm11, %xmm2, %xmm11
100000ab5:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
100000ab9:	c4 42 81 9c e4 	vfnmadd132pd	%xmm12, %xmm15, %xmm12
100000abe:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
100000ac2:	c4 41 59 59 fd 	vmulpd	%xmm13, %xmm4, %xmm15
100000ac7:	c4 42 b9 98 ed 	vfmadd132pd	%xmm13, %xmm8, %xmm13
100000acc:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100000ad0:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
100000ad4:	c4 42 89 9c d2 	vfnmadd132pd	%xmm10, %xmm14, %xmm10
100000ad9:	c4 c1 71 59 d3 	vmulpd	%xmm11, %xmm1, %xmm2
100000ade:	c4 42 d1 98 db 	vfmadd132pd	%xmm11, %xmm5, %xmm11
100000ae3:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100000ae7:	c4 e2 91 9c e4 	vfnmadd132pd	%xmm4, %xmm13, %xmm4
100000aec:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100000af1:	c4 41 61 59 ec 	vmulpd	%xmm12, %xmm3, %xmm13
100000af6:	c4 42 c1 98 e4 	vfmadd132pd	%xmm12, %xmm7, %xmm12
100000afb:	c4 41 79 59 f2 	vmulpd	%xmm10, %xmm0, %xmm14
100000b00:	c4 e2 a1 9c c9 	vfnmadd132pd	%xmm1, %xmm11, %xmm1
100000b05:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000b09:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100000b0d:	c4 42 b1 98 d2 	vfmadd132pd	%xmm10, %xmm9, %xmm10
100000b12:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000b16:	c5 01 59 dc 	vmulpd	%xmm4, %xmm15, %xmm11
100000b1a:	c4 e2 99 9c db 	vfnmadd132pd	%xmm3, %xmm12, %xmm3
100000b1f:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100000b24:	c4 e2 b9 98 e4 	vfmadd132pd	%xmm4, %xmm8, %xmm4
100000b29:	c4 41 79 28 e7 	vmovapd	%xmm15, %xmm12
100000b2e:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100000b33:	c4 e2 a9 9c c0 	vfnmadd132pd	%xmm0, %xmm10, %xmm0
100000b38:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
100000b3c:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
100000b40:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100000b45:	c4 42 d9 9c e7 	vfnmadd132pd	%xmm15, %xmm4, %xmm12
100000b4a:	c4 41 79 28 d5 	vmovapd	%xmm13, %xmm10
100000b4f:	c4 c1 61 59 e5 	vmulpd	%xmm13, %xmm3, %xmm4
100000b54:	c4 e2 c1 98 db 	vfmadd132pd	%xmm3, %xmm7, %xmm3
100000b59:	c5 69 59 f9 	vmulpd	%xmm1, %xmm2, %xmm15
100000b5d:	c4 e2 d1 98 c9 	vfmadd132pd	%xmm1, %xmm5, %xmm1
100000b62:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100000b66:	c4 42 e1 9c d5 	vfnmadd132pd	%xmm13, %xmm3, %xmm10
100000b6b:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100000b6f:	c4 41 79 59 ee 	vmulpd	%xmm14, %xmm0, %xmm13
100000b74:	c4 e2 b1 98 c0 	vfmadd132pd	%xmm0, %xmm9, %xmm0
100000b79:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100000b7e:	c4 c1 19 59 db 	vmulpd	%xmm11, %xmm12, %xmm3
100000b83:	c4 e2 f1 9c d2 	vfnmadd132pd	%xmm2, %xmm1, %xmm2
100000b88:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
100000b8d:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100000b91:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100000b95:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100000b9a:	c4 42 f9 9c f6 	vfnmadd132pd	%xmm14, %xmm0, %xmm14
100000b9f:	c4 c1 69 59 cf 	vmulpd	%xmm15, %xmm2, %xmm1
100000ba4:	c4 e2 d1 98 d2 	vfmadd132pd	%xmm2, %xmm5, %xmm2
100000ba9:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
100000bad:	c5 a9 59 c4 	vmulpd	%xmm4, %xmm10, %xmm0
100000bb1:	c4 42 99 9c db 	vfnmadd132pd	%xmm11, %xmm12, %xmm11
100000bb6:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
100000bba:	c4 42 c1 98 d2 	vfmadd132pd	%xmm10, %xmm7, %xmm10
100000bbf:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
100000bc3:	c4 41 11 59 e5 	vmulpd	%xmm13, %xmm13, %xmm12
100000bc8:	c4 42 e9 9c ff 	vfnmadd132pd	%xmm15, %xmm2, %xmm15
100000bcd:	c5 79 29 f2 	vmovapd	%xmm14, %xmm2
100000bd1:	c4 41 11 59 ee 	vmulpd	%xmm14, %xmm13, %xmm13
100000bd6:	c4 c2 b1 98 d6 	vfmadd132pd	%xmm14, %xmm9, %xmm2
100000bdb:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100000bdf:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100000be3:	c4 e2 a9 9c e4 	vfnmadd132pd	%xmm4, %xmm10, %xmm4
100000be8:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100000bec:	c5 78 29 64 24 10 	vmovaps	%xmm12, 16(%rsp)
100000bf2:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
100000bf6:	c4 62 89 a8 74 24 10 	vfmadd213pd	16(%rsp), %xmm14, %xmm14
100000bfd:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100000c02:	c4 c1 69 5c d4 	vsubpd	%xmm12, %xmm2, %xmm2
100000c07:	c5 11 58 e6 	vaddpd	%xmm6, %xmm13, %xmm12
100000c0b:	c5 61 59 eb 	vmulpd	%xmm3, %xmm3, %xmm13
100000c0f:	c4 c1 61 59 db 	vmulpd	%xmm11, %xmm3, %xmm3
100000c14:	c5 78 29 24 24 	vmovaps	%xmm12, (%rsp)
100000c19:	c4 41 21 59 e3 	vmulpd	%xmm11, %xmm11, %xmm12
100000c1e:	c5 59 59 dc 	vmulpd	%xmm4, %xmm4, %xmm11
100000c22:	c4 41 79 28 d5 	vmovapd	%xmm13, %xmm10
100000c27:	c5 78 29 6c 24 30 	vmovaps	%xmm13, 48(%rsp)
100000c2d:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
100000c31:	c4 41 39 58 ec 	vaddpd	%xmm12, %xmm8, %xmm13
100000c36:	c5 78 29 64 24 20 	vmovaps	%xmm12, 32(%rsp)
100000c3c:	c5 61 58 e6 	vaddpd	%xmm6, %xmm3, %xmm12
100000c40:	c5 f9 59 d8 	vmulpd	%xmm0, %xmm0, %xmm3
100000c44:	c5 d9 59 c0 	vmulpd	%xmm0, %xmm4, %xmm0
100000c48:	c4 c1 01 59 e7 	vmulpd	%xmm15, %xmm15, %xmm4
100000c4d:	c4 41 11 5c ea 	vsubpd	%xmm10, %xmm13, %xmm13
100000c52:	c4 41 71 59 ff 	vmulpd	%xmm15, %xmm1, %xmm15
100000c57:	c5 79 28 d3 	vmovapd	%xmm3, %xmm10
100000c5b:	c5 f8 29 5c 24 40 	vmovaps	%xmm3, 64(%rsp)
100000c61:	c5 a1 58 df 	vaddpd	%xmm7, %xmm11, %xmm3
100000c65:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100000c69:	c5 f8 29 64 24 50 	vmovaps	%xmm4, 80(%rsp)
100000c6f:	c5 d1 58 e4 	vaddpd	%xmm4, %xmm5, %xmm4
100000c73:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100000c78:	c4 c1 61 5c da 	vsubpd	%xmm10, %xmm3, %xmm3
100000c7d:	c5 71 59 d1 	vmulpd	%xmm1, %xmm1, %xmm10
100000c81:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100000c85:	c5 81 58 ce 	vaddpd	%xmm6, %xmm15, %xmm1
100000c89:	c5 7b 10 3d 3f 11 00 00 	vmovsd	4415(%rip), %xmm15
100000c91:	c4 41 79 2e fe 	vucomisd	%xmm14, %xmm15
100000c96:	c5 78 29 54 24 60 	vmovaps	%xmm10, 96(%rsp)
100000c9c:	c4 c1 59 5c e2 	vsubpd	%xmm10, %xmm4, %xmm4
100000ca1:	73 6d 	jae	109 <_main._omp_fn.0+0x4B0>
100000ca3:	c4 41 09 15 f6 	vunpckhpd	%xmm14, %xmm14, %xmm14
100000ca8:	c4 41 79 2e fe 	vucomisd	%xmm14, %xmm15
100000cad:	73 61 	jae	97 <_main._omp_fn.0+0x4B0>
100000caf:	c5 79 28 74 24 20 	vmovapd	32(%rsp), %xmm14
100000cb5:	c5 09 58 54 24 30 	vaddpd	48(%rsp), %xmm14, %xmm10
100000cbb:	c4 41 79 2e fa 	vucomisd	%xmm10, %xmm15
100000cc0:	73 4e 	jae	78 <_main._omp_fn.0+0x4B0>
100000cc2:	c4 41 29 15 d2 	vunpckhpd	%xmm10, %xmm10, %xmm10
100000cc7:	c4 41 79 2e fa 	vucomisd	%xmm10, %xmm15
100000ccc:	73 42 	jae	66 <_main._omp_fn.0+0x4B0>
100000cce:	c5 21 58 5c 24 40 	vaddpd	64(%rsp), %xmm11, %xmm11
100000cd4:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100000cd9:	73 35 	jae	53 <_main._omp_fn.0+0x4B0>
100000cdb:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100000ce0:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100000ce5:	73 29 	jae	41 <_main._omp_fn.0+0x4B0>
100000ce7:	c5 79 28 74 24 50 	vmovapd	80(%rsp), %xmm14
100000ced:	c5 09 58 54 24 60 	vaddpd	96(%rsp), %xmm14, %xmm10
100000cf3:	c4 41 79 2e fa 	vucomisd	%xmm10, %xmm15
100000cf8:	73 16 	jae	22 <_main._omp_fn.0+0x4B0>
100000cfa:	c4 41 29 15 d2 	vunpckhpd	%xmm10, %xmm10, %xmm10
100000cff:	c4 41 79 2e fa 	vucomisd	%xmm10, %xmm15
100000d04:	0f 82 aa 01 00 00 	jb	426 <_main._omp_fn.0+0x654>
100000d0a:	66 0f 1f 44 00 00 	nopw	(%rax,%rax)
100000d10:	48 83 e8 01 	subq	$1, %rax
100000d14:	0f 85 1d fc ff ff 	jne	-995 <_main._omp_fn.0+0xD7>
100000d1a:	c5 79 28 3c 24 	vmovapd	(%rsp), %xmm15
100000d1f:	c5 79 28 f2 	vmovapd	%xmm2, %xmm14
100000d23:	c4 42 91 b8 c5 	vfmadd231pd	%xmm13, %xmm13, %xmm8
100000d28:	c4 41 79 28 d4 	vmovapd	%xmm12, %xmm10
100000d2d:	c4 42 b1 98 f6 	vfmadd132pd	%xmm14, %xmm9, %xmm14
100000d32:	c5 7b 10 0d 96 10 00 00 	vmovsd	4246(%rip), %xmm9
100000d3a:	c4 e2 e1 b8 fb 	vfmadd231pd	%xmm3, %xmm3, %xmm7
100000d3f:	c4 c1 69 59 d7 	vmulpd	%xmm15, %xmm2, %xmm2
100000d44:	c4 42 b9 9c d4 	vfnmadd132pd	%xmm12, %xmm8, %xmm10
100000d49:	c4 41 79 28 de 	vmovapd	%xmm14, %xmm11
100000d4e:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000d52:	c4 42 81 bc df 	vfnmadd231pd	%xmm15, %xmm15, %xmm11
100000d57:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000d5b:	c4 41 29 59 d2 	vmulpd	%xmm10, %xmm10, %xmm10
100000d60:	c5 e9 59 d2 	vmulpd	%xmm2, %xmm2, %xmm2
100000d64:	c4 42 e9 98 db 	vfmadd132pd	%xmm11, %xmm2, %xmm11
100000d69:	c4 c1 11 59 d4 	vmulpd	%xmm12, %xmm13, %xmm2
100000d6e:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100000d73:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000d77:	48 19 c0 	sbbq	%rax, %rax
100000d7a:	48 83 e0 80 	andq	$-128, %rax
100000d7e:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000d82:	48 05 bf 00 00 00 	addq	$191, %rax
100000d88:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100000d8d:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100000d92:	c4 62 e9 b8 d2 	vfmadd231pd	%xmm2, %xmm2, %xmm10
100000d97:	c5 f9 59 d3 	vmulpd	%xmm3, %xmm0, %xmm2
100000d9b:	c4 e2 c1 9c c0 	vfnmadd132pd	%xmm0, %xmm7, %xmm0
100000da0:	48 19 d2 	sbbq	%rdx, %rdx
100000da3:	48 83 e2 80 	andq	$-128, %rdx
100000da7:	48 81 c2 ff 00 00 00 	addq	$255, %rdx
100000dae:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100000db3:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100000db7:	c5 f9 59 c0 	vmulpd	%xmm0, %xmm0, %xmm0
100000dbb:	48 0f 43 c2 	cmovaeq	%rdx, %rax
100000dbf:	48 89 c2 	movq	%rax, %rdx
100000dc2:	81 e2 df 00 00 00 	andl	$223, %edx
100000dc8:	c4 41 79 2e ca 	vucomisd	%xmm10, %xmm9
100000dcd:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100000dd1:	c4 41 29 15 d2 	vunpckhpd	%xmm10, %xmm10, %xmm10
100000dd6:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000dda:	c4 e2 e9 b8 c2 	vfmadd231pd	%xmm2, %xmm2, %xmm0
100000ddf:	48 89 c2 	movq	%rax, %rdx
100000de2:	81 e2 ef 00 00 00 	andl	$239, %edx
100000de8:	c4 41 79 2e ca 	vucomisd	%xmm10, %xmm9
100000ded:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000df1:	48 89 c2 	movq	%rax, %rdx
100000df4:	81 e2 f7 00 00 00 	andl	$247, %edx
100000dfa:	c5 79 2e c8 	vucomisd	%xmm0, %xmm9
100000dfe:	c5 f9 15 c0 	vunpckhpd	%xmm0, %xmm0, %xmm0
100000e02:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000e06:	48 89 c2 	movq	%rax, %rdx
100000e09:	81 e2 fb 00 00 00 	andl	$251, %edx
100000e0f:	c5 79 2e c8 	vucomisd	%xmm0, %xmm9
100000e13:	c5 d9 59 c1 	vmulpd	%xmm1, %xmm4, %xmm0
100000e17:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
100000e1c:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000e20:	48 89 c2 	movq	%rax, %rdx
100000e23:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
100000e28:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100000e2c:	81 e2 fd 00 00 00 	andl	$253, %edx
100000e32:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100000e36:	c5 f1 59 c9 	vmulpd	%xmm1, %xmm1, %xmm1
100000e3a:	c4 e2 f9 b8 c8 	vfmadd231pd	%xmm0, %xmm0, %xmm1
100000e3f:	c5 79 2e c9 	vucomisd	%xmm1, %xmm9
100000e43:	c5 f1 15 c9 	vunpckhpd	%xmm1, %xmm1, %xmm1
100000e47:	48 0f 42 c2 	cmovbq	%rdx, %rax
100000e4b:	48 89 c2 	movq	%rax, %rdx
100000e4e:	81 e2 fe 00 00 00 	andl	$254, %edx
100000e54:	c5 79 2e c9 	vucomisd	%xmm1, %xmm9
100000e58:	0f 42 c2 	cmovbl	%edx, %eax
100000e5b:	48 89 ca 	movq	%rcx, %rdx
100000e5e:	48 83 c1 08 	addq	$8, %rcx
100000e62:	48 c1 fa 03 	sarq	$3, %rdx
100000e66:	88 04 16 	movb	%al, (%rsi,%rdx)
100000e69:	4c 39 c1 	cmpq	%r8, %rcx
100000e6c:	0f 85 7e fa ff ff 	jne	-1410 <_main._omp_fn.0+0x90>
100000e72:	49 83 c1 01 	addq	$1, %r9
100000e76:	4c 01 ff 	addq	%r15, %rdi
100000e79:	4d 39 ca 	cmpq	%r9, %r10
100000e7c:	0f 8f 50 fa ff ff 	jg	-1456 <_main._omp_fn.0+0x72>
100000e82:	48 89 ee 	movq	%rbp, %rsi
100000e85:	48 89 df 	movq	%rbx, %rdi
100000e88:	4c 89 04 24 	movq	%r8, (%rsp)
100000e8c:	e8 89 0e 00 00 	callq	3721 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D445>
100000e91:	4c 8b 04 24 	movq	(%rsp), %r8
100000e95:	84 c0 	testb	%al, %al
100000e97:	0f 85 1b fa ff ff 	jne	-1509 <_main._omp_fn.0+0x58>
100000e9d:	e8 72 0e 00 00 	callq	3698 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D43F>
100000ea2:	48 81 c4 88 00 00 00 	addq	$136, %rsp
100000ea9:	5b 	popq	%rbx
100000eaa:	5d 	popq	%rbp
100000eab:	41 5c 	popq	%r12
100000ead:	41 5d 	popq	%r13
100000eaf:	41 5e 	popq	%r14
100000eb1:	41 5f 	popq	%r15
100000eb3:	c3 	retq
100000eb4:	31 c0 	xorl	%eax, %eax
100000eb6:	eb a3 	jmp	-93 <_main._omp_fn.0+0x5FB>
100000eb8:	0f 1f 84 00 00 00 00 00 	nopl	(%rax,%rax)

_main._omp_fn.1:
100000ec0:	41 57 	pushq	%r15
100000ec2:	b9 01 00 00 00 	movl	$1, %ecx
100000ec7:	ba 01 00 00 00 	movl	$1, %edx
100000ecc:	41 56 	pushq	%r14
100000ece:	41 55 	pushq	%r13
100000ed0:	41 54 	pushq	%r12
100000ed2:	55 	pushq	%rbp
100000ed3:	53 	pushq	%rbx
100000ed4:	48 81 ec a8 00 00 00 	subq	$168, %rsp
100000edb:	48 8b 47 10 	movq	16(%rdi), %rax
100000edf:	48 8b 2f 	movq	(%rdi), %rbp
100000ee2:	48 8d 9c 24 98 00 00 00 	leaq	152(%rsp), %rbx
100000eea:	4c 8d bc 24 90 00 00 00 	leaq	144(%rsp), %r15
100000ef2:	4c 8b 6f 18 	movq	24(%rdi), %r13
100000ef6:	48 89 44 24 70 	movq	%rax, 112(%rsp)
100000efb:	48 8b 47 08 	movq	8(%rdi), %rax
100000eff:	49 89 d9 	movq	%rbx, %r9
100000f02:	31 ff 	xorl	%edi, %edi
100000f04:	4d 89 f8 	movq	%r15, %r8
100000f07:	48 89 ee 	movq	%rbp, %rsi
100000f0a:	48 89 44 24 78 	movq	%rax, 120(%rsp)
100000f0f:	e8 0c 0e 00 00 	callq	3596 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D44B>
100000f14:	84 c0 	testb	%al, %al
100000f16:	0f 84 2f 06 00 00 	je	1583 <_main._omp_fn.1+0x68B>
100000f1c:	49 bc 00 00 00 00 00 00 00 fe 	movabsq	$-144115188075855872, %r12
100000f26:	48 8b 84 24 98 00 00 00 	movq	152(%rsp), %rax
100000f2e:	4c 8b 8c 24 90 00 00 00 	movq	144(%rsp), %r9
100000f36:	48 89 84 24 80 00 00 00 	movq	%rax, 128(%rsp)
100000f3e:	48 85 ed 	testq	%rbp, %rbp
100000f41:	0f 8e f1 05 00 00 	jle	1521 <_main._omp_fn.1+0x678>
100000f47:	48 8d 45 ff 	leaq	-1(%rbp), %rax
100000f4b:	49 89 e8 	movq	%rbp, %r8
100000f4e:	48 83 e0 c0 	andq	$-64, %rax
100000f52:	4d 0f af c1 	imulq	%r9, %r8
100000f56:	48 83 c0 40 	addq	$64, %rax
100000f5a:	48 89 84 24 88 00 00 00 	movq	%rax, 136(%rsp)
100000f62:	4d 85 c0 	testq	%r8, %r8
100000f65:	4d 8d 50 3f 	leaq	63(%r8), %r10
100000f69:	c4 81 7b 12 74 cd 00 	vmovddup	(%r13,%r9,8), %xmm6
100000f70:	4d 0f 49 d0 	cmovnsq	%r8, %r10
100000f74:	31 ff 	xorl	%edi, %edi
100000f76:	49 c1 fa 06 	sarq	$6, %r10
100000f7a:	66 0f 1f 44 00 00 	nopw	(%rax,%rax)
100000f80:	48 89 fa 	movq	%rdi, %rdx
100000f83:	48 89 f8 	movq	%rdi, %rax
100000f86:	48 8b 74 24 78 	movq	120(%rsp), %rsi
100000f8b:	31 c9 	xorl	%ecx, %ecx
100000f8d:	48 d1 fa 	sarq	%rdx
100000f90:	48 c1 f8 06 	sarq	$6, %rax
100000f94:	48 c1 e2 04 	shlq	$4, %rdx
100000f98:	4c 01 d0 	addq	%r10, %rax
100000f9b:	48 03 54 24 70 	addq	112(%rsp), %rdx
100000fa0:	4c 8d 1c c6 	leaq	(%rsi,%rax,8), %r11
100000fa4:	48 8d b2 00 02 00 00 	leaq	512(%rdx), %rsi
100000fab:	0f 1f 44 00 00 	nopl	(%rax,%rax)
100000fb0:	c5 79 28 12 	vmovapd	(%rdx), %xmm10
100000fb4:	c5 f9 28 ce 	vmovapd	%xmm6, %xmm1
100000fb8:	c5 f9 28 c6 	vmovapd	%xmm6, %xmm0
100000fbc:	c5 79 28 f6 	vmovapd	%xmm6, %xmm14
100000fc0:	c5 79 28 4a 10 	vmovapd	16(%rdx), %xmm9
100000fc5:	c5 79 28 42 20 	vmovapd	32(%rdx), %xmm8
100000fca:	b8 06 00 00 00 	movl	$6, %eax
100000fcf:	c5 f9 28 de 	vmovapd	%xmm6, %xmm3
100000fd3:	c5 f9 28 7a 30 	vmovapd	48(%rdx), %xmm7
100000fd8:	c4 41 79 28 e2 	vmovapd	%xmm10, %xmm12
100000fdd:	c5 79 29 c4 	vmovapd	%xmm8, %xmm4
100000fe1:	c5 79 29 ca 	vmovapd	%xmm9, %xmm2
100000fe5:	c5 f9 28 ef 	vmovapd	%xmm7, %xmm5
100000fe9:	c5 19 59 db 	vmulpd	%xmm3, %xmm12, %xmm11
100000fed:	c4 42 a9 98 e4 	vfmadd132pd	%xmm12, %xmm10, %xmm12
100000ff2:	c5 79 59 ec 	vmulpd	%xmm4, %xmm0, %xmm13
100000ff6:	c4 e2 b9 98 e4 	vfmadd132pd	%xmm4, %xmm8, %xmm4
100000ffb:	c4 62 e1 bc e3 	vfnmadd231pd	%xmm3, %xmm3, %xmm12
100001000:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100001005:	c5 89 59 da 	vmulpd	%xmm2, %xmm14, %xmm3
100001009:	c4 e2 b1 98 d2 	vfmadd132pd	%xmm2, %xmm9, %xmm2
10000100e:	c4 e2 d9 9c c0 	vfnmadd132pd	%xmm0, %xmm4, %xmm0
100001013:	c4 c1 11 58 e5 	vaddpd	%xmm13, %xmm13, %xmm4
100001018:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
10000101c:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100001020:	c4 41 21 59 ec 	vmulpd	%xmm12, %xmm11, %xmm13
100001025:	c4 c2 89 bc d6 	vfnmadd231pd	%xmm14, %xmm14, %xmm2
10000102a:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
10000102e:	c5 51 59 f1 	vmulpd	%xmm1, %xmm5, %xmm14
100001032:	c4 42 a9 98 e4 	vfmadd132pd	%xmm12, %xmm10, %xmm12
100001037:	c5 59 59 f8 	vmulpd	%xmm0, %xmm4, %xmm15
10000103b:	c4 e2 c1 98 ed 	vfmadd132pd	%xmm5, %xmm7, %xmm5
100001040:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
100001044:	c4 e2 b9 98 c0 	vfmadd132pd	%xmm0, %xmm8, %xmm0
100001049:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
10000104e:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100001053:	c4 42 99 9c db 	vfnmadd132pd	%xmm11, %xmm12, %xmm11
100001058:	c5 61 59 e2 	vmulpd	%xmm2, %xmm3, %xmm12
10000105c:	c4 e2 d1 9c c9 	vfnmadd132pd	%xmm1, %xmm5, %xmm1
100001061:	c5 f9 28 eb 	vmovapd	%xmm3, %xmm5
100001065:	c4 e2 b1 98 d2 	vfmadd132pd	%xmm2, %xmm9, %xmm2
10000106a:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
10000106e:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100001073:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
100001077:	c4 e2 f9 9c e4 	vfnmadd132pd	%xmm4, %xmm0, %xmm4
10000107c:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100001080:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100001085:	c4 e2 e9 9c eb 	vfnmadd132pd	%xmm3, %xmm2, %xmm5
10000108a:	c5 79 29 f2 	vmovapd	%xmm14, %xmm2
10000108e:	c5 89 59 d9 	vmulpd	%xmm1, %xmm14, %xmm3
100001092:	c4 e2 c1 98 c9 	vfmadd132pd	%xmm1, %xmm7, %xmm1
100001097:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
10000109b:	c5 79 29 e0 	vmovapd	%xmm12, %xmm0
10000109f:	c4 c2 f1 9c d6 	vfnmadd132pd	%xmm14, %xmm1, %xmm2
1000010a4:	c5 79 29 e9 	vmovapd	%xmm13, %xmm1
1000010a8:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000010ac:	c4 41 11 59 f3 	vmulpd	%xmm11, %xmm13, %xmm14
1000010b1:	c4 42 a9 98 db 	vfmadd132pd	%xmm11, %xmm10, %xmm11
1000010b6:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000010ba:	c4 c2 a1 9c cd 	vfnmadd132pd	%xmm13, %xmm11, %xmm1
1000010bf:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
1000010c4:	c5 19 59 ed 	vmulpd	%xmm5, %xmm12, %xmm13
1000010c8:	c4 e2 b1 98 ed 	vfmadd132pd	%xmm5, %xmm9, %xmm5
1000010cd:	c5 61 59 da 	vmulpd	%xmm2, %xmm3, %xmm11
1000010d1:	c4 e2 c1 98 d2 	vfmadd132pd	%xmm2, %xmm7, %xmm2
1000010d6:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
1000010da:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
1000010df:	c4 c2 d1 9c c4 	vfnmadd132pd	%xmm12, %xmm5, %xmm0
1000010e4:	c5 01 59 e4 	vmulpd	%xmm4, %xmm15, %xmm12
1000010e8:	c4 e2 b9 98 e4 	vfmadd132pd	%xmm4, %xmm8, %xmm4
1000010ed:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
1000010f2:	c5 89 59 e9 	vmulpd	%xmm1, %xmm14, %xmm5
1000010f6:	c4 e2 e9 9c db 	vfnmadd132pd	%xmm3, %xmm2, %xmm3
1000010fb:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
1000010ff:	c4 e2 a9 98 c9 	vfmadd132pd	%xmm1, %xmm10, %xmm1
100001104:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100001108:	c4 42 d9 9c ff 	vfnmadd132pd	%xmm15, %xmm4, %xmm15
10000110d:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100001112:	c5 91 59 e0 	vmulpd	%xmm0, %xmm13, %xmm4
100001116:	c4 e2 b1 98 c0 	vfmadd132pd	%xmm0, %xmm9, %xmm0
10000111b:	c5 d1 58 ed 	vaddpd	%xmm5, %xmm5, %xmm5
10000111f:	c4 42 f1 9c f6 	vfnmadd132pd	%xmm14, %xmm1, %xmm14
100001124:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
100001128:	c5 a1 59 cb 	vmulpd	%xmm3, %xmm11, %xmm1
10000112c:	c4 e2 c1 98 db 	vfmadd132pd	%xmm3, %xmm7, %xmm3
100001131:	c5 d1 58 ee 	vaddpd	%xmm6, %xmm5, %xmm5
100001135:	c4 c1 19 59 d7 	vmulpd	%xmm15, %xmm12, %xmm2
10000113a:	c4 42 f9 9c ed 	vfnmadd132pd	%xmm13, %xmm0, %xmm13
10000113f:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100001143:	c4 c1 51 59 c6 	vmulpd	%xmm14, %xmm5, %xmm0
100001148:	c4 42 b9 98 ff 	vfmadd132pd	%xmm15, %xmm8, %xmm15
10000114d:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100001151:	c4 42 a9 98 f6 	vfmadd132pd	%xmm14, %xmm10, %xmm14
100001156:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
10000115a:	c4 42 e1 9c db 	vfnmadd132pd	%xmm11, %xmm3, %xmm11
10000115f:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001163:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
100001167:	c4 42 81 9c e4 	vfnmadd132pd	%xmm12, %xmm15, %xmm12
10000116c:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100001170:	c4 41 59 59 fd 	vmulpd	%xmm13, %xmm4, %xmm15
100001175:	c4 42 b1 98 ed 	vfmadd132pd	%xmm13, %xmm9, %xmm13
10000117a:	c4 c1 71 59 db 	vmulpd	%xmm11, %xmm1, %xmm3
10000117f:	c4 42 c1 98 db 	vfmadd132pd	%xmm11, %xmm7, %xmm11
100001184:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001188:	c4 e2 89 9c ed 	vfnmadd132pd	%xmm5, %xmm14, %xmm5
10000118d:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100001191:	c4 41 69 59 f4 	vmulpd	%xmm12, %xmm2, %xmm14
100001196:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
10000119b:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
1000011a0:	c4 e2 91 9c e4 	vfnmadd132pd	%xmm4, %xmm13, %xmm4
1000011a5:	c4 e2 a1 9c c9 	vfnmadd132pd	%xmm1, %xmm11, %xmm1
1000011aa:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000011ae:	c5 79 59 ed 	vmulpd	%xmm5, %xmm0, %xmm13
1000011b2:	c4 e2 a9 98 ed 	vfmadd132pd	%xmm5, %xmm10, %xmm5
1000011b7:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
1000011bb:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
1000011c0:	c4 e2 99 9c d2 	vfnmadd132pd	%xmm2, %xmm12, %xmm2
1000011c5:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000011c9:	c5 01 59 dc 	vmulpd	%xmm4, %xmm15, %xmm11
1000011cd:	c4 e2 b1 98 e4 	vfmadd132pd	%xmm4, %xmm9, %xmm4
1000011d2:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
1000011d6:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
1000011db:	c4 e2 d1 9c c0 	vfnmadd132pd	%xmm0, %xmm5, %xmm0
1000011e0:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
1000011e4:	c5 79 29 f5 	vmovapd	%xmm14, %xmm5
1000011e8:	c4 42 d9 9c ff 	vfnmadd132pd	%xmm15, %xmm4, %xmm15
1000011ed:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
1000011f2:	c5 89 59 e2 	vmulpd	%xmm2, %xmm14, %xmm4
1000011f6:	c4 e2 b9 98 d2 	vfmadd132pd	%xmm2, %xmm8, %xmm2
1000011fb:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
1000011ff:	c4 41 79 28 e7 	vmovapd	%xmm15, %xmm12
100001204:	c5 61 59 f9 	vmulpd	%xmm1, %xmm3, %xmm15
100001208:	c4 e2 c1 98 c9 	vfmadd132pd	%xmm1, %xmm7, %xmm1
10000120d:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100001211:	c4 c2 e9 9c ee 	vfnmadd132pd	%xmm14, %xmm2, %xmm5
100001216:	c5 11 59 f0 	vmulpd	%xmm0, %xmm13, %xmm14
10000121a:	c4 e2 a9 98 c0 	vfmadd132pd	%xmm0, %xmm10, %xmm0
10000121f:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100001223:	c4 c1 21 59 d4 	vmulpd	%xmm12, %xmm11, %xmm2
100001228:	c4 42 b1 98 e4 	vfmadd132pd	%xmm12, %xmm9, %xmm12
10000122d:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
100001232:	c4 e2 f1 9c db 	vfnmadd132pd	%xmm3, %xmm1, %xmm3
100001237:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
10000123c:	c4 42 f9 9c ed 	vfnmadd132pd	%xmm13, %xmm0, %xmm13
100001241:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100001245:	c5 d9 59 c5 	vmulpd	%xmm5, %xmm4, %xmm0
100001249:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
10000124d:	c4 e2 b9 98 ed 	vfmadd132pd	%xmm5, %xmm8, %xmm5
100001252:	c4 42 99 9c db 	vfnmadd132pd	%xmm11, %xmm12, %xmm11
100001257:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
10000125b:	c5 81 59 cb 	vmulpd	%xmm3, %xmm15, %xmm1
10000125f:	c4 e2 c1 98 db 	vfmadd132pd	%xmm3, %xmm7, %xmm3
100001264:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001268:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
10000126c:	c4 e2 d1 9c e4 	vfnmadd132pd	%xmm4, %xmm5, %xmm4
100001271:	c4 c1 09 59 ee 	vmulpd	%xmm14, %xmm14, %xmm5
100001276:	c4 41 09 59 f5 	vmulpd	%xmm13, %xmm14, %xmm14
10000127b:	c4 42 e1 9c ff 	vfnmadd132pd	%xmm15, %xmm3, %xmm15
100001280:	c5 79 29 eb 	vmovapd	%xmm13, %xmm3
100001284:	c4 c2 a9 98 dd 	vfmadd132pd	%xmm13, %xmm10, %xmm3
100001289:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
10000128d:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100001291:	c5 f8 29 6c 24 10 	vmovaps	%xmm5, 16(%rsp)
100001297:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
10000129b:	c4 62 91 a8 6c 24 10 	vfmadd213pd	16(%rsp), %xmm13, %xmm13
1000012a2:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
1000012a7:	c5 61 5c e5 	vsubpd	%xmm5, %xmm3, %xmm12
1000012ab:	c5 e9 59 ea 	vmulpd	%xmm2, %xmm2, %xmm5
1000012af:	c5 89 58 de 	vaddpd	%xmm6, %xmm14, %xmm3
1000012b3:	c4 41 21 59 f3 	vmulpd	%xmm11, %xmm11, %xmm14
1000012b8:	c4 41 69 59 db 	vmulpd	%xmm11, %xmm2, %xmm11
1000012bd:	c5 f8 29 6c 24 30 	vmovaps	%xmm5, 48(%rsp)
1000012c3:	c4 c1 31 58 d6 	vaddpd	%xmm14, %xmm9, %xmm2
1000012c8:	c5 78 29 74 24 20 	vmovaps	%xmm14, 32(%rsp)
1000012ce:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
1000012d3:	c5 e9 5c d5 	vsubpd	%xmm5, %xmm2, %xmm2
1000012d7:	c5 f9 59 e8 	vmulpd	%xmm0, %xmm0, %xmm5
1000012db:	c5 21 58 f6 	vaddpd	%xmm6, %xmm11, %xmm14
1000012df:	c5 59 59 dc 	vmulpd	%xmm4, %xmm4, %xmm11
1000012e3:	c5 f9 59 c4 	vmulpd	%xmm4, %xmm0, %xmm0
1000012e7:	c5 f8 29 6c 24 50 	vmovaps	%xmm5, 80(%rsp)
1000012ed:	c4 c1 39 58 e3 	vaddpd	%xmm11, %xmm8, %xmm4
1000012f2:	c5 78 29 5c 24 40 	vmovaps	%xmm11, 64(%rsp)
1000012f8:	c4 41 01 59 df 	vmulpd	%xmm15, %xmm15, %xmm11
1000012fd:	c4 41 71 59 ff 	vmulpd	%xmm15, %xmm1, %xmm15
100001302:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100001306:	c5 d9 5c e5 	vsubpd	%xmm5, %xmm4, %xmm4
10000130a:	c5 f1 59 e9 	vmulpd	%xmm1, %xmm1, %xmm5
10000130e:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100001312:	c5 78 29 5c 24 60 	vmovaps	%xmm11, 96(%rsp)
100001318:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
10000131d:	c5 f8 29 2c 24 	vmovaps	%xmm5, (%rsp)
100001322:	c4 c1 41 58 eb 	vaddpd	%xmm11, %xmm7, %xmm5
100001327:	c5 d1 5c 2c 24 	vsubpd	(%rsp), %xmm5, %xmm5
10000132c:	c5 81 58 ce 	vaddpd	%xmm6, %xmm15, %xmm1
100001330:	c5 7b 10 3d 98 0a 00 00 	vmovsd	2712(%rip), %xmm15
100001338:	c4 41 79 2e fd 	vucomisd	%xmm13, %xmm15
10000133d:	73 71 	jae	113 <_main._omp_fn.1+0x4F0>
10000133f:	c4 41 11 15 ed 	vunpckhpd	%xmm13, %xmm13, %xmm13
100001344:	c4 41 79 2e fd 	vucomisd	%xmm13, %xmm15
100001349:	73 65 	jae	101 <_main._omp_fn.1+0x4F0>
10000134b:	c5 79 28 6c 24 20 	vmovapd	32(%rsp), %xmm13
100001351:	c5 11 58 5c 24 30 	vaddpd	48(%rsp), %xmm13, %xmm11
100001357:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
10000135c:	73 52 	jae	82 <_main._omp_fn.1+0x4F0>
10000135e:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100001363:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100001368:	73 46 	jae	70 <_main._omp_fn.1+0x4F0>
10000136a:	c5 79 28 6c 24 40 	vmovapd	64(%rsp), %xmm13
100001370:	c5 11 58 5c 24 50 	vaddpd	80(%rsp), %xmm13, %xmm11
100001376:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
10000137b:	73 33 	jae	51 <_main._omp_fn.1+0x4F0>
10000137d:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100001382:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100001387:	73 27 	jae	39 <_main._omp_fn.1+0x4F0>
100001389:	c5 79 28 6c 24 60 	vmovapd	96(%rsp), %xmm13
10000138f:	c5 11 58 1c 24 	vaddpd	(%rsp), %xmm13, %xmm11
100001394:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
100001399:	73 15 	jae	21 <_main._omp_fn.1+0x4F0>
10000139b:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
1000013a0:	c4 41 79 2e fb 	vucomisd	%xmm11, %xmm15
1000013a5:	0f 82 b7 01 00 00 	jb	439 <_main._omp_fn.1+0x6A2>
1000013ab:	0f 1f 44 00 00 	nopl	(%rax,%rax)
1000013b0:	48 83 e8 01 	subq	$1, %rax
1000013b4:	0f 85 2f fc ff ff 	jne	-977 <_main._omp_fn.1+0x129>
1000013ba:	c4 41 79 28 ec 	vmovapd	%xmm12, %xmm13
1000013bf:	c4 62 d9 b8 c4 	vfmadd231pd	%xmm4, %xmm4, %xmm8
1000013c4:	c5 79 28 fa 	vmovapd	%xmm2, %xmm15
1000013c8:	c5 91 59 d3 	vmulpd	%xmm3, %xmm13, %xmm2
1000013cc:	c4 42 a9 98 ed 	vfmadd132pd	%xmm13, %xmm10, %xmm13
1000013d1:	c4 42 81 b8 cf 	vfmadd231pd	%xmm15, %xmm15, %xmm9
1000013d6:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
1000013da:	c4 62 e1 bc eb 	vfnmadd231pd	%xmm3, %xmm3, %xmm13
1000013df:	c5 fb 10 1d e9 09 00 00 	vmovsd	2537(%rip), %xmm3
1000013e7:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
1000013eb:	c5 e9 59 d2 	vmulpd	%xmm2, %xmm2, %xmm2
1000013ef:	c4 42 e9 98 ed 	vfmadd132pd	%xmm13, %xmm2, %xmm13
1000013f4:	c4 c1 09 59 d7 	vmulpd	%xmm15, %xmm14, %xmm2
1000013f9:	c4 42 b1 9c f6 	vfnmadd132pd	%xmm14, %xmm9, %xmm14
1000013fe:	c4 c1 79 2e dd 	vucomisd	%xmm13, %xmm3
100001403:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001407:	c4 41 09 59 de 	vmulpd	%xmm14, %xmm14, %xmm11
10000140c:	48 19 c0 	sbbq	%rax, %rax
10000140f:	48 83 e0 80 	andq	$-128, %rax
100001413:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001417:	48 05 bf 00 00 00 	addq	$191, %rax
10000141d:	c4 c1 79 2e dd 	vucomisd	%xmm13, %xmm3
100001422:	c4 41 11 15 ed 	vunpckhpd	%xmm13, %xmm13, %xmm13
100001427:	c4 62 e9 b8 da 	vfmadd231pd	%xmm2, %xmm2, %xmm11
10000142c:	c5 f9 59 d4 	vmulpd	%xmm4, %xmm0, %xmm2
100001430:	c4 e2 b9 9c c0 	vfnmadd132pd	%xmm0, %xmm8, %xmm0
100001435:	4d 19 f6 	sbbq	%r14, %r14
100001438:	49 83 e6 80 	andq	$-128, %r14
10000143c:	49 81 c6 ff 00 00 00 	addq	$255, %r14
100001443:	c4 c1 79 2e dd 	vucomisd	%xmm13, %xmm3
100001448:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
10000144c:	c5 f9 59 c0 	vmulpd	%xmm0, %xmm0, %xmm0
100001450:	49 0f 43 c6 	cmovaeq	%r14, %rax
100001454:	49 89 c6 	movq	%rax, %r14
100001457:	41 81 e6 df 00 00 00 	andl	$223, %r14d
10000145e:	c4 c1 79 2e db 	vucomisd	%xmm11, %xmm3
100001463:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001467:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
10000146c:	49 0f 42 c6 	cmovbq	%r14, %rax
100001470:	c4 e2 e9 b8 c2 	vfmadd231pd	%xmm2, %xmm2, %xmm0
100001475:	49 89 c6 	movq	%rax, %r14
100001478:	41 81 e6 ef 00 00 00 	andl	$239, %r14d
10000147f:	c4 c1 79 2e db 	vucomisd	%xmm11, %xmm3
100001484:	49 0f 42 c6 	cmovbq	%r14, %rax
100001488:	49 89 c6 	movq	%rax, %r14
10000148b:	41 81 e6 f7 00 00 00 	andl	$247, %r14d
100001492:	c5 f9 2e d8 	vucomisd	%xmm0, %xmm3
100001496:	c5 f9 15 c0 	vunpckhpd	%xmm0, %xmm0, %xmm0
10000149a:	49 0f 42 c6 	cmovbq	%r14, %rax
10000149e:	49 89 c6 	movq	%rax, %r14
1000014a1:	41 81 e6 fb 00 00 00 	andl	$251, %r14d
1000014a8:	c5 f9 2e d8 	vucomisd	%xmm0, %xmm3
1000014ac:	c5 d1 59 c1 	vmulpd	%xmm1, %xmm5, %xmm0
1000014b0:	c4 e2 c1 98 ed 	vfmadd132pd	%xmm5, %xmm7, %xmm5
1000014b5:	49 0f 42 c6 	cmovbq	%r14, %rax
1000014b9:	49 89 c6 	movq	%rax, %r14
1000014bc:	c4 e2 d1 9c c9 	vfnmadd132pd	%xmm1, %xmm5, %xmm1
1000014c1:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
1000014c5:	41 81 e6 fd 00 00 00 	andl	$253, %r14d
1000014cc:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
1000014d0:	c5 f1 59 c9 	vmulpd	%xmm1, %xmm1, %xmm1
1000014d4:	c4 e2 f9 b8 c8 	vfmadd231pd	%xmm0, %xmm0, %xmm1
1000014d9:	c5 f9 2e d9 	vucomisd	%xmm1, %xmm3
1000014dd:	c5 f1 15 c1 	vunpckhpd	%xmm1, %xmm1, %xmm0
1000014e1:	49 0f 42 c6 	cmovbq	%r14, %rax
1000014e5:	49 89 c6 	movq	%rax, %r14
1000014e8:	49 c1 e6 38 	shlq	$56, %r14
1000014ec:	4c 89 f0 	movq	%r14, %rax
1000014ef:	4c 21 e0 	andq	%r12, %rax
1000014f2:	c5 f9 2e d8 	vucomisd	%xmm0, %xmm3
1000014f6:	49 0f 43 c6 	cmovaeq	%r14, %rax
1000014fa:	48 c1 e9 08 	shrq	$8, %rcx
1000014fe:	48 83 c2 40 	addq	$64, %rdx
100001502:	48 09 c1 	orq	%rax, %rcx
100001505:	48 39 f2 	cmpq	%rsi, %rdx
100001508:	0f 85 a2 fa ff ff 	jne	-1374 <_main._omp_fn.1+0xF0>
10000150e:	49 89 0b 	movq	%rcx, (%r11)
100001511:	48 83 c7 40 	addq	$64, %rdi
100001515:	48 3b bc 24 88 00 00 00 	cmpq	136(%rsp), %rdi
10000151d:	0f 85 5d fa ff ff 	jne	-1443 <_main._omp_fn.1+0xC0>
100001523:	49 83 c1 01 	addq	$1, %r9
100001527:	49 01 e8 	addq	%rbp, %r8
10000152a:	4c 39 8c 24 80 00 00 00 	cmpq	%r9, 128(%rsp)
100001532:	0f 8f 2a fa ff ff 	jg	-1494 <_main._omp_fn.1+0xA2>
100001538:	48 89 de 	movq	%rbx, %rsi
10000153b:	4c 89 ff 	movq	%r15, %rdi
10000153e:	e8 d7 07 00 00 	callq	2007 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D445>
100001543:	84 c0 	testb	%al, %al
100001545:	0f 85 db f9 ff ff 	jne	-1573 <_main._omp_fn.1+0x66>
10000154b:	e8 c4 07 00 00 	callq	1988 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D43F>
100001550:	48 81 c4 a8 00 00 00 	addq	$168, %rsp
100001557:	5b 	popq	%rbx
100001558:	5d 	popq	%rbp
100001559:	41 5c 	popq	%r12
10000155b:	41 5d 	popq	%r13
10000155d:	41 5e 	popq	%r14
10000155f:	41 5f 	popq	%r15
100001561:	c3 	retq
100001562:	31 c0 	xorl	%eax, %eax
100001564:	eb 94 	jmp	-108 <_main._omp_fn.1+0x63A>
100001566:	66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)

_numDigits:
100001570:	31 c9 	xorl	%ecx, %ecx
100001572:	48 85 ff 	testq	%rdi, %rdi
100001575:	74 33 	je	51 <_numDigits+0x3A>
100001577:	48 be 67 66 66 66 66 66 66 66 	movabsq	$7378697629483820647, %rsi
100001581:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
100001590:	48 89 f8 	movq	%rdi, %rax
100001593:	48 c1 ff 3f 	sarq	$63, %rdi
100001597:	48 83 c1 01 	addq	$1, %rcx
10000159b:	48 f7 ee 	imulq	%rsi
10000159e:	48 c1 fa 02 	sarq	$2, %rdx
1000015a2:	48 29 fa 	subq	%rdi, %rdx
1000015a5:	48 89 d7 	movq	%rdx, %rdi
1000015a8:	75 e6 	jne	-26 <_numDigits+0x20>
1000015aa:	48 89 c8 	movq	%rcx, %rax
1000015ad:	c3 	retq
1000015ae:	66 90 	nop

_mand64:
1000015b0:	c5 f9 28 f0 	vmovapd	%xmm0, %xmm6
1000015b4:	48 8d b7 00 02 00 00 	leaq	512(%rdi), %rsi
1000015bb:	31 c0 	xorl	%eax, %eax
1000015bd:	0f 1f 00 	nopl	(%rax)
1000015c0:	c5 79 28 0f 	vmovapd	(%rdi), %xmm9
1000015c4:	c5 f9 28 ce 	vmovapd	%xmm6, %xmm1
1000015c8:	c5 f9 28 c6 	vmovapd	%xmm6, %xmm0
1000015cc:	c5 79 28 e6 	vmovapd	%xmm6, %xmm12
1000015d0:	c5 79 28 47 10 	vmovapd	16(%rdi), %xmm8
1000015d5:	c5 f9 28 7f 20 	vmovapd	32(%rdi), %xmm7
1000015da:	ba 06 00 00 00 	movl	$6, %edx
1000015df:	c5 f9 28 de 	vmovapd	%xmm6, %xmm3
1000015e3:	c5 f9 28 6f 30 	vmovapd	48(%rdi), %xmm5
1000015e8:	c4 41 79 28 d1 	vmovapd	%xmm9, %xmm10
1000015ed:	c5 79 28 f7 	vmovapd	%xmm7, %xmm14
1000015f1:	c4 41 79 28 f8 	vmovapd	%xmm8, %xmm15
1000015f6:	c5 f9 28 e5 	vmovapd	%xmm5, %xmm4
1000015fa:	c5 29 59 db 	vmulpd	%xmm3, %xmm10, %xmm11
1000015fe:	c4 42 b1 98 d2 	vfmadd132pd	%xmm10, %xmm9, %xmm10
100001603:	c5 d9 59 d1 	vmulpd	%xmm1, %xmm4, %xmm2
100001607:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
10000160c:	c4 41 79 28 ea 	vmovapd	%xmm10, %xmm13
100001611:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
100001616:	c4 62 e1 bc eb 	vfnmadd231pd	%xmm3, %xmm3, %xmm13
10000161b:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
100001620:	c5 e9 58 e2 	vaddpd	%xmm2, %xmm2, %xmm4
100001624:	c4 c1 01 59 dc 	vmulpd	%xmm12, %xmm15, %xmm3
100001629:	c4 42 b9 98 ff 	vfmadd132pd	%xmm15, %xmm8, %xmm15
10000162e:	c5 09 59 d0 	vmulpd	%xmm0, %xmm14, %xmm10
100001632:	c4 42 c1 98 f6 	vfmadd132pd	%xmm14, %xmm7, %xmm14
100001637:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
10000163b:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
10000163f:	c4 c1 21 59 d5 	vmulpd	%xmm13, %xmm11, %xmm2
100001644:	c4 42 b1 98 ed 	vfmadd132pd	%xmm13, %xmm9, %xmm13
100001649:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
10000164d:	c4 42 81 9c e4 	vfnmadd132pd	%xmm12, %xmm15, %xmm12
100001652:	c4 e2 89 9c c0 	vfnmadd132pd	%xmm0, %xmm14, %xmm0
100001657:	c4 41 29 58 d2 	vaddpd	%xmm10, %xmm10, %xmm10
10000165c:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
100001660:	c5 29 58 d6 	vaddpd	%xmm6, %xmm10, %xmm10
100001664:	c4 42 91 9c db 	vfnmadd132pd	%xmm11, %xmm13, %xmm11
100001669:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
10000166d:	c4 41 61 59 f4 	vmulpd	%xmm12, %xmm3, %xmm14
100001672:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
100001677:	c5 29 59 e8 	vmulpd	%xmm0, %xmm10, %xmm13
10000167b:	c4 e2 c1 98 c0 	vfmadd132pd	%xmm0, %xmm7, %xmm0
100001680:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001684:	c4 41 69 59 fb 	vmulpd	%xmm11, %xmm2, %xmm15
100001689:	c4 42 b1 98 db 	vfmadd132pd	%xmm11, %xmm9, %xmm11
10000168e:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100001693:	c4 62 e1 bc e3 	vfnmadd231pd	%xmm3, %xmm3, %xmm12
100001698:	c5 d9 59 d9 	vmulpd	%xmm1, %xmm4, %xmm3
10000169c:	c4 e2 d1 98 c9 	vfmadd132pd	%xmm1, %xmm5, %xmm1
1000016a1:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
1000016a6:	c4 42 f9 9c d2 	vfnmadd132pd	%xmm10, %xmm0, %xmm10
1000016ab:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
1000016af:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
1000016b3:	c4 e2 a1 9c d2 	vfnmadd132pd	%xmm2, %xmm11, %xmm2
1000016b8:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
1000016bd:	c4 e2 f1 9c e4 	vfnmadd132pd	%xmm4, %xmm1, %xmm4
1000016c2:	c5 79 29 f0 	vmovapd	%xmm14, %xmm0
1000016c6:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000016ca:	c4 c1 09 59 cc 	vmulpd	%xmm12, %xmm14, %xmm1
1000016cf:	c4 42 b9 98 e4 	vfmadd132pd	%xmm12, %xmm8, %xmm12
1000016d4:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
1000016d8:	c4 41 11 59 da 	vmulpd	%xmm10, %xmm13, %xmm11
1000016dd:	c4 42 c1 98 d2 	vfmadd132pd	%xmm10, %xmm7, %xmm10
1000016e2:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000016e6:	c4 c2 99 9c c6 	vfnmadd132pd	%xmm14, %xmm12, %xmm0
1000016eb:	c5 71 58 f1 	vaddpd	%xmm1, %xmm1, %xmm14
1000016ef:	c5 79 29 e9 	vmovapd	%xmm13, %xmm1
1000016f3:	c5 61 59 e4 	vmulpd	%xmm4, %xmm3, %xmm12
1000016f7:	c4 c2 a9 9c cd 	vfnmadd132pd	%xmm13, %xmm10, %xmm1
1000016fc:	c4 41 21 58 eb 	vaddpd	%xmm11, %xmm11, %xmm13
100001701:	c5 01 59 da 	vmulpd	%xmm2, %xmm15, %xmm11
100001705:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
10000170a:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
10000170e:	c4 e2 b1 98 d2 	vfmadd132pd	%xmm2, %xmm9, %xmm2
100001713:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
100001717:	c5 09 59 d0 	vmulpd	%xmm0, %xmm14, %xmm10
10000171b:	c4 e2 b9 98 c0 	vfmadd132pd	%xmm0, %xmm8, %xmm0
100001720:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100001725:	c4 e2 d9 9c db 	vfnmadd132pd	%xmm3, %xmm4, %xmm3
10000172a:	c4 41 21 58 db 	vaddpd	%xmm11, %xmm11, %xmm11
10000172f:	c5 91 59 e1 	vmulpd	%xmm1, %xmm13, %xmm4
100001733:	c4 e2 c1 98 c9 	vfmadd132pd	%xmm1, %xmm7, %xmm1
100001738:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
10000173c:	c4 42 e9 9c ff 	vfnmadd132pd	%xmm15, %xmm2, %xmm15
100001741:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
100001745:	c4 41 29 58 d2 	vaddpd	%xmm10, %xmm10, %xmm10
10000174a:	c4 42 f9 9c f6 	vfnmadd132pd	%xmm14, %xmm0, %xmm14
10000174f:	c5 99 59 d3 	vmulpd	%xmm3, %xmm12, %xmm2
100001753:	c4 e2 d1 98 db 	vfmadd132pd	%xmm3, %xmm5, %xmm3
100001758:	c4 42 f1 9c ed 	vfnmadd132pd	%xmm13, %xmm1, %xmm13
10000175d:	c5 d9 58 e4 	vaddpd	%xmm4, %xmm4, %xmm4
100001761:	c5 29 58 d6 	vaddpd	%xmm6, %xmm10, %xmm10
100001765:	c4 c1 21 59 c7 	vmulpd	%xmm15, %xmm11, %xmm0
10000176a:	c4 42 b1 98 ff 	vfmadd132pd	%xmm15, %xmm9, %xmm15
10000176f:	c5 d9 58 e6 	vaddpd	%xmm6, %xmm4, %xmm4
100001773:	c4 c1 29 59 ce 	vmulpd	%xmm14, %xmm10, %xmm1
100001778:	c4 42 b9 98 f6 	vfmadd132pd	%xmm14, %xmm8, %xmm14
10000177d:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001781:	c4 42 e1 9c e4 	vfnmadd132pd	%xmm12, %xmm3, %xmm12
100001786:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
10000178a:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
10000178e:	c4 42 81 9c db 	vfnmadd132pd	%xmm11, %xmm15, %xmm11
100001793:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100001797:	c4 42 89 9c d2 	vfnmadd132pd	%xmm10, %xmm14, %xmm10
10000179c:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
1000017a0:	c5 99 59 da 	vmulpd	%xmm2, %xmm12, %xmm3
1000017a4:	c4 42 d1 98 e4 	vfmadd132pd	%xmm12, %xmm5, %xmm12
1000017a9:	c5 71 58 f6 	vaddpd	%xmm6, %xmm1, %xmm14
1000017ad:	c4 c1 59 59 cd 	vmulpd	%xmm13, %xmm4, %xmm1
1000017b2:	c4 42 c1 98 ed 	vfmadd132pd	%xmm13, %xmm7, %xmm13
1000017b7:	c4 41 29 59 fe 	vmulpd	%xmm14, %xmm10, %xmm15
1000017bc:	c4 42 b9 98 d2 	vfmadd132pd	%xmm10, %xmm8, %xmm10
1000017c1:	c5 e1 58 db 	vaddpd	%xmm3, %xmm3, %xmm3
1000017c5:	c4 e2 99 9c d2 	vfnmadd132pd	%xmm2, %xmm12, %xmm2
1000017ca:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
1000017ce:	c5 21 59 e0 	vmulpd	%xmm0, %xmm11, %xmm12
1000017d2:	c4 e2 91 9c e4 	vfnmadd132pd	%xmm4, %xmm13, %xmm4
1000017d7:	c4 42 b1 98 db 	vfmadd132pd	%xmm11, %xmm9, %xmm11
1000017dc:	c5 e1 58 de 	vaddpd	%xmm6, %xmm3, %xmm3
1000017e0:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
1000017e4:	c4 42 89 bc d6 	vfnmadd231pd	%xmm14, %xmm14, %xmm10
1000017e9:	c4 41 01 58 ff 	vaddpd	%xmm15, %xmm15, %xmm15
1000017ee:	c5 69 59 eb 	vmulpd	%xmm3, %xmm2, %xmm13
1000017f2:	c4 e2 d1 98 d2 	vfmadd132pd	%xmm2, %xmm5, %xmm2
1000017f7:	c5 59 59 f1 	vmulpd	%xmm1, %xmm4, %xmm14
1000017fb:	c4 e2 c1 98 e4 	vfmadd132pd	%xmm4, %xmm7, %xmm4
100001800:	c5 01 58 fe 	vaddpd	%xmm6, %xmm15, %xmm15
100001804:	c4 e2 a1 9c c0 	vfnmadd132pd	%xmm0, %xmm11, %xmm0
100001809:	c4 41 19 58 dc 	vaddpd	%xmm12, %xmm12, %xmm11
10000180e:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100001813:	c4 e2 e9 9c db 	vfnmadd132pd	%xmm3, %xmm2, %xmm3
100001818:	c5 21 58 de 	vaddpd	%xmm6, %xmm11, %xmm11
10000181c:	c4 41 09 58 f6 	vaddpd	%xmm14, %xmm14, %xmm14
100001821:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
100001826:	c5 79 29 fc 	vmovapd	%xmm15, %xmm4
10000182a:	c5 11 58 ee 	vaddpd	%xmm6, %xmm13, %xmm13
10000182e:	c4 41 79 59 e3 	vmulpd	%xmm11, %xmm0, %xmm12
100001833:	c4 e2 b1 98 c0 	vfmadd132pd	%xmm0, %xmm9, %xmm0
100001838:	c5 09 58 f6 	vaddpd	%xmm6, %xmm14, %xmm14
10000183c:	c4 c1 71 59 d6 	vmulpd	%xmm14, %xmm1, %xmm2
100001841:	c4 e2 c1 98 c9 	vfmadd132pd	%xmm1, %xmm7, %xmm1
100001846:	c4 42 f9 9c db 	vfnmadd132pd	%xmm11, %xmm0, %xmm11
10000184b:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
100001850:	c4 c1 01 59 c2 	vmulpd	%xmm10, %xmm15, %xmm0
100001855:	c4 42 b9 98 d2 	vfmadd132pd	%xmm10, %xmm8, %xmm10
10000185a:	c5 19 58 e6 	vaddpd	%xmm6, %xmm12, %xmm12
10000185e:	c4 42 f1 9c f6 	vfnmadd132pd	%xmm14, %xmm1, %xmm14
100001863:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001867:	c4 c1 61 59 cd 	vmulpd	%xmm13, %xmm3, %xmm1
10000186c:	c4 e2 d1 98 db 	vfmadd132pd	%xmm3, %xmm5, %xmm3
100001871:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100001875:	c4 c2 a9 9c e7 	vfnmadd132pd	%xmm15, %xmm10, %xmm4
10000187a:	c4 41 19 59 fc 	vmulpd	%xmm12, %xmm12, %xmm15
10000187f:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001883:	c4 41 19 59 e3 	vmulpd	%xmm11, %xmm12, %xmm12
100001888:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
10000188c:	c4 42 e1 9c ed 	vfnmadd132pd	%xmm13, %xmm3, %xmm13
100001891:	c5 79 29 db 	vmovapd	%xmm11, %xmm3
100001895:	c5 f1 58 c9 	vaddpd	%xmm1, %xmm1, %xmm1
100001899:	c4 c2 b1 98 db 	vfmadd132pd	%xmm11, %xmm9, %xmm3
10000189e:	c5 78 29 7c 24 98 	vmovaps	%xmm15, -104(%rsp)
1000018a4:	c4 62 a1 a8 5c 24 98 	vfmadd213pd	-104(%rsp), %xmm11, %xmm11
1000018ab:	c4 41 19 58 e4 	vaddpd	%xmm12, %xmm12, %xmm12
1000018b0:	c5 f1 58 ce 	vaddpd	%xmm6, %xmm1, %xmm1
1000018b4:	c4 41 61 5c d7 	vsubpd	%xmm15, %xmm3, %xmm10
1000018b9:	c5 79 59 f8 	vmulpd	%xmm0, %xmm0, %xmm15
1000018bd:	c5 99 58 de 	vaddpd	%xmm6, %xmm12, %xmm3
1000018c1:	c5 f9 59 c4 	vmulpd	%xmm4, %xmm0, %xmm0
1000018c5:	c5 59 59 e4 	vmulpd	%xmm4, %xmm4, %xmm12
1000018c9:	c4 c1 09 59 e6 	vmulpd	%xmm14, %xmm14, %xmm4
1000018ce:	c5 78 29 7c 24 88 	vmovaps	%xmm15, -120(%rsp)
1000018d4:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
1000018d8:	c4 41 39 58 fc 	vaddpd	%xmm12, %xmm8, %xmm15
1000018dd:	c5 78 29 64 24 a8 	vmovaps	%xmm12, -88(%rsp)
1000018e3:	c5 01 5c 7c 24 88 	vsubpd	-120(%rsp), %xmm15, %xmm15
1000018e9:	c5 f8 29 64 24 b8 	vmovaps	%xmm4, -72(%rsp)
1000018ef:	c5 79 58 e6 	vaddpd	%xmm6, %xmm0, %xmm12
1000018f3:	c5 e9 59 c2 	vmulpd	%xmm2, %xmm2, %xmm0
1000018f7:	c5 89 59 d2 	vmulpd	%xmm2, %xmm14, %xmm2
1000018fb:	c5 41 58 f4 	vaddpd	%xmm4, %xmm7, %xmm14
1000018ff:	c4 c1 11 59 e5 	vmulpd	%xmm13, %xmm13, %xmm4
100001904:	c4 41 71 59 ed 	vmulpd	%xmm13, %xmm1, %xmm13
100001909:	c5 f8 29 44 24 c8 	vmovaps	%xmm0, -56(%rsp)
10000190f:	c5 09 5c f0 	vsubpd	%xmm0, %xmm14, %xmm14
100001913:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001917:	c5 f8 29 64 24 d8 	vmovaps	%xmm4, -40(%rsp)
10000191d:	c5 d1 58 e4 	vaddpd	%xmm4, %xmm5, %xmm4
100001921:	c4 41 11 58 ed 	vaddpd	%xmm13, %xmm13, %xmm13
100001926:	c5 e9 58 c6 	vaddpd	%xmm6, %xmm2, %xmm0
10000192a:	c5 f1 59 d1 	vmulpd	%xmm1, %xmm1, %xmm2
10000192e:	c5 91 58 ce 	vaddpd	%xmm6, %xmm13, %xmm1
100001932:	c5 7b 10 2d 96 04 00 00 	vmovsd	1174(%rip), %xmm13
10000193a:	c4 41 79 2e eb 	vucomisd	%xmm11, %xmm13
10000193f:	c5 f8 29 54 24 e8 	vmovaps	%xmm2, -24(%rsp)
100001945:	c5 d9 5c e2 	vsubpd	%xmm2, %xmm4, %xmm4
100001949:	73 65 	jae	101 <_mand64+0x400>
10000194b:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100001950:	c4 41 79 2e eb 	vucomisd	%xmm11, %xmm13
100001955:	73 59 	jae	89 <_mand64+0x400>
100001957:	c5 f9 28 54 24 a8 	vmovapd	-88(%rsp), %xmm2
10000195d:	c5 e9 58 54 24 88 	vaddpd	-120(%rsp), %xmm2, %xmm2
100001963:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
100001967:	73 47 	jae	71 <_mand64+0x400>
100001969:	c5 e9 15 d2 	vunpckhpd	%xmm2, %xmm2, %xmm2
10000196d:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
100001971:	73 3d 	jae	61 <_mand64+0x400>
100001973:	c5 f9 28 54 24 b8 	vmovapd	-72(%rsp), %xmm2
100001979:	c5 e9 58 54 24 c8 	vaddpd	-56(%rsp), %xmm2, %xmm2
10000197f:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
100001983:	73 2b 	jae	43 <_mand64+0x400>
100001985:	c5 e9 15 d2 	vunpckhpd	%xmm2, %xmm2, %xmm2
100001989:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
10000198d:	73 21 	jae	33 <_mand64+0x400>
10000198f:	c5 f9 28 54 24 d8 	vmovapd	-40(%rsp), %xmm2
100001995:	c5 e9 58 54 24 e8 	vaddpd	-24(%rsp), %xmm2, %xmm2
10000199b:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
10000199f:	73 0f 	jae	15 <_mand64+0x400>
1000019a1:	c5 e9 15 d2 	vunpckhpd	%xmm2, %xmm2, %xmm2
1000019a5:	c5 79 2e ea 	vucomisd	%xmm2, %xmm13
1000019a9:	0f 82 6e 01 00 00 	jb	366 <_mand64+0x56D>
1000019af:	90 	nop
1000019b0:	48 83 ea 01 	subq	$1, %rdx
1000019b4:	0f 85 40 fc ff ff 	jne	-960 <_mand64+0x4A>
1000019ba:	c5 a9 59 d3 	vmulpd	%xmm3, %xmm10, %xmm2
1000019be:	c4 41 79 28 da 	vmovapd	%xmm10, %xmm11
1000019c3:	c4 41 79 28 ef 	vmovapd	%xmm15, %xmm13
1000019c8:	c5 78 29 74 24 88 	vmovaps	%xmm14, -120(%rsp)
1000019ce:	c4 42 b1 98 da 	vfmadd132pd	%xmm10, %xmm9, %xmm11
1000019d3:	c4 42 91 b8 c5 	vfmadd231pd	%xmm13, %xmm13, %xmm8
1000019d8:	c4 41 79 28 d4 	vmovapd	%xmm12, %xmm10
1000019dd:	c5 7b 10 0d eb 03 00 00 	vmovsd	1003(%rip), %xmm9
1000019e5:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
1000019e9:	c4 62 e1 bc db 	vfnmadd231pd	%xmm3, %xmm3, %xmm11
1000019ee:	c4 42 b9 9c d4 	vfnmadd132pd	%xmm12, %xmm8, %xmm10
1000019f3:	c5 f9 28 5c 24 88 	vmovapd	-120(%rsp), %xmm3
1000019f9:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
1000019fd:	c4 e2 e1 b8 fb 	vfmadd231pd	%xmm3, %xmm3, %xmm7
100001a02:	c5 e9 59 d2 	vmulpd	%xmm2, %xmm2, %xmm2
100001a06:	c4 41 29 59 d2 	vmulpd	%xmm10, %xmm10, %xmm10
100001a0b:	c4 42 e9 98 db 	vfmadd132pd	%xmm11, %xmm2, %xmm11
100001a10:	c4 c1 11 59 d4 	vmulpd	%xmm12, %xmm13, %xmm2
100001a15:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100001a1a:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001a1e:	48 19 d2 	sbbq	%rdx, %rdx
100001a21:	48 83 e2 80 	andq	$-128, %rdx
100001a25:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001a29:	48 81 c2 bf 00 00 00 	addq	$191, %rdx
100001a30:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100001a35:	c4 41 21 15 db 	vunpckhpd	%xmm11, %xmm11, %xmm11
100001a3a:	c4 62 e9 b8 d2 	vfmadd231pd	%xmm2, %xmm2, %xmm10
100001a3f:	c5 f9 59 d3 	vmulpd	%xmm3, %xmm0, %xmm2
100001a43:	c4 e2 c1 9c c0 	vfnmadd132pd	%xmm0, %xmm7, %xmm0
100001a48:	48 19 c9 	sbbq	%rcx, %rcx
100001a4b:	48 83 e1 80 	andq	$-128, %rcx
100001a4f:	48 81 c1 ff 00 00 00 	addq	$255, %rcx
100001a56:	c4 41 79 2e cb 	vucomisd	%xmm11, %xmm9
100001a5b:	c5 e9 58 d2 	vaddpd	%xmm2, %xmm2, %xmm2
100001a5f:	c5 f9 59 c0 	vmulpd	%xmm0, %xmm0, %xmm0
100001a63:	48 0f 43 d1 	cmovaeq	%rcx, %rdx
100001a67:	48 89 d1 	movq	%rdx, %rcx
100001a6a:	81 e1 df 00 00 00 	andl	$223, %ecx
100001a70:	c4 41 79 2e ca 	vucomisd	%xmm10, %xmm9
100001a75:	c5 e9 58 d6 	vaddpd	%xmm6, %xmm2, %xmm2
100001a79:	c4 41 29 15 d2 	vunpckhpd	%xmm10, %xmm10, %xmm10
100001a7e:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001a82:	c4 e2 e9 b8 c2 	vfmadd231pd	%xmm2, %xmm2, %xmm0
100001a87:	48 89 d1 	movq	%rdx, %rcx
100001a8a:	81 e1 ef 00 00 00 	andl	$239, %ecx
100001a90:	c4 41 79 2e ca 	vucomisd	%xmm10, %xmm9
100001a95:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001a99:	48 89 d1 	movq	%rdx, %rcx
100001a9c:	81 e1 f7 00 00 00 	andl	$247, %ecx
100001aa2:	c5 79 2e c8 	vucomisd	%xmm0, %xmm9
100001aa6:	c5 f9 15 c0 	vunpckhpd	%xmm0, %xmm0, %xmm0
100001aaa:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001aae:	48 89 d1 	movq	%rdx, %rcx
100001ab1:	81 e1 fb 00 00 00 	andl	$251, %ecx
100001ab7:	c5 79 2e c8 	vucomisd	%xmm0, %xmm9
100001abb:	c5 d9 59 c1 	vmulpd	%xmm1, %xmm4, %xmm0
100001abf:	c4 e2 d1 98 e4 	vfmadd132pd	%xmm4, %xmm5, %xmm4
100001ac4:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001ac8:	48 89 d1 	movq	%rdx, %rcx
100001acb:	c4 e2 d9 9c c9 	vfnmadd132pd	%xmm1, %xmm4, %xmm1
100001ad0:	c5 f9 58 c0 	vaddpd	%xmm0, %xmm0, %xmm0
100001ad4:	81 e1 fd 00 00 00 	andl	$253, %ecx
100001ada:	c5 f9 58 c6 	vaddpd	%xmm6, %xmm0, %xmm0
100001ade:	c5 f1 59 c9 	vmulpd	%xmm1, %xmm1, %xmm1
100001ae2:	c4 e2 f9 b8 c8 	vfmadd231pd	%xmm0, %xmm0, %xmm1
100001ae7:	c5 79 2e c9 	vucomisd	%xmm1, %xmm9
100001aeb:	c5 f1 15 c9 	vunpckhpd	%xmm1, %xmm1, %xmm1
100001aef:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001af3:	48 89 d1 	movq	%rdx, %rcx
100001af6:	81 e1 fe 00 00 00 	andl	$254, %ecx
100001afc:	c5 79 2e c9 	vucomisd	%xmm1, %xmm9
100001b00:	48 0f 42 d1 	cmovbq	%rcx, %rdx
100001b04:	48 c1 e8 08 	shrq	$8, %rax
100001b08:	48 83 c7 40 	addq	$64, %rdi
100001b0c:	48 c1 e2 38 	shlq	$56, %rdx
100001b10:	48 09 d0 	orq	%rdx, %rax
100001b13:	48 39 f7 	cmpq	%rsi, %rdi
100001b16:	0f 85 a4 fa ff ff 	jne	-1372 <_mand64+0x10>
100001b1c:	c3 	retq
100001b1d:	31 d2 	xorl	%edx, %edx
100001b1f:	eb e3 	jmp	-29 <_mand64+0x554>
Disassembly of section __TEXT,__text_startup:
_main:
100001b30:	55 	pushq	%rbp
100001b31:	48 89 e5 	movq	%rsp, %rbp
100001b34:	41 57 	pushq	%r15
100001b36:	41 bf c8 00 00 00 	movl	$200, %r15d
100001b3c:	41 56 	pushq	%r14
100001b3e:	41 55 	pushq	%r13
100001b40:	41 54 	pushq	%r12
100001b42:	53 	pushq	%rbx
100001b43:	48 83 ec 28 	subq	$40, %rsp
100001b47:	83 ff 01 	cmpl	$1, %edi
100001b4a:	0f 8f 73 01 00 00 	jg	371 <_main+0x193>
100001b50:	48 bf 67 66 66 66 66 66 66 66 	movabsq	$7378697629483820647, %rdi
100001b5a:	4c 89 f9 	movq	%r15, %rcx
100001b5d:	31 f6 	xorl	%esi, %esi
100001b5f:	90 	nop
100001b60:	48 89 c8 	movq	%rcx, %rax
100001b63:	48 c1 f9 3f 	sarq	$63, %rcx
100001b67:	48 83 c6 01 	addq	$1, %rsi
100001b6b:	48 f7 ef 	imulq	%rdi
100001b6e:	48 c1 fa 02 	sarq	$2, %rdx
100001b72:	48 29 ca 	subq	%rcx, %rdx
100001b75:	48 89 d1 	movq	%rdx, %rcx
100001b78:	75 e6 	jne	-26 <_main+0x30>
100001b7a:	4d 89 fc 	movq	%r15, %r12
100001b7d:	48 01 f6 	addq	%rsi, %rsi
100001b80:	49 c1 fc 03 	sarq	$3, %r12
100001b84:	48 8d 5e 0c 	leaq	12(%rsi), %rbx
100001b88:	4c 8d 6e 05 	leaq	5(%rsi), %r13
100001b8c:	4d 0f af e7 	imulq	%r15, %r12
100001b90:	48 83 e3 f8 	andq	$-8, %rbx
100001b94:	4c 29 eb 	subq	%r13, %rbx
100001b97:	4d 01 ec 	addq	%r13, %r12
100001b9a:	4a 8d 3c 23 	leaq	(%rbx,%r12), %rdi
100001b9e:	e8 95 01 00 00 	callq	405 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D463>
100001ba3:	4c 89 f9 	movq	%r15, %rcx
100001ba6:	48 8d 35 09 02 00 00 	leaq	521(%rip), %rsi
100001bad:	4c 89 fa 	movq	%r15, %rdx
100001bb0:	48 01 c3 	addq	%rax, %rbx
100001bb3:	49 89 c6 	movq	%rax, %r14
100001bb6:	31 c0 	xorl	%eax, %eax
100001bb8:	48 89 df 	movq	%rbx, %rdi
100001bbb:	49 01 dd 	addq	%rbx, %r13
100001bbe:	e8 7b 01 00 00 	callq	379 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D469>
100001bc3:	4a 8d 04 fd 10 00 00 00 	leaq	16(,%r15,8), %rax
100001bcb:	48 29 c4 	subq	%rax, %rsp
100001bce:	48 8d 74 24 0f 	leaq	15(%rsp), %rsi
100001bd3:	48 29 c4 	subq	%rax, %rsp
100001bd6:	48 83 e6 f0 	andq	$-16, %rsi
100001bda:	48 89 e1 	movq	%rsp, %rcx
100001bdd:	4d 85 ff 	testq	%r15, %r15
100001be0:	7e 7a 	jle	122 <_main+0x12C>
100001be2:	c5 e1 57 db 	vxorpd	%xmm3, %xmm3, %xmm3
100001be6:	4c 89 ff 	movq	%r15, %rdi
100001be9:	31 c0 	xorl	%eax, %eax
100001beb:	c5 fb 10 05 e5 01 00 00 	vmovsd	485(%rip), %xmm0
100001bf3:	c4 c1 e3 2a df 	vcvtsi2sdq	%r15, %xmm3, %xmm3
100001bf8:	c5 f9 28 2d f0 01 00 00 	vmovapd	496(%rip), %xmm5
100001c00:	c5 fb 10 25 d8 01 00 00 	vmovsd	472(%rip), %xmm4
100001c08:	c5 fb 5e db 	vdivsd	%xmm3, %xmm0, %xmm3
100001c0c:	c5 fb 12 f3 	vmovddup	%xmm3, %xmm6
100001c10:	48 8d 50 01 	leaq	1(%rax), %rdx
100001c14:	c5 f1 57 c9 	vxorpd	%xmm1, %xmm1, %xmm1
100001c18:	c5 f9 57 c0 	vxorpd	%xmm0, %xmm0, %xmm0
100001c1c:	c4 e1 f3 2a c8 	vcvtsi2sdq	%rax, %xmm1, %xmm1
100001c21:	c4 e1 fb 2a c2 	vcvtsi2sdq	%rdx, %xmm0, %xmm0
100001c26:	48 89 c2 	movq	%rax, %rdx
100001c29:	48 d1 fa 	sarq	%rdx
100001c2c:	48 c1 e2 04 	shlq	$4, %rdx
100001c30:	c5 f1 14 d0 	vunpcklpd	%xmm0, %xmm1, %xmm2
100001c34:	c4 e2 d9 99 cb 	vfmadd132sd	%xmm3, %xmm4, %xmm1
100001c39:	c4 e2 d9 99 c3 	vfmadd132sd	%xmm3, %xmm4, %xmm0
100001c3e:	c4 e2 d1 98 d6 	vfmadd132pd	%xmm6, %xmm5, %xmm2
100001c43:	c5 fb 11 0c c1 	vmovsd	%xmm1, (%rcx,%rax,8)
100001c48:	c5 fb 11 44 c1 08 	vmovsd	%xmm0, 8(%rcx,%rax,8)
100001c4e:	48 83 c0 02 	addq	$2, %rax
100001c52:	c5 f8 29 14 16 	vmovaps	%xmm2, (%rsi,%rdx)
100001c57:	48 39 f8 	cmpq	%rdi, %rax
100001c5a:	75 b4 	jne	-76 <_main+0xE0>
100001c5c:	4c 89 f8 	movq	%r15, %rax
100001c5f:	48 89 4d c8 	movq	%rcx, -56(%rbp)
100001c63:	31 c9 	xorl	%ecx, %ecx
100001c65:	48 c1 f8 3f 	sarq	$63, %rax
100001c69:	48 89 75 c0 	movq	%rsi, -64(%rbp)
100001c6d:	48 8d 75 b0 	leaq	-80(%rbp), %rsi
100001c71:	48 c1 e8 3a 	shrq	$58, %rax
100001c75:	4c 89 6d b8 	movq	%r13, -72(%rbp)
100001c79:	49 8d 14 07 	leaq	(%r15,%rax), %rdx
100001c7d:	4c 89 7d b0 	movq	%r15, -80(%rbp)
100001c81:	83 e2 3f 	andl	$63, %edx
100001c84:	48 39 c2 	cmpq	%rax, %rdx
100001c87:	ba 00 00 00 00 	movl	$0, %edx
100001c8c:	75 53 	jne	83 <_main+0x1B1>
100001c8e:	48 8d 3d 2b f2 ff ff 	leaq	-3541(%rip), %rdi
100001c95:	e8 8c 00 00 00 	callq	140 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D451>
100001c9a:	4c 89 e2 	movq	%r12, %rdx
100001c9d:	48 89 de 	movq	%rbx, %rsi
100001ca0:	bf 01 00 00 00 	movl	$1, %edi
100001ca5:	e8 9a 00 00 00 	callq	154 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D46F>
100001caa:	4c 89 f7 	movq	%r14, %rdi
100001cad:	e8 80 00 00 00 	callq	128 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D45D>
100001cb2:	48 8d 65 d8 	leaq	-40(%rbp), %rsp
100001cb6:	31 c0 	xorl	%eax, %eax
100001cb8:	5b 	popq	%rbx
100001cb9:	41 5c 	popq	%r12
100001cbb:	41 5d 	popq	%r13
100001cbd:	41 5e 	popq	%r14
100001cbf:	41 5f 	popq	%r15
100001cc1:	5d 	popq	%rbp
100001cc2:	c3 	retq
100001cc3:	48 8b 7e 08 	movq	8(%rsi), %rdi
100001cc7:	e8 60 00 00 00 	callq	96 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D457>
100001ccc:	48 63 f0 	movslq	%eax, %rsi
100001ccf:	48 83 c6 07 	addq	$7, %rsi
100001cd3:	48 83 e6 f8 	andq	$-8, %rsi
100001cd7:	74 16 	je	22 <_main+0x1BF>
100001cd9:	49 89 f7 	movq	%rsi, %r15
100001cdc:	e9 6f fe ff ff 	jmp	-401 <_main+0x20>
100001ce1:	48 8d 3d 78 eb ff ff 	leaq	-5256(%rip), %rdi
100001ce8:	e8 39 00 00 00 	callq	57 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccxXXDoD.o+0xA6B5D451>
100001ced:	eb ab 	jmp	-85 <_main+0x16A>
100001cef:	45 31 ff 	xorl	%r15d, %r15d
100001cf2:	e9 83 fe ff ff 	jmp	-381 <_main+0x4A>
100001cf7:	90 	nop
100001cf8:	90 	nop
100001cf9:	90 	nop
100001cfa:	90 	nop
100001cfb:	90 	nop
100001cfc:	90 	nop
100001cfd:	90 	nop
100001cfe:	90 	nop
100001cff:	90 	nop

_set_fast_math:
100001d00:	0f ae 5c 24 fc 	stmxcsr	-4(%rsp)
100001d05:	81 4c 24 fc 40 80 00 00 	orl	$32832, -4(%rsp)
100001d0d:	0f ae 54 24 fc 	ldmxcsr	-4(%rsp)
100001d12:	c3 	retq
Disassembly of section __TEXT,__stubs:
__stubs:
100001d14:	ff 25 f6 02 00 00 	jmpq	*758(%rip)
100001d1a:	ff 25 f8 02 00 00 	jmpq	*760(%rip)
100001d20:	ff 25 fa 02 00 00 	jmpq	*762(%rip)
100001d26:	ff 25 fc 02 00 00 	jmpq	*764(%rip)
100001d2c:	ff 25 fe 02 00 00 	jmpq	*766(%rip)
100001d32:	ff 25 00 03 00 00 	jmpq	*768(%rip)
100001d38:	ff 25 02 03 00 00 	jmpq	*770(%rip)
100001d3e:	ff 25 04 03 00 00 	jmpq	*772(%rip)
100001d44:	ff 25 06 03 00 00 	jmpq	*774(%rip)
Disassembly of section __TEXT,__stub_helper:
__stub_helper:
100001d4c:	4c 8d 1d b5 02 00 00 	leaq	693(%rip), %r11
100001d53:	41 53 	pushq	%r11
100001d55:	ff 25 a5 02 00 00 	jmpq	*677(%rip)
100001d5b:	90 	nop
100001d5c:	68 00 00 00 00 	pushq	$0
100001d61:	e9 e6 ff ff ff 	jmp	-26 <__stub_helper>
100001d66:	68 1c 00 00 00 	pushq	$28
100001d6b:	e9 dc ff ff ff 	jmp	-36 <__stub_helper>
100001d70:	68 39 00 00 00 	pushq	$57
100001d75:	e9 d2 ff ff ff 	jmp	-46 <__stub_helper>
100001d7a:	68 57 00 00 00 	pushq	$87
100001d7f:	e9 c8 ff ff ff 	jmp	-56 <__stub_helper>
100001d84:	68 6c 00 00 00 	pushq	$108
100001d89:	e9 be ff ff ff 	jmp	-66 <__stub_helper>
100001d8e:	68 78 00 00 00 	pushq	$120
100001d93:	e9 b4 ff ff ff 	jmp	-76 <__stub_helper>
100001d98:	68 84 00 00 00 	pushq	$132
100001d9d:	e9 aa ff ff ff 	jmp	-86 <__stub_helper>
100001da2:	68 92 00 00 00 	pushq	$146
100001da7:	e9 a0 ff ff ff 	jmp	-96 <__stub_helper>
100001dac:	68 a1 00 00 00 	pushq	$161
100001db1:	e9 96 ff ff ff 	jmp	-106 <__stub_helper>
