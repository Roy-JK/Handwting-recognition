function [answer_V,answer]=tran_X_2(Temp,tt)   %%矩形积分公式法  tt 时间间隔 毫秒  
tt=tt/1000;
answer_V=[];  %速度的结果
answer=[];  %最后的结果
V=[]; %速度序列
X=[]; %位移序列
a=[]; %加速度序列
for i=2:size(Temp,2)  %第一维是时间，第2到4维是加速度三轴
    a=Temp(:,i)';
    for j=1:length(a)
       V(j)=sum(a(1:j))*tt;
    end
    for j=1:length(V)
        X(j)=sum(V(1:j))*tt;
    end
    answer(:,i)=X';
    answer_V(:,i)=V';
    X=[];
    V=[];
    a=[];
end
answer(:,1)=Temp(:,1); %把第一维时间补上
answer_V(:,1)=Temp(:,1); %把第一维时间补上
end