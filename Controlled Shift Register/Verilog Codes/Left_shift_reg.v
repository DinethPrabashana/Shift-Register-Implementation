module Left_shift_reg #(parameter reg_size = 4)(q, d, shl, clk);

//port declaration
input shl, d, clk ;
output [reg_size - 1 : 0] q ;
integer j;

// internal connection input to D flip_flop
reg [reg_size - 1 : 0] d_f ;

// module instantiations
DF df_0(q[0], d_f[0], clk);
genvar i ;
generate 
    for (i = 1 ; i < reg_size ; i = i + 1 )
    begin : gen_dff
        DF df_u(q[i], d_f[i], clk);
    end
endgenerate 

// control logic assignments
always @(*) 
begin
    d_f[0] = (d & shl) | (q[0] & (~shl));
    for (j = 1; j < reg_size; j = j + 1) 
	 begin
        d_f[j] = (q[j-1] & shl) | (q[j] & (~shl));
    end
end

endmodule
