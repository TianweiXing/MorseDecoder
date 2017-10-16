module neuron (weight, in1u, in2u, in3u, in4u, out);
  input   unsigned [7:0] in1u, in2u, in3u, in4u;
  output  unsigned [7:0] out;

  input  [34:0] weight;
  wire   signed  [8:0] in1, in2, in3, in4;
  wire   signed  [6:0] w1, w2, w3, w4, b;
  wire   signed [18:0] p1, p2, p3, p4;
  wire   signed [18:0] pre;
  wire   neg, pos;
  wire   unsigned [7:0] abs;

  assign in1 = {1'b0, in1u};
  assign in2 = {1'b0, in2u};
  assign in3 = {1'b0, in3u};
  assign in4 = {1'b0, in4u};

  assign w1 = weight[34:28];
  assign w2 = weight[27:21];
  assign w3 = weight[20:14];
  assign w4 = weight[13:7];
  assign b  = weight[6:0];

  assign p1 = w1 * in1;
  assign p2 = w2 * in2;
  assign p3 = w3 * in3;
  assign p4 = w4 * in4;
  assign pre = p1 + p2 + p3 + p4 + b;

  assign neg = pre[18];
  assign pos = |pre[17:10];

  assign abs = pos ? 8'hff : pre[9:2];
  assign out = neg ? 0 : abs;

endmodule
