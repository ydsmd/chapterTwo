clear;clc;
parameterLoadForchapter2_4
j = 1;
%% 模型验证
% LNs = [10e-3 20e-3 30e-3];
% for i = 1:length(LNs)
%     Ln = LNs(i);
%     simOut = sim('chapter2_4.slx');
%     P1_2DoF(:,j) = simOut.P1_2DoF.Data;
%     P2_2DoF(:,j) = simOut.P2_2DoF.Data;
%     P1_CPLT(:,j) = simOut.P1_CPLT.Data;
%     P2_CPLT(:,j) = simOut.P2_CPLT.Data;
%     Fc1(:,j) = simOut.Fc1.Data;
%     Fc2(:,j) = simOut.Fc2.Data;
%     Zb(:,j) = simOut.Zb.Data;
%     j = j+1;
% end
for N = 6:8
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
% 
figure()
for i = 1:3 

subplot(223)
plot(t(400:600),P2_2DoF(400:600,i))
Title = ['二自由度两轴车模型多边形激励下2位轮对轮轨力'];
title(Title,'FontSize',14)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
legend('6阶','7阶','8阶')

subplot(224)
plot(t(400:600),P2_CPLT(400:600,i))
Title = ['单节车辆垂向振动多边形激励下下2位轮对轮轨力'];
title(Title,'FontSize',14)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
legend('6阶','7阶','8阶')

subplot(221)
plot(t(400:600),P1_2DoF(400:600,i))
Title = ['二自由度两轴车模型多边形激励下1位轮对轮轨力'];
title(Title,'FontSize',14)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
legend('6阶','7阶','8阶')

subplot(222)
plot(t(400:600),P1_CPLT(400:600,i))
Title = ['单节车辆垂向振动多边形激励下下1位轮对轮轨力'];
title(Title,'FontSize',14)
xlim([0.4 0.6])
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
legend('6阶','7阶','8阶')
end

% 图2.8
% plot(t(3000:5000),P1_2DoF(3000:5000,1))
% hold on 
% plot(t(3000:5000),P1_CPLT(3000:5000,1),'--')
% xlabel('时间(s)','FontSize',14)
% ylabel('动态附加力(N)','FontSize',14)
% legend('二自由度模型','单节车模型')

% 阻尼力和垂向位移验证 图2.9
figure(2)
for i = 1 :3

    subplot(311)
    plot(t(3000:5000),Fc1(3000:5000,i))
    Title = ['单节车辆垂向振动模型多边形激励下前悬挂阻尼力'];
    title(Title,'FontSize',14)
    xlabel('时间(s)','FontSize',14)
    ylabel('前悬挂阻尼力(N)','FontSize',14)
    hold on
    legend('6阶','7阶','8阶')
    subplot(312)
    plot(t(3000:5000),Fc2(3000:5000,i))
    Title = ['单节车辆垂向振动模型多边形激励下后悬挂阻尼力'];
    title(Title,'FontSize',14)
    xlabel('时间(s)','FontSize',14)
    ylabel('后悬挂阻尼力(N)','FontSize',14)
    legend('6阶','7阶','8阶')
    hold on 


    subplot(313)
    plot(t(3000:5000),Zb(3000:5000,i))
    Title = ['单节车辆垂向振动模型多边形激励下车体垂向位移'];
    title(Title,'FontSize',14)
    xlabel('时间(s)','FontSize',14)
    ylabel('车体垂向位移(m)','FontSize',14)
    legend('6阶','7阶','8阶')
    hold on
end


%% 擦伤验证

figure(3)
for i = 1:3 

subplot(223)
plot(t(3000:5000),P2_2DoF(3000:5000,i))
Title = ['二自由度两轴车模型擦伤激励下2位轮对轮轨力'];
title(Title,'FontSize',14)
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
legend('60mm','80mm','100mm')

subplot(224)
plot(t(3000:5000),P2_CPLT(3000:5000,i))
Title = ['单节车辆垂向振动擦伤激励下下2位轮对轮轨力'];
title(Title,'FontSize',14)
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
legend('60mm','80mm','100mm')

subplot(221)
plot(t(3000:5000),P1_2DoF(3000:5000,i))
Title = ['二自由度两轴车模型擦伤激励下1位轮对轮轨力'];
title(Title,'FontSize',14)
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
legend('60mm','80mm','100mm')

subplot(222)
plot(t(3000:5000),P1_CPLT(3000:5000,i))
Title = ['单节车辆垂向振动擦伤激励下下1位轮对轮轨力'];
title(Title,'FontSize',14)
xlabel('时间(s)','FontSize',14)
ylabel('动态附加力(N)','FontSize',14)
hold on 
legend('60mm','80mm','100mm')
end

figure(4)
for i = 1 :3

    subplot(311)
    plot(t(3000:5000),Fc1(3000:5000,i))
    Title = ['单节车辆垂向振动模型擦伤激励下前悬挂阻尼力'];
    title(Title,'FontSize',14)
    xlabel('时间(s)','FontSize',14)
    ylabel('前悬挂阻尼力(N)','FontSize',14)
    hold on
    legend('60mm','80mm','100mm')
    subplot(312)
    plot(t(3000:5000),Fc2(3000:5000,i))
    Title = ['单节车辆垂向振动模型擦伤激励下后悬挂阻尼力'];
    title(Title,'FontSize',14)
    xlabel('时间(s)','FontSize',14)
    ylabel('后悬挂阻尼力(N)','FontSize',14)
    legend('60mm','80mm','100mm')
    hold on 


    subplot(313)
    plot(t(3000:5000),Zb(3000:5000,i))
    Title = ['单节车辆垂向振动模型擦伤激励下车体垂向位移'];
    title(Title,'FontSize',14)
    xlabel('时间(s)','FontSize',14)
    ylabel('车体垂向位移(m)','FontSize',14)
    legend('60mm','80mm','100mm')
    hold on
end
