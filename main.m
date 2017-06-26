%% 遍历A文件夹内的 xx.data,将字符添加到group数组
contains = dir('A\*.data');
group={};
for i=1:length(contains)
    [a,b]=fileparts(contains(i).name);
    group(i)={b};
end

%% 遍历group, 一一进行处理
for i=1:length(group)

    combine(group{1,i},'.data');                         %% 将所有data文件合并，生成文件 xx.combine
%     mv_gra(group{1,i});                            %% 去除重力，xx.combine-> xx.mvG
%     fil(group{1,i});                                    %% 低通滤波 ：xx.combine->.fil
%     remAvg(group{1,i});                           %%去除静态时候的平均量  xx.combine->xx.remAvg
    rem_by_ifft(group{1,i},'.combine');          %%逆傅立叶滤波 ,生成xx.rem_ifft
    tran_X(group{1,i},'.rem_ifft');                   %% 生成位移序列，生成 xx.tranX 
    normalize(group{1,i},'.tranX');                 %% 归一化，生成文件 xx.nal 
%     draw(group{1,i},'.tranX');                         %% 画出某文件类型的图像
end

return;
%% 计算两两相似度
fid=fopen('result.txt', 'wt','n','UTF-8'); 
fprintf(fid,' ,');
for i=1:length(group)
    fprintf(fid,'%s,',group{1,i}); %打印首行字母 制表
end
fprintf(fid,'\n'); 
for i=1:length(group)
    fprintf(fid,'%s,',group{1,i}); %打印首列字母 制表
    for j=1:length(group)
%         fprintf(fid,'%.2f,',compute_similarity_ou(group{1,i},group{1,j}));
        fprintf(fid,'%.2f,',compute_similarity_dtw(group{1,i},group{1,j},'.nal'));
    end
    fprintf(fid,'\n');
end
fclose(fid);
fprintf('All things has done');
 
