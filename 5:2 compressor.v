module comp_5to2 (
    input  wire X0, X1, X2, X3, X4, Cin1, Cin2,
    output wire Sum, Cout1, Cout2
);

    wire s1, c1;
    wire s2, c2;
    wire s3, c3;

    assign s1 = X0 ^ X1 ^ X2 ^ Cin1;
    assign c1 = (X0 & X1) | (X1 & X2) | (X0 & X2) | (Cin1 & (X0 ^ X1 ^ X2));

    assign s2 = X3 ^ X4 ^ Cin2;
    assign c2 = (X3 & X4) | (X4 & Cin2) | (X3 & Cin2);

    assign s3 = s1 ^ s2;
    assign c3 = (s1 & s2);

    assign Sum   = s3;
    assign Cout1 = c1 | c2; // horizontal carry
    assign Cout2 = c3;      // vertical carry

endmodule
