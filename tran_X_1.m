function [answer_V,answer]=tran_X_1(Temp,tt) %��ʽ�������ַ�  tt ʱ���� ����  

tt=tt/1000;
answer_V=[];  %�ٶȵĽ��
answer=[];  %���Ľ��
V=[]; %�ٶ�����
X=[]; %λ������
a=[]; %���ٶ�����
V(1)=0;
X(1)=0;


for i=2:size(Temp,2)  %��һά��ʱ�䣬��2��4ά�Ǽ��ٶ�����
    a=Temp(:,i)';
    for j=2:length(a)
       V(j)=tranV(a,j,tt); %���ٶ�
       X(j)=X(j-1)+V(j-1)*tt+0.5*a(j-1)*tt*tt;
    end
    
    answer(:,i)=X';
    answer_V(:,i)=V';
    X=[];
    V=[];
    V(1)=0;
    X(1)=0;
end

answer(:,1)=Temp(:,1); %�ѵ�һάʱ�䲹��
answer_V(:,1)=Temp(:,1); %�ѵ�һάʱ�䲹��
end
