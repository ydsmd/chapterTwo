%%%%%%%%%%%%%%%%%%%%%%%%% Figure2_16and2_17.m%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          本文件绘制论文图2.16至2.17                                           %
%          作者：余道洪                                                        %
%          修改日期：2023.4.12                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
parameterLoadForchapter2_4
j = 1;
Lns = [20e-3,30e-3,40e-3];
for i = 1:3
    Ln = Lns(i)
    Ln1 = Ln;
    simOut = sim('chapter2_4_1.slx');
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
h1 = figure(3)
for i = 1:3 
colorset= [242 121 112;50 184 151;199 109 162] /255;
linetype = {'-','--',':'};
Lwidth = [1.5 2 2];
subplot(223)
plot(t(400:600),-P2_2DoF(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
xlim([0.55 0.6])
Title = ['二自由度两轴车模型擦伤激励下'];
title(Title,'FontSize',12)
subtitle('2位轮对轮轨力','FontSize',12)
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
set(gca,'FontSize',14)
legend('20mm','30mm','40mm')
prettyAxes().gbase()
set(gca,'FontSize',16)

subplot(224)
plot(t(400:600),P2_CPLT(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
xlim([0.55 0.6])
Title = ['单节车辆垂向振动擦伤激励下'];
title(Title,'FontSize',18)
subtitle('2位轮对轮轨力','FontSize',18)
xlabel('时间(s)','FontSize',18)
ylabel('动态附加力(N)','FontSize',18)
hold on 
set(gca,'FontSize',14)
legend('20mm','30mm','40mm')
prettyAxes().gbase()


subplot(221)
plot(t(400:600),P1_2DoF(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
xlim([0.55 0.6])
Title = ['二自由度两轴车模型擦伤激励下'];
title(Title,'FontSize',18)
subtitle('1位轮对轮轨力','FontSize',18)
xlabel('时间(s)','FontSize',18)
ylabel('动态附加力(N)','FontSize',18)
hold on 
set(gca,'FontSize',18)
legend('20mm','30mm','40mm')
prettyAxes().gbase()
set(gca,'FontSize',14)

subplot(222)
plot(t(400:600),P1_CPLT(400:600,i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
xlim([0.55 0.6])
Title = ['单节车辆垂向振动擦伤激励下'];
title(Title,'FontSize',18)
subtitle('1位轮对轮轨力','FontSize',18)
xlabel('时间(s)','FontSize',18)
ylabel('动态附加力(N)','FontSize',18)
hold on 
set(gca,'FontSize',14)
legend('20mm','30mm','40mm')
prettyAxes().gbase()
end
set(h1,'position',[150,100,1050,650]);
h2 = figure(4)
for i = 1 :3

    subplot(311)
    plot(t(400:600),Fc1((400:600),i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
    Title = ['单节车辆垂向振动模型擦伤激励下前悬挂阻尼力'];
    title(Title,'FontSize',18)
    xlabel('时间(s)','FontSize',18)
    ylabel('前悬挂阻尼力(N)','FontSize',18)
    hold on
    set(gca,'FontSize',14)
    prettyAxes().gbase()
    xlim([0.54 0.6])
    legend('20mm','30mm','40mm')

    subplot(312)
    plot(t((400:600)),Fc2((400:600),i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
    Title = ['单节车辆垂向振动模型擦伤激励下后悬挂阻尼力'];
    title(Title,'FontSize',18)
    xlabel('时间(s)','FontSize',18)
    ylabel('后悬挂阻尼力(N)','FontSize',18)
    legend('20mm','30mm','40mm')
    hold on 
    set(gca,'FontSize',14)
    xlim([0.54 0.6])
    prettyAxes().gbase()


    subplot(313)
    plot(t((400:600)),Zb((400:600),i),linetype{i},'Color',colorset(i,:),'LineWidth',Lwidth(i))
    Title = ['单节车辆垂向振动模型擦伤激励下车体垂向位移'];
    title(Title,'FontSize',18)
    xlabel('时间(s)','FontSize',18)
    ylabel('车体垂向位移(m)','FontSize',18)
    legend('20mm','30mm','40mm')
    hold on
    set(gca,'FontSize',14)
    xlim([0.54 0.6])
    prettyAxes().gbase()

end
set(h2,'position',[500,25,850,750]);