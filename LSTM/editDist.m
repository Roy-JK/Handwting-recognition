function dist = editDist(stateSeq, alphaSeq)

m = length(stateSeq);
n = length(alphaSeq);
dp = zeros(m, n);

costMat = [
    0 1 3 1 5 5;
    1 0 1 3 5 5;
    3 1 0 1 5 5;
    1 3 1 0 5 5;
    5 5 5 5 0 3;
    5 5 5 5 3 0;
    ];
insertCost = 2;

for i = 1 : m
    for j = 1 : n
        x = uint8(stateSeq(i)) - uint8('0');
        y = uint8(alphaSeq(j)) - uint8('0');
        dp(i, j) = size(costMat, 1) ^ 2;
        if i <= 1 && j <= 1
            dp(i, j) = min(dp(i, j), costMat(x, y));
        elseif i > 1 && j > 1
            dp(i, j) = min(dp(i, j), dp(i - 1, j - 1) + costMat(x, y));
        end
        if i > 1
            dp(i, j) = min(dp(i, j), dp(i - 1, j) + insertCost);
            if(j <= 1)
                dp(i, j) = min(dp(i, j), costMat(x, y) + insertCost * (i - 1));
            end
        end
        if j > 1
            dp(i, j) = min(dp(i, j), dp(i, j - 1) + insertCost);
            if(i <= 1)
                dp(i, j) = min(dp(i, j), costMat(x, y) + insertCost * (j - 1));
            end
        end
    end
end

dist = dp(m, n);