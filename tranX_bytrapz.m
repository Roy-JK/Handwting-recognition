function answer=tranX_bytrapz(X)
time=X(:,1);
for i=2:4
    answer(:,i)=cumtrapz(time,cumtrapz(time,X(:,i)));
end
answer(:,1)=time;
end