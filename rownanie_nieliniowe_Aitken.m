syms f(x) x
f(x) = cos(x)-(x^2)+0.4*x-0.2;
g = diff(f);
x(1)=1;
i=1;
while(true)
    x(i+1) = x(i)-f(x(i))/g(x(i));
    if(abs(f(x(i+1))))<10^-14
        disp(['Miejsce zerowe: x=' ]);
        disp(double(x(i+1)));
        
        break;
    end
    i=i+1;
end