clear all
close all
M = 2 * 256;
K = 1;
f = 1 : M;
s = K * 1 ./ f ;
figure(1); plot(s); grid;
LOGs = log10(s);
LOGf = log10(f);
figure(4); plot(LOGf, LOGs); grid;
hh = sqrt(m * s);
m = 2 * M - 1;
h2(1 : M) = hh(1 : M);
h2(M : m) = hh(M :  - 1 : 1);
figure(2); plot(h); grid;
pp = rand(1, m);
re = h2 .* cos(pp) ;
im = h2 .* sin(pp) ;
hh = re + i * im ;