module adder_8bit(A, B, carryIn, carryOut, Sum);

    // 8-bit wire for the inputs A and B
    input[7:0] A, B;

    // Wire for the ORIGINAL carry-in
    input carryIn;

    // Wire for the carryOut
    output carryOut;

    // Wire that carries the Sum of this CLA
    output[7:0] Sum;

    // Wires for the propagate of the first 4-bit block (p3)
    // and the second (p7)
    wire p3, p7;

    // Wires for the generate of the first 4-bit block (g3)
    // and the second (g7)
    wire g3, g7;

    // Wires for the carry of the first block (c3) and the
    // second (c7)
    wire c3, c7;

    // The two 4-bit CLA blocks that make up the 8-bit CLA

    CLA4Bit block1(A[3:0], B[3:0], carryIn, c3, p3, g3, Sum[3:0]);

    CLA4Bit block2(A[7:4], B[7:4], c3, c7, p7, g7, Sum[7:4]);
endmodule