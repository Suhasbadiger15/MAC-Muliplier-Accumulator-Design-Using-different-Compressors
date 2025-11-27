module compressor_4_2 (
    input  wire X0, X1, X2, X3, Cin,
    output wire Sum, Carry, Cout
);

    function [1:0] full_adder;
        input a, b, c;
        begin
            full_adder[0] = a ^ b ^ c;
            full_adder[1] = (a & b) | (b & c) | (a & c);
        end
    endfunction

    wire sum1, carry1;
    wire sum2, carry2;

    assign {carry1, sum1} = full_adder(X0, X1, X2);
    assign {carry2, sum2} = full_adder(sum1, X3, Cin);

    assign Sum   = sum2;
    assign Carry = carry1;
    assign Cout  = carry2;

endmodule
