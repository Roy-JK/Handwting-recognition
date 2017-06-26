clear; close all; clc;
s = 'B5';
D = readX(s);
tt = 20;
D = timeprocess(D);  
D = interpolation(D,tt);
D= [D(:,1), filter(ones(1,10), 1, D(:, 2 : end) / 10)];
[D,~]=move_mean(D);
[V, ~]=tran_X_2(D,tt);

centerX = classifyV(sqrt(D(:, 2) .^ 2 +D(:, 3) .^ 2));

X = [];
lastPos = zeros(1, size(D, 2) - 1);
for i=2 :length(centerX)
    index=centerX(i-1) : centerX(i) - 1;
    d = D(index, :);
    [d, ~] = move_mean(d);
    [~, x] = tran_X_2(d, tt);
    x = [x(:, 1), x(:, 2 : end) + ones(size(x, 1), 1) * lastPos];
    lastPos = x(end,2 : end);
    X = [X; x];
end
size(centerX,2)
%% cartoon
figure;
for i=1:size(X,1)
plot(X(i,2),X(i,3),'*','MarkerSize',2);
axis([min(X(:,2))*1.3,max(X(:,2))*1.3,min(X(:,3))*1.3,max(X(:,3))*1.3]);
hold on;
pause(0.005);
end
%%
function [A,avg] = move_mean(D)
c = 1;
A = [D(:, 1), D(:, 2) - c * mean(D(:, 2)), D(:, 3) - c * mean(D(:, 3)), D(:, 4)- c * mean(D(:, 4))];
avg = c*mean(D(:,2));
end
%%
% draw(MV,1,'x dimension of a');
% hold on;
% plot(MV(mini,1),MV(mini,2),'ro','MarkerSize',10);
% hold on
% plot(MV(mini2, 1), MV(mini2, 2),'bx','MarkerSize',10);

%% cartoon
% figure;
% X=X1;
% for i=1:size(X,1)
% plot(X(i,2),X(i,3),'*','MarkerSize',2);
% axis([min(X(:,2))*1.3,max(X(:,2))*1.3,min(X(:,3))*1.3,max(X(:,3))*1.3]);
% hold on;
% pause(0.005);
% end
% draw(X,1,'x÷·Œª“∆');
%%
