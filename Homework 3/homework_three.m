clc         % Clear command window history
clear       % Clear workspace memory
close all   % Close all figure frames

n = -50:1:240;
Ts = 0.1;
y = ( ( mod( floor( n), 7 / Ts) < 5 / Ts) .* ( mod( floor( n), 7 / Ts) >= 3 / Ts)) * 4;

close all;
figure(), plot( n, y);
axis([-50,240,-1,5]);


% FSE Coefficients
% f = @(k) k^2 + k means function handle, it is like f(k) = k^2 + k
ak = @(k) sinc(2*k/7) .* (8/7) .* exp(-1i*(2*pi/7)*4*k);

Nval = 1;

k = -Nval:Nval;
ak_out = real(ak(k));    % Omit complex part
ak_out(k==0) = 8/7;
figure, stem(k, ak_out); % Opens new figure frame

t = -15:0.001:15;
y = 0;
for k=-Nval:Nval
    y = y + real(ak(k) .* exp( 1i*( 2*pi/7)*k.*t));
end
figure, plot(t,y);


harmonic0 = real(ak(0) .* exp( 1i*( 2*pi/7)*0.*t));
harmonic1 = real(ak(1) .* exp( 1i*( 2*pi/7)*1.*t)) + real(ak(-1) .* exp( 1i*( 2*pi/7)*-1.*t));
harmonic2 = real(ak(2) .* exp( 1i*( 2*pi/7)*2.*t)) + real(ak(-2) .* exp( 1i*( 2*pi/7)*-2.*t));
harmonic3 = real(ak(3) .* exp( 1i*( 2*pi/7)*3.*t)) + real(ak(-3) .* exp( 1i*( 2*pi/7)*-3.*t));
figure, plot(t,harmonic0,t,harmonic1,t,harmonic2,t,harmonic3);
