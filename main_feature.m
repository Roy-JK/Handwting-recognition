%% ����A�ļ����ڵ� xx.data,���ַ����ӵ�group����
contains = dir('A\*.data');
group={};
for i=1:length(contains)
    [a,b]=fileparts(contains(i).name);
    group(i)={b};
end


%% ����group, һһ���д���
for i=1:length(group)
    feature=[]
    datafile=['.\A\',group{1,i},'.data'];  %ԭ����
    Data=load(datafile);
    feature=extra_features(Data);
    

    
    
   
    combine(group{1,i},'.data');                         %% ������data�ļ��ϲ��������ļ� xx.combine
%     mv_gra(group{1,i});                            %% ȥ��������xx.combine-> xx.mvG
%     fil(group{1,i});                                    %% ��ͨ�˲� ��xx.combine->.fil
%     remAvg(group{1,i});                           %%ȥ����̬ʱ���ƽ����  xx.combine->xx.remAvg
    rem_by_ifft(group{1,i},'.combine');          %%�渵��Ҷ�˲� ,����xx.rem_ifft
    tran_X(group{1,i},'.rem_ifft');                   %% ����λ�����У����� xx.tranX 
    normalize(group{1,i},'.tranX');                 %% ��һ���������ļ� xx.nal 
%     draw(group{1,i},'.tranX');                         %% ����ĳ�ļ����͵�ͼ��
end

%dlmwrite(target_file, answer, 'delimiter',' ', 'precision','%f');
return;