k= 0:7; % liczba danych z tabeli
y= [-2.2 -1.6 0.5 1.6 1.0 0.5 -0.6 -0.8]; % dane z tabeli
T= 0.001; % okres próbkowania
l= 1;
m= 0;
P= 1:(max(k)/T)+1; % alokacja zmiennej P
    for i= 1:length(y)-2
    d= m:T:2;
        for h= 1:length(d)
        P(l)= 0.5*(2*y(i)-d(h)*(3*y(i)-4*y(i+1)+y(i+2))+(d(h)^2)*(y(i)-2*y(i+1)+y(i+2)));
        F(l)=1/2*(-(3*y(i)-4*y(i+1)+y(i+2))+2*d(h)*(y(i)-2*y(i+1)+y(i+2)));
        l=l+1;
        end
    m=1+T;
    end
t=0:T:7;
figure(1)
plot(t,P); hold on; grid on; plot(k,y,'ro');
 
    title('Interpolacja 3-punktowa'); xlabel('Próbki'); ylabel('Amplituda');
    legend('Funkcja interpolowana','Próbki');


    
y1 = interp1(k,y,t, 'linear'); % Interpolacja liniowa
y2 = interp1(k,y,t, 'cubic'); % Interpolacja wielomianowa
y3 = interp1(k,y,t, 'spline'); % Interpolacja przez sklejanie funkcji
figure(2)
plot(t,y1, 'k'); hold on; grid on;
plot(t,y2, 'g'); plot(t,y3, 'm'); plot(k,y, 'ro');
    title('Interpolacja z użyciem wbudowanych funkcji Matlaba');
    xlabel('Próbki'); ylabel('Amplituda');
    legend('Metoda Liniowa','Metoda Wielomianowa','Sklejanie Funkcji','Probki')


