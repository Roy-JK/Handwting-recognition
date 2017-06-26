function  myFft(X)    

fs=50;
figure;
data= X;
y=fft(data);
[L,~] = size(data);
y = y(1:floor(L/2)+1);
A = abs(y);
f = fs*(0:L/2)/L;
plot(f,A);
xlabel('Frequency (Hz)');
%     xlim( [ 90, 102 ] );
ylim( [ 0, 50] );

end



