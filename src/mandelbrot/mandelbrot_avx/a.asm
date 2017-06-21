
a.out:	file format Mach-O 64-bit x86-64

Disassembly of section __TEXT,__text:
__text:
100000780:	4c 8d 54 24 08 	leaq	8(%rsp), %r10
100000785:	48 83 e4 e0 	andq	$-32, %rsp
100000789:	b9 01 00 00 00 	movl	$1, %ecx
10000078e:	ba 01 00 00 00 	movl	$1, %edx
100000793:	41 ff 72 f8 	pushq	-8(%r10)
100000797:	55 	pushq	%rbp
100000798:	48 89 e5 	movq	%rsp, %rbp
10000079b:	41 57 	pushq	%r15
10000079d:	41 56 	pushq	%r14
10000079f:	49 89 fe 	movq	%rdi, %r14
1000007a2:	41 55 	pushq	%r13
1000007a4:	41 54 	pushq	%r12
1000007a6:	4c 8d 65 c8 	leaq	-56(%rbp), %r12
1000007aa:	41 52 	pushq	%r10
1000007ac:	4d 89 e1 	movq	%r12, %r9
1000007af:	53 	pushq	%rbx
1000007b0:	48 8d 5d c0 	leaq	-64(%rbp), %rbx
1000007b4:	49 89 d8 	movq	%rbx, %r8
1000007b7:	48 83 ec 60 	subq	$96, %rsp
1000007bb:	48 63 77 18 	movslq	24(%rdi), %rsi
1000007bf:	4c 8b 6f 10 	movq	16(%rdi), %r13
1000007c3:	4c 8b 3f 	movq	(%rdi), %r15
1000007c6:	31 ff 	xorl	%edi, %edi
1000007c8:	e8 d3 04 00 00 	callq	1235 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2D5>
1000007cd:	84 c0 	testb	%al, %al
1000007cf:	0f 84 c2 01 00 00 	je	450 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x217>
1000007d5:	c5 f8 57 c0 	vxorps	%xmm0, %xmm0, %xmm0
1000007d9:	c4 c1 fa 2a c7 	vcvtsi2ssq	%r15, %xmm0, %xmm0
1000007de:	4d 85 ff 	testq	%r15, %r15
1000007e1:	0f 88 ca 01 00 00 	js	458 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x231>
1000007e7:	c5 7a 10 05 31 06 00 00 	vmovss	1585(%rip), %xmm8
1000007ef:	c5 fc 28 3d 69 06 00 00 	vmovaps	1641(%rip), %ymm7
1000007f7:	c5 3a 5e c0 	vdivss	%xmm0, %xmm8, %xmm8
1000007fb:	c5 ba 59 0d 21 06 00 00 	vmulss	1569(%rip), %xmm8, %xmm1
100000803:	c5 ba 59 1d 1d 06 00 00 	vmulss	1565(%rip), %xmm8, %xmm3
10000080b:	c5 ba 59 15 19 06 00 00 	vmulss	1561(%rip), %xmm8, %xmm2
100000813:	c5 ba 59 25 15 06 00 00 	vmulss	1557(%rip), %xmm8, %xmm4
10000081b:	c5 ba 59 05 11 06 00 00 	vmulss	1553(%rip), %xmm8, %xmm0
100000823:	c4 c1 3a 58 e8 	vaddss	%xmm8, %xmm8, %xmm5
100000828:	c5 3a 59 0d 08 06 00 00 	vmulss	1544(%rip), %xmm8, %xmm9
100000830:	c5 f0 14 cb 	vunpcklps	%xmm3, %xmm1, %xmm1
100000834:	c5 e8 14 d4 	vunpcklps	%xmm4, %xmm2, %xmm2
100000838:	c5 f8 14 c5 	vunpcklps	%xmm5, %xmm0, %xmm0
10000083c:	c5 f0 16 ca 	vmovlhps	%xmm2, %xmm1, %xmm1
100000840:	c4 41 38 14 c9 	vunpcklps	%xmm9, %xmm8, %xmm9
100000845:	c4 c1 78 16 c1 	vmovlhps	%xmm9, %xmm0, %xmm0
10000084a:	c4 63 75 18 c8 01 	vinsertf128	$1, %xmm0, %ymm1, %ymm9
100000850:	4c 8b 4d c0 	movq	-64(%rbp), %r9
100000854:	44 8b 5d c8 	movl	-56(%rbp), %r11d
100000858:	4d 8b 46 08 	movq	8(%r14), %r8
10000085c:	45 89 ca 	movl	%r9d, %r10d
10000085f:	4d 85 ed 	testq	%r13, %r13
100000862:	0f 84 f2 00 00 00 	je	242 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x1DA>
100000868:	4d 63 c9 	movslq	%r9d, %r9
10000086b:	4c 89 ef 	movq	%r13, %rdi
10000086e:	c5 7a 10 1d c6 05 00 00 	vmovss	1478(%rip), %xmm11
100000876:	c5 7a 10 15 c2 05 00 00 	vmovss	1474(%rip), %xmm10
10000087e:	49 0f af f9 	imulq	%r9, %rdi
100000882:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
100000890:	c5 c8 57 f6 	vxorps	%xmm6, %xmm6, %xmm6
100000894:	c4 c1 ca 2a f1 	vcvtsi2ssq	%r9, %xmm6, %xmm6
100000899:	4d 85 c9 	testq	%r9, %r9
10000089c:	79 1c 	jns	28 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x13A>
10000089e:	4c 89 c8 	movq	%r9, %rax
1000008a1:	4c 89 ca 	movq	%r9, %rdx
1000008a4:	c5 c8 57 f6 	vxorps	%xmm6, %xmm6, %xmm6
1000008a8:	48 d1 e8 	shrq	%rax
1000008ab:	83 e2 01 	andl	$1, %edx
1000008ae:	48 09 d0 	orq	%rdx, %rax
1000008b1:	c4 e1 ca 2a f0 	vcvtsi2ssq	%rax, %xmm6, %xmm6
1000008b6:	c5 ca 58 f6 	vaddss	%xmm6, %xmm6, %xmm6
1000008ba:	c4 c2 21 99 f0 	vfmadd132ss	%xmm8, %xmm11, %xmm6
1000008bf:	31 c9 	xorl	%ecx, %ecx
1000008c1:	31 f6 	xorl	%esi, %esi
1000008c3:	c4 e2 7d 18 f6 	vbroadcastss	%xmm6, %ymm6
1000008c8:	0f 1f 84 00 00 00 00 00 	nopl	(%rax,%rax)
1000008d0:	8d 04 f5 00 00 00 00 	leal	(,%rsi,8), %eax
1000008d7:	c5 d0 57 ed 	vxorps	%xmm5, %xmm5, %xmm5
1000008db:	c5 fc 28 c6 	vmovaps	%ymm6, %ymm0
1000008df:	ba 32 00 00 00 	movl	$50, %edx
1000008e4:	c4 e1 d2 2a e8 	vcvtsi2ssq	%rax, %xmm5, %xmm5
1000008e9:	c4 c2 29 99 e8 	vfmadd132ss	%xmm8, %xmm10, %xmm5
1000008ee:	c4 e2 7d 18 ed 	vbroadcastss	%xmm5, %ymm5
1000008f3:	c4 c1 54 58 e9 	vaddps	%ymm9, %ymm5, %ymm5
1000008f8:	c5 fc 28 dd 	vmovaps	%ymm5, %ymm3
1000008fc:	eb 1c 	jmp	28 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x19A>
1000008fe:	66 90 	nop
100000900:	c5 e4 59 c0 	vmulps	%ymm0, %ymm3, %ymm0
100000904:	c5 d4 58 d2 	vaddps	%ymm2, %ymm5, %ymm2
100000908:	c5 ec 5c dc 	vsubps	%ymm4, %ymm2, %ymm3
10000090c:	c5 fc 58 c0 	vaddps	%ymm0, %ymm0, %ymm0
100000910:	c5 fc 58 c6 	vaddps	%ymm6, %ymm0, %ymm0
100000914:	48 83 ea 01 	subq	$1, %rdx
100000918:	74 1b 	je	27 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x1B5>
10000091a:	c5 e4 59 d3 	vmulps	%ymm3, %ymm3, %ymm2
10000091e:	c5 fc 59 e0 	vmulps	%ymm0, %ymm0, %ymm4
100000922:	c5 ec 58 cc 	vaddps	%ymm4, %ymm2, %ymm1
100000926:	c5 f4 c2 cf 11 	vcmplt_oqps	%ymm7, %ymm1, %ymm1
10000092b:	c5 fc 50 c1 	vmovmskps	%ymm1, %eax
10000092f:	85 c0 	testl	%eax, %eax
100000931:	75 cd 	jne	-51 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x180>
100000933:	31 c0 	xorl	%eax, %eax
100000935:	49 03 08 	addq	(%r8), %rcx
100000938:	88 04 39 	movb	%al, (%rcx,%rdi)
10000093b:	8d 4e 01 	leal	1(%rsi), %ecx
10000093e:	48 89 ce 	movq	%rcx, %rsi
100000941:	49 39 cd 	cmpq	%rcx, %r13
100000944:	77 8a 	ja	-118 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x150>
100000946:	41 83 c2 01 	addl	$1, %r10d
10000094a:	49 83 c1 01 	addq	$1, %r9
10000094e:	4c 01 ef 	addq	%r13, %rdi
100000951:	45 39 d3 	cmpl	%r10d, %r11d
100000954:	0f 8f 36 ff ff ff 	jg	-202 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x110>
10000095a:	4c 89 e6 	movq	%r12, %rsi
10000095d:	48 89 df 	movq	%rbx, %rdi
100000960:	c5 7c 29 4d 90 	vmovaps	%ymm9, -112(%rbp)
100000965:	c5 fc 29 bd 70 ff ff ff 	vmovaps	%ymm7, -144(%rbp)
10000096d:	c5 7a 11 45 bc 	vmovss	%xmm8, -68(%rbp)
100000972:	c5 f8 77 	vzeroupper
100000975:	e8 20 03 00 00 	callq	800 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2CF>
10000097a:	c5 7a 10 45 bc 	vmovss	-68(%rbp), %xmm8
10000097f:	c5 7c 28 4d 90 	vmovaps	-112(%rbp), %ymm9
100000984:	84 c0 	testb	%al, %al
100000986:	c5 fc 28 bd 70 ff ff ff 	vmovaps	-144(%rbp), %ymm7
10000098e:	0f 85 bc fe ff ff 	jne	-324 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0xD0>
100000994:	c5 f8 77 	vzeroupper
100000997:	e8 f8 02 00 00 	callq	760 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2C9>
10000099c:	48 83 c4 60 	addq	$96, %rsp
1000009a0:	5b 	popq	%rbx
1000009a1:	41 5a 	popq	%r10
1000009a3:	41 5c 	popq	%r12
1000009a5:	41 5d 	popq	%r13
1000009a7:	41 5e 	popq	%r14
1000009a9:	41 5f 	popq	%r15
1000009ab:	5d 	popq	%rbp
1000009ac:	49 8d 62 f8 	leaq	-8(%r10), %rsp
1000009b0:	c3 	retq
1000009b1:	4c 89 f8 	movq	%r15, %rax
1000009b4:	41 83 e7 01 	andl	$1, %r15d
1000009b8:	c4 41 38 57 c0 	vxorps	%xmm8, %xmm8, %xmm8
1000009bd:	48 d1 e8 	shrq	%rax
1000009c0:	4c 09 f8 	orq	%r15, %rax
1000009c3:	c4 61 ba 2a c0 	vcvtsi2ssq	%rax, %xmm8, %xmm8
1000009c8:	c4 c1 3a 58 c0 	vaddss	%xmm8, %xmm8, %xmm0
1000009cd:	e9 15 fe ff ff 	jmp	-491 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x67>

