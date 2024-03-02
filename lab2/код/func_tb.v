`timescale 1ns / 1ps

module func_tb;

    reg clk = 0;
    reg rst = 0;
    reg [7:0] a;
    reg [7:0] b;
    reg start = 0;

    wire [23:0] y;
    reg [23:0] expected;
    wire busy;

    func my_func1(
        .clk_i(clk),
        .rst_i(rst),
        .a_i(a),
        .b_i(b),
        .start_i(start),

        .y_o(y),
        .busy(busy)
    );

    task test_func;
        input [3:0] iter;
        input [7:0] test_a;
        input [7:0] test_b;
//        input [23:0] test_res;
        begin
            a = test_a;
            b = test_b;
            start = 1;
            #10
            start = 0;
            expected = a*b+a*a*a;
            while (busy) begin
                #5;
            end
            if(y == expected) $display("Test %d: Correct", iter);
            else $display("Test %d: Failed Actual:%d Expected:%d", iter,expected, y);
        end
    endtask

    initial begin
        test_func(1, 0, 0);
        test_func(2, 1, 0);
        test_func(3, 1, 1);
        test_func(4, 2, 2);
        test_func(5, 15, 240);
        test_func(6, 240, 15);
        test_func(7, 170, 85);
        test_func(8, 85, 170);
        test_func(9, 100, 125);
        test_func(10, 255, 255);

        
    end   
    
    always begin
        #1  clk =  ! clk;
    end    

endmodule