module voting_machine(
  output reg [7:0]count1,count2,count3,
  input btn1,btn2,btn3,
  input clk,rst
);
  reg prev_btn1, prev_btn2, prev_btn3;
always @(posedge clk or posedge rst)
begin
if (rst) begin
  count1 <= 8'b0;
  count2 <= 8'b0;
  count3 <= 8'b0;
  prev_btn1 <= 0;
  prev_btn2 <= 0;
  prev_btn3 <= 0;
  end
else begin
  if ((btn1 & ~prev_btn1) & ~(btn2 & ~prev_btn2) & ~(btn3 & ~prev_btn3))
      count1 <= count1 + 1;
  else if ((btn2 & ~prev_btn2) & ~(btn1 & ~prev_btn1) & ~(btn3 & ~prev_btn3))
      count2 <= count2 + 1;
  else if ((btn3 & ~prev_btn3) & ~(btn1 & ~prev_btn1) & ~(btn2 & ~prev_btn2))
      count3 <= count3 + 1;

  // Update previous button state
  prev_btn1 <= btn1;
  prev_btn2 <= btn2;
  prev_btn3 <= btn3;
  end
end
endmodule


  
  
