
module CLA4Bit(A, B, carryIn, carryOut, PG, GG, Sum);
    input[3:0] A, B;
    input carryIn;
    output carryOut;

    output PG;
    output GG;

    output[3:0] Sum;

    wire[3:0] G, P, C;

    assign G = A & B;
    assign P = A ^ B;
    assign Sum = P ^ C;

    assign C[0] = carryIn;

    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);

    assign PG = P[3] & P[2] & P[1] & P[0];
    assign GG = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
endmodule