__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0:
100000780:	4c 8d 54 24 08 	leaq	8(%rsp), %r10
100000785:	48 83 e4 e0 	andq	$-32, %rsp
100000789:	b9 01 00 00 00 	movl	$1, %ecx
10000078e:	ba 01 00 00 00 	movl	$1, %edx
100000793:	41 ff 72 f8 	pushq	-8(%r10)
100000797:	55 	pushq	%rbp
100000798:	48 89 e5 	movq	%rsp, %rbp
10000079b:	41 57 	pushq	%r15
10000079d:	41 56 	pushq	%r14
10000079f:	49 89 fe 	movq	%rdi, %r14
1000007a2:	41 55 	pushq	%r13
1000007a4:	41 54 	pushq	%r12
1000007a6:	4c 8d 65 c8 	leaq	-56(%rbp), %r12
1000007aa:	41 52 	pushq	%r10
1000007ac:	4d 89 e1 	movq	%r12, %r9
1000007af:	53 	pushq	%rbx
1000007b0:	48 8d 5d c0 	leaq	-64(%rbp), %rbx
1000007b4:	49 89 d8 	movq	%rbx, %r8
1000007b7:	48 83 ec 60 	subq	$96, %rsp
1000007bb:	48 63 77 18 	movslq	24(%rdi), %rsi
1000007bf:	4c 8b 6f 10 	movq	16(%rdi), %r13
1000007c3:	4c 8b 3f 	movq	(%rdi), %r15
1000007c6:	31 ff 	xorl	%edi, %edi
1000007c8:	e8 d3 04 00 00 	callq	1235 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2D5>
1000007cd:	84 c0 	testb	%al, %al
1000007cf:	0f 84 c2 01 00 00 	je	450 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x217>
1000007d5:	c5 f8 57 c0 	vxorps	%xmm0, %xmm0, %xmm0
1000007d9:	c4 c1 fa 2a c7 	vcvtsi2ssq	%r15, %xmm0, %xmm0
1000007de:	4d 85 ff 	testq	%r15, %r15
1000007e1:	0f 88 ca 01 00 00 	js	458 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x231>
1000007e7:	c5 7a 10 05 31 06 00 00 	vmovss	1585(%rip), %xmm8
1000007ef:	c5 fc 28 3d 69 06 00 00 	vmovaps	1641(%rip), %ymm7
1000007f7:	c5 3a 5e c0 	vdivss	%xmm0, %xmm8, %xmm8
1000007fb:	c5 ba 59 0d 21 06 00 00 	vmulss	1569(%rip), %xmm8, %xmm1
100000803:	c5 ba 59 1d 1d 06 00 00 	vmulss	1565(%rip), %xmm8, %xmm3
10000080b:	c5 ba 59 15 19 06 00 00 	vmulss	1561(%rip), %xmm8, %xmm2
100000813:	c5 ba 59 25 15 06 00 00 	vmulss	1557(%rip), %xmm8, %xmm4
10000081b:	c5 ba 59 05 11 06 00 00 	vmulss	1553(%rip), %xmm8, %xmm0
100000823:	c4 c1 3a 58 e8 	vaddss	%xmm8, %xmm8, %xmm5
100000828:	c5 3a 59 0d 08 06 00 00 	vmulss	1544(%rip), %xmm8, %xmm9
100000830:	c5 f0 14 cb 	vunpcklps	%xmm3, %xmm1, %xmm1
100000834:	c5 e8 14 d4 	vunpcklps	%xmm4, %xmm2, %xmm2
100000838:	c5 f8 14 c5 	vunpcklps	%xmm5, %xmm0, %xmm0
10000083c:	c5 f0 16 ca 	vmovlhps	%xmm2, %xmm1, %xmm1
100000840:	c4 41 38 14 c9 	vunpcklps	%xmm9, %xmm8, %xmm9
100000845:	c4 c1 78 16 c1 	vmovlhps	%xmm9, %xmm0, %xmm0
10000084a:	c4 63 75 18 c8 01 	vinsertf128	$1, %xmm0, %ymm1, %ymm9
100000850:	4c 8b 4d c0 	movq	-64(%rbp), %r9
100000854:	44 8b 5d c8 	movl	-56(%rbp), %r11d
100000858:	4d 8b 46 08 	movq	8(%r14), %r8
10000085c:	45 89 ca 	movl	%r9d, %r10d
10000085f:	4d 85 ed 	testq	%r13, %r13
100000862:	0f 84 f2 00 00 00 	je	242 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x1DA>
100000868:	4d 63 c9 	movslq	%r9d, %r9
10000086b:	4c 89 ef 	movq	%r13, %rdi
10000086e:	c5 7a 10 1d c6 05 00 00 	vmovss	1478(%rip), %xmm11
100000876:	c5 7a 10 15 c2 05 00 00 	vmovss	1474(%rip), %xmm10
10000087e:	49 0f af f9 	imulq	%r9, %rdi
100000882:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
100000890:	c5 c8 57 f6 	vxorps	%xmm6, %xmm6, %xmm6
100000894:	c4 c1 ca 2a f1 	vcvtsi2ssq	%r9, %xmm6, %xmm6
100000899:	4d 85 c9 	testq	%r9, %r9
10000089c:	79 1c 	jns	28 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x13A>
10000089e:	4c 89 c8 	movq	%r9, %rax
1000008a1:	4c 89 ca 	movq	%r9, %rdx
1000008a4:	c5 c8 57 f6 	vxorps	%xmm6, %xmm6, %xmm6
1000008a8:	48 d1 e8 	shrq	%rax
1000008ab:	83 e2 01 	andl	$1, %edx
1000008ae:	48 09 d0 	orq	%rdx, %rax
1000008b1:	c4 e1 ca 2a f0 	vcvtsi2ssq	%rax, %xmm6, %xmm6
1000008b6:	c5 ca 58 f6 	vaddss	%xmm6, %xmm6, %xmm6
1000008ba:	c4 c2 21 99 f0 	vfmadd132ss	%xmm8, %xmm11, %xmm6
1000008bf:	31 c9 	xorl	%ecx, %ecx
1000008c1:	31 f6 	xorl	%esi, %esi
1000008c3:	c4 e2 7d 18 f6 	vbroadcastss	%xmm6, %ymm6
1000008c8:	0f 1f 84 00 00 00 00 00 	nopl	(%rax,%rax)
1000008d0:	8d 04 f5 00 00 00 00 	leal	(,%rsi,8), %eax
1000008d7:	c5 d0 57 ed 	vxorps	%xmm5, %xmm5, %xmm5
1000008db:	c5 fc 28 c6 	vmovaps	%ymm6, %ymm0
1000008df:	ba 32 00 00 00 	movl	$50, %edx
1000008e4:	c4 e1 d2 2a e8 	vcvtsi2ssq	%rax, %xmm5, %xmm5
1000008e9:	c4 c2 29 99 e8 	vfmadd132ss	%xmm8, %xmm10, %xmm5
1000008ee:	c4 e2 7d 18 ed 	vbroadcastss	%xmm5, %ymm5
1000008f3:	c4 c1 54 58 e9 	vaddps	%ymm9, %ymm5, %ymm5
1000008f8:	c5 fc 28 dd 	vmovaps	%ymm5, %ymm3
1000008fc:	eb 1c 	jmp	28 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x19A>
1000008fe:	66 90 	nop
100000900:	c5 e4 59 c0 	vmulps	%ymm0, %ymm3, %ymm0
100000904:	c5 d4 58 d2 	vaddps	%ymm2, %ymm5, %ymm2
100000908:	c5 ec 5c dc 	vsubps	%ymm4, %ymm2, %ymm3
10000090c:	c5 fc 58 c0 	vaddps	%ymm0, %ymm0, %ymm0
100000910:	c5 fc 58 c6 	vaddps	%ymm6, %ymm0, %ymm0
100000914:	48 83 ea 01 	subq	$1, %rdx
100000918:	74 1b 	je	27 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x1B5>
10000091a:	c5 e4 59 d3 	vmulps	%ymm3, %ymm3, %ymm2
10000091e:	c5 fc 59 e0 	vmulps	%ymm0, %ymm0, %ymm4
100000922:	c5 ec 58 cc 	vaddps	%ymm4, %ymm2, %ymm1
100000926:	c5 f4 c2 cf 11 	vcmplt_oqps	%ymm7, %ymm1, %ymm1
10000092b:	c5 fc 50 c1 	vmovmskps	%ymm1, %eax
10000092f:	85 c0 	testl	%eax, %eax
100000931:	75 cd 	jne	-51 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x180>
100000933:	31 c0 	xorl	%eax, %eax
100000935:	49 03 08 	addq	(%r8), %rcx
100000938:	88 04 39 	movb	%al, (%rcx,%rdi)
10000093b:	8d 4e 01 	leal	1(%rsi), %ecx
10000093e:	48 89 ce 	movq	%rcx, %rsi
100000941:	49 39 cd 	cmpq	%rcx, %r13
100000944:	77 8a 	ja	-118 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x150>
100000946:	41 83 c2 01 	addl	$1, %r10d
10000094a:	49 83 c1 01 	addq	$1, %r9
10000094e:	4c 01 ef 	addq	%r13, %rdi
100000951:	45 39 d3 	cmpl	%r10d, %r11d
100000954:	0f 8f 36 ff ff ff 	jg	-202 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x110>
10000095a:	4c 89 e6 	movq	%r12, %rsi
10000095d:	48 89 df 	movq	%rbx, %rdi
100000960:	c5 7c 29 4d 90 	vmovaps	%ymm9, -112(%rbp)
100000965:	c5 fc 29 bd 70 ff ff ff 	vmovaps	%ymm7, -144(%rbp)
10000096d:	c5 7a 11 45 bc 	vmovss	%xmm8, -68(%rbp)
100000972:	c5 f8 77 	vzeroupper
100000975:	e8 20 03 00 00 	callq	800 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2CF>
10000097a:	c5 7a 10 45 bc 	vmovss	-68(%rbp), %xmm8
10000097f:	c5 7c 28 4d 90 	vmovaps	-112(%rbp), %ymm9
100000984:	84 c0 	testb	%al, %al
100000986:	c5 fc 28 bd 70 ff ff ff 	vmovaps	-144(%rbp), %ymm7
10000098e:	0f 85 bc fe ff ff 	jne	-324 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0xD0>
100000994:	c5 f8 77 	vzeroupper
100000997:	e8 f8 02 00 00 	callq	760 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2C9>
10000099c:	48 83 c4 60 	addq	$96, %rsp
1000009a0:	5b 	popq	%rbx
1000009a1:	41 5a 	popq	%r10
1000009a3:	41 5c 	popq	%r12
1000009a5:	41 5d 	popq	%r13
1000009a7:	41 5e 	popq	%r14
1000009a9:	41 5f 	popq	%r15
1000009ab:	5d 	popq	%rbp
1000009ac:	49 8d 62 f8 	leaq	-8(%r10), %rsp
1000009b0:	c3 	retq
1000009b1:	4c 89 f8 	movq	%r15, %rax
1000009b4:	41 83 e7 01 	andl	$1, %r15d
1000009b8:	c4 41 38 57 c0 	vxorps	%xmm8, %xmm8, %xmm8
1000009bd:	48 d1 e8 	shrq	%rax
1000009c0:	4c 09 f8 	orq	%r15, %rax
1000009c3:	c4 61 ba 2a c0 	vcvtsi2ssq	%rax, %xmm8, %xmm8
1000009c8:	c4 c1 3a 58 c0 	vaddss	%xmm8, %xmm8, %xmm0
1000009cd:	e9 15 fe ff ff 	jmp	-491 <__ZN12_GLOBAL__N_111compute_setEm._omp_fn.0+0x67>
Disassembly of section __TEXT,__text_startup:
_main:
1000009e0:	41 57 	pushq	%r15
1000009e2:	41 56 	pushq	%r14
1000009e4:	41 55 	pushq	%r13
1000009e6:	41 54 	pushq	%r12
1000009e8:	55 	pushq	%rbp
1000009e9:	53 	pushq	%rbx
1000009ea:	48 83 ec 68 	subq	$104, %rsp
1000009ee:	83 ff 01 	cmpl	$1, %edi
1000009f1:	0f 8f 75 01 00 00 	jg	373 <_main+0x18C>
1000009f7:	b9 32 00 00 00 	movl	$50, %ecx
1000009fc:	ba c8 00 00 00 	movl	$200, %edx
100000a01:	be c8 00 00 00 	movl	$200, %esi
100000a06:	31 c0 	xorl	%eax, %eax
100000a08:	bb c8 00 00 00 	movl	$200, %ebx
100000a0d:	48 8d 3d b4 03 00 00 	leaq	948(%rip), %rdi
100000a14:	bd c8 00 00 00 	movl	$200, %ebp
100000a19:	41 be 88 13 00 00 	movl	$5000, %r14d
100000a1f:	e8 ca 02 00 00 	callq	714 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C323>
100000a24:	41 bc 19 00 00 00 	movl	$25, %r12d
100000a2a:	e8 83 02 00 00 	callq	643 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2E7>
100000a2f:	c5 f9 ef c0 	vpxor	%xmm0, %xmm0, %xmm0
100000a33:	48 c7 44 24 30 00 00 00 00 	movq	$0, 48(%rsp)
100000a3c:	49 89 c5 	movq	%rax, %r13
100000a3f:	c5 f8 29 44 24 20 	vmovaps	%xmm0, 32(%rsp)
100000a45:	4c 89 f7 	movq	%r14, %rdi
100000a48:	e8 71 02 00 00 	callq	625 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2F3>
100000a4d:	4c 8b 44 24 20 	movq	32(%rsp), %r8
100000a52:	48 8b 4c 24 28 	movq	40(%rsp), %rcx
100000a57:	49 89 c7 	movq	%rax, %r15
100000a5a:	4a 8d 04 30 	leaq	(%rax,%r14), %rax
100000a5e:	48 89 44 24 08 	movq	%rax, 8(%rsp)
100000a63:	4c 29 c1 	subq	%r8, %rcx
100000a66:	0f 85 37 01 00 00 	jne	311 <_main+0x1C3>
100000a6c:	4c 89 f2 	movq	%r14, %rdx
100000a6f:	31 f6 	xorl	%esi, %esi
100000a71:	4c 89 ff 	movq	%r15, %rdi
100000a74:	4c 89 44 24 10 	movq	%r8, 16(%rsp)
100000a79:	e8 6a 02 00 00 	callq	618 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C31D>
100000a7e:	4c 8b 44 24 10 	movq	16(%rsp), %r8
100000a83:	48 8b 4c 24 08 	movq	8(%rsp), %rcx
100000a88:	4d 85 c0 	testq	%r8, %r8
100000a8b:	0f 85 50 01 00 00 	jne	336 <_main+0x201>
100000a91:	48 8b 44 24 08 	movq	8(%rsp), %rax
100000a96:	c4 c1 f9 6e cf 	vmovq	%r15, %xmm1
100000a9b:	c4 e3 f1 22 c1 01 	vpinsrq	$1, %rcx, %xmm1, %xmm0
100000aa1:	48 89 44 24 30 	movq	%rax, 48(%rsp)
100000aa6:	c5 f8 29 44 24 20 	vmovaps	%xmm0, 32(%rsp)
100000aac:	48 8d 44 24 20 	leaq	32(%rsp), %rax
100000ab1:	48 8d 74 24 40 	leaq	64(%rsp), %rsi
100000ab6:	31 c9 	xorl	%ecx, %ecx
100000ab8:	31 d2 	xorl	%edx, %edx
100000aba:	48 8d 3d bf fc ff ff 	leaq	-833(%rip), %rdi
100000ac1:	4c 89 64 24 50 	movq	%r12, 80(%rsp)
100000ac6:	48 89 44 24 48 	movq	%rax, 72(%rsp)
100000acb:	89 5c 24 58 	movl	%ebx, 88(%rsp)
100000acf:	48 89 6c 24 40 	movq	%rbp, 64(%rsp)
100000ad4:	e8 cd 01 00 00 	callq	461 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2DB>
100000ad9:	e8 d4 01 00 00 	callq	468 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2E7>
100000ade:	48 8d 3d 08 03 00 00 	leaq	776(%rip), %rdi
100000ae5:	4c 8b 64 24 28 	movq	40(%rsp), %r12
100000aea:	48 ba db 34 b6 d7 82 de 1b 43 	movabsq	$4835703278458516699, %rdx
100000af4:	4c 29 e8 	subq	%r13, %rax
100000af7:	4c 8b 6c 24 20 	movq	32(%rsp), %r13
100000afc:	48 89 c1 	movq	%rax, %rcx
100000aff:	48 f7 ea 	imulq	%rdx
100000b02:	31 c0 	xorl	%eax, %eax
100000b04:	48 c1 f9 3f 	sarq	$63, %rcx
100000b08:	48 c1 fa 12 	sarq	$18, %rdx
100000b0c:	48 89 d6 	movq	%rdx, %rsi
100000b0f:	48 29 ce 	subq	%rcx, %rsi
100000b12:	e8 d7 01 00 00 	callq	471 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C323>
100000b17:	48 8d 35 e2 02 00 00 	leaq	738(%rip), %rsi
100000b1e:	48 8d 3d de 02 00 00 	leaq	734(%rip), %rdi
100000b25:	e8 a6 01 00 00 	callq	422 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C305>
100000b2a:	48 89 c5 	movq	%rax, %rbp
100000b2d:	48 89 c7 	movq	%rax, %rdi
100000b30:	89 d9 	movl	%ebx, %ecx
100000b32:	89 da 	movl	%ebx, %edx
100000b34:	48 8d 35 d7 02 00 00 	leaq	727(%rip), %rsi
100000b3b:	31 c0 	xorl	%eax, %eax
100000b3d:	e8 94 01 00 00 	callq	404 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C30B>
100000b42:	4c 89 e2 	movq	%r12, %rdx
100000b45:	48 89 e9 	movq	%rbp, %rcx
100000b48:	be 01 00 00 00 	movl	$1, %esi
100000b4d:	4c 89 ef 	movq	%r13, %rdi
100000b50:	4c 29 ea 	subq	%r13, %rdx
100000b53:	e8 84 01 00 00 	callq	388 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C311>
100000b58:	48 89 ef 	movq	%rbp, %rdi
100000b5b:	e8 6a 01 00 00 	callq	362 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2FF>
100000b60:	4c 89 ef 	movq	%r13, %rdi
100000b63:	e8 50 01 00 00 	callq	336 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2ED>
100000b68:	31 c0 	xorl	%eax, %eax
100000b6a:	eb 28 	jmp	40 <_main+0x1B4>
100000b6c:	48 8b 7e 08 	movq	8(%rsi), %rdi
100000b70:	e8 4f 01 00 00 	callq	335 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2F9>
100000b75:	89 c3 	movl	%eax, %ebx
100000b77:	85 c0 	testl	%eax, %eax
100000b79:	0f 8e 78 fe ff ff 	jle	-392 <_main+0x17>
100000b7f:	a8 07 	testb	$7, %al
100000b81:	74 75 	je	117 <_main+0x218>
100000b83:	48 8d 3d 1e 02 00 00 	leaq	542(%rip), %rdi
100000b8a:	e8 65 01 00 00 	callq	357 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C329>
100000b8f:	b8 e7 03 00 00 	movl	$999, %eax
100000b94:	48 83 c4 68 	addq	$104, %rsp
100000b98:	5b 	popq	%rbx
100000b99:	5d 	popq	%rbp
100000b9a:	41 5c 	popq	%r12
100000b9c:	41 5d 	popq	%r13
100000b9e:	41 5e 	popq	%r14
100000ba0:	41 5f 	popq	%r15
100000ba2:	c3 	retq
100000ba3:	4c 89 c6 	movq	%r8, %rsi
100000ba6:	48 89 ca 	movq	%rcx, %rdx
100000ba9:	4c 89 ff 	movq	%r15, %rdi
100000bac:	4c 89 44 24 18 	movq	%r8, 24(%rsp)
100000bb1:	48 89 4c 24 10 	movq	%rcx, 16(%rsp)
100000bb6:	e8 27 01 00 00 	callq	295 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C317>
100000bbb:	48 8b 4c 24 10 	movq	16(%rsp), %rcx
100000bc0:	4c 89 f2 	movq	%r14, %rdx
100000bc3:	31 f6 	xorl	%esi, %esi
100000bc5:	49 8d 3c 0f 	leaq	(%r15,%rcx), %rdi
100000bc9:	4a 8d 0c 37 	leaq	(%rdi,%r14), %rcx
100000bcd:	48 89 4c 24 10 	movq	%rcx, 16(%rsp)
100000bd2:	e8 11 01 00 00 	callq	273 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C31D>
100000bd7:	48 8b 4c 24 10 	movq	16(%rsp), %rcx
100000bdc:	4c 8b 44 24 18 	movq	24(%rsp), %r8
100000be1:	4c 89 c7 	movq	%r8, %rdi
100000be4:	48 89 4c 24 10 	movq	%rcx, 16(%rsp)
100000be9:	e8 ca 00 00 00 	callq	202 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2ED>
100000bee:	48 8b 4c 24 10 	movq	16(%rsp), %rcx
100000bf3:	e9 99 fe ff ff 	jmp	-359 <_main+0xB1>
100000bf8:	48 63 eb 	movslq	%ebx, %rbp
100000bfb:	89 c2 	movl	%eax, %edx
100000bfd:	89 c6 	movl	%eax, %esi
100000bff:	b9 32 00 00 00 	movl	$50, %ecx
100000c04:	49 89 ec 	movq	%rbp, %r12
100000c07:	49 89 ee 	movq	%rbp, %r14
100000c0a:	48 8d 3d b7 01 00 00 	leaq	439(%rip), %rdi
100000c11:	31 c0 	xorl	%eax, %eax
100000c13:	e8 d6 00 00 00 	callq	214 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C323>
100000c18:	49 c1 ec 03 	shrq	$3, %r12
100000c1c:	e8 91 00 00 00 	callq	145 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2E7>
100000c21:	4d 0f af f4 	imulq	%r12, %r14
100000c25:	c5 f9 ef c0 	vpxor	%xmm0, %xmm0, %xmm0
100000c29:	48 c7 44 24 30 00 00 00 00 	movq	$0, 48(%rsp)
100000c32:	49 89 c5 	movq	%rax, %r13
100000c35:	c5 f8 29 44 24 20 	vmovaps	%xmm0, 32(%rsp)
100000c3b:	4d 85 f6 	testq	%r14, %r14
100000c3e:	0f 84 68 fe ff ff 	je	-408 <_main+0xCC>
100000c44:	e9 fc fd ff ff 	jmp	-516 <_main+0x65>
100000c49:	48 89 c3 	movq	%rax, %rbx
100000c4c:	4d 85 ed 	testq	%r13, %r13
100000c4f:	74 20 	je	32 <_main+0x291>
100000c51:	4c 89 ef 	movq	%r13, %rdi
100000c54:	c5 f8 77 	vzeroupper
100000c57:	e8 5c 00 00 00 	callq	92 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2ED>
100000c5c:	48 89 df 	movq	%rbx, %rdi
100000c5f:	e8 48 00 00 00 	callq	72 </var/folders/52/h0ycylmj1s93wsc_br6fqk_h0000gn/T//ccS9gURW.o+0xA6B5C2E1>
100000c64:	48 8b 7c 24 20 	movq	32(%rsp), %rdi
100000c69:	48 89 c3 	movq	%rax, %rbx
100000c6c:	48 85 ff 	testq	%rdi, %rdi
100000c6f:	75 e3 	jne	-29 <_main+0x274>
100000c71:	c5 f8 77 	vzeroupper
100000c74:	eb e6 	jmp	-26 <_main+0x27C>
100000c76:	48 89 c3 	movq	%rax, %rbx
100000c79:	eb d6 	jmp	-42 <_main+0x271>
100000c7b:	90 	nop
100000c7c:	90 	nop
100000c7d:	90 	nop
100000c7e:	90 	nop
100000c7f:	90 	nop

