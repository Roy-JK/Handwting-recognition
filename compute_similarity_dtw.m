function y=compute_similarity_dtw(A,B,type) %dtw�����Ƚ�A.type��B.type ��2ά����nά�����ƶȣ���һά��ʱ�䣩
fprintf('********��ʼ����%s��%s*******\n',A,B);
X=load(['.\A\',A,type]);
Y=load(['.\A\',B,type]);


y=f_dtw(X(:,2:4),Y(:,2:4));
disp(['**********',A,' and ',B,' had done by DTW.**********']);
end