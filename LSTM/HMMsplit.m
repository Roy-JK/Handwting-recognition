function stateSeq = HMMsplit(labelSeq)

%% matrix definition
alphaN = 26;
showedN = 6;
hiddenN = 5;

showedS = ['1', '2', '3', '4', '5', '6'];
hiddenS = ['B', 'M', 'E', 'S', 'C'];
%begin, mid, end, single, connect

labelMat = [
    '13243 ';
    '13242 ';
    '1355  ';
    '6     ';
    '135   ';
    '124212';
    '124213';
    '124312';
    '124313';
    '134212';
    '134213';
    '134312';
    '134313';
    '13212 ';
    '13213 ';
    '13312 ';
    '13313 ';
    '52    ';
    '51    ';
    '13142 ';
    '13143 ';
    '21112 ';
    '21113 ';
    '21142 ';
    '21143 ';
    '24112 ';
    '24113 ';
    '24142 ';
    '24143 ';
    '31112 ';
    '31113 ';
    '31142 ';
    '31143 ';
    '34112 ';
    '34113 ';
    '34142 ';
    '34143 ';
    '5     ';
    '1312  ';
    '12    ';
    '13    ';
    '13232 ';
    '1323  ';
    '6     ';
    '135   ';
    '62    ';
    '1352  ';
    '65    ';
    '211   ';
    '241   ';
    '311   ';
    '341   ';
    '62    ';
    '61    ';
    '23    ';
    '2323  ';
    '231   ';
    '241   ';
    '2312  ';
    '2311  ';
    '212   ';
    '213   ';
    '312   ';
    '313   '];
stateMat = [
    'BMMME ';
    'BMMME ';
    'BMME  ';
    'S     ';
    'BME   ';
    'BMMMME';
    'BMMMME';
    'BMMMME';
    'BMMMME';
    'BMMMME';
    'BMMMME';
    'BMMMME';
    'BMMMME';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BE    ';
    'BE    ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'BMMME ';
    'S     ';
    'BMME  ';
    'BE    ';
    'BE    ';
    'BMMME ';
    'BMME  ';
    'S     ';
    'BME   ';
    'BE    ';
    'BMME  ';
    'BE    ';
    'BME   ';
    'BME   ';
    'BME   ';
    'BME   ';
    'BE    ';
    'BE    ';
    'BE    ';
    'BMME  ';
    'BME   ';
    'BME   ';
    'BMME  ';
    'BMME  ';
    'BME   ';
    'BME   ';
    'BME   ';
    'BME   '];

% longLabel = '';
% longState = '';
% for i = 1 : size(labelMat, 1)
%     for j = 1 : size(labelMat, 1)
%         longLabel = [longLabel, strtrim(labelMat(i, :)), '3', strtrim(labelMat(j, :)), '3'];
%         longState = [longState, strtrim(stateMat(i, :)), 'C', strtrim(stateMat(j, :)), 'C'];
%     end
% end
% 
% 
% [transMat, emitMat] = hmmestimate(...
%     longLabel, ...
%     longState, ...
%     'SYMBOLS', showedS, 'STATENAMES', hiddenS);

transMat = [0,0.852459016393443,0.147540983606557,0,0;0,0.609022556390978,0.390977443609023,0,0;0,0,0,0,1;0,0,0,0,1;0.953119277255524,0,0,0.0468807227444757,0];
emitMat = [0.409836065573771,0.295081967213115,0.196721311475410,0,0.0327868852459016,0.0655737704918033;0.413533834586466,0.112781954887218,0.225563909774436,0.233082706766917,0.0150375939849624,0;0.147540983606557,0.426229508196721,0.360655737704918,0,0.0655737704918033,0;0,0,0,0,0.333333333333333,0.666666666666667;0,0,1,0,0,0];

