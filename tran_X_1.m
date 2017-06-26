function [answer_V,answer]=tran_X_1(Temp,tt) %公式迭代积分法  tt 时间间隔 毫秒  

tt=tt/1000;
answer_V=[];  %速度的结果
answer=[];  %最后的结果
V=[]; %速度序列
X=[]; %位移序列
a=[]; %加速度序列
V(1)=0;
X(1)=0;


for i=2:size(Temp,2)  %第一维是时间，第2到4维是加速度三轴
    a=Temp(:,i)';
    for j=2:length(a)
       V(j)=tranV(a,j,tt); %求速度
       X(j)=X(j-1)+V(j-1)*tt+0.5*a(j-1)*tt*tt;
    end
    
    answer(:,i)=X';
    answer_V(:,i)=V';
    X=[];
    V=[];
    V(1)=0;
    X(1)=0;
end

answer(:,1)=Temp(:,1); %把第一维时间补上
answer_V(:,1)=Temp(:,1); %把第一维时间补上
end

