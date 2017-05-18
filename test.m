clear;
clc;

%-----------------------¶ÁÈ¡Í¼Ïñ---------------------------
figure
% I = imread('D:\ImageSource\Weizmann_Seg_DB_1obj\100_0109\src_color\100_0109.png');
I = imread('D:\ImageSource\cmuGeometricContextDataset\alley07.jpg');
subplot(1,2,1);imshow(I);
I = rgb2gray(I);
subplot(1,2,2);imshow(I);
title('Ô­Í¼Ïñ');
m=size(I,1);
n=size(I,2);
gray=reshape(I,m*n,1);
options = [2;1000;1e-5;0];
claNum = 2;
% C(1,:) = rand(1,1)*(m*n);
% C(2,:) = rand(1,1)*(m*n);
[uk,Ck] = kmeans(double(gray),claNum,'maxiter',1000,'Display','final','Replicates',1);
[centerf,uf,objf] = fcm(double(gray),claNum,options);
[centerkf,ukf,objkf] = kfcmFun(double(gray),claNum,1000,2);
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
for i = 1 : claNum
    grayk(uk==i,:) = i*step;
    grayf(indexf==i,:) = i*step;
    graykf(indexkf==i,:) = i*step;
end
imgk = reshape(grayk,m,n);
imgf = reshape(grayf,m,n);
imgkf = reshape(graykf,m,n);
imwrite(uint8(imgk),'kmean_result.jpg');
imwrite(uint8(imgf),'fcm_result.jpg');
imwrite(uint8(imgkf),'kfcm_result.jpg');
figure;
subplot(1,3,1);imshow(uint8(imgk));
subplot(1,3,2);imshow(uint8(imgf));
subplot(1,3,3);imshow(uint8(imgkf));
title('½á¹ûÍ¼Ïñ');

