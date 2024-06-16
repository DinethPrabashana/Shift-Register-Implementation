module DF(Q, D, CLK);

//port declaration
input D, CLK ;
output reg Q ;

//behavioral block
always @(posedge CLK)
begin 
    Q <= D ;
end

endmodule