function y=compute_similarity_ou(A,B) %ŷʽ���뷽���Ƚ� A.combine��B.combine �����ƶ�
fprintf('********��ʼ����%s��%s*******\n',A,B);
X=load(['.\A\',A,'.combine']);
Y=load(['.\A\',B,'.combine']);

n=size(X,1);
m=size(Y,1);
answer=1000000000000;
window=200;
dis=window-1;
for i=1:1:n-dis
   for j=1:1:m-dis
%        fprintf('*****��ʼ����(%s,%s)��i=%d��j=%d��****\n',A,B,i,j);
       x1=X(i:i+dis,1:7);
       x2=Y(j:j+dis,1:7);
       y1=f_fft(x1);
       y2=f_fft(x2);
       z1=y1(y1(:,1)>0.5,:);
       z2=y2(y2(:,1)>0.5,:);
       T=(z1(:,2:7)-z2(:,2:7)).^2;
       tmp=sum(sum(T));
       
% %        tmp=f_dtw(y1(:,2:7),y2(:,2:7));
%       T=(X(i:i+dis,2:7)-Y(j:j+dis,2:7)).^2;
%       tmp=sum(sum(T));   

      if tmp<answer
        answer=tmp;
      end
   end
end
y=answer;

disp(['**********',A,' and ',B,' had done by OU.**********']);
end