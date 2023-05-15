
eps=1e-6;
del=2*eps;
k=2;
it=0;
x(1)=-1;
x(2)=1;
while(del>eps)
it=it+1;
x(k+1)=x(k)-(((cos(x(k))-((x(k)).^2)+0.4*x(k)-0.2)*(x(k)-x(k-1)))/((cos(x(k))-((x(k)).^2)+0.4*x(k)-0.2)-(cos(x(k-1))-((x(k-1)).^2)+0.4*x(k-1)-0.2)));
del=abs(x(k+1)-x(k));
k=k+1;
end
disp(['Miejsce zerowe: x=' num2str(x(it))]);
disp(['Liczba iteracji: ' num2str(it)]);
disp(['Blad ' num2str(del)]);