
module saturating_multiplier #(parameter N=8)
  (
    input signed [N-1:0] a,
    input signed [N-1:0] b,
    output reg signed [N-1:0] product);
  
  wire signed [2*N-1:0] full_prod;
  
  assign full_prod = a * b;
 
  localparam signed [N-1:0] MAX_POS ={1'b0, {(N-1){1'b1}}};
  localparam signed [N-1:0] MAX_NEG ={1'b1, {(N-1){1'b0}}};
 
  always @ (*) begin
    if (full_prod > MAX_POS) begin
      product = MAX_POS;
    end
    else if (full_prod < MAX_NEG) begin
      product = MAX_NEG;
    end
    else begin
      product = full_prod[N-1:0];
    end
  end
 
endmodule  
