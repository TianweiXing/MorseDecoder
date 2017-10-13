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

print "w1", (np.min(w1), np.max(w1))
print "b1", (np.min(b1), np.max(b1))
print "w2", (np.min(w2), np.max(w2))
print "b2", (np.min(b2), np.max(b2))

def run(x, w1, b1, w2, b2):
    h = x.dot(w1) + b1
    h = np.maximum(h, 0)  # using ReLU as activate function
    h = np.right_shift(h, 2)
    y = h.dot(w2) + b2
    y = np.maximum(y, 0)  # using ReLU as activate function
    y = np.right_shift(y, 3)

    print "[ max_h =", np.max(h), 
    print "max_y =", np.max(y), "]"

    return np.argmax(y, axis=1)


def errors(dit, dah):
    test = np.copy(x)
    test[test==3] = dit
    test[test==9] = dah
    letters = run(test, w1, b1, w2, b2)
    return sum(letters != range(26))

print "errors (3,7) = ", errors(3,7)
print "errors (3,8) = ", errors(3,8)
print "errors (3,9) = ", errors(3,9)
print "errors (3,10) = ", errors(3,10)
print "errors (3,11) = ", errors(3,11)

print 

print "errors (4,11) = ", errors(4,11)
print "errors (4,12) = ", errors(4,12)
print "errors (4,13) = ", errors(4,13)
print "errors (4,14) = ", errors(4,14)
print "errors (4,15) = ", errors(4,15)
