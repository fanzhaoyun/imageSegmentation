clear;
clc;
%-----------------------¶ÁÈ¡Í¼Ïñ---------------------------
figure
load allimsegs2
I = imread('D:\ImageSource\cmuGeometricContextDataset\alley01.jpg');
I = rgb2gray(I);
subplot(1,2,1);
imshow(I);
title('Ô­Í¼Ïñ');
m=size(I,1);
n=size(I,2);
% r=I(:,:,1);
% g=I(:,:,2);
% b=I(:,:,3);
% r1=reshape(r,m*n,1);
% g1=reshape(g,m*n,1);
% b1=reshape(b,m*n,1);
gray=reshape(I,m*n,1);
% [u1,center1] = k_means(double(r1),4,100,1e-5);
% [u2,center2] = k_means(double(g1),4,100,1e-5);
% [u3,center3] = k_means(double(b1),4,100,1e-5);
% [u1,C1] = kmeans(double(r1),544,'maxiter',100);
% [u2,C2] = kmeans(double(g1),544,'maxiter',100);
% [u3,C3] = kmeans(double(b1),544,'maxiter',100);
[u,C] = kmeans(double(gray),5,'maxiter',1000);
img=uint8(zeros(size(I)));
step = fix(256./5);
for i = 1 : 5
%     r1(u1==i,:) = C1(i);
%     g1(u2==i,:) = C2(i);
%     b1(u3==i,:) = C3(i);
    gray1(u==i,:) = i*step;
end
% r1=reshape(r1,m,n);
% g1=reshape(g1,m,n);
% b1=reshape(b1,m,n);
% r1=mapn(r1,255);
% g1=mapn(g1,255);
% b1=mapn(b1,255);
% img(:,:,1) = r1;
% img(:,:,2) = g1;
% img(:,:,3) = b1;
img = reshape(gray1,m,n);
subplot(1,2,2);
imshow(uint8(img));
title('½á¹ûÍ¼Ïñ');

