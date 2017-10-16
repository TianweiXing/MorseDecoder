module hidden(in1, in2, in3, in4, out1, out2, out3, out4);

  input   [7:0] in1, in2, in3, in4;
  output  [7:0] out1, out2, out3, out4;

  neuron h1(rom.weights[0], in1, in2, in3, in4, out1);
  neuron h2(rom.weights[1], in1, in2, in3, in4, out2);
  neuron h3(rom.weights[2], in1, in2, in3, in4, out3);
  neuron h4(rom.weights[3], in1, in2, in3, in4, out4);

endmodule
