#Declaration des procedures et fonctions
def fact(n):
    if n==0:
        return 1

    else:
        return n*fact(n-1)
#programme principale
x=int(input("entrez un nombre: "))
print(x,"! =", fact(x))
a=input()
