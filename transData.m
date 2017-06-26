clear; close all; clc;

dataFolder = 'DATA/';
windowSize = 80;
tt = 20;
trainRate = 0.8;

%% feature matrix
X_train_acc = [];
Y_train_acc = [];
Z_train_acc = [];
X_train_vel = [];
Y_train_vel = [];
Z_train_vel = [];
X_train_dis = [];
Y_train_dis = [];
Z_train_dis = [];
y_train = [];

X_test_acc = [];
Y_test_acc = [];
Z_test_acc = [];
X_test_vel = [];
Y_test_vel = [];
Z_test_vel = [];
X_test_dis = [];
Y_test_dis = [];
Z_test_dis = [];
y_test = [];

%% get features
allFolder = dir(dataFolder);

for i = 3 : length(allFolder)
    folder = dir([dataFolder, allFolder(i).name, '/']);
    splitDir = regexp(allFolder(i).name, ' ', 'split');
    label = char(splitDir(1));
    
    Xacc = [];
    Yacc = [];
    Zacc = [];
    Xvel = [];
    Yvel = [];
    Zvel = [];
    Xdis = [];
    Ydis = [];
    Zdis = [];
    y = []; 
    
    for j = 3 : length(folder)
        A = load([dataFolder, allFolder(i).name, '/', folder(j).name]);
        A = [A(:, 1), A(:, 2) - mean(A(:, 2)), A(:, 3) - mean(A(:, 3)), A(:, 4)- mean(A(:, 4))];
        A = interpolation(A, tt);
        [V, D] = tran_X_2(A, tt);
        
        if size(D, 1) < windowSize
            continue;
        end       
       
        l = 1;
        while l <= size(D, 1)
            left = 1;
            right = 1;
            if l + windowSize > size(D, 1)
                left = size(A, 1) - windowSize + 1;
                right = size(A, 1);
            else
                left = l;
                right = l + windowSize - 1;
            end
            Xacc = [Xacc; A(left : right, 2)'];
            Yacc = [Yacc; A(left : right, 3)'];
            Zacc = [Zacc; A(left : right, 4)'];
            Xvel = [Xvel; V(left : right, 2)'];
            Yvel = [Yvel; V(left : right, 3)'];
            Zvel = [Zvel; V(left : right, 4)'];
            Xdis = [Xdis; D(left : right, 2)'];
            Ydis = [Ydis; D(left : right, 3)'];
            Zdis = [Zdis; D(left : right, 4)'];
            y = [y; label];
            if right == size(A, 1)
                break;
            end
            
            l = l + windowSize / 2;
        end   
    end
    trainId = floor(trainRate * size(y, 1));
        
    X_train_acc = [X_train_acc; Xacc(1 : trainId, :)];
    Y_train_acc = [Y_train_acc; Yacc(1 : trainId, :)];
    Z_train_acc = [Z_train_acc; Zacc(1 : trainId, :)];
    X_train_vel = [X_train_vel; Xvel(1 : trainId, :)];
    Y_train_vel = [Y_train_vel; Yvel(1 : trainId, :)];
    Z_train_vel = [Z_train_vel; Zvel(1 : trainId, :)];
    X_train_dis = [X_train_dis; Xdis(1 : trainId, :)];
    Y_train_dis = [Y_train_dis; Ydis(1 : trainId, :)];
    Z_train_dis = [Z_train_dis; Zdis(1 : trainId, :)];
    y_train = [y_train; y(1 : trainId, :)];

    X_test_acc = [X_test_acc; Xacc(trainId + 1 : end, :)];
    Y_test_acc = [Y_test_acc; Yacc(trainId + 1 : end, :)];
    Z_test_acc = [Z_test_acc; Zacc(trainId + 1 : end, :)];
    X_test_vel = [X_test_vel; Xvel(trainId + 1 : end, :)];
    Y_test_vel = [Y_test_vel; Yvel(trainId + 1 : end, :)];
    Z_test_vel = [Z_test_vel; Zvel(trainId + 1 : end, :)];
    X_test_dis = [X_test_dis; Xdis(trainId + 1 : end, :)];
    Y_test_dis = [Y_test_dis; Ydis(trainId + 1 : end, :)];
    Z_test_dis = [Z_test_dis; Zdis(trainId + 1 : end, :)];
    y_test = [y_test; y(trainId + 1 : end, :)];
end

%% save files
cd(dataFolder);

save('X_acc_train.txt', 'X_train_acc', '-ascii');
save('Y_acc_train.txt', 'Y_train_acc', '-ascii');
%save('Z_train_acc.txt', 'Z_train_acc', '-ascii');
save('X_vel_train.txt', 'X_train_vel', '-ascii');
save('Y_vel_train.txt', 'Y_train_vel', '-ascii');
%save('Z_vel_train.txt', 'Z_train_vel', '-ascii');
save('X_dis_train.txt', 'X_train_dis', '-ascii');
save('Y_dis_train.txt', 'Y_train_dis', '-ascii');
%save('Z_dis_train.txt', 'Z_train_dis', '-ascii');

fid = fopen('y_train_label.txt', 'w');
fprintf(fid, '%c\n', y_train);
fclose(fid);

save('X_acc_test.txt', 'X_test_acc', '-ascii');
save('Y_acc_test.txt', 'Y_test_acc', '-ascii');
%save('Z_acc_test.txt', 'Z_test_acc', '-ascii');
save('X_vel_test.txt', 'X_test_vel', '-ascii');
save('Y_vel_test.txt', 'Y_test_vel', '-ascii');
%save('Z_vel_test.txt', 'Z_test_vel', '-ascii');
save('X_dis_test.txt', 'X_test_dis', '-ascii');
save('Y_dis_test.txt', 'Y_test_dis', '-ascii');
%save('Z_dis_test.txt', 'Z_test_dis', '-ascii');

fid = fopen('y_test_label.txt', 'w');
fprintf(fid, '%c\n', y_test);
fclose(fid);

cd('../');