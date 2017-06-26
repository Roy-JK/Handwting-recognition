function  answer=rem_by_ifft(D,fs)    %X='A2'

% target_file=['.\A\',X,'.rem_ifft'];   % %%每一个字母生成一个X.rem_ifft文件
% D=load(['.\A\',X,type]);
%fs=50;
answer=[];
for i=2:4 
    data= D(:,i);
    y=fft(data);
    [L,~] = size(data);
    f = fs*(0:L/2)/L;
    if mod(L,2)==1
        f=[f,f(end:-1:2)];
    else
        f=[f,f(end-1:-1:2)];
    end
    for j=1:size(f,2)
        if f(j)<0.5 | f(j)>5
            y(j)=0;
        end
    end
    A=ifft(y);
    answer(:,i)=A;
end;
answer(:,1)=D(:,1);
% dlmwrite(target_file, answer, 'delimiter',' ', 'precision','%f');
end