_set_fast_math:
100000c80:	0f ae 5c 24 fc 	stmxcsr	-4(%rsp)
100000c85:	81 4c 24 fc 40 80 00 00 	orl	$32832, -4(%rsp)
100000c8d:	0f ae 54 24 fc 	ldmxcsr	-4(%rsp)
100000c92:	c3 	retq
Disassembly of section __TEXT,__stubs:
__stubs:
100000c94:	ff 25 7e 03 00 00 	jmpq	*894(%rip)
100000c9a:	ff 25 80 03 00 00 	jmpq	*896(%rip)
100000ca0:	ff 25 82 03 00 00 	jmpq	*898(%rip)
100000ca6:	ff 25 84 03 00 00 	jmpq	*900(%rip)
100000cac:	ff 25 86 03 00 00 	jmpq	*902(%rip)
100000cb2:	ff 25 88 03 00 00 	jmpq	*904(%rip)
100000cb8:	ff 25 8a 03 00 00 	jmpq	*906(%rip)
100000cbe:	ff 25 8c 03 00 00 	jmpq	*908(%rip)
100000cc4:	ff 25 8e 03 00 00 	jmpq	*910(%rip)
100000cca:	ff 25 90 03 00 00 	jmpq	*912(%rip)
100000cd0:	ff 25 92 03 00 00 	jmpq	*914(%rip)
100000cd6:	ff 25 94 03 00 00 	jmpq	*916(%rip)
100000cdc:	ff 25 96 03 00 00 	jmpq	*918(%rip)
100000ce2:	ff 25 98 03 00 00 	jmpq	*920(%rip)
100000ce8:	ff 25 9a 03 00 00 	jmpq	*922(%rip)
100000cee:	ff 25 9c 03 00 00 	jmpq	*924(%rip)
100000cf4:	ff 25 9e 03 00 00 	jmpq	*926(%rip)
Disassembly of section __TEXT,__stub_helper:
__stub_helper:
100000cfc:	4c 8d 1d 05 03 00 00 	leaq	773(%rip), %r11
100000d03:	41 53 	pushq	%r11
100000d05:	ff 25 f5 02 00 00 	jmpq	*757(%rip)
100000d0b:	90 	nop
100000d0c:	68 82 00 00 00 	pushq	$130
100000d11:	e9 e6 ff ff ff 	jmp	-26 <__stub_helper>
100000d16:	68 00 00 00 00 	pushq	$0
100000d1b:	e9 dc ff ff ff 	jmp	-36 <__stub_helper>
100000d20:	68 1c 00 00 00 	pushq	$28
100000d25:	e9 d2 ff ff ff 	jmp	-46 <__stub_helper>
100000d2a:	68 39 00 00 00 	pushq	$57
100000d2f:	e9 c8 ff ff ff 	jmp	-56 <__stub_helper>
100000d34:	68 57 00 00 00 	pushq	$87
100000d39:	e9 be ff ff ff 	jmp	-66 <__stub_helper>
100000d3e:	68 6c 00 00 00 	pushq	$108
100000d43:	e9 b4 ff ff ff 	jmp	-76 <__stub_helper>
100000d48:	68 ae 00 00 00 	pushq	$174
100000d4d:	e9 aa ff ff ff 	jmp	-86 <__stub_helper>
100000d52:	68 ba 00 00 00 	pushq	$186
100000d57:	e9 a0 ff ff ff 	jmp	-96 <__stub_helper>
100000d5c:	68 c8 00 00 00 	pushq	$200
100000d61:	e9 96 ff ff ff 	jmp	-106 <__stub_helper>
100000d66:	68 d5 00 00 00 	pushq	$213
100000d6b:	e9 8c ff ff ff 	jmp	-116 <__stub_helper>
100000d70:	68 e4 00 00 00 	pushq	$228
100000d75:	e9 82 ff ff ff 	jmp	-126 <__stub_helper>
100000d7a:	68 f2 00 00 00 	pushq	$242
100000d7f:	e9 78 ff ff ff 	jmp	-136 <__stub_helper>
100000d84:	68 02 01 00 00 	pushq	$258
100000d89:	e9 6e ff ff ff 	jmp	-146 <__stub_helper>
100000d8e:	68 11 01 00 00 	pushq	$273
100000d93:	e9 64 ff ff ff 	jmp	-156 <__stub_helper>
100000d98:	68 20 01 00 00 	pushq	$288
100000d9d:	e9 5a ff ff ff 	jmp	-166 <__stub_helper>
