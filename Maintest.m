clear;
s = 'ST';
D = readX(s);
tt = 20;
D = timeprocess(D);  %处理时间
D = interpolation(D,tt);  %插值
[D,~]=move_mean(D); %减去平均值
[V,X]=tran_X_2(D,tt); %求速度和位移
windowsize=60; %序列长度
%%
[D, ~]=move_mean(D);
[V, ~]=tran_X_2(D,tt);
centerX = classifyV(sqrt(V(:, 2) .^ 2 +V(:, 3) .^ 2));%聚类
centerX=[1,centerX,size(D,1)];
fprintf('共分为%d段\n',length(centerX)-1);

j=1;
for i=1: length(centerX)-1
    index1=centerX(i);
    index2=centerX(i+1);
    if(index2-index1)<windowsize
        continue;
    end
    a=index1+(index2-index1-windowsize)/2;
    a=floor(a);
    b=windowsize-1+a;
    Result(:,:,j)=D(a:b,:);
    j=j+1;
end
fprintf('有效分段数为%d\n ',j-1);

X_pre_acc = [];
Y_pre_acc = [];
X_pre_vel = [];
Y_pre_vel = [];
X_pre_dis = [];
Y_pre_dis = [];
tt = 20;

for i = 1 : size(Result, 3)
    A = Result(:, :, i);
    [V, D] = tran_X_2(A, tt);
    X_pre_acc = [X_pre_acc; A(:, 2)'];
    Y_pre_acc = [Y_pre_acc; A(:, 3)'];
    X_pre_vel = [X_pre_vel; V(:, 2)'];
    Y_pre_vel = [Y_pre_vel; V(:, 3)'];
    X_pre_dis = [X_pre_dis; D(:, 2)'];
    Y_pre_dis = [Y_pre_dis; D(:, 3)'];
end

s='./LSTM\data\UCI HAR Dataset\predict\Inertial Signals\';
save([s,'X_acc_pre.txt'], 'X_pre_acc', '-ascii');
save([s,'Y_acc_pre.txt'], 'Y_pre_acc', '-ascii');
save([s,'X_vel_pre.txt'], 'X_pre_vel', '-ascii');
save([s,'Y_vel_pre.txt'], 'Y_pre_vel', '-ascii');
save([s,'X_dis_pre.txt'], 'X_pre_dis', '-ascii');
save([s,'Y_dis_pre.txt'], 'Y_pre_dis', '-ascii');
% quit;

function [A,avg] = move_mean(D) %去掉平均值
c = 1;
A = [D(:, 1), D(:, 2) - c * mean(D(:, 2)), D(:, 3) - c * mean(D(:, 3)), D(:, 4)- c * mean(D(:, 4))];
avg = c*mean(D(:,2));
end



