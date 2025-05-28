n = input("Saississez la taille ")
mat = zeros(n,n)
for i=1:n
    for j=1:i
        mat_inf(i,j)=input("mat("+string(i)+","+string(j)+")= ")
    end
end
for j=1:n
    for i=1:j
        mat_sup(i,j)=input("mat("+string(i)+","+string(j)+")= ")
    end
end
disp(mat_inf)
disp(mat_sup)
