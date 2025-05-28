
from math import *
a = float(input("a : "))
b = float(input("b : "))
c = float(input("c : "))
delta = b * b - 4 * a * c
if delta > 0:
    x1 = (-b + sqrt(delta)) / (2 * a)
    x2 = (-b - sqrt(delta)) / (2 * a)
    print ("deux solutions:",x1 " " ,x2)
elif delta == 0:
    x = -b / (2 * a)
    print("une solution:"+ str(x))
else:
    print ("pas de solution reelle", x)
