%% ����A�ļ����ڵ� xx.data,���ַ����ӵ�group����
contains = dir('A\*.data');
group={};
for i=1:length(contains)
    [a,b]=fileparts(contains(i).name);
    group(i)={b};
end

%% ����group, һһ���д���
for i=1:length(group)

    combine(group{1,i},'.data');                         %% ������data�ļ��ϲ��������ļ� xx.combine
%     mv_gra(group{1,i});                            %% ȥ��������xx.combine-> xx.mvG
%     fil(group{1,i});                                    %% ��ͨ�˲� ��xx.combine->.fil
%     remAvg(group{1,i});                           %%ȥ����̬ʱ���ƽ����  xx.combine->xx.remAvg
    rem_by_ifft(group{1,i},'.combine');          %%�渵��Ҷ�˲� ,����xx.rem_ifft
    tran_X(group{1,i},'.rem_ifft');                   %% ����λ�����У����� xx.tranX 
    normalize(group{1,i},'.tranX');                 %% ��һ���������ļ� xx.nal 
%     draw(group{1,i},'.tranX');                         %% ����ĳ�ļ����͵�ͼ��
end

return;
%% �����������ƶ�
fid=fopen('result.txt', 'wt','n','UTF-8'); 
fprintf(fid,' ,');
for i=1:length(group)
    fprintf(fid,'%s,',group{1,i}); %��ӡ������ĸ �Ʊ�
end
fprintf(fid,'\n'); 
for i=1:length(group)
    fprintf(fid,'%s,',group{1,i}); %��ӡ������ĸ �Ʊ�
    for j=1:length(group)
%         fprintf(fid,'%.2f,',compute_similarity_ou(group{1,i},group{1,j}));
        fprintf(fid,'%.2f,',compute_similarity_dtw(group{1,i},group{1,j},'.nal'));
    end
    fprintf(fid,'\n');
end
fclose(fid);
fprintf('All things has done');
 