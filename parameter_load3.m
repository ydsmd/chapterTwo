clc;
clear;
%% 单轮模型
mv = 42400;
jv = 1064400;
kv = 400000;
d = 2.6;
%% 弹性轨模型
% MF = 10000; % moving force - N
v = 100/3.6; % the velocity of the moving force - m/s
m = 7800*(7684e-6); % the linear density - kg/m
L = 210; % the span of the simply support bridge - m
E = 2.1e11; % the elastic modulus - N*m^-2
I = 3055e-8; % the innertial moment - m^4
kf = 6.67e7;
position = 0.5*L;


%% 不圆设置
A = 0.01;
r = 840/1000/2;

