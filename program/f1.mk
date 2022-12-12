# Make file to assembly RISC-V assembly language program(s) in program/f1 folder
#   ... relocate instruction to start at 0xBFC00000
#   ... output hex file ready to be read into instruction memory
S_FILES = $(shell find program/f1/ -type f -name '*.s')
S_HEX_FILES = $(patsubst program/f1/%.s, program/f1/%.hex, $(S_FILES))

clean:
	@rm -f program/f1/*.hex

hexfile: $(S_HEX_FILES)
	@echo "** Making .hex file for instruction memory"

program/f1/%.hex: program/f1/%.s
	@riscv64-unknown-elf-as -R -march=rv32im -mabi=ilp32 -o "$?.out" "$?"
	@riscv64-unknown-elf-ld -melf32lriscv -e 0xBFC00000 -Ttext 0xBFC00000 -o "$?.out.reloc" "$?.out"
	@rm "$?.out"
	@riscv64-unknown-elf-objcopy -O binary -j .text "$?.out.reloc" "$?.bin"
	@rm "$?.out.reloc"
	@program/format_hex.sh "$?"
	@rm "$?.bin"
