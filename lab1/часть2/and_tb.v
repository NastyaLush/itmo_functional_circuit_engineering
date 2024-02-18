`timescale 1ns / 1ps
module and_tb;
reg x_0,x_1,x_2;
wire ress;
and_impl andd(
    .x0(x_0),
    .x1(x_1),
    .x2(x_2),
    .res(ress)
);
integer i;
reg [2:0] test_val;
reg expected_res;
initial begin
    for(i=0;i<8;i=i+1) begin
        test_val=i;
        x_0=test_val[0];
        x_1=test_val[1];
        x_2=test_val[2];
        expected_res=&test_val;
        
        #10
       
          if (ress==expected_res) begin
           $display ("and:Correct!!! x_0=%b x_1=%b x_2=%b res=%b", x_0,x_1,x_2,ress);
          end else begin
           $display ("and:Wrong!!! x_0=%b x_1=%b x_2=%b res=%b, expected=&b", x_0,x_1,x_2,ress, expected_res);
          end

     end
         #10 $stop;
end
        
endmodule