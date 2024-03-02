`timescale 1ns / 1ps

module my_mul_tb;
    reg clk = 0;
    reg rst;
    reg [7:0] a;
    reg [15:0] b;
    reg start;

    wire busy;
    wire [23:0] y;
    reg [23:0] expected;
    
    my_mul mul1(
        .a_bi(a),
        .b_bi(b),
        .start_i(start),
        .clk_i(clk),
        .rst_i(rst),
        
        .busy_o(busy),
        .y_bo(y)
    );
    
    task test_mul;
        input [3:0] iter;
        input [7:0] test_a;
        input [7:0] test_b;
        begin
            a = test_a;
            b = test_b;
            rst=0;
            start = 1;
            expected = a*b;
            #10
            start = 0;
            while (busy) begin
                #5;
            end
            if(y == expected) $display("Test %d: Correct", iter);
            else $display("Test %d: Failed Actual:%d Expected:%d", iter,expected, y);
        end
    endtask
    
    initial begin
    test_mul(1,8'hA,16'hBB);
    test_mul(2,8'hFF,16'hFFFF);
    test_mul(3,8'h0,16'h0);
    test_mul(4,8'h1,16'h0);
    test_mul(5,8'h1,16'h1);
    end
    
    
    always 
        #5  clk =  ! clk;   
endmodule
