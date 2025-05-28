from math import *
a = input("Veuillez entrer la valeur du coefficient de x^2 : ")
b = input("Veuillez entrer la valeur du coefficient de x: ")
b = input("Veuillez entrer la valeur du terme constant: ")
try:
    a=float(a)
    b=float(b)
    c=float(c)
    delta=pow(b,2)-4*a*c
    if delta>0:
        delta=sqrt(delta)
        x_1=(-b-delta)/(2*a)
        x_2=(-b+delta)/(2*a)
        print("{}x^2+{}x+{} admet 2 solutions réelles x_1 = {} et x_2 = {}".format(a,b,c,x_1,x_2))
    elif delta==0:
        delta=sqrt(delta)
        x_0 = (-b)/(2*a)
        print("{}x^2+{}x+{} admet une solution double x_0 = {}".format(a,b,c,x_0))
    elif delta<0:
        delta=sqrt(delta)
        z_1=complex((-b)/(2*a),abs(delta)/(2*a))
        z_2=complex((-b)/(2*a),-abs(delta)/(2*a))
        print("{}x^2+{}x+{} admet 2 solutions complexes z_1 = {} et z_2 = {}".format(a,b,c,z_1,z_2))
        
    else:
        pass
    assert a!=0
except AssertionError:
    print("Cette equation n'est pas du second dégré !")
except:
    print("Erreur utilisateur !")
