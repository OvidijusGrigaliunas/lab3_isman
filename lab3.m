close all
clear
clc
% 1. Duomenų paruošimas
X = 0.1:1/22:1;
% for H = 1:19
% for K = 1:19
Y =  (1 + 0.6*sin(2*pi*X/0.7)) + 0.3*sin(2*pi*X)/2;
step = 0.1;
w = randn(3,1);
c = [0.191, 0.8727];
r = [0.13, 0.14];
y_apskaiciuota = zeros(1,length(X));
for k = 1:50000
    for j = 1:length(X)
       
        % 1 sluosknis
        %y(i) = 1/(1+exp(-v(i,1)));
        f1 = gauss(X(j),c(1), r(1));
        f2 = gauss(X(j),c(2), r(2));
        y = f1*w(1) + f2*w(2) + w(3);
        e = Y(j) - y;
        w(1) = w(1) + step*e*f1;
        w(2) = w(2) + step*e*f2;
        w(3) = w(3)+ step*e;
        % Koeficientu atnaujinimas

    end
end

X2 = 0:0.005:1;
for j = 1:length(X2)
        f1 = gauss(X2(j),c(1), r(1));
        f2 = gauss(X2(j),c(2), r(2));
        y_apskaiciuota(j) = f1*w(1) + f2*w(2)+w(3);
end
figure
plot(X,Y)
figure
plot(X,Y,'*',X2, y_apskaiciuota, 'rx')
legend('Tikroji',"Apskaičiuota")