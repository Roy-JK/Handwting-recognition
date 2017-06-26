function video_main()
%%
color304k1.name='304k1';
color304k1.interval=1/30;
color304k1.yellow=[255,146,83];
color304k1.green=[0,112,77];
color304k1.blue=[0,93,156];
color304k1.red=[255,77,72];

color304k2.name='304k2';
color304k2.interval=1/30;
color304k2.yellow=[255,147,83];
color304k2.green=[5,110,80];
color304k2.blue=[0,79,143];
color304k2.red=[255,53,38];

color304k3.name='304k3';
color304k3.interval=1/30;
color304k3.yellow=[255,152,86];
color304k3.green=[0,105,66];
color304k3.blue=[0,97,158];
color304k3.red=[255,81,64];

color304k4.name='304k4';
color304k4.interval=1/30;
color304k4.yellow=[255,125,49];
color304k4.green=[0,122,70];
color304k4.blue=[0,108,165];
color304k4.red=[204,29,6];
%%
distance=0.1;                        %10cm比例尺
flag=0;                                           %是否打印出图
color=color304k1;                     %对照点参数

%%
obj =VideoReader(['./video/',color.name,'.mp4']); 
interval=color.interval;                         %采样率 
nFrame=obj .NumberOfFrames;
Locs=[];                                 %位置数组
lastP=[0,0];

%%
frame=read(obj,1);
lpoint=findCenter(frame,color.green,[0,0]);
if flag==1       
    imshow(frame);
    hold all;
    plot(lpoint(2),lpoint(1),'ro','MarkerSize',20,'LineWidth',3)
end
rpoint=findCenter(frame,color.blue,[0,0]);
if flag==1
    figure;
    imshow(frame);
    hold all;
    plot(rpoint(2),rpoint(1),'ro','MarkerSize',20,'LineWidth',3)
end
scale=distance/dist(lpoint,rpoint');%实际距离/图上距离  求出比例尺
%%
cnt = 1;
for i = 2 : nFrame
    frame=read(obj,i);
    
    [~, numColor] = findCenter(frame,color.red,lastP);
    if numColor > 500
        continue;
    end
    
    [loc, ~] = findCenter(frame,color.yellow,lastP);%手表标志点
    lastP=loc;
    Locs(cnt,:)=loc;
    cnt = cnt + 1;
    if(mod(cnt,10)==0) 
        fprintf('%d finish\n ',cnt);   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    if flag==1
        figure;
        imshow(frame);
        hold all;
        plot(loc(2),loc(1),'ro','MarkerSize',10,'LineWidth',3)
    end
%     print(gcf,'-dpng','abc.png')
end

%%
V=[];
for i=2:size(Locs,1)
    distance=dist(Locs(i,:),Locs(i-1,:)');
      if Locs(i,2)>=Locs(i-1,2)
            distance=distance*1;
        else
            distance=distance*(-1);
      end
    V(i-1)=distance*scale/interval;
end
V=V';

a=[];
for i=2:size(V,1)
    a(i-1)=(V(i)-V(i-1))/interval;
end
%%
interval2=interval*1000;
t=0:interval2:interval2*(cnt-4);
%%
figure;
D=readX(color.name);
D=timeprocess(D);
D=interpolation(D,20);
D=[D(:,1),D(:,2)-mean(D(:,2)),D(:,3:end)];
plot(t,a,D(:,1),D(:,2),'LineWidth',1.5);
legend('video','watch');
title(['加速度']);

tv2=0:interval2:interval2*(cnt-3);
figure;
plot(tv2,V,'LineWidth',1.5);
title(['录像微分得到的速度']);

[~,X_r_watch]=tran_X_2(D,20);
draw(X_r_watch,1,'手表加速度积回去的位移');

[~,X_r_video_1]=tran_X_1([t',a'],100/3);
draw(X_r_video_1,1,'录像加速度梯形积回去的位移');

[~,X_r_video_2]=tran_X_2([t',a'],100/3);
draw(X_r_video_2,1,'录像加速度矩形积回去的位移');

figure;
plot(Locs)
title(['原位置数据']);
% t=0:interval:interval*(nFrame-2);
% figure;
% X_new=cumtrapz(t,cumtrapz(t,a));
% plot(X_new)
% title(['加速度系统函数积分回去的位移图像']);

% XXX=tran_X(a,interval);
% figure;
% plot(XXX);
% title(['加速度自写函数积分回去的位移图像']);

end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
function [coord, numColor] = findCenter(img, color, lastPos)
img = double(img);
nearDisp = 1000;

[m, n, ~] = size(img);
if lastPos(1) ~= 0 && lastPos(2) ~= 0
    rowL = max(1, floor(lastPos(1) - m / 10));
    rowR = min(m, floor(lastPos(1) + m / 10));
    colL = max(1, floor(lastPos(2) - n / 10));
    colR = min(n, floor(lastPos(2) + n / 10));
else
    rowL = 1;
    rowR = m;
    colL = 1;
    colR = n;
end

colorDisp = (img(rowL : rowR, colL : colR, 1) - color(1)) .^ 2 + ...
    (img(rowL : rowR, colL : colR, 2) - color(2)) .^ 2 + ...
    (img(rowL : rowR, colL : colR, 3) - color(3)) .^ 2;

numColor = sum(sum(colorDisp < nearDisp));

row = repmat((rowL : rowR)', colR - colL + 1, 1);
col = sort(repmat((colL : colR)', rowR - rowL + 1, 1));

colorDisp = [colorDisp(:), row, col];

[dispVec, dispId] = sort(colorDisp(:, 1), 1);
colorDisp = [dispVec, colorDisp(dispId, 2 : 3)];

l = 1;
r = size(dispVec, 1) + 1;

while l < r
    m = floor((l + r) / 2);
    if dispVec(m, 1) < nearDisp
        l = m + 1;
    else
        r = m;
    end
end
if l == 1
    coord = colorDisp(1, 2 : 3);
else
    coord = floor(sum(colorDisp(1 : l, 2 : 3)) / l);
end

end
