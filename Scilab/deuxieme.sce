a = input(" Rentrer la valeur de a : ");
b = input(" Rentrer la valeur de b (qui doit etre superieur a a) : ");
//le tracé de f(x)
x=linspace(a,b,200);
y=sinh(a.*x+b)./log(sqrt(x.^2+b.^2));
plot(x,y);
