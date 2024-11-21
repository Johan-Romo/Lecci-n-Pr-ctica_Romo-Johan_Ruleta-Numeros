import 'dart:math';

class RuletaLogica {
  Map<String, dynamic> generarYCalcularPorcentajes() {
    Random random = Random();
    List<int> numerosGenerados = List.generate(5, (index) => random.nextInt(37)); // Generar 5 números aleatorios entre 0 y 36

    int pares = 0;
    int impares = 0;
    int ceros = 0;

    for (int numero in numerosGenerados) {
      if (numero == 0) {
        ceros++;
      } else if (numero % 2 == 0) {
        pares++;
      } else {
        impares++;
      }
    }

    double porcentajePares = (pares / 5) * 100;
    double porcentajeImpares = (impares / 5) * 100;
    double porcentajeCeros = (ceros / 5) * 100;

    return {
      'numerosGenerados': numerosGenerados.join(', '),
      'porcentajePares': porcentajePares,
      'porcentajeImpares': porcentajeImpares,
      'porcentajeCeros': porcentajeCeros,
    };
  }
}
