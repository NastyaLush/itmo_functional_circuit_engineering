`timescale 1ns / 1ps

module prog_tb;
  reg x_0, x_1, x_2;
  wire [7:0] ress;
  prog prog_l (
    .x_0(x_0),
    .x_1(x_1),
    .x_2(x_2),
    .res(ress)
  );
  integer i;
  reg [2:0] test_val;
  reg [7:0] expected_res;

  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      test_val = i;
      {x_0, x_1, x_2} = test_val;
      expected_res = $pow(2,i);
      #10
    
      if (expected_res==ress) begin
        $display("Correct!!! x_0=%b x_1=%b x_2=%b res=%b", x_0, x_1, x_2, $unsigned(ress));
      end else begin
        $display("Wrong!!! x_0=%b x_1=%b x_2=%b res=%b, expected=%b", x_0, x_1, x_2, ress, expected_res);
     end

    end
       
       #10 $stop;
  
  end

endmodule