clear;clc;
parameterLoadForchapter2_5
j = 1;
%% 模型验证
% N_set = [6 7 8 9];
% N_set = 0;
% for i = 1:length(N_set)
%     N1 = N_set(i);
%     N2 = 0;
%     simOut = sim('chapter2_5_1.slx');
%     ACC(:,j) = simOut.acc_Der.Data;
%     j = j+1;
% end

%% figure 2.17——2.18
N1 = 0;N2 = 0;
simOut = sim('chapter2_5_1.slx');
t = simOut.dis_mid.Time;
y = simOut.dis_mid.Data;

figure(1)
xx = LowPass(y,0.01,20);
plot(t,xx)
hold on

% plot(t,y)
% hold on

xlabel('时间(s)','FontSize',14)
ylabel('梁中点垂向位移(m)','FontSize',14)
UMdisplacement = csvread('简化模型.csv',2,0);
plot(UMdisplacement(:,1),UMdisplacement(:,3));
legend('lowpass','UM')
legend('lowpass','SIMULINK','UM')
legend('SIMULINK','UM')

figure(2)

xx = UMdisplacement(:,5);
xx(1:1687) = LowPass(xx(1:1687),0.01,3);
xx(1850:end) = LowPass(xx(1850:end),0.01,3);

plot(UMdisplacement(:,1),xx)
hold on 
t2 = simOut.acc_Der.Data;
y2 = simOut.dis_mid.Time+1.933;
t2 = LowPass(t2,0.0001,130)
plot(y2,t2)
% xlim([2.5 5])
% ylim([-70 90])

xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
legend('SIMULINK','UM')


plot(UMdisplacement(:,1),UMdisplacement(:,6))





