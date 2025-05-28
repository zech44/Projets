print("Ce programme vous aide à obtenir une certaine documentation sur des outils des bibliothèque python")
print("Sur quoi voulez-vous vous renseigner ?")
outil=input("Répondez à la question ici : ")
try     :
    print("Voici ci-dessous ce que nous pouvons vous fournir comme documentation : ")
    help(outil)
except  :
    print("Il nous est impossible de vous fournir une quelconque documentation sur {}".format(outil))
    print("Verifiez que vous avez bien entré un outil python !")
else    :
    print("C'est tout ce que nous avons comme information sur {}".format(outil))
finally :
    print("Fin du programme...")
