#Max1
def Max1(x,y):
    if x < y :
        max1=y
    else:
        max1=x
    return max1

#Max2
def Max2(v,w,x,y,z):
    return Max1(Max1(Max1(v,w),Max1(x,y)),z)
    

#Programme Principale
a=float(input("Saisissez le nombre 1: "))
b=float(input("Saisissez le nombre 2: "))
c=float(input("Saisissez le nombre 3: "))
d=float(input("Saisissez le nombre 1: "))
e=float(input("Saisissez le nombre 1: "))
m=Max2(a,b,c,d,e)
print("le maximum est ", m)
