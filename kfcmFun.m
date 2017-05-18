function [center, U, obj_fcn] = kfcmFun(data, cluster_n,maxit, kernel_b,expo)
data_n = size(data, 1); % 求出data的第一维(rows)数,即样本个数
obj_fcn = zeros(100, 1);	% 初始化输出参数obj_fcn
U = initkfcm(cluster_n, data_n);	% 初始化模糊分配矩阵,使U满足列上相加为1
index = randperm(data_n);   % 对样本序数随机排列
center_old = data(index(1:cluster_n),:);  % 选取随机排列的序数的前cluster_n个
for i = 1:maxit
	[U, center, obj_fcn(i)] = stepkfcm(data,U,center_old, expo, kernel_b);
    fprintf('Iteration count = %d, obj. fcn = %f\n', i, obj_fcn(i));
    center_old = center;    % 用新的聚类中心代替老的聚类中心
	% 终止条件判别
	if i > 1
		if abs(obj_fcn(i) - obj_fcn(i-1)) < 1e-5
            break; 
        end
	end
end
iter_n = i;	
obj_fcn(iter_n+1:100) = [];

function U = initkfcm(cluster_n, data_n)
% 初始化fcm的隶属度函数矩阵
U = rand(cluster_n, data_n);
col_sum = sum(U);
U = U./col_sum(ones(cluster_n, 1), :);

function [U_new,center_new,obj_fcn] = stepkfcm(data,U,center,expo,kernel_b)
% 模糊C均值聚类时迭代的一步
feature_n = size(data,2);  % 特征维数
cluster_n = size(center,1); % 聚类个数
mf = U.^expo;      
% 计算新的聚类中心;
KernelMat = gaussKernel(center,data,kernel_b); % 计算高斯核矩阵
num = mf.*KernelMat * data;   
den = sum(mf.*KernelMat,2);  
center_new = num./(den*ones(1,feature_n));

% 计算新的隶属度矩阵；
kdist = distkfcm(center_new, data, kernel_b);    % 计算距离矩阵
obj_fcn = sum(sum((kdist.^2).*mf));  % 计算目标函数值
tmp = kdist.^(-1/(expo-1));     
U_new = tmp./(ones(cluster_n, 1)*sum(tmp)); 

function out = distkfcm(center, data, kernel_b)
% 计算样本点距离聚类中心的距离
cluster_n = size(center, 1);
data_n = size(data, 1);
out = zeros(cluster_n, data_n);
for i = 1:cluster_n % 对每个聚类中心 
    vi = center(i,:);
    out(i,:) = 2-2*gaussKernel(vi,data,kernel_b);
end

function out = gaussKernel(center,data,kernel_b)
% 高斯核函数计算
dist = zeros(size(center, 1), size(data, 1));
for k = 1:size(center, 1)
    dist(k, :) = sqrt(sum(((data-ones(size(data,1),1)*center(k,:)).^2)',1));
end
out = exp(-dist.^2/kernel_b^2);




