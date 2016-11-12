close all;

n = 1:0.001:100;

x1 = 7 * cos( 0.3 * pi * n + 0.3);
x2 = sin( 0.7 * pi * n - pi / 6);

sumx1x2 = x1 + x2;

figure();
plot( n, x1);
xlabel('n');
ylabel('x1(n)');
figure();
plot( n, x2);
xlabel('n');
ylabel('x2(n)');
figure();
plot( n, sumx1x2);
xlabel('n');
ylabel('x1(n) + x2(n)');
