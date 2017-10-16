`timescale 1ns / 1ps

module main;
  reg   [7:0] in1, in2, in3, in4;
  wire  [4:0] out;

  integer i;

  net net(in1, in2, in3, in4, out);

  initial begin
      $display("Hello, World");

      #1
      for (i = 0; i < 26; i = i+1) begin
          in1 = rom.inputs[i][31:24];
          in2 = rom.inputs[i][23:16];
          in3 = rom.inputs[i][15:8];
          in4 = rom.inputs[i][7:0];
          #1
          $display ("Morse code %d%d%d%d = %d", in1, in2, in3, in4, out);
      end

      $finish ;
  end
endmodule
