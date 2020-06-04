	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.intel_syntax noprefix
	.globl	_sum                    ## -- Begin function sum
	.p2align	4, 0x90
_sum:                                   ## @sum
## %bb.0:
	push	rbp
	mov	rbp, rsp
	test	esi, esi
	jle	LBB0_1
## %bb.2:
	mov	r8d, esi
	cmp	esi, 7
	ja	LBB0_4
## %bb.3:
	xorps	xmm1, xmm1
	xor	ecx, ecx
	jmp	LBB0_12
LBB0_1:
	xorps	xmm1, xmm1
	jmp	LBB0_13
LBB0_4:
	mov	ecx, r8d
	and	ecx, -8
	lea	rsi, [rcx - 8]
	mov	rax, rsi
	shr	rax, 3
	inc	rax
	mov	r9d, eax
	and	r9d, 3
	cmp	rsi, 24
	jae	LBB0_6
## %bb.5:
	xorps	xmm0, xmm0
	xor	eax, eax
	xorps	xmm1, xmm1
	test	r9, r9
	jne	LBB0_9
	jmp	LBB0_11
LBB0_6:
	mov	esi, 1
	sub	rsi, rax
	lea	rsi, [r9 + rsi - 1]
	xorps	xmm0, xmm0
	xor	eax, eax
	xorps	xmm1, xmm1
	.p2align	4, 0x90
LBB0_7:                                 ## =>This Inner Loop Header: Depth=1
	movups	xmm2, xmmword ptr [rdi + 4*rax]
	addps	xmm2, xmm0
	movups	xmm0, xmmword ptr [rdi + 4*rax + 16]
	addps	xmm0, xmm1
	movups	xmm1, xmmword ptr [rdi + 4*rax + 32]
	movups	xmm3, xmmword ptr [rdi + 4*rax + 48]
	movups	xmm4, xmmword ptr [rdi + 4*rax + 64]
	addps	xmm4, xmm1
	addps	xmm4, xmm2
	movups	xmm2, xmmword ptr [rdi + 4*rax + 80]
	addps	xmm2, xmm3
	addps	xmm2, xmm0
	movups	xmm0, xmmword ptr [rdi + 4*rax + 96]
	addps	xmm0, xmm4
	movups	xmm1, xmmword ptr [rdi + 4*rax + 112]
	addps	xmm1, xmm2
	add	rax, 32
	add	rsi, 4
	jne	LBB0_7
## %bb.8:
	test	r9, r9
	je	LBB0_11
LBB0_9:
	lea	rax, [rdi + 4*rax + 16]
	neg	r9
	.p2align	4, 0x90
LBB0_10:                                ## =>This Inner Loop Header: Depth=1
	movups	xmm2, xmmword ptr [rax - 16]
	addps	xmm0, xmm2
	movups	xmm2, xmmword ptr [rax]
	addps	xmm1, xmm2
	add	rax, 32
	inc	r9
	jne	LBB0_10
LBB0_11:
	addps	xmm0, xmm1
	movaps	xmm1, xmm0
	movhlps	xmm1, xmm0              ## xmm1 = xmm0[1],xmm1[1]
	addps	xmm1, xmm0
	haddps	xmm1, xmm1
	cmp	rcx, r8
	je	LBB0_13
	.p2align	4, 0x90
LBB0_12:                                ## =>This Inner Loop Header: Depth=1
	addss	xmm1, dword ptr [rdi + 4*rcx]
	inc	rcx
	cmp	r8, rcx
	jne	LBB0_12
LBB0_13:
	movss	dword ptr [rdx], xmm1
	pop	rbp
	ret
                                        ## -- End function

.subsections_via_symbols
