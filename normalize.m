function answer=normalize(Temp) %���� .nal  % filename='B6';

% datafile=['.\A\',filename,type];  %ԭ����
% nomal_datafile=['.\A\',filename,'.nal'];   %Ŀ������

Temp=load(datafile);
X=Temp(:,2:4);
Min=min(X);
Min(Min>0)=0;
Min=-Min;
NG=X+repmat(Min,size(X,1),1); %NGΪ�Ǹ�

Max=max(NG);
NOMAL=NG./repmat(Max,size(NG,1),1);%NOMALΪ��һ��֮�������

answer=[Temp(:,1),NOMAL];
end