function result=interpolation(X,interval)  %����

%% ȥ��
[tmp I] = unique(X(:,1), 'first');
D = X(I,:);

%% ��ֵ����
time=D(:,1);
result=[];
for i=2:4
    data=D(:,i);
    y=data;
    x=time;
    xx=[time(1,1):interval:time(end,1)]';
    yy=spline(x,y,xx);
    result(:,1)=xx;
    result(:,i)=yy;
end
end