clc
clear
k=100;
X=load('C:\Users\Sayan Nag\Downloads\MATLAB CODE\MATLAB CODE\1_city.txt');
X
[p,L] = tspsearch(X);
p
L
h2=figure;
x=X(p,2);
y=X(p,3);
plot(x,y,'-o','MarkerSize',2);
