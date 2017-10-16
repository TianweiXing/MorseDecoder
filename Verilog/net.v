module net(in1, in2, in3, in4, out);
  input   [7:0] in1, in2, in3, in4;
  output  [4:0] out;

  wire [7:0] hid1, hid2, hid3, hid4;

  hidden hidden(in1, in2, in3, in4, hid1, hid2, hid3, hid4);
  outlayer outlayer(hid1, hid2, hid3, hid4, out);

endmodule
