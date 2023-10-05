import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Imc extends StatefulWidget {
  const Imc({super.key});
  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  var maskFormatterAltura = MaskTextInputFormatter(
      mask: '#.##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskFormatterPeso = MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskFormatterImc = MaskTextInputFormatter(
      mask: '##.##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  double vImc = 0;
  String textIMC = "";
  String textValidator = "";

  void mensaje(BuildContext context, String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Resultado"),
          content: Text("Su IMC es: " + value),
          actions: <Widget>[
            Center(child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Aceptar"),
            ),)

          ],
        );
      },
    );
  }
  void calcular() {
    setState(() {
      vImc = double.parse(peso.text) /
          (double.parse(altura.text) * double.parse(altura.text));
      textIMC = vImc.toStringAsFixed(2);
      mensaje(context, textIMC);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          //fondo header
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: const BoxDecoration(color: Colors.deepPurple),
            ),
          ),

          //titulo
          Positioned(
            top: 40,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("IMC APP",style:  TextStyle(color: Colors.white,fontSize: 28, fontWeight: FontWeight.bold),),
                  Text("VIDA SALUDABLE",style:  TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ],
              ),
            ),
          ),

          // ***** CONTENIDO APLICACION
          Positioned(
            top: 170,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 235, 233, 233)),
            ),
          ),

          // peso
          Positioned(
            top: 178,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.fromLTRB(30, 10, 50, 0),
              child: Column(
                children: [
                  cajas(peso, "Peso", TextInputType.text, maskFormatterPeso),
                  cajas(altura, "Altura", TextInputType.text, maskFormatterAltura)
                ],
              ),
            )
          ),

          //text
          Positioned(
            top: 320,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    calcular();
                  },
                  child: const Text("Calcular"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget cajas(TextEditingController controller, String label, TextInputType tipo,
    MaskTextInputFormatter formater) {
  return TextField(
    controller: controller,
    keyboardType: tipo,
    decoration: InputDecoration(labelText: label),
    inputFormatters: [formater],
  );
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.deepPurple,
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0), // Personaliza el radio del borde
    )
);



