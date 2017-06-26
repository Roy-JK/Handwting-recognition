function answer=f_dtw(t,r) %标准dtw比较 t,r两个矩阵
n = size(t,1);
m = size(r,1);

d = zeros(n,m);
for i = 1:n
    for j = 1:m
        d(i,j) = sum((t(i,:)-r(j,:)).^2);
    end
end

D = ones(n,m) * realmax;
D(1,1) = d(1,1);

for i = 1:n
    for j = 1:m
        if i==1&&j==1
            continue;
        end
        if i>1
            D1 = D(i-1,j);
        else
            D1 = realmax;
        end
        if j>1&&i>1
            D2 = D(i-1,j-1);
        else D2 = realmax;
        end
        if j>1
            D3 = D(i,j-1);
        else
            D3 = realmax;
        end
        D(i,j) = d(i,j) + min([D1,D2,D3]);
    end
end
answer=D(n,m);
fprintf('****DTW计算完毕\n');

% [x1,y1]=min(D(n,:));
% [x2,y2]=min(D(:,m));
% answer=x1;
% if(x1<x2)
%     answer=x1;
%     fprintf('最小的在末行（%d，%d）,最小距离是%f\n',n,y1,x1);
% else
%     answer=x2;
%     fprintf('最小的在末列（%d,%d）,最小距离是%f\n',y2,m,x2);
% end







