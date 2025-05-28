A=rand(4,5);
disp(A);
for i=1:3
    for j=1:4
        B(i,j)=A(4-i,j+1);
    end
end
disp(B);
