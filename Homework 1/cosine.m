n = 0:127;
dense = 0:0.0001:127;

x1 = cos( 0.1 * pi * n);
x2 = cos( 2.1 * pi * n);
x3 = cos( -1.9 * pi * n);
x4 = cos( 0.2 * pi * n);
x5 = cos( 0.2 * pi * n + 0.5);
x6 = cos( 0.3 * pi * n);
x7 = cos( 0.01 * pi * n);
x8 = cos( pi * n);
x9 = cos( 1.01 * pi * n);
x10 = cos( 0.99 * pi * n);
x11 = cos( n);
x12 = cos( 0.7 * n + 0.5);

mydisp( x1);
mydisp( x2);
mydisp( x3);
mydisp( x4);
mydisp( x5);
mydisp( x6);
mydisp( x7);
mydisp( x8);
mydisp( x9);
mydisp( x10);
mydisp( x11);
mydisp( x12);

close all;

figure();
plot(dense, cos( dense), '.',n, x11, '-', n, x12, '-');
xlabel('n');
ylabel('cos( wn + t)');

figure();
plot(n,x1, '-', n,x2, 'x', n,x3, 'o');
xlabel('n');
ylabel('cos( wn + t)');

figure();
plot(n,x4,'-',n,x5,'-');
xlabel('n');
ylabel('cos( wn + t)');

figure();
plot(n,x9, '-', n,x10, '.');
xlabel('n');
ylabel('cos( wn + t)');

findPeriod( x1);
findPeriod( x2);
findPeriod( x3);
findPeriod( x4);
findPeriod( x5);
findPeriod( x6);
findPeriod( x7);
findPeriod( x8);
findPeriod( x9);
findPeriod( x10);
findPeriod( x11);
findPeriod( x12);

function [period] = findPeriod( mat )
    period = 0;
    index = 3:127;
    periods = find(mat(1,1) == mat(1,index));
    disp(['fundamental period of ' inputname(1) ':'] );
    [x, y] = size(periods);
    if( y > 1)
        disp(periods(1,2) - periods(1,1));
    else
        disp('    no periods found within 0-127'); 
        disp(' ');
    end 
    
    disp(periods);
    
end

function mydisp(b)
    disp([inputname(1) ':'] );
    disp('n = 0:');
    disp( b(1,0+1));
    disp('n = 8:');
    disp( b(1,8+1));
    disp('n = 28:');
    disp( b(1,28+1));
    disp('n = 127:');
    disp( b(1,127+1));
    disp('');
end