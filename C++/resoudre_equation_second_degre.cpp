#include <iostream>
#include <cmath>

using namespace std;

int main() {
    double a, b, c, discriminant, racine1, racine2;

    // Lecture des coefficients
    cout << "Entrez le coefficient a : ";
    cin >> a;
    cout << "Entrez le coefficient b : ";
    cin >> b;
    cout << "Entrez le coefficient c : ";
    cin >> c;

    // Calcul du discriminant
    discriminant = b*b - 4*a*c;

    // Si le discriminant est positif
    if (discriminant > 0) {
        racine1 = (-b + sqrt(discriminant)) / (2*a);
        racine2 = (-b - sqrt(discriminant)) / (2*a);
        cout << "Les racines sont : " << racine1 << " et " << racine2 << endl;
    }
    // Si le discriminant est nul
    else if (discriminant == 0) {
        racine1 = -b / (2*a);
        cout << "La racine double est : " << racine1 << endl;
    }
    // Si le discriminant est négatif
    else {
        double partie_reelle = -b/(2*a);
        double partie_imaginaire = sqrt(-discriminant)/(2*a);
        cout << "Les racines complexes sont : " << partie_reelle << " + i" << partie_imaginaire << " et " << partie_reelle << " - i" << partie_imaginaire << endl;
    }

    return 0;
}