% alphaPoss = ones(1, alphaN) / alphaN;
% 
% alphaToStroke = cat(3, ...
% [   1 0 0 0 0 0;    %A
%     0 0 1 0 0 0;
%     0 1 0 0 0 0;
%     0 0 0 1 0 0;
%     0 0.5 0.5 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %B
%     0 0 1 0 0 0;
%     0 0 0 0 1 0;
%     0 0 0 0 1 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0 0 0 0 1;    %C
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %D
%     0 0 1 0 0 0;
%     0 0 0 0 1 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %E
%     0 0.5 0.5 0 0 0;
%     0 0 0 1 0 0;
%     0 0.5 0.5 0 0 0;
%     1 0 0 0 0 0;
%     0 0.5 0.5 0 0 0], ...
% [   1 0 0 0 0 0;    %F
%     0 0 1 0 0 0;
%     0 0.5 0.5 0 0 0;
%     1 0 0 0 0 0;
%     0 0.5 0.5 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0 0 0 1 0;    %G
%     0.5 0.5 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %H
%     0 0 1 0 0 0;
%     1 0 0 0 0 0;
%     0 0 0 1 0 0;
%     0 0.5 0.5 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0.5 0.5 0 0 0;    %I
%     0.5 0 0 0.5 0 0;
%     1 0 0 0 0 0;
%     0.5 0 0 0.5 0 0;
%     0 0.5 0.5 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0 0 0 1 0;    %J
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %K
%     0 0 1 0 0 0;
%     1 0 0 0 0 0;
%     0 1 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %L
%     0 0.5 0.5 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %M
%     0 0 1 0 0 0;
%     0 1 0 0 0 0;
%     0 0 1 0 0 0;
%     0 1 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %N
%     0 0 1 0 0 0;
%     0 1 0 0 0 0;
%     0 0 1 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0 0 0 0 1;    %O
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %P
%     0 0 1 0 0 0;
%     0 0 0 0 1 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0 0 0 0 1;    %Q
%     0 1 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   1 0 0 0 0 0;    %R
%     0 0 1 0 0 0;
%     0 0 0 0 1 0;
%     0 1 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0 0 0 0 1;    %S
%     0 0 0 0 1 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0.5 0.5 0 1 0;    %T
%     0.5 0 0 0.5 0 0;
%     1 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0 0 0 0 1;    %U
%     0.5 0.5 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 1 0 0 0 0;    %V
%     0 0 1 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 1 0 0 0 0;    %W
%     0 0 1 0 0 0;
%     0 1 0 0 0 0;
%     0 0 1 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 1 0 0 0 0;    %X
%     0 0 0.5 0.5 0 0;
%     1 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 1 0 0 0 0;    %Y
%     0 0 1 0 0 0;
%     1 0 0 0 0 0;
%     0.5 0.5 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0], ...
% [   0 0.5 0.5 0 0 0;    %Z
%     1 0 0 0 0 0;
%     0 0.5 0.5 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0;
%     0 0 0 0 0 0]);
%     
% 
% transMat = zeros(size(hiddenS, 2), size(hiddenS, 2));
% emitMat = zeros(size(hiddenS, 2), size(showedS, 2));
% 
% %% calculate transmission matrix
% transMat(3, 5) = 1; %'E' -> 'C'
% transMat(4, 5) = 1; %'S' -> 'C'
% 
% BM = 0;
% BE = 0;
% S = 0;
% MM = 0;
% ME = 0;
% 
% for i = 1 : alphaN
%     stro = alphaToStroke(:, :, i);
%     if ~any(stro(2, :))
%         S = S + alphaPoss(i);
%     elseif ~any(stro(3, :))
%         BE = BE + alphaPoss(i);
%     else
%         BM = BM + alphaPoss(i);
%         j = 4;
%         while j <= 6 && any(stro(j, :))
%             MM = MM + alphaPoss(i);
%             j = j + 1;
%         end
%         ME = ME + alphaPoss(i);
%     end
% end
% 
% transMat(1, 2) = BM / (BM + BE);        %'B' -> 'M'
% transMat(1, 3) = 1 - transMat(1, 2);    %'B' -> 'E'
% transMat(2, 2) = MM / (MM + ME);        %'M' -> 'M'
% transMat(2, 3) = 1 - transMat(2, 2);    %'M' -> 'E'
% transMat(5, 5) = S / (BM + BE + S);     %'C' -> 'S'
% transMat(5, 1) = 1 - transMat(5, 5);    %'C' -> 'B'
% 
% %% calculate emission matrix
% 
% emitMat(5, 3) = 1; %'C' -> LD2RU
% 
% for i = 1 : alphaN
%     stro = alphaToStroke(:, :, i);
%     j = 1;
%     while j + 1 <= 6 && any(stro(j + 1, :))
%         j = j + 1;
%     end
%     if j == 1
%         emitMat(4, :) = emitMat(4, :) + alphaPoss(i) * stro(1, :); %'S'
%     elseif j == 2
%         emitMat(1, :) = emitMat(1, :) + alphaPoss(i) * stro(1, :); %'B'
%         emitMat(3, :) = emitMat(3, :) + alphaPoss(i) * stro(2, :); %'E'
%     else
%         emitMat(1, :) = emitMat(1, :) + alphaPoss(i) * stro(1, :); %'B'
%         for k = 2 : j - 1
%            emitMat(2, :) = emitMat(2, :) + alphaPoss(i) * stro(k, :); %'M' 
%         end
%         emitMat(3, :) = emitMat(3, :) + alphaPoss(i) * stro(j, :); %'E'
%     end
% end
% 
% emitMat = emitMat ./ repmat(sum(emitMat, 2), 1, showedN);
% 
%% HMMmodel
try
    stateSeq = hmmviterbi(labelSeq, transMat, emitMat, ...
    'SYMBOLS', showedS, 'STATENAMES', hiddenS);
catch
    stateSeq = '';
    fprintf('Zero transmission probability!\nDummy state sequence generated!\n');
end