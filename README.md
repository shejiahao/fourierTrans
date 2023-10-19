<!--
 * @Author: aMoonRunner jhshe@foxmail.com
 * @Date: 2023-10-18 20:41:00
 * @LastEditors: aMoonRunner jhshe@foxmail.com
 * @LastEditTime: 2023-10-19 10:01:05
 * @FilePath: \fourierTrans\README.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# 傅里叶变换学习笔记

## 离散傅里叶变换

创建时间 _2023 年 10 月 18 日_

_纸上得来终觉浅，觉知此事要躬行，想搞懂离散傅里叶变换，最好是自己做一遍，回想起来，从来没有真正手算过傅里叶变换_

本文只求理解，会用，不追求严谨的推导

---

首先是离散傅里叶变换的公式，傅里叶变换后得到的$X[k]$为

$$
X[k]=\sum_{n=0}^{N-1}{x[n]e^{-j(2\pi/N)kn}},(0\leq k \leq N-1)
$$

然后是离散傅里叶**反**变换的公式，原信号$x(t)$的采样信号$x(n)$可以表示为

$$
x[n]=\frac{1}{N}\sum_{k=0}^{N-1}{X[k]e^{j(2\pi/N)kn}}
$$

---

对于$e^{-2\pi\frac{k}{N}n}$,如果不好理解，就根据欧拉公式$e^{i\theta}=cos(\theta)+isin(\theta)$先拆分一下，（最好是能够理解）

$$
X[k]=   \sum_{n=0}^{N-1}{x[n]cos(-2\pi\frac{k}{N}n)}+
        j\sum_{n=0}^{N-1}{x[n]sin(-2\pi\frac{k}{N}n)}
        ,(0\leq k \leq N-1)
$$

也就是

$$
X[k]=   \sum_{n=0}^{N-1}{x[n]cos(2\pi\frac{k}{N}n)}-
        j\sum_{n=0}^{N-1}{x[n]sin(2\pi\frac{k}{N}n)}
        ,(0\leq k \leq N-1)
$$

先看$cos$项，对于$X[k]$，可以这样理解，在原信号的每个采样点$x[n]$所在的位置，按照某个特定频率的余弦信号也生成一个点（离散化），逐点相乘，再求和，这样可以寻找原始信号$x[n]$，与这个余弦信号$cos(2\pi\frac{k}{N}n)$之间的相关性

因为这个操作有个很奇妙的地方，如果这两个信号不相关，$X[k]$算出来就是 0

举个例子，假设原信号$x(t)=cos(4\pi x)$,在两个周期内采样 20 个点
$$x[n]=cos(4\pi\times\frac{n}{N})$$

$X[1]$计算结果如下,$X[1]=0$
![](pictures/2023-10-18-22-34-40.png)
$X[2]$计算结果如下,$X[2]=10$
![](pictures/2023-10-18-22-53-38.png)
$X[3]$计算结果如下,$X[3]=0$
![](pictures/2023-10-18-22-53-07.png)
一直到$X[19]$,$X[19]=0$
![](pictures/2023-10-18-22-51-59.png)

只有当$x[n]$中有此频率成分时，$X[k]$才不为0

那么，计算出来的$X[k]$的物理含义到底是什么呢？
1. “$k$”表示第$k$个频率分量，这里，信号频率为2Hz，采样频率$f_s$为20Hz，那么$X[k]$就对应了$f=\frac{k}{N}f_s$的频率，当$k=2$时，$f=2Hz$
假设采样点数$N=40$，那么对于$$x[n]=cos(4\pi\times\frac{n}{N})$$进行变换，则$X[2]=20$,对应频率$f=\frac{2}{40}\times40$
