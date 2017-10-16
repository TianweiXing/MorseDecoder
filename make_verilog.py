import numpy as np
from numpy import array, int16, int8

x = array([[0, 0, 3, 9],
       [9, 3, 3, 3],
       [9, 3, 9, 3],
       [0, 9, 3, 3],
       [0, 0, 0, 3],
       [3, 3, 9, 3],
       [0, 9, 9, 3],
       [3, 3, 3, 3],
       [0, 0, 3, 3],
       [3, 9, 9, 9],
       [0, 9, 3, 9],
       [3, 9, 3, 3],
       [0, 0, 9, 9],
       [0, 0, 9, 3],
       [0, 9, 9, 9],
       [3, 9, 9, 3],
       [9, 9, 3, 9],
       [0, 3, 9, 3],
       [0, 3, 3, 3],
       [0, 0, 0, 9],
       [0, 3, 3, 9],
       [3, 3, 3, 9],
       [0, 3, 9, 9],
       [9, 3, 3, 9],
       [9, 3, 9, 9],
       [9, 9, 3, 3]], dtype=int8)

w1 =  array([[ 19,  -6,  10,  10],
       [  9,   1, -20, -11],
       [ -2,  -3,   9,  30],
       [  5,  -4,  16,  15]], dtype=int16)
b1 =  array([ -8,   1,   8, -35], dtype=int16)
w2 =  array([[-16,  11,   0,  16, -15,  -8,  -9,   5, -32,   5,   6,  13, -19,
        -25,  -7,   3,  11, -14,  -2,  -6, -10,   1, -12,   7,  -3,  10],
       [  1,   3,  -1,   0,  -3,   5,   1,   2,  -3,  -2,   0,   4,   2,
          2,  -3,  -1,  -3,   1,   0,   3,   3,  -6,   7,   4,  -5,   3],
       [ 19,  12,  -5, -10,  27,  -7, -32,   0,  16, -16, -24,   0,  10,
          0, -21, -25,  -2, -16, -11,  23,  10,  13,   2,  21,   5, -15],
       [ -3, -13,   7, -36, -17,  12,  17,   0,   0,   9,   7, -11,   4,
         10,  16,  12,  -3,  16,  10,  -9,   2,  -5,   8, -15,   3,   2]], dtype=int16)
b2 =  array([-20,   6, -23,  18,  23, -26,  14,  28,  28, -26,  33,   8, -20,
         9, -18, -17, -24, -10,  40, -14,  20,   1, -14, -26, -19, -21], dtype=int16)

print "module rom();"
print "  reg [31:0] inputs[0:25];"
print "  reg [34:0] weights[0:30];"
print "  initial begin"

### ROM for inputs

for i in range(len(x[:,0])):
    print "    inputs[%d] = " % i,
    print "32'b_" + "_".join((format(x & 0xff, '08b') for x in x[i,:])) + ";"
print

### ROM for weights

n = 0
for i,b in enumerate(b1):
    print "    weights[%d] = " % n, ; n+=1
    vals = list(w1[:,i])
    vals.append(b)
    print "35'b_" + "_".join((format(w & 0x7f, '07b') for w in vals)) + ";"
print
for i,b in enumerate(b2):
    print "    weights[%d] = " % n, ; n+=1
    vals = list(w2[:,i])
    vals.append(b)
    print "35'b_" + "_".join((format(w & 0x7f, '07b') for w in vals)) + ";"
print "  end"

print "endmodule"
