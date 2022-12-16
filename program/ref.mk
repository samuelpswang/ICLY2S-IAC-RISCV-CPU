# Make file to assembly RISC-V assembly language program(s) in myprog folder
#   ... relocate instruction to start at 0xBFC00000
#   ... output hex file ready to be read into instruction memory




clean:
	@rm -f program/ref/*.hex program/ref/*.asm program/ref/*.bin

reference: program/ref/pdf.s
	@riscv64-unknown-elf-as -R -march=rv32im -mabi=ilp32 -o program/ref/pdf.out program/ref/pdf.s
	@riscv64-unknown-elf-ld -melf32lriscv -e 0xBFC00000 -Ttext 0xBFC00000 -o program/ref/pdf.out.reloc program/ref/pdf.out
	@riscv64-unknown-elf-objcopy -O binary -j .text program/ref/pdf.out.reloc program/ref/pdf.bin
	@riscv64-unknown-elf-objdump -D -S -l -F -Mno-aliases program/ref/pdf.out.reloc > program/ref/pdf.asm
	@od -v -An -t x1 program/ref/pdf.bin | tr -s '\n' | awk '{pdf=pdf};1' > program/ref/pdf.hex
	@rm program/ref/pdf.out
	@rm program/ref/pdf.out.reloc
	@program/format_hex.sh program/ref/pdf
	@rm program/ref/pdf.bin
