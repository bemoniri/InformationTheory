clc
clear
close all
P = 15;
N = 1;
X = sqrt(P)*randn(1024, 1);
Y = X + sqrt(N) *randn(1024, 1);

%% Theory
I = 0.5 * log2( 1 + P/N)

%% my implementation of KDR:
IM_95109564(X, Y)

%% The widely used implementation of the adaptive algorithm
log2(exp(1))*muting([X, Y])
