%% 多边形

clc;clear;
TimeDomin = zeros(4,3);

L = 210/2;v = 100/3.6;
mid = L/(v);
mid2 = (L+2.6)/(v);
period = pi*0.42/(v);
part = round((mid-period)/(1e-3)):round((mid2+period)/(1e-3));


subplot(221)
load ./dataset/Poly_6_spd_100_onW1.mat
t = time;
plot(t(part),ACC(part));
xlabel('时间(s)','FontSize',18) 
set(gca,'FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',18)
xlim([3.72 3.92])
title('6阶多边形输入','FontSize',18)
tmp = getTimeDominFeatures(ACC(part));
TimeDomin(1,:) = [tmp(1),tmp(2),tmp(8)^2];
prettyAxes().gbase()
subplot(222)
load ./dataset/Poly_7_spd_100_onW1.mat
t = time;
plot(t(part),ACC(part));
xlabel('时间(s)','FontSize',18)
set(gca,'FontSize',18)
ylabel('梁中点振动加速度(m/s²)','FontSize',18)
xlim([3.72 3.92])
title('7阶多边形输入','FontSize',18)
tmp = getTimeDominFeatures(ACC(part));
TimeDomin(2,:) = [tmp(1),tmp(2),tmp(8)^2];
prettyAxes().gbase()
subplot(223)
load ./dataset/Poly_8_spd_100_onW1.mat
t = time;
plot(t(part),ACC(part));
xlabel('时间(s)','FontSize',18)
set(gca,'FontSize',18)
ylabel('梁中点振动加速度(m/s²)','FontSize',18)
xlim([3.72 3.92])
title('8阶多边形输入','FontSize',18)
tmp = getTimeDominFeatures(ACC(part));
TimeDomin(3,:) = [tmp(1),tmp(2),tmp(8)^2];
prettyAxes().gbase()
subplot(224)
load ./dataset/Poly_9_spd_100_onW1.mat
t = time;
plot(t(part),ACC(part));
xlabel('时间(s)','FontSize',18)
set(gca,'FontSize',18)
ylabel('梁中点振动加速度(m/s²)','FontSize',18)
title('9阶多边形输入','FontSize',18)
tmp = getTimeDominFeatures(ACC(part));
TimeDomin(4,:) = [tmp(1),tmp(2),tmp(8)^2];
xlim([3.72 3.92])
prettyAxes().gbase()

%% 擦伤
clc;clear;
TimeDomin = zeros(4,3);

L = 210/2;v = 100/3.6;
mid = L/(v);
mid2 = (L+2.6)/(v);
period = pi*0.42/(v);
part = round((mid-period)/(1e-3)):round((mid2+period)/(1e-3));

figure
subplot(221)
load ./dataset/Crusie_0.01_spd_100_onW1.mat
t = time;
plot(t(part),ACC(part));
xlabel('时间(s)','FontSize',18) 
set(gca,'FontSize',14)
ylabel('梁中点振动加速度(m/s²)','FontSize',18)
xlim([3.72 3.92])
title('10mm擦伤输入','FontSize',18)
tmp = getTimeDominFeatures(ACC(part));
TimeDomin(1,:) = [tmp(1),tmp(2),tmp(8)^2];
prettyAxes().gbase()
subplot(222)
load ./dataset/Crusie_0.02_spd_100_onW1.mat
t = time;
plot(t(part),ACC(part));
xlabel('时间(s)','FontSize',18)
set(gca,'FontSize',18)
ylabel('梁中点振动加速度(m/s²)','FontSize',18)
xlim([3.72 3.92])
title('20mm擦伤输入','FontSize',18)
tmp = getTimeDominFeatures(ACC(part));
TimeDomin(2,:) = [tmp(1),tmp(2),tmp(8)^2];
prettyAxes().gbase()
subplot(223)
load ./dataset/Crusie_0.03_spd_100_onW1.mat
t = time;
plot(t(part),ACC(part));
xlabel('时间(s)','FontSize',18)
set(gca,'FontSize',18)
ylabel('梁中点振动加速度(m/s²)','FontSize',18)
xlim([3.72 3.92])
title('30mm擦伤输入','FontSize',18)
tmp = getTimeDominFeatures(ACC(part));
TimeDomin(3,:) = [tmp(1),tmp(2),tmp(8)^2];
prettyAxes().gbase()
subplot(224)
load ./dataset/Crusie_0.04_spd_100_onW1.mat
t = time;
plot(t(part),ACC(part));
xlabel('时间(s)','FontSize',18)
set(gca,'FontSize',18)
ylabel('梁中点振动加速度(m/s²)','FontSize',18)
title('40mm擦伤输入','FontSize',18)
tmp = getTimeDominFeatures(ACC(part));
TimeDomin(4,:) = [tmp(1),tmp(2),tmp(8)^2];
xlim([3.72 3.92])
prettyAxes().gbase()