function answer=normalize(Temp) %生成 .nal  % filename='B6';

% datafile=['.\A\',filename,type];  %原数据
% nomal_datafile=['.\A\',filename,'.nal'];   %目标数据

Temp=load(datafile);
X=Temp(:,2:4);
Min=min(X);
Min(Min>0)=0;
Min=-Min;
NG=X+repmat(Min,size(X,1),1); %NG为非负

Max=max(NG);
NOMAL=NG./repmat(Max,size(NG,1),1);%NOMAL为归一化之后的数据

answer=[Temp(:,1),NOMAL];
end
