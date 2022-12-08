# Specifications

**Table 1: `ImmSrc`**

| Code | Operation | Input | Output |
| :--- | :-------- | :---- | :----- |
| 0b00 | I-type Signed Extension | 12-bit Signed | 32-bit Signed |
| 0b01 | B-type Signed Extension | 12-bit Signed | 32-bit Signed |
| 0b10 | S-type Signed Extension | 12-bit Signed | 32-bit Signed |
| 0b10 | NULL | N/A | 32'd0 |

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
