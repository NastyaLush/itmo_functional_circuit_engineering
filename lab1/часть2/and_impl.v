`timescale 1ns / 1ps


module and_impl(
input x0,
input x1,
input x2,
output res
    );
    wire not_x0, not_x1,not_x2, not_and_x0_x1, and_x0_x1, not_x0_x1_x2;
    nand(not_x0,x0,x0);
    nand(not_x1,x1,x1);
    nand(not_x2,x2,x2);
    
    nand(not_and_x0_x1,x0,x1);
    nand(and_x0_x1,not_and_x0_x1, not_and_x0_x1);
    nand(not_x0_x1_x2, and_x0_x1,x2);
    nand(res, not_x0_x1_x2, not_x0_x1_x2);
    
    
    
    
endmodule