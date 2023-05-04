%%%%%%%%%%%%%%%%%%%%%%%%% Figure2_12and2_14.m%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          本文件绘制论文图2.12至2.13                                           %
%          作者：余道洪                                                        %
%          修改日期：2023.4.12                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
parameterLoadForchapter2_4
j = 1;
A_set = [3e-4,2.75e-4,2.5e-4];
for N1 = 6:8
    N2 = N1;
    A = A_set(N1-5);
    simOut = sim('chapter2_4.slx');
    P1_2DoF(:,j) = simOut.P1_2DoF.Data;
    P2_2DoF(:,j) = simOut.P2_2DoF.Data;
    P1_CPLT(:,j) = simOut.P1_CPLT.Data;
    P2_CPLT(:,j) = simOut.P2_CPLT.Data;
    Fc1(:,j) = simOut.Fc1.Data;
    Fc2(:,j) = simOut.Fc2.Data;
    Zb(:,j) = simOut.Zb.Data;
    j = j+1;
end
t = simOut.Zb.Time;
%% 
h1=figure()
for i = 1:3 
colorset= [242 121 112;50 184 151;199 109 162] /255;
linetype = {'-','--',':'};
Lwidth = [1.5 2 2];
subplot(223)
plot(t(400:600),P2_2DoF(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
Title = ['二自由度两轴车模型多边形激励下'];
title(Title,'FontSize',14)
subtitle('2位轮对轮轨力','FontSize',14)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
legend('6阶','7阶','8阶')
set(gca,'FontSize',14);
prettyAxes().gbase()

subplot(224)
plot(t(400:600),P2_CPLT(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
Title = ['单节车辆垂向振动多边形激励下'];
title(Title,'FontSize',18)
subtitle('2位轮对轮轨力','FontSize',18)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',18)
ylabel('动态附加力(N)','FontSize',18)
hold on 
legend('6阶','7阶','8阶')
set(gca,'FontSize',14);
prettyAxes().gbase()

subplot(221)
plot(t(400:600),P1_2DoF(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
Title = ['二自由度两轴车模型多边形激励下'];
subtitle('1位轮对轮轨力','FontSize',18)
title(Title,'FontSize',18)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',18)
ylabel('动态附加力(N)','FontSize',18)
hold on 
legend('6阶','7阶','8阶')
set(gca,'FontSize',14);
prettyAxes().gbase()

subplot(222)
plot(t(400:600),P1_CPLT(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
Title = ['单节车辆垂向振动多边形激励下'];
subtitle('1位轮对轮轨力','FontSize',18)
title(Title,'FontSize',18)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',18)
ylabel('动态附加力(N)','FontSize',18)
hold on 
legend('6阶','7阶','8阶')
set(gca,'FontSize',14);
prettyAxes().gbase()
end
set(h1,'position',[150,100,1050,650]);
%% 图2.11
h3 = figure()
for i = 1 :3

    subplot(311)
    plot(t(400:600),Fc1(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
    Title = ['单节车辆垂向振动模型多边形激励下前悬挂阻尼力'];
    title(Title,'FontSize',18)
    xlim([0.4 0.6])
    xlabel('时间(s)','FontSize',18)
    ylabel('前悬挂阻尼力(N)','FontSize',18)
    hold on
    legend('6阶','7阶','8阶')
    set(gca,'FontSize',14);
    prettyAxes().gbase()

    subplot(312)
    plot(t(400:600),Fc2(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
    Title = ['单节车辆垂向振动模型多边形激励下后悬挂阻尼力'];
    title(Title,'FontSize',18)
    xlim([0.4 0.6])
    xlabel('时间(s)','FontSize',18)
    ylabel('后悬挂阻尼力(N)','FontSize',18)
    legend('6阶','7阶','8阶')
    set(gca,'FontSize',14);
    hold on 
    prettyAxes().gbase()

    subplot(313)
    plot(t(400:600),Zb(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
    Title = ['单节车辆垂向振动模型多边形激励下车体垂向位移'];
    title(Title,'FontSize',18)
    xlim([0.4 0.6])
    xlabel('时间(s)','FontSize',18)
    ylabel('车体垂向位移(m)','FontSize',18)
    legend('6阶','7阶','8阶')
    set(gca,'FontSize',14);
    hold on
    prettyAxes().gbase()
end
set(h3,'position',[500,25,850,750]);