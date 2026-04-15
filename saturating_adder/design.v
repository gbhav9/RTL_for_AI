// Code your design here
module saturating_adder#(parameter N=8
                        )
  (
    input signed [N-1:0] a,
    input signed [N-1:0] b,
    output reg signed [N-1:0] sum);
  wire signed [N:0] full_res;
  assign full_res = {a[N-1],a}+{b[N-1],b};
 
  localparam signed [N-1:0] MAX_POS ={1'b0, {(N-1){1'b1}}};
  localparam signed [N-1:0] MAX_NEG ={1'b1, {(N-1){1'b0}}};
 
  always @ (*) begin
    if (full_res > $signed({1'b0, MAX_POS})) begin
      sum = MAX_POS;
    end
    else if (full_res < $signed({1'b1, MAX_NEG})) begin
      sum = MAX_NEG;
    end
    else begin
      sum = full_res[N-1:0];
    end
  end
 
endmodule
