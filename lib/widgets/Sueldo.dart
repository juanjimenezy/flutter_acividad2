import 'package:flutter/material.dart';

class Sueldo extends StatefulWidget {
  const Sueldo({super.key});
  @override
  State<Sueldo> createState() => _SueldoState();
}

class _SueldoState extends State<Sueldo> {
  TextEditingController cntNombre = TextEditingController();
  TextEditingController cntN1 = TextEditingController();
  TextEditingController cntN2 = TextEditingController();

  String RESULTADO01 = "";
  String RESULTADO02 = "";
  String name = "";
  double valor = 0;

  void mensaje(BuildContext context, String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 50,
            width: 300,
            child: Column(children: [Text("$RESULTADO01",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple)),

              Text("$RESULTADO02",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),],
          )
          ),
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

  void Calcular(){
    setState(() {
      name = cntNombre.text;
      double n1 = double.parse(cntN1.text);
      double n2 = double.parse(cntN2.text);
      valor = (n1 * n2);
      RESULTADO01 = "¡Hola $name!";
      RESULTADO02 = "El valor de su sueldo es: \$$valor";
      mensaje(context, RESULTADO02);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Stack(
        children: [
          // ************* BACKGROUND PRINCIPAL
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 320,
              decoration: const BoxDecoration(
                color: Colors.deepPurple),
              ),
            ),

          //IMAGEN
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('sueldo.png'),
                    width: 150,
                    height: 150,
                  )
                ],
              ),
            ),
          ),

           // ************ CONTENIDO NOMBRE PERSONA
          Positioned(
              top: 170,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Text(
                      "APPSUELDO",
                      style:  TextStyle( 
                        color: Colors.white, 
                        fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                   Text(
                      "¡CALCULO SUELDO!",
                      style:  TextStyle( 
                        color: Colors.white, 
                        fontSize: 18),
                    ),
                  ],
                ),
              ),
          ),
          
          // ***** CONTENIDO APLICACION
          Positioned(
              top: 270,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 235, 233, 233)),
              ),
          ),

          // ******* CONTENIDO FORMULARIO
          Positioned(
            top: 260,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.fromLTRB(30, 10, 50, 0),
              child: Column(
                children: [
                  Cajas(cntNombre, "Nombre del Empleado", TextInputType.text),
                  Cajas(cntN1, "Horas Trabajadas", TextInputType.number),
                  Cajas(cntN2, "Valor Hora", TextInputType.number),
                ]
                ),
            ),          
          ),

          Positioned(
            top: 450,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: (){
                      Calcular();
                    }, 
                    child: const Text("Calcular")
                  ),
                ]
                ),
            ),          
          ),
        ]
      )
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: Colors.deepPurple,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Personaliza el radio del borde
      )
  );

  Widget Cajas(TextEditingController cn, String Label, TextInputType tipo){
      return TextField(
              controller: cn,
              keyboardType: tipo,
              decoration: InputDecoration(
                labelText: Label
              ),
      );
  }


}

