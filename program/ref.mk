# Make file to assembly RISC-V assembly language program(s) in myprog folder
#   ... relocate instruction to start at 0xBFC00000
#   ... output hex file ready to be read into instruction memory




clean:
	@rm -f program/ref/pdf.hex program/ref/pdf.asm ref/*.out program/ref/pdf.bin

reference: program/ref/pdf.s
	@riscv64-unknown-elf-as -R -march=rv32im -mabi=ilp32 -o program/ref/pdf.s.out program/ref/pdf.s
	@riscv64-unknown-elf-ld -melf32lriscv -e 0xBFC00000 -Ttext 0xBFC00000 -o program/ref/pdf.s.out.reloc program/ref/pdf.s.out
	@riscv64-unknown-elf-objcopy -O binary -j .text program/ref/pdf.s.out.reloc program/ref/pdf.s.bin
	@riscv64-unknown-elf-objdump -D -S -l -F -Mno-aliases program/ref/pdf.s.out.reloc > program/ref/pdf.asm
	@od -v -An -t x1 program/ref/pdf.s.bin | tr -s '\n' | awk '{pdf=pdf};1' > program/ref/pdf.hex
	@rm program/ref/pdf.s.out
	@rm program/ref/pdf.s.out.reloc
	@program/format_hex.sh program/ref/pdf.s
	@rm program/ref/pdf.s.bin
