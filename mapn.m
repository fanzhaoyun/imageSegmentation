function [ img ] = mapn( I ,n)
%MAP256 此处显示有关此函数的摘要
%   此处显示详细说明

I = double(I);
img = (I - min(min(I))) ./ (max(max(I)) - min(min(I))) * n;

end

