# Specifications

**Table 1: `ImmSrc`**

| Code | Operation | Input | Output |
| :--- | :-------- | :---- | :----- |
| 0b000 | Sign Extend I-type | 12-bit Signed | 32-bit Signed |
| 0b001 | Sign Extend B-type | 12-bit Signed | 32-bit Signed |
| 0b010 | Sign Extend S-type | 12-bit Signed | 32-bit Signed |
| 0b010 | Sign Extend J-type | 12-bit Signed | 32-bit Signed |
| 0b100 | Extend Lower 0s U-type | 12-bit Unsigned | 32-bit Unsigned |
| Else | NULL | N/A | 32'd0 |

**Table 2: `ALUControl`**

| Code | Operation | Used |
| :--- | :-------- | :--- |
| 0b0000 | Add | Y |
| 0b0001 | Subtract | Y |
| 0b0010 | Bitwise And | N |
| 0b0011 | Bitwise Or | N |
| 0b0100 | Bitwise Xor | Y |
| 0b0101 | Set Less Than | N |
| 0b0110 | Shift Left Logical | Y |
| 0b0111 | Shift Right Logical | N |
| 0b1000 | Shift Right Arithmetic | N |
| 0b1111 | NULL | Y |
