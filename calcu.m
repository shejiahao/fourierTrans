clc;clear;close all;
N=20;
n=(0:1:N-1);
k=18;
xn=cos(4.*pi.*(n./N)+pi/4);
yn=sin(2.*pi.*k.*(n./N));
X_1_array=xn.*yn;
X_1_sumArray=X_1_array;
for i=2:1:length(X_1_sumArray)
X_1_sumArray(i)=X_1_sumArray(i)+X_1_sumArray(i-1);
end

myFig=figure(1);
myFig.Color=[1,1,1];
subplot(2,1,1);
stem(n,xn,"LineWidth",2);
hold on;
stem(n,yn,"LineWidth",2);
lgd=legend("$x[n]$","$cos(2\pi\frac{k}{N}n)$");
lgd.Interpreter="latex";
ax=gca;
ax.FontName="Times New Roman";
titleText = sprintf('k=%d', k);
ax.Title.String=titleText;

subplot(2,1,2);
stem(n,X_1_array,"LineWidth",2);
hold on;
plot(n,X_1_sumArray,"LineWidth",2);
yline(0);
lgd=legend("product","integral value");
lgd.Interpreter="latex";
ax=gca;
ax.FontName="Times New Roman";
titleText = sprintf('k=%d', k);
ax.Title.String=titleText;

copygraphics(gcf,"ContentType","image","Resolution",200);