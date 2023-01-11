clear;clc;
parameterLoadForchapter2_5
j = 1;
%% 模型验证
N_set = [6 7 8 9];

for i = 1:length(N_set)
    N1 = N_set(i);
    N2 = 0;
    simOut = sim('chapter2_5_1.slx');
    ACC(:,j) = simOut.acc_Der.Data;
    j = j+1;
end

%% figure 2.17——2.18
N1 = 0;
N2 = 0;
simOut = sim('chapter2_5_1.slx');
t = simOut.dis_mid.Time;
y = simOut.dis_mid.Data;
figure(1)
plot(t,y)
hold on
xlim([3 5])
xlabel('时间(s)','FontSize',14)
ylabel('梁中点垂向位移(m)','FontSize',14)
UMdisplacement = csvread('displacement2.csv',2,0);
plot(UMdisplacement(:,1),UMdisplacement(:,2));
legend('SIMULINK','UM')
figure(2)
t2 = simOut.acc_Der.Data;
y2 = simOut.dis_mid.Time;
UMaccelration = csvread('accelreation2.csv',2,0);
plot(y2,t2)
hold on
plot(UMaccelration(:,1),UMaccelration(:,2));
xlim([3 5])
xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
legend('SIMULINK','UM')
%

%% figure2.19
% load ACC_poly_6789_on_WHEEL1.mat
figure(3)
part = 1.2e3:1.35e3;
t = simOut.acc_Der.Time;
subplot(221)
plot(t(part),ACC(part,1))
xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
xlim([3.7 4])
title('6阶多边形输入')
subplot(222)
plot(t(part),ACC(part,2))
xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
xlim([3.7 4])
title('7阶多边形输入')
subplot(223)
plot(t(part),ACC(part,3))
xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
xlim([3.7 4])
title('8阶多边形输入')
subplot(224)
plot(t(part),ACC(part,4))
xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
title('9阶多边形输入')
xlim([3.7 4])

%% table2.4

timeDominP.Six = getTimeDominFeatures(ACC(part,1));
timeDominP.Seven = getTimeDominFeatures(ACC(part,2));
timeDominP.Eight = getTimeDominFeatures(ACC(part,3));
timeDominP.Nine = getTimeDominFeatures(ACC(part,4));



%% figure2.20
j = 1;
LN_set = [40e-3 60e-3 80e-3 100e-3];
Acc = [];
for i = 1:length(LN_set)
    Ln = LN_set(i);
    simOut = sim('chapter2_5_2.slx');
    Acc(:,j) = simOut.Cru_acc.Data;
    j = j+1;
end
% load ACC_crusie_46810_on_WHEEL1.mat
part = 1.2e3:1.35e3;
ACC = Acc;
figure(4)
subplot(221)
plot(t(part),ACC(part,1))
xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
xlim([3.7 4])
title('40mm擦伤输入')
subplot(222)
plot(t(part),ACC(part,2))
xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
xlim([3.7 4])
title('60mm擦伤输入')
subplot(223)
plot(t(part),ACC(part,3))
xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
xlim([3.7 4])
title('70mm擦伤输入')
subplot(224)
plot(t(part),ACC(part,4))
xlabel('时间(s)','FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',14)
title('100mm擦伤输入')
xlim([3.7 4])
%% table2.5

timeDominC.Forty = getTimeDominFeatures(ACC(part,1));
timeDominC.Sixty = getTimeDominFeatures(ACC(part,2));
timeDominC.Eighty = getTimeDominFeatures(ACC(part,3));
timeDominC.Hundred = getTimeDominFeatures(ACC(part,4));

