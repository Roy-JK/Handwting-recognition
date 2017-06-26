function y=compute_similarity_dtw(A,B,type) %dtw方法比较A.type和B.type 第2维到第n维的相似度（第一维是时间）
fprintf('********开始计算%s和%s*******\n',A,B);
X=load(['.\A\',A,type]);
Y=load(['.\A\',B,type]);


y=f_dtw(X(:,2:4),Y(:,2:4));
disp(['**********',A,' and ',B,' had done by DTW.**********']);
end