close all
clear
clc
% 1. Duomenų paruošimas
X = 0.1:0.05:4;
Y =  (1 + 0.6*sin(2*pi*X/0.7)) + 0.3*sin(2*pi*X)/2;
step = 0.01;
rc_kiekis = 6;
w = randn(rc_kiekis,1);
b = randn(1);
j = 2;
for i=1:rc_kiekis
    while Y(j) > Y(j-1)
        c(i) = X(j);
        j=j+1;
    end
    a = j;
    if i < rc_kiekis
         % preleidzia vietas kur mazeja y
        while Y(j) < Y(j-1)
            j = j + 1;
        end
        b = j;
        r(i) =  X(round((a+b)/2)) - X(a);
    else
        r(i) =  X(a) - X(round((a+b)/2));
    end
end
r
c
y_apskaiciuota = zeros(1,length(X));
for k = 1:500000
    for j = 1:length(X)
       
        % 1 sluosknis
        %y(i) = 1/(1+exp(-v(i,1)));
        for i=1:rc_kiekis
            f(i) = gauss(X(j),c(i), r(i));
            fw(i) = f(i)*w(i);
        end
        y = sum(fw) + b;
        e = Y(j) - y;
        for i=1:6
            w(i) = w(i) + step*e*f(i);
        end
        b = b + step*e;
        % Koeficientu atnaujinimas

    end
end
X2 = 0:0.005:4;
for j = 1:length(X2)
        for i=1:rc_kiekis
            f(i) = gauss(X2(j),c(i), r(i));
            fw(i) = f(i)*w(i);
        end
        y_apskaiciuota(j) = sum(fw) + b;
end
figure
plot(X,Y)
figure
plot(X,Y,'*',X2, y_apskaiciuota, 'rx')
legend('Tikroji',"Apskaičiuota")
