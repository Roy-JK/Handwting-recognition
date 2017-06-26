function fil_test(filename) % filename='B6'  .combine->.fil  使用生成的滤波器
datafile=['.\A\',filename,'.combine']; %原始数据
ans_datafile=['.\A\',filename,'.fil'];     %目标数据
answer=[];
Temp=load(datafile);
for i=2:7
    tt=highpass(Temp(:,i));
%        tt=myfilter(Temp(:,i),1,5,200);
    answer(:,i)=tt;
end
answer(:,1)=Temp(:,1);    %最后添加上时间
dlmwrite(ans_datafile, answer, 'delimiter',' ', 'precision','%f'); %输出文件
disp([filename,'.fil has done.'])
end

function y=lowp(x,f1,f3,rp,rs,Fs)
%低通滤波
%使用注意事项：通带或阻带的截止频率的选取范围是不能超过采样率的一半
%即，f1,f3的值都要小于 Fs/2
%x:需要带通滤波的序列
% f 1：通带截止频率
% f 3：阻带截止频率
%rp：边带区衰减DB数设置
%rs：截止区衰减DB数设置
%FS：序列x的采样频率
% rp=0.1;rs=30;%通带边衰减DB值和阻带边衰减DB值
% Fs=2000;%采样率
%
wp=2*pi*f1/Fs;
ws=2*pi*f3/Fs;
% 设计切比雪夫滤波器；
[n,wn]=cheb1ord(wp/pi,ws/pi,rp,rs);
[bz1,az1]=cheby1(n,rp,wp/pi);
%查看设计滤波器的曲线
[h,w]=freqz(bz1,az1,256,Fs);
h=20*log10(abs(h));
% figure;plot(w,h);title('所设计滤波器的通带曲线');grid on;
%
y=filter(bz1,az1,x);%对序列x滤波后得到的序列y
end


function mv_gra(filename) % filename='B6'  .combine->.mvG 出去重力

% 检测目标文件 .fil如果存在就返回
if exist(['.\A\',filename,'.mvG'],'file')
    fprintf('%s.mvG exists,return.\n',filename);
    return;
end


fprintf('%s.mvG  not exists.\n',filename);
datafile=['.\A\',filename,'.combine']; %原始数据
ans_datafile=['.\A\',filename,'.mvG'];     %目标数据

answer=[];

Temp=load(datafile);
for i=2:7
       G=lowp(Temp(:,i),0.3,0.5,0.1,30,50);
       answer(:,i)=Temp(:,i)-G;
end

answer(:,1)=Temp(:,1);    %最后添加上时间
dlmwrite(ans_datafile, answer, 'delimiter',' ', 'precision','%f'); %输出文件

disp([filename,'.fil has done.'])

end

function y=myfilter(x,a,b,fs)  %孟同学告诉我的
aaa=fir1(300,[a/(fs/2),b/(fs/2)]);
y=filtfilt(aaa,1,x);
end

function remAvg(filename) %去掉平均值

datafile=['.\A\',filename,'.combine']; %原文件
ans_datafile=['.\A\',filename,'.remAvg']; %目标文件
Env=load('.\A\env.env');
Temp=load(datafile);
for i=2:4
    answer(:,i)=Temp(:,i)-mean(Env(:,i));
end
answer(:,1)=Temp(:,1); %把第一维时间补上
dlmwrite(ans_datafile, answer, 'delimiter',' ', 'precision','%f'); %输出文件

disp([filename,'.remAvg has done.'])


end

