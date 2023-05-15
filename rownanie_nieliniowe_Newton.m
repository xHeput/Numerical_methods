x=-4:0.01:2;
eps=1e-6;
del=eps*2;
k=2;
it=0;
    while(del>eps)
    x(k)=x(k-1)-(cos(x(k-1))-(x(k-1).^2)+0.4*x(k-1)-0.2)/(-2*(x(k-1))-sin(x(k-1))+0.4);
    del=x(k)-x(k-1);
    k=k+1;
    it=it+1;
    end
disp(['Miejsce zerowe: x=' num2str(x(it))]);
disp(['Ilość wykonanych iteracji: ' num2str(it)]);
disp(['Wartość błędu ' num2str(del)]);