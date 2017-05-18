clear;
clc;

load clusterdemo.dat

options = [2;1000;1e-7;1];
claNum = 3;
[uk,Ck] = kmeans(double(clusterdemo),claNum,'maxiter',1000,'Display','final','Replicates',3);
[centerf,uf,objf] = fcm(double(clusterdemo),claNum,options);
[centerkf,ukf,objkf] = kfcmFun(clusterdemo,claNum,1000,3,2);

maxU = max(uf);
index1 = find(uf(1,:) == maxU);
index2 = find(uf(2,:) == maxU);
index3 = find(uf(3,:) == maxU);
plot3(clusterdemo(index1,1),clusterdemo(index1,2),clusterdemo(index1,3),'ob')
hold on
plot3(clusterdemo(index2,1),clusterdemo(index2,2),clusterdemo(index2,3),'or')
plot3(clusterdemo(index3,1),clusterdemo(index3,2),clusterdemo(index3,3),'og')
plot3(centerf(1,1),centerf(1,2),centerf(1,3),'xb','MarkerSize',15,'LineWidth',3)
plot3(centerf(2,1),centerf(2,2),centerf(2,3),'xr','MarkerSize',15,'LineWidth',3)
plot3(centerf(3,1),centerf(3,2),centerf(3,3),'xg','MarkerSize',15,'LineWidth',3)
title('fcm聚类结果')
hold off

figure;
index1 = find(uk == 1);
index2 = find(uk == 2);
index3 = find(uk == 3);
plot3(clusterdemo(index1,1),clusterdemo(index1,2),clusterdemo(index1,3),'ob')
hold on
plot3(clusterdemo(index2,1),clusterdemo(index2,2),clusterdemo(index2,3),'or')
plot3(clusterdemo(index3,1),clusterdemo(index3,2),clusterdemo(index3,3),'og')
plot3(Ck(1,1),Ck(1,2),Ck(1,3),'xb','MarkerSize',15,'LineWidth',3)
plot3(Ck(2,1),Ck(2,2),Ck(2,3),'xr','MarkerSize',15,'LineWidth',3)
plot3(Ck(3,1),Ck(3,2),Ck(3,3),'xg','MarkerSize',15,'LineWidth',3)
title('kmeans聚类结果')
hold off

figure;
maxU = max(ukf);
index1 = find(ukf(1,:) == maxU);
index2 = find(ukf(2,:) == maxU);
index3 = find(ukf(3,:) == maxU);
plot3(clusterdemo(index1,1),clusterdemo(index1,2),clusterdemo(index1,3),'ob')
hold on
plot3(clusterdemo(index2,1),clusterdemo(index2,2),clusterdemo(index2,3),'or')
plot3(clusterdemo(index3,1),clusterdemo(index3,2),clusterdemo(index3,3),'og')
plot3(centerkf(1,1),centerkf(1,2),centerkf(1,3),'xb','MarkerSize',15,'LineWidth',3)
plot3(centerkf(2,1),centerkf(2,2),centerkf(2,3),'xr','MarkerSize',15,'LineWidth',3)
plot3(centerkf(3,1),centerkf(3,2),centerkf(3,3),'xg','MarkerSize',15,'LineWidth',3)
title('kfcm聚类结果')
hold off

%% 二维测试
clear;
clc;
load fcmdata.dat
options = [2;1000;1e-7;1];
claNum = 2;
[uk,Ck] = kmeans(fcmdata,claNum,'maxiter',1000,'Display','final','Replicates',3);
[centers,U] = fcm(fcmdata,claNum,options);

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
plot(fcmdata(index1,1),fcmdata(index1,2),'ob')
hold on
plot(fcmdata(index2,1),fcmdata(index2,2),'or')
plot(centers(1,1),centers(1,2),'xb','MarkerSize',15,'LineWidth',3)
plot(centers(2,1),centers(2,2),'xr','MarkerSize',15,'LineWidth',3)
hold off

figure;
index1 = find(uk == 1);
index2 = find(uk == 2);
plot(fcmdata(index1,1),fcmdata(index1,2),'ob')
hold on
plot(fcmdata(index2,1),fcmdata(index2,2),'or')
plot(Ck(1,1),Ck(1,2),'xb','MarkerSize',15,'LineWidth',3)
plot(Ck(2,1),Ck(2,2),'xr','MarkerSize',15,'LineWidth',3)
title('kmeans聚类结果')
hold off
