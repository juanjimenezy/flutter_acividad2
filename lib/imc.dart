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

  void calcular() {
    setState(() {
      vImc = double.parse(peso.text) /
          (double.parse(altura.text) * double.parse(altura.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //titulo
          Positioned(
            top: 10,
            width: MediaQuery.of(context).size.width,
            child: const Column(
                children: [
                  Text(
                    "IMC APP",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("VIDA SALUDABLE ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400))
                ],
              ),

          ),

          // peso
          Positioned(
            top: 90,
            width: MediaQuery.of(context).size.width,
            child: Column(
                children: [
                  cajas(peso, "Peso", TextInputType.text, maskFormatterPeso)
                ],
              ),

          ),

          //altura
          Positioned(
            top: 160,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                cajas(
                    altura, "Altura", TextInputType.text, maskFormatterAltura)
              ],
            ),
          ),

          //text
          Positioned(
            top: 230,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const Text("El IMC ES: "),
                Text("$vImc"),
              ],
            ),
          ),

          //BTN CALCULAR
          Positioned(
            top: 290,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    calcular();
                  },
                  child: const Text("Calcular"),
                ),
              ],
            ),
          ),
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


