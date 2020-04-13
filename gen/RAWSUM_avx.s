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
	mov	r9d, esi
	cmp	esi, 31
	ja	LBB0_4
## %bb.3:
	vxorps	xmm0, xmm0, xmm0
	xor	ecx, ecx
	jmp	LBB0_11
LBB0_1:
	vxorps	xmm0, xmm0, xmm0
	jmp	LBB0_12
LBB0_4:
	mov	ecx, r9d
	and	ecx, -32
	lea	rsi, [rcx - 32]
	mov	rax, rsi
	shr	rax, 5
	inc	rax
	mov	r8d, eax
	and	r8d, 1
	test	rsi, rsi
	je	LBB0_5
## %bb.6:
	mov	esi, 1
	sub	rsi, rax
	lea	rax, [r8 + rsi - 1]
	vxorps	xmm0, xmm0, xmm0
	xor	esi, esi
	vxorps	xmm1, xmm1, xmm1
	vxorps	xmm2, xmm2, xmm2
	vxorps	xmm3, xmm3, xmm3
	.p2align	4, 0x90
LBB0_7:                                 ## =>This Inner Loop Header: Depth=1
	vaddps	ymm0, ymm0, ymmword ptr [rdi + 4*rsi]
	vaddps	ymm1, ymm1, ymmword ptr [rdi + 4*rsi + 32]
	vaddps	ymm2, ymm2, ymmword ptr [rdi + 4*rsi + 64]
	vaddps	ymm3, ymm3, ymmword ptr [rdi + 4*rsi + 96]
	vaddps	ymm0, ymm0, ymmword ptr [rdi + 4*rsi + 128]
	vaddps	ymm1, ymm1, ymmword ptr [rdi + 4*rsi + 160]
	vaddps	ymm2, ymm2, ymmword ptr [rdi + 4*rsi + 192]
	vaddps	ymm3, ymm3, ymmword ptr [rdi + 4*rsi + 224]
	add	rsi, 64
	add	rax, 2
	jne	LBB0_7
## %bb.8:
	test	r8, r8
	je	LBB0_10
LBB0_9:
	vaddps	ymm3, ymm3, ymmword ptr [rdi + 4*rsi + 96]
	vaddps	ymm2, ymm2, ymmword ptr [rdi + 4*rsi + 64]
	vaddps	ymm1, ymm1, ymmword ptr [rdi + 4*rsi + 32]
	vaddps	ymm0, ymm0, ymmword ptr [rdi + 4*rsi]
LBB0_10:
	vaddps	ymm1, ymm1, ymm3
	vaddps	ymm0, ymm0, ymm2
	vaddps	ymm0, ymm0, ymm1
	vextractf128	xmm1, ymm0, 1
	vaddps	ymm0, ymm0, ymm1
	vpermilpd	xmm1, xmm0, 1   ## xmm1 = xmm0[1,0]
	vaddps	ymm0, ymm0, ymm1
	vhaddps	ymm0, ymm0, ymm0
	cmp	rcx, r9
	je	LBB0_12
	.p2align	4, 0x90
LBB0_11:                                ## =>This Inner Loop Header: Depth=1
	vaddss	xmm0, xmm0, dword ptr [rdi + 4*rcx]
	inc	rcx
	cmp	r9, rcx
	jne	LBB0_11
LBB0_12:
	vmovss	dword ptr [rdx], xmm0
	pop	rbp
	vzeroupper
	ret
LBB0_5:
	vxorps	xmm0, xmm0, xmm0
	xor	esi, esi
	vxorps	xmm1, xmm1, xmm1
	vxorps	xmm2, xmm2, xmm2
	vxorps	xmm3, xmm3, xmm3
	test	r8, r8
	jne	LBB0_9
	jmp	LBB0_10
                                        ## -- End function

.subsections_via_symbols
