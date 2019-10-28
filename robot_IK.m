clc; clear all;
H1 = [1 0 0 1592;
      0 1 0 0;
      0 0 1 2185;
      0 0 0 1];
inverse_k(H1)
H2 = [0 -1 0 0;
      1 0  0 1520;
      0 0  1 2185;
      0 0  0 1];
inverse_k(H2)