clc;
clear;
%% 多边形
A=10;
R=400;
Rmat = ones(1,629)*R;
fai = -pi:0.01:pi;
for i = 1 :4
    R0 = R + A*sin(i*fai)';
    figure() 
    polarplot(fai,R0,'r');
    hold on
    polarplot(fai,Rmat,'k--');
    title([num2str(i),'阶多边形']);
end

