module comp2 (
    input  wire A, B, C, D, Cin,
    output wire Sum, Cout, Carry
);

    wire x1, x2, x3, x4, x5, x6;

    assign x1 = A ^ B;
    assign x2 = C ^ D;
    assign x3 = A & B;
    assign x4 = C & D;
    assign x5 = x1 & x2;

    assign Sum   = x1 ^ x2 ^ Cin;
    assign Carry = x3 | x4 | x5;

    assign x6 = x1 ^ x2;
    assign Cout  = (x6 & Cin) | (x1 & x2);

endmodule
