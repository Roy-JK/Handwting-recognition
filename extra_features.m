function features=extra_features(Data)
    features=[];
    D1=normalize(interpolation(Data));
    D2=rem_by_ifft(interpolation(Data));
    tmp=feature_mean(D1);
    features=[feature,tmp];



function answer=feature_mean(X)
for i=2:4
    answer(i-1)=mean(X(:,i));
end

