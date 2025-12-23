`timescale 1ns/1ns

module voting_machine_tb;
  wire [7:0]count1,count2,count3;
  reg btn1,btn2,btn3;
  reg clk,rst;

  voting_machine uut (
    .count1(count1),
    .count2(count2),
    .count3(count3),
    .btn1(btn1),
    .btn2(btn2),
    .btn3(btn3),
    .clk(clk),
    .rst(rst)
  );
  initial clk=0;
  always #5 clk=~clk;
  initial begin 
  $dumpfile("voting_machine.vcd");
  $dumpvars(0,voting_machine_tb);

  $monitor("time=%d \t rst=%b \t clk=%b \t btn1=%b \t btn2=%b \t btn3=%b \t count1=%b \t count2=%b \t count3=%b \t", $time,rst,clk,btn1, btn2, btn3, count1, count2, count3);

  // iniiallize
btn1=0; btn2=0; btn3=0;
rst=1;

#10 rst =0;

#10 btn1=1;
#10 btn1=0;

#10 btn2=1;
#10 btn2=0;

#10 btn3=1;
#10 btn3=0;

#5 btn1 = 1; btn3 = 1;
#10 btn1 = 0; btn3 = 0;

#20 ;
$finish;
end 
endmodule


