clear all;
clc;
format long;
k = 0.001; %długość kroku całkowania dla a)
%k = 0.0001; %długość kroku całkowania dla b)
%k = 0.00001; %długość kroku całkowania dla c)
t = 0:k:0.005;
y1(1)  = 0;
y2(1)  = 0;
y3(1)  = 0;
y4(1)  = 0;

f = pi*t-sin(100*pi*t+pi/5);
n = length(t);

for i=2:n
    y1(i) = y1(i-1) + k*f(i-1); %Metoda prostokątów jawna
    y2(i) = y2(i-1) + k*f(i); %Metoda prostokątów niejawna
    y3(i) = y3(i-1) + k/2*(f(i-1)+f(i)); %Metoda trapezów
end

for i=2:n-1
    y4(i) = y4(i-1) + k/3*(f(i-1)+f(i)+f(i+1)); %Metoda Simpsona
end

MetodaProstokatowJawna = y1(length(t))
MetodaProstokatowNiejawna = y2(length(t))
MetodaTrapezow = y3(length(t))
MetodaSimpsona = y4(length(t)-1)

plot(t,y1,t,y2,t,y3)
hold on
grid on
plot(t(1:(length(t)-1)), y4(1:(length(t)-1)))
legend('Metoda prostokątów jawna', 'Metoda prostokątów niejawna', ...
    'Metoda trapezów', 'Metoda Simpsona')
xlabel ('Czas')
ylabel ('Wart. funkcji')
