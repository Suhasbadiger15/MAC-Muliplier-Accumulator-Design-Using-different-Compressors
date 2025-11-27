module MAC_UNIT (
    input clk,
    input rst,
    input signed [15:0] a,
    input signed [15:0] b,
    output reg signed [31:0] z,
    output reg signed [31:0] product_out
);

    reg [1:0] temp;
    integer i;
    reg E1;
    reg signed [31:0] Y1;
    reg signed [31:0] Z_internal;
    reg signed [31:0] Z_internal_reg;

    // Instantiate compressor module
    wire sum_out, carry_out, cout_out;
    reg X0, X1, X2, X3, Cin;
    wire Sum, Carry, Cout;

    comp1 comp_inst(
        .A(X0), 
        .B(X1), 
        .C(X2), 
        .D(X3), 
        .Cin(Cin), 
        .Sum(Sum), 
        .Cout(Cout), 
        .Carry(Carry)
    );

    function [31:0] compressor_adder;
        input [31:0] A, B;
        reg [31:0] S;
        reg carry;
        integer j;
        begin
            carry = 1'b0;
            for (j = 0; j < 32; j = j + 1) begin
                X0 = A[j];
                X1 = B[j];
                X2 = 1'b0;
                X3 = 1'b0;
                Cin = carry;
                #1; // small delay for accurate simulation
                S[j] = Sum;
                carry = Carry | Cout;
            end
            compressor_adder = S;
        end
    endfunction

    always @(*) begin
        Z_internal = 32'sd0;
        E1 = 1'b0;
        for (i = 0; i < 16; i = i + 1) begin
            temp = {a[i], E1};
            Y1 = -b;
            case (temp)
                2'b10: Z_internal[31:16] = compressor_adder(Z_internal[31:16], Y1);
                2'b01: Z_internal[31:16] = compressor_adder(Z_internal[31:16], b);
                default: ;
            endcase
            Z_internal = Z_internal >>> 1;
            E1 = a[i];
        end
        if (b == 16'sd128) begin
            Z_internal = -Z_internal;
        end
    end

    // Registering the output for pipelining
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            Z_internal_reg <= 32'sd0;
        end else begin
            Z_internal_reg <= Z_internal;
        end
    end

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            z <= 32'sd0;
            product_out <= 32'sd0;
        end else begin
            product_out <= Z_internal_reg;
            z <= z + Z_internal_reg;
        end
    end

endmodule
