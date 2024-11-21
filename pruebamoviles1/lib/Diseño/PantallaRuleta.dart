import 'package:flutter/material.dart';
import '../Logica/RuletaLogica.dart';  // Cambié el nombre a "LogicaRuleta"

class PantallaRuleta extends StatefulWidget {
  @override
  _PantallaRuletaState createState() => _PantallaRuletaState();
}

class _PantallaRuletaState extends State<PantallaRuleta> {
  Map<String, dynamic> _resultados = {};
 RuletaLogica _logicaRuleta = RuletaLogica();

  void _generarNumeros() {
    _resultados = _logicaRuleta.generarYCalcularPorcentajes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf7f0ba) ,
      appBar: AppBar(
        title: Text(
          "Simulador de Ruleta",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 , color: Colors.white),
        ),
        backgroundColor: Color(0xFF53a08e),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.all(16),
                color: Color(0xFFe0dba4),
                child: Center(
                  child:
                  Text(
                  "Dele click al boton para generar 5 números aleatorios: ",
                  style: TextStyle(fontSize: 16, color: Colors.black, ),
                ),
        )

            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generarNumeros,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7ebea3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Generar Números",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Center(
              child: Image.network(
                'https://media2.giphy.com/media/d8i03eEeIQY3kqPk9N/giphy.gif?cid=6c09b952j4dohjxehnc0jkcxhz7fepkstemf75voaqpvsg28&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=s',  // Reemplaza con la URL de tu GIF
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: 20),
            if (_resultados.isNotEmpty)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFa9cba6),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    Text(
                      "Números Generados: ${_resultados['numerosGenerados']}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade900,
                      ),
                    ),


                  ],
                ),
              ),
            SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "% Pares: ${_resultados['porcentajePares']?.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade900,
                      ),
                    ),
                    Text(
                      "% Impares: ${_resultados['porcentajeImpares']?.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade900,
                      ),
                    ),
                    Text(
                      "% Ceros: ${_resultados['porcentajeCeros']?.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade900,
                      ),

                    ),
                  ],
                ),
              )
          ],
        ),

      ),

    );
  }
}
