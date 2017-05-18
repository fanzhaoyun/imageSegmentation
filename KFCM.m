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
[center1,u,obj] = kfcmFun(double(r1),4,150,2);
[center2,u,obj] = kfcmFun(double(g1),4,150,2);
[center3,u,obj] = kfcmFun(double(b1),4,150,2);
img=uint8(zeros(size(I)));
for i=1:m
    for j=1:n
        distance=abs(center1-double(I(i,j,1)));
        k = find(distance == min(distance));
        img(i,j,1)=center1(uint8(k(1)));
    end
end
for i=1:m
    for j=1:n
        distance=abs(center2-double(I(i,j,2)));
        k = find(distance == min(distance));
        img(i,j,2)=center2(uint8(k(1)));
    end
end
for i=1:m
    for j=1:n
        distance=abs(center3-double(I(i,j,3)));
        k = find(distance == min(distance));
        img(i,j,3)=center3(uint8(k(1)));
    end
end
subplot(1,2,2);
imshow(uint8(img));
title('结果图像');

