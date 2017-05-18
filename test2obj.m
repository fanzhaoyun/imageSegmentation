clear;
clc;

load img_list.mat

DBpath = 'D:\ImageSource\Weizmann_Seg_DB_2obj\';
for j=1:length(fls)
    filepath = strcat(DBpath,fls(j).name,'\src_color\',fls(j).name,'.png');
    I = imread(filepath);
    I = rgb2gray(I);
    m=size(I,1);
    n=size(I,2);
    gray=reshape(I,m*n,1);
    options = [2;1000;1e-5;1];
    claNum = 3;
    [uk,Ck] = kmeans(double(gray),claNum,'maxiter',1000,'Display','final','Replicates',1);
    [centerf,uf,objf] = fcm(double(gray),claNum,options);
    [centerkf,ukf,objkf] = kfcmFun(double(gray),claNum,1000,300,2);
    [~,indk] = sort(Ck);
    [~,indf] = sort(centerf);
    [~,indkf] = sort(centerkf);
    for i = 1 : size(uk,1)
        uk(i) = indk(uk(i));
    end
    uf = uf(indf,:);
    ukf = ukf(indkf,:);
    step = fix(256./claNum);
    [~,indexf] = max(uf);
    [~,indexkf] = max(ukf);
    grayk = zeros(size(gray));
    grayf = zeros(size(gray));
    graykf = zeros(size(gray));
    for i = 1 : claNum
        grayk(uk==i,:) = i*step;
        grayf(indexf==i,:) = i*step;
        graykf(indexkf==i,:) = i*step;
    end
    imgk = reshape(grayk,m,n);
    imgf = reshape(grayf,m,n);
    imgkf = reshape(graykf,m,n);
    kpath = strcat(DBpath,fls(j).name,'\kmeans');
    fpath = strcat(DBpath,fls(j).name,'\fcm');
    kfpath = strcat(DBpath,fls(j).name,'\kfcm');
    if ~exist(kpath)
        mkdir(kpath);
    end
    if ~exist(fpath)
        mkdir(fpath);
    end
    if ~exist(kfpath)
        mkdir(kfpath);
    end
    kmeanspath = strcat(kpath,'\',fls(j).name,'.png');
    fcmpath = strcat(fpath,'\',fls(j).name,'.png');
    kfcmpath = strcat(kfpath,'\',fls(j).name,'.png');
    imwrite(uint8(imgk),kmeanspath);
    imwrite(uint8(imgf),fcmpath);
    imwrite(uint8(imgkf),kfcmpath);
end;