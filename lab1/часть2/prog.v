`timescale 1ns / 1ps

module prog(
    input x_0,
    input x_1,
    input x_2,
    output[7:0] res
    );
    wire not_x0, not_x1, not_x2;
    nand(not_x0, x_0,x_0);
    nand(not_x1, x_1,x_1);
    nand(not_x2, x_2,x_2);
    
    and_impl q0(.x0(x_0), .x1(x_1), .x2(x_2), .res(res[7]));
    and_impl q1(.x0(x_0), .x1(x_1), .x2(not_x2), .res(res[6]));
    and_impl q2(.x0(x_0), .x1(not_x1), .x2(x_2), .res(res[5]));
    and_impl q3(.x0(x_0), .x1(not_x1), .x2(not_x2), .res(res[4]));
    and_impl q4(.x0(not_x0), .x1(x_1), .x2(x_2), .res(res[3]));
    and_impl q5(.x0(not_x0), .x1(x_1), .x2(not_x2), .res(res[2]));
    and_impl q6(.x0(not_x0), .x1(not_x1), .x2(x_2), .res(res[1]));
    and_impl q7(.x0(not_x0), .x1(not_x1), .x2(not_x2), .res(res[0]));
endmodule