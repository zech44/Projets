from math import *
#Declaration de la procedure de menu de la calculatrice
def menu() :
    print("............Calculatrice...........")
    print("............1: FACTORIELLE ' n! ' ..........")
    print("............2:COMBINAISON ' xCn '...........")
    print("............3:ARRANGEMENT ' xAn  '...........")
    print("............4:PUISSANCE x^n...........")
    print("............5:D.L de Exp(x) i=1,n ...........")

#Declaration de la fonction factorielle 
def fact(n):
    if n==0:
        return 1

    else:
        return n*fact(n-1)

#Declaration du Developpement limite de exponentielle  
def DLexp(x,n):
    if n==1 :
        return 1
    else:
        return (x**(n)/fact(n))+(x**(n-1)/fact(n-1)) # +(x**1/fact(1))
    
#Programme Principale
e=0
while e==0 :
    
    menu()
    choix=input("Faites votre choix 1 ou 2 ou 3 ou 4 ou 5 : ")
    while choix != "1" and choix != "2" and choix != "3" and choix != "4" and choix != "5" :
        menu()
        choix=input("Faites votre choix 1 ou 2 ou 3 ou 4 ou 5 : ")

    match choix :
        case '1' :
            n=int(input(" Saississez le nombre de la factorielle "))
            print(" La factorielle de ",n," est : ", fact(n))
        case '2' :
            x=int(input("Saississez x = "))
            n=int(input("Saississez n = "))
            if n < 0 or x > n :
                print("x doit etre superieur ou egale a n et doivent etre positives ")
            else :
                print(" La combinaison de ",x," dans ",n," est : ", fact(n)/fact(x)*fact(n-x))
        case '3' :
            x=int(input("Saississez x = "))
            n=int(input("Saississez n = "))
            if n < 0 or x > n :
                print("x doit etre superieur ou egale a n et doivent etre positives ")
            else :
                print(" L''arrangement de ",n," dans ",x," est : ", fact(n)/fact(n-x))
        case '4' :
             x=int(input("Saississez x = "))
             n=int(input("Saississez n = "))
             print(x,"^",n," = ",x**n)
        case '5' :
             x=int(input("Saississez x = "))
             n=int(input("Saississez n = "))
             if n==0 and x==0 :
                print(" 0^0 est impossible ")
             else :
                print(" Le D.L. de exp(",x,") pour i=1,",n," est : ", DLexp(x,n))
    e=float(input("Saississez 0 pour recommancer : "))

