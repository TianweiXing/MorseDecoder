module comparator(in1, in1l, in2, in2l, out, outl);

  input   [7:0] in1, in2;
  input   [4:0] in1l, in2l;
  output  [7:0] out;
  output  [4:0] outl;

  wire cmp;

  assign cmp = in1 > in2;
  assign out = cmp ? in1 : in2;
  assign outl = cmp ? in1l : in2l;

endmodule
