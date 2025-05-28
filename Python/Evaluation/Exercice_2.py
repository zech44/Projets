#fonction gérant l'addition
def addition(arg_1,arg_2):
    somme = arg_1 + arg_2
    return somme

#fonction gérant le produit
def multiplication(arg_1,arg_2):
    produit = arg_1 * arg_2
    return produit

#fonction gérant le reste
def soustraction(arg_1,arg_2):
    reste = arg_1 - arg_2
    return reste

#fonction gérant le quotient
def division(arg_1,arg_2):
    try:
        quotient = arg_1 / arg_2
        return quotient
    except ZeroDivisionError:
        print("Il est impossible de faire une division par '0' ")
        
#programme principal
print("Bienvenu... Ce programme vous servira a effectuer les operations elementaires (+,*,-,/)")
nbr_1 = input("Veuillez entrer la première valeur : ")
nbr_2 = input("Veuillez entrer la seconde valeur : ")
oper=input("Veuillez entrer l'operateur : ")
try:
    nbr_1=float(nbr_1)
    nbr_2=float(nbr_2)
    if oper=="+":
        resultat=addition(nbr_1,nbr_2)
        print("L'addition de {} à {} donne : {}".format(nbr_1,nbr_2,resultat)) 
    elif oper=="*":
        resultat=multiplication(nbr_1,nbr_2)
        print("La mutliplication de {} et {} donne : {}".format(nbr_1,nbr_2,resultat)) 
    elif oper=="-":
        resultat=soustraction(nbr_1,nbr_2)
        print("La soustraction de {} dans {} donne : {}".format(nbr_1,nbr_2,resultat)) 
    elif oper=="/":
        resultat=division(nbr_1,nbr_2)
        print("La division de {} par {} donne : {}".format(nbr_1,nbr_2,resultat)) 
    else:
        print("Operateur invalide")
except:
    print("Vous avez saisi une valeur invalide ! ")
finally:
    print("Fin du programme...")
