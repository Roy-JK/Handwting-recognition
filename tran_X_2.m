function [answer_V,answer]=tran_X_2(Temp,tt)   %%���λ��ֹ�ʽ��  tt ʱ���� ����  
tt=tt/1000;
answer_V=[];  %�ٶȵĽ��
answer=[];  %���Ľ��
V=[]; %�ٶ�����
X=[]; %λ������
a=[]; %���ٶ�����
for i=2:size(Temp,2)  %��һά��ʱ�䣬��2��4ά�Ǽ��ٶ�����
    a=Temp(:,i)';
    for j=1:length(a)
       V(j)=sum(a(1:j))*tt;
    end
    for j=1:length(V)
        X(j)=sum(V(1:j))*tt;
    end
    answer(:,i)=X';
    answer_V(:,i)=V';
    X=[];
    V=[];
    a=[];
end
answer(:,1)=Temp(:,1); %�ѵ�һάʱ�䲹��
answer_V(:,1)=Temp(:,1); %�ѵ�һάʱ�䲹��
end