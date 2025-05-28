print("............Calco...........")
print("............+: Add..........")
print("............-:Sub...........")
print("............*:Mul...........")
print("............/:Div...........")
choix=input("Votre choix + ou - ou * ou /")

while choix != "+" and choix != "-" and choix != "*" and choix != "/" :
     print("............Calco...........")
     print("............+: Add..........")
     print("............-:Sub...........")
     print("............*:Mul...........")
     print("............/:Div...........")
     choix=input("Votre choix + ou - ou * ou /")

n1 = float(input(" entrez les deux nombres n1 = "))
n2 = float(input("et n2 = "))
match choix :
    case '+' : res=n1+n2
    case '-' : res=n1-n2
    case '*' : res=n1*n2
    case '/' :
        if n2 == 0 :
               print("Impossible")
        else :
               res= nb1/nb2
if choix == "+" or choix == "-" or choix == "*" or choix == "/" and n2 != 0 :
     print("la solution est ", res) 
