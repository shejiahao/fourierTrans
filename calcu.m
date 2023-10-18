clc;clear;close all;
N=20;
n=(0:1:N-1);

xn=cos(4.*pi.*(n./N));
yn=cos(2.*pi.*(2./N).*n);
X_1_array=xn.*yn;
X_1_sumArray=X_1_array;
for i=2:1:length(X_1_sumArray)
X_1_sumArray(i)=X_1_sumArray(i)+X_1_sumArray(i-1);
end


myFig=figure(1);
myFig.Color=[1,1,1];
subplot(2,1,1);
plot(n,xn,"LineWidth",2);
hold on;
plot(n,yn,"LineWidth",2);
lgd=legend("$x[n]$","$cos(2\pi\frac{k}{N}n)$");
lgd.Interpreter="latex";
ax=gca;
ax.FontName="Times New Roman";
ax.Title.String="k=1";



subplot(2,1,2);
plot(n,X_1_array,"LineWidth",2);
hold on;
plot(n,X_1_sumArray,"LineWidth",2);
yline(0);
lgd=legend("product","integral value");
lgd.Interpreter="latex";
ax=gca;
ax.FontName="Times New Roman";
ax.Title.String="k=1";

copygraphics(myFig, "Resolution", 600);