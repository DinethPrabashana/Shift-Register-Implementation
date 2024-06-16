module tb_left_shift_reg;

parameter reg_size = 4 ;
reg SHIFT_LEFT, DATA_IN, CLOCK ;
wire [reg_size - 1 : 0] Q ;

Left_shift_reg #(reg_size) lsr (Q, DATA_IN, SHIFT_LEFT, CLOCK);

always 
begin 
    #5 CLOCK = ~CLOCK ;
end

initial 
begin 
    CLOCK = 0 ;
    SHIFT_LEFT = 0 ;
    DATA_IN = 0 ;
    #10 SHIFT_LEFT = 1 ;

// writing 1101 to the reg with left shifting
    #43 DATA_IN = 1 ;
    #10 DATA_IN = 1 ;
    #10 DATA_IN = 0 ;
    #10 DATA_IN = 1 ;
    #3 SHIFT_LEFT = 0 ; // stop shifting the data after the required data is stored

// writing 1000 to the reg with left shifting
    #46 DATA_IN = 1 ; SHIFT_LEFT = 1 ;
    #10 DATA_IN = 0 ;
    #10 DATA_IN = 0 ;
    #10 DATA_IN = 0 ;
    #3 SHIFT_LEFT = 0 ;

//checking wether the data is written when the SHL is low (if yes there is an error)
    #10 DATA_IN = 1 ;
    #10 DATA_IN = 0 ;
end

initial 
begin
    $monitor( $time, "  CLOCK = %b, SHIFT_LEFT = %b, DATA_IN = %b, Q = %b",CLOCK, SHIFT_LEFT, DATA_IN, Q);
end

endmodule