% 创建一些示例数据
x = linspace(0, 2*pi, 100);
y = sin(x);

% 获取一些工作区的变量
variable1 = 42; % 从工作区获取的变量1
variable2 = 'Hello, MATLAB!'; % 从工作区获取的变量2

% 创建标题字符串，包含工作区的变量
titleText = sprintf('这是一个示例标题\n变量1：%d\n变量2：%s', variable1, variable2);

% 绘制图形并添加标题
figure;
plot(x, y);
title(titleText);
