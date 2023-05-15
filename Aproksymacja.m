T=1000; %okres próbkowania wynik
t=0:1/T:0.02; %wektor czasu
w=100*pi; %omega
fi=pi/3; %przesunięcie fazowe
A=50; %amplituda sygnału
y1=ones(5,21); %prelokacja macierzy współczynników 1
y2=ones(2,21); %prelokacja macierzy współczynników 2
a=w*(1/1000);

%%Funkcja z szumem
f1=0.4*A*(0.5-rand(1)); %szum
f=A*sin(w*t+fi)+f1; %funkcja z szumem

    %Obliczenia współczynników
    for k=1:length(t)
    y1(:,k)=[1; a*k; (a*k)^2; (a*k)^3; (a*k)^4]; %model pierwszy
    y2(:,k)=[sin(a*k); cos(a*k)]; %model drugi
    end
    
%Aproksymacja modelem pierwszym
h1=inv(y1*y1')*y1*f';
aprox1=h1'*y1;
%Aproksymacja modelem drugim
h2=inv(y2*y2')*y2*f';
aprox2=h2'*y2;

%% ploty
plot(t,f,'r', 'LineWidth',3); %funkcja aproksymowana
hold on; grid on;
plot(t,aprox1, 'g', 'LineWidth',2); %funkcja aproksymująca pierwsza
plot(t,aprox2, 'b', 'LineWidth',2); %funkcja aproksymująca druga
plot(t,f, 'ro', 'MarkerSize',6, 'MarkerFace', 'r')
title('Aproksymacja z użyciem dwóch modeli');
xlabel('Czas [s]');
ylabel('Amplituda');
h = legend('Funkcja aproksymowana','Model pierwszy','Model drugi');