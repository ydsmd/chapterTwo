%%%%%%%%%%%%%%%%%%%%%%%%% Figure2_9and2_10and2_11.m%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          本文件绘制论文图2.9至2.11                                            %
%          作者：余道洪                                                        %
%          修改日期：2023.4.28                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
parameterLoadForchapter2_4
j = 1;
N2 = 0;
A_set = [3e-4,2.75e-4,2.5e-4];
for N1 = 6:8
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
%% 图2.9
h1 = figure()
for i = 1:3 
colorset= [242 121 112;50 184 151;199 109 162] /255;
linetype = {'-','--',':'};
Lwidth = [1.5 2 2];
subplot(223)
plot(t(400:600),P2_2DoF(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
Title = ['二自由度两轴车模型多边形激励下'];
subtitle('2位轮对轮轨力','FontSize',18)
title(Title,'FontSize',18)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',18)
ylabel('动态附加力(N)','FontSize',18)
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
title(Title,'FontSize',18)
subtitle('1位轮对轮轨力','FontSize',18)
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
title(Title,'FontSize',18)
subtitle('1位轮对轮轨力','FontSize',18)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',18)
ylabel('动态附加力(N)','FontSize',18)
hold on 
legend('6阶','7阶','8阶')
set(gca,'FontSize',14);
prettyAxes().gbase()
end

set(h1,'position',[150,100,1050,650]);
%% 图2.10
h2 = figure()
plot(t(400:500),P1_2DoF(400:500,1),'Color',[142 207 201]/255,'LineWidth',3)
hold on 
plot(t(400:500),P1_CPLT(400:500,1),'--','Color',[250 127 111]/255,'LineWidth',1.5)
xlim([0.4 0.44])
xlabel('时间(s)','FontSize',18)
ylabel('动态附加力(N)','FontSize',18)
legend('二自由度模型','单节车模型','FontSize',16)
prettyAxes().gbase()
set(gca,'FontSize',18)
set(h2,'position',[150,100,550,450]);
%% 图2.11
h3=figure()
for i = 1 :3

    subplot(311)
    plot(t(400:600),Fc1(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
    Title = ['单节车辆垂向振动模型多边形激励下前悬挂阻尼力'];
    title(Title,'FontSize',18)
    xlim([0.4 0.6])
    xlabel('时间(s)','FontSize',18)
    ylabel('前悬挂阻尼力(N)','FontSize',18)
    hold on
    set(gca,'FontSize',14);
    legend('6阶','7阶','8阶')
    prettyAxes().gbase()

    subplot(312)
    plot(t(400:600),Fc2(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
    Title = ['单节车辆垂向振动模型多边形激励下后悬挂阻尼力'];
    title(Title,'FontSize',18)
    xlim([0.4 0.6])
    xlabel('时间(s)','FontSize',18)
    ylabel('后悬挂阻尼力(N)','FontSize',18)
    legend('6阶','7阶','8阶')
    hold on 
    set(gca,'FontSize',14);
    prettyAxes().gbase()

    subplot(313)
    plot(t(400:600),Zb(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
    Title = ['单节车辆垂向振动模型多边形激励下车体垂向位移'];
    title(Title,'FontSize',18)
    xlim([0.4 0.6])
    xlabel('时间(s)','FontSize',18)
    ylabel('车体垂向位移(m)','FontSize',18)
    legend('6阶','7阶','8阶')
    hold on
    set(gca,'FontSize',14);
    prettyAxes().gbase()
end
set(h3,'position',[500,25,850,750]);