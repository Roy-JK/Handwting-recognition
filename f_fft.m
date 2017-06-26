function  f_fft(X,type)    %X='A2'
% nomal_datafile=['.\A\',X,'.fft'];
% %%每一个字母生成一个X.fft文件

D=load(['.\A\',X,type]);
fs=50;
% answer=[];%X字母最后6维合在一起的矩阵
figure;

for i=2:4 %第一维是时间，从第二维到第七维是加速度和陀螺仪,对每一维数据进行FFT过程
    data= D(:,i);
    y=fft(data);
    [L,~] = size(data);
    y = y(1:floor(L/2)+1);
    A = abs(y);
    f = fs*(0:L/2)/L;
%     figure('visible','off');
    subplot(3,1,i-1);
    plot(f,A);
%     title([X,':::::',num2str(i)]);
    xlabel('Frequency (Hz)');
%     xlim( [ 90, 102 ] );
    ylim( [ 0, 50] );
%     answer(:,i)=A.';
end;
suptitle(['FFT:',X,type]);
%print('-dtiff',['.\A\image\FFT_',X,type,'.tiff']);
% dlmwrite(nomal_datafile, answer, 'delimiter',' ', 'precision','%f');
% answer(:,1)=f;
end



