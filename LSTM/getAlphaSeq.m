clc; clear; close all;

labelSeq = char(textread('hmm_input.txt', '%s'));
%%
alphabet = 'A' : 'Z';

%% HMM split
stateSeq = HMMsplit(labelSeq);
labelSeq('C' == stateSeq) = '0';
splitSeq = char(regexp(labelSeq, '0', 'split'));

%% min editDist
alphaSeq = '';

for i = 1 : size(splitSeq, 1)
    stateSeq = strtrim(splitSeq(i, :));
    if length(stateSeq) <= 0
        continue;
    end
    distVec = zeros(1, 26);
    for j = 1 : 26
        if j == 1       %A
            s = '13243';
            distVec(j) = editDist(stateSeq, s);
            s = '13242';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 2   %B
            s = '1355';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 3   %C
            s = '6';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 4   %D
            s = '135';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 5   %E
            s = '124212';
            distVec(j) = editDist(stateSeq, s);
            s = '124213';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '124312';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '124313';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '134212';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '134213';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '134312';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '134313';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 6   %F
            s = '13212';
            distVec(j) = editDist(stateSeq, s);
            s = '13213';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '13312';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '13313';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 7   %G
            s = '52';
            distVec(j) = editDist(stateSeq, s);
            s = '51';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 8   %H
            s = '13142';
            distVec(j) = editDist(stateSeq, s);
            s = '13143';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 9   %I
            s = '21112';
            distVec(j) = editDist(stateSeq, s);
            s = '21113';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '21142';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '21143';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '24112';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '24113';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '24142';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '24143';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '31112';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '31113';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '31142';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '31143';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '34112';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '34113';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '34142';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '34143';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 10  %J
            s = '5';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 11  %K
            s = '1312';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 12  %L
            s = '12';
            distVec(j) = editDist(stateSeq, s);
            s = '13';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 13  %M
            s = '13232';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 14  %N
            s = '1323';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 15  %O
            s = '6';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 16  %P
            s = '135';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 17  %Q
            s = '62';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 18  %R
            s = '1352';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 19  %S
            s = '65';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 20  %T
            s = '211';
            distVec(j) = editDist(stateSeq, s);
            s = '241';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '311';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '341';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 21  %U
            s = '62';
            distVec(j) = editDist(stateSeq, s);
            s = '61';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 22  %V
            s = '23';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 23  %W
            s = '2323';
            distVec(j) = editDist(stateSeq, s);
        elseif j == 24  %X
            s = '231';
            distVec(j) = editDist(stateSeq, s);
            s = '241';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 25  %Y
            s = '2312';
            distVec(j) = editDist(stateSeq, s);
            s = '2311';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        elseif j == 26  %Z
            s = '212';
            distVec(j) = editDist(stateSeq, s);
            s = '213';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '312';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
            s = '313';
            distVec(j) = min(distVec(j), editDist(stateSeq, s));
        end
    end
    alphaSeq = [alphaSeq, '(', alphabet(min(distVec) == distVec), ')'];
end

alphaSeq


