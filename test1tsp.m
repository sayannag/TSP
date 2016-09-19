clc
clear
k=100;
%global X;
X=load('C:\Users\Sayan Nag\Downloads\MATLAB CODE\MATLAB CODE\1_city.txt');
X
[p,L] = tspsearchwithSA(X);
% p
% L
hold off;
x=X(p,2);
y=X(p,3);
plot(x,y,'-o','MarkerSize',2);
xlabel(['cost = ',num2str(L)])
drawnow;
