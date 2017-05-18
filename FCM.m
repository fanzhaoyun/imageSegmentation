clear;
clc;
%% FCM实现图像分割
figure
I=imread('1.jpg'); %自行更改图像名称
subplot(1,2,1);
imshow(I);
title('原图像');
m=size(I,1);
n=size(I,2);
r=I(:,:,1);
g=I(:,:,2);
b=I(:,:,3);
r1=reshape(r,m*n,1);
g1=reshape(g,m*n,1);
b1=reshape(b,m*n,1);
options = [2;100;1e-5;1];
[center1,u1,obj] = fcm(double(r1),4,options);
[center2,u2,obj] = fcm(double(g1),4,options);
[center3,u3,obj] = fcm(double(b1),4,options);
img=uint8(zeros(size(I)));
for i=1:m
    for j=1:n
        [~,k] = max(u1(:,(i-1)*m+j));
        img(i,j,1)=center1(k(1));
    end
end
for i=1:m
    for j=1:n
        [~,k] = max(u2(:,(i-1)*m+j));
        img(i,j,2)=center2(k(1));
    end
end
for i=1:m
    for j=1:n
        distance=abs(center3-double(I(i,j,3)));
        [~,k] = max(u3(:,(i-1)*m+j));
        img(i,j,3)=center3(k(1));
    end
end

subplot(1,2,2);
imshow(uint8(img));
title('结果图像');

%% mytest

img=uint8(zeros(size(I)));
for i=1:m
    for j=1:n
        [~,k] = max(u1(:,(j-1)*m+i));
        img(i,j,1)=center1(k(1));
    end
end
for i=1:m
    for j=1:n
        [~,k] = max(u2(:,(j-1)*m+i));
        img(i,j,2)=center2(k(1));
    end
end
for i=1:m
    for j=1:n
        distance=abs(center3-double(I(i,j,3)));
        [~,k] = max(u3(:,(j-1)*m+i));
        img(i,j,3)=center3(k(1));
    end
end

imshow(uint8(img));
title('结果图像');