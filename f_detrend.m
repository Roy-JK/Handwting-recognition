function result=f_detrend(X)
detrendX = detrend(X(:, 2 : end));
result=[X(:,1),detrendX];
end