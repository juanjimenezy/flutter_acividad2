import 'package:flutter/material.dart';

class Principal extends StatelessWidget{
  const Principal({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text("Principal")),
        body: Column(
          children: [

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/Imc');
            }, 
            child: Text("IMC")),

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/Sueldo');
            }, 
            child: Text("Sueldo")),

          ]
        ),
    );
  }
}
