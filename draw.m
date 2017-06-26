function draw(X,flag,s)
if ~exist('s', 'var') || isempty(s)
    s = '';
end

a0=X(:,1);
a1=X(:,2);
if flag ~= 1
a2=X(:,3);
a3=X(:,4);
end
%[a0,a1,a2,a3]=textread(['.\A\',filename,type],'%f %f %f %f');

t=a0;

if flag==1
    figure;
    plot(t,a1);
    legend('x');
    title(['',s]);
    return;
end
   
if flag==2
    figure;
    plot(t,a2);
    legend('y');
    title(['',s]);
    return;
end

figure;
% figure('visible','off');
subplot(4,1,1);
plot(t,a1,t,a2,t,a3);
legend('x','y','z');
% ylim( [ -2, 2] );
title([s,'::::x,y,z']);

subplot(4,1,2);
plot(t,a1);
legend('x');
%   
title('x');

subplot(4,1,3);
plot(t,a2);
legend('y');
title('y');

subplot(4,1,4);
plot(t,a3);
legend('z');
title('z');
%print('-dtiff',['.\A\image\Trend_',filename,type,'.tiff']);

end




