a=input("Entrez a :");
N=input("Entrez N:");
SN=0;
u(1)=a;
for i=2:N+1
    u(i)=(2*u(i-1)+1)/(u(i-1)+1);
end
SN=sum(u);
disp(SN);
