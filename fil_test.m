function fil_test(filename) % filename='B6'  .combine->.fil  ʹ�����ɵ��˲���
datafile=['.\A\',filename,'.combine']; %ԭʼ����
ans_datafile=['.\A\',filename,'.fil'];     %Ŀ������
answer=[];
Temp=load(datafile);
for i=2:7
    tt=highpass(Temp(:,i));
%        tt=myfilter(Temp(:,i),1,5,200);
    answer(:,i)=tt;
end
answer(:,1)=Temp(:,1);    %���������ʱ��
dlmwrite(ans_datafile, answer, 'delimiter',' ', 'precision','%f'); %����ļ�
disp([filename,'.fil has done.'])
end

function y=lowp(x,f1,f3,rp,rs,Fs)
%��ͨ�˲�
%ʹ��ע�����ͨ��������Ľ�ֹƵ�ʵ�ѡȡ��Χ�ǲ��ܳ��������ʵ�һ��
%����f1,f3��ֵ��ҪС�� Fs/2
%x:��Ҫ��ͨ�˲�������
% f 1��ͨ����ֹƵ��
% f 3�������ֹƵ��
%rp���ߴ���˥��DB������
%rs����ֹ��˥��DB������
%FS������x�Ĳ���Ƶ��
% rp=0.1;rs=30;%ͨ����˥��DBֵ�������˥��DBֵ
% Fs=2000;%������
%
wp=2*pi*f1/Fs;
ws=2*pi*f3/Fs;
% ����б�ѩ���˲�����
[n,wn]=cheb1ord(wp/pi,ws/pi,rp,rs);
[bz1,az1]=cheby1(n,rp,wp/pi);
%�鿴����˲���������
[h,w]=freqz(bz1,az1,256,Fs);
h=20*log10(abs(h));
% figure;plot(w,h);title('������˲�����ͨ������');grid on;
%
y=filter(bz1,az1,x);%������x�˲���õ�������y
end


function mv_gra(filename) % filename='B6'  .combine->.mvG ��ȥ����

% ���Ŀ���ļ� .fil������ھͷ���
if exist(['.\A\',filename,'.mvG'],'file')
    fprintf('%s.mvG exists,return.\n',filename);
    return;
end


fprintf('%s.mvG  not exists.\n',filename);
datafile=['.\A\',filename,'.combine']; %ԭʼ����
ans_datafile=['.\A\',filename,'.mvG'];     %Ŀ������

answer=[];

Temp=load(datafile);
for i=2:7
       G=lowp(Temp(:,i),0.3,0.5,0.1,30,50);
       answer(:,i)=Temp(:,i)-G;
end

answer(:,1)=Temp(:,1);    %���������ʱ��
dlmwrite(ans_datafile, answer, 'delimiter',' ', 'precision','%f'); %����ļ�

disp([filename,'.fil has done.'])

end

function y=myfilter(x,a,b,fs)  %��ͬѧ�����ҵ�
aaa=fir1(300,[a/(fs/2),b/(fs/2)]);
y=filtfilt(aaa,1,x);
end

function remAvg(filename) %ȥ��ƽ��ֵ

datafile=['.\A\',filename,'.combine']; %ԭ�ļ�
ans_datafile=['.\A\',filename,'.remAvg']; %Ŀ���ļ�
Env=load('.\A\env.env');
Temp=load(datafile);
for i=2:4
    answer(:,i)=Temp(:,i)-mean(Env(:,i));
end
answer(:,1)=Temp(:,1); %�ѵ�һάʱ�䲹��
dlmwrite(ans_datafile, answer, 'delimiter',' ', 'precision','%f'); %����ļ�

disp([filename,'.remAvg has done.'])


end
