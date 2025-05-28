#include <iostream>
#include <cmath>
#include <complex>

using namespace std;

int main() {
    double a, b, c;
    cout << "Entrez les coefficients a, b et c: ";
    cin >> a >> b >> c;

    double delta = b * b - 4 * a * c;

    if (delta > 0) {
        double x1 = (-b + sqrt(delta)) / (2 * a);  
  		double x2 = (-b - sqrt(delta)) / (2 * a);
        cout << "Les solutions sont: x1 = " << x1 << ", x2 = " << x2 << endl;
    } else if (delta == 0) {
        double x = -b / (2 * a);
        cout << "La solution est: x = " << x << endl;
    } else {
        complex<double> x1 = (-b + sqrt(complex<double>(delta, 0))) / (2.0 * a);
        complex<double> x2 = (-b - sqrt(complex<double>(delta, 0))) / (2.0 * a);
        cout << "Les solutions sont: x1 = " << x1 << ", x2 = " << x2 << endl;
    }

    return 0;